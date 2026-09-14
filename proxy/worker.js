/**
 * FloodCraft AI Proxy - Cloudflare Worker
 * 
 * Proxies OpenAI-compatible requests from CreatureChat to Google's Gemini API
 * without exposing your secret Gemini API Key to students or public repositories.
 */

export default {
  async fetch(request, env, ctx) {
    // 1. Handle CORS Preflight
    if (request.method === "OPTIONS") {
      return new Response(null, {
        status: 204,
        headers: {
          "Access-Control-Allow-Origin": "*",
          "Access-Control-Allow-Methods": "GET, POST, OPTIONS",
          "Access-Control-Allow-Headers": "Content-Type, Authorization",
          "Access-Control-Max-Age": "86400",
        },
      });
    }

    const url = new URL(request.url);

    // 2. Health check / status endpoint
    if (request.method === "GET" && (url.pathname === "/" || url.pathname === "/health")) {
      return new Response(
        JSON.stringify({
          status: "ok",
          service: "FloodCraft CreatureChat AI Proxy",
          configured: Boolean(env.GEMINI_API_KEY),
          model: "gemini-2.5-flash",
          timestamp: new Date().toISOString(),
        }),
        {
          status: 200,
          headers: {
            "Content-Type": "application/json",
            "Access-Control-Allow-Origin": "*",
          },
        }
      );
    }

    // 3. Only allow POST for chat completions
    if (request.method !== "POST") {
      return new Response(
        JSON.stringify({ error: { message: "Method not allowed. Use POST." } }),
        {
          status: 405,
          headers: { "Content-Type": "application/json", "Access-Control-Allow-Origin": "*" },
        }
      );
    }

    // 4. Verify API Key is configured in Worker environment
    if (!env.GEMINI_API_KEY) {
      return new Response(
        JSON.stringify({
          error: {
            message: "GEMINI_API_KEY is not configured in Cloudflare Worker environment secrets.",
            code: "missing_api_key",
          },
        }),
        {
          status: 500,
          headers: { "Content-Type": "application/json", "Access-Control-Allow-Origin": "*" },
        }
      );
    }

    try {
      const incomingBody = await request.json();

      // Ensure model default if not provided
      if (!incomingBody.model) {
        incomingBody.model = "gemini-2.5-flash";
      }

      // 5. Forward request to Google Gemini OpenAI-compatible endpoint
      const geminiEndpoint = "https://generativelanguage.googleapis.com/v1beta/openai/chat/completions";

      const upstreamResponse = await fetch(geminiEndpoint, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "Authorization": `Bearer ${env.GEMINI_API_KEY.trim()}`,
        },
        body: JSON.stringify(incomingBody),
      });

      if (!upstreamResponse.ok) {
        const errorText = await upstreamResponse.text();
        return new Response(errorText, {
          status: upstreamResponse.status,
          headers: {
            "Content-Type": "application/json",
            "Access-Control-Allow-Origin": "*",
          },
        });
      }

      const responseJson = await upstreamResponse.json();

      // Ensure that character generation responses ALWAYS have a valid, non-N/A Short Greeting
      // and strip any <LEAD> tags to prevent CreatureChat from pathfinding into random underground targets
      if (responseJson && responseJson.choices && responseJson.choices.length > 0) {
        const message = responseJson.choices[0].message;
        if (message && typeof message.content === "string") {
          message.content = ensureCharacterGreeting(message.content, incomingBody);
          // Strip <LEAD> and <UNLEAD> to prevent CreatureChat RandomTargetFinder from leading players underground
          message.content = message.content.replace(/<LEAD>/gi, "").replace(/<UNLEAD>/gi, "").trim();
        }
      }

      return new Response(JSON.stringify(responseJson), {
        status: 200,
        headers: {
          "Content-Type": "application/json",
          "Access-Control-Allow-Origin": "*",
        },
      });
    } catch (err) {
      return new Response(
        JSON.stringify({
          error: {
            message: err.message || "An unexpected error occurred in proxy.",
          },
        }),
        {
          status: 500,
          headers: { "Content-Type": "application/json", "Access-Control-Allow-Origin": "*" },
        }
      );
    }
  },
};

/**
 * Ensures that newly generated character sheets have a valid, spoken Short Greeting
 * so the Guide Chicken never displays "N/A" on the first player interaction.
 */
function ensureCharacterGreeting(content, fullRequest) {
  if (!content || typeof content !== "string") return content;

  // Only apply to character sheet responses
  if (!content.includes("Personality:") && !content.includes("Name:") && !content.includes("Speaking Style")) {
    return content;
  }

  // Normalize markdown bold variations of Short Greeting
  let updated = content
    .replace(/\*\*Short Greeting:\*\*/gi, "- Short Greeting:")
    .replace(/\*\*Short Greeting\*\*:/gi, "- Short Greeting:")
    .replace(/^[ \t]*Short Greeting\s*:/gim, "- Short Greeting:");

  // Check if a valid Short Greeting line already exists
  const match = updated.match(/-?\s*short greeting:\s*(.+)/i);
  if (match && match[1].trim().length > 3 && !/^["']?N\/?A["']?$/i.test(match[1].trim())) {
    return updated;
  }

  // Extract guide name/level
  let guideName = "Guide";
  const nameMatch = updated.match(/-?\s*name:\s*(.+)/i);
  if (nameMatch) {
    guideName = nameMatch[1].replace(/["\n\r]/g, "").trim();
  }

  const reqStr = JSON.stringify(fullRequest || {});
  const isGreenville = reqStr.includes("Greenville") || updated.includes("Greenville");
  let greeting = "";

  if (guideName.includes("L1") || guideName.includes("1")) {
    greeting = isGreenville
      ? "Welcome to Greenville, Mississippi! Cluck cluck! We need to rush inside and save 12 household items in the attic before the flood arrives. Press the start button beside me when you are ready!"
      : "Welcome to St. Bernard Parish, Louisiana! Rising storm surge is heading towards this house. Watch the video using the crimson button, then press the start button beside me to place sandbags!";
  } else if (guideName.includes("L2") || guideName.includes("2")) {
    greeting = isGreenville
      ? "Great job on Level 1! For Level 2, we need to locate and clear 5 clogged street drains with shears. Press the start button beside me to begin!"
      : "Great work! For Level 2, floodwaters are clogging neighborhood storm drains. Grab your shears and press the start button beside me to clear the drains!";
  } else if (guideName.includes("L3") || guideName.includes("3")) {
    greeting = isGreenville
      ? "Welcome to Sandbag Defense! We need to build sandbag barriers around the building. Watch the educational video with the crimson button, then press the start button beside me!"
      : "Welcome to Wildlife Rescue! Floodwaters are rising in the swamp. Grab a lead, rescue the stranded pets, and bring them across the bridge! Press the start button to start!";
  } else if (guideName.includes("L4") || guideName.includes("4")) {
    greeting = isGreenville
      ? "A river levee broke! Jump into a rescue boat, find the 4 stranded citizens in the floodwaters, and bring them safely to the tents. Press the start button beside me to begin!"
      : "Water has entered the ground floor! Rush inside, collect 12 valuable household items, and store them safely in the upstairs chest. Press the start button beside me to begin!";
  } else if (guideName.includes("L5") || guideName.includes("5")) {
    greeting = isGreenville
      ? "Welcome to the Relief Camp! Grab food and clean water rations from the supply table and deliver them to our 4 residents resting in the tents. Press the start button to begin!"
      : "A reservoir is overflowing! Dive down to clear blockages, grab a spare cogwheel to fix the controls, and open the spillway gate! Press the start button beside me to begin!";
  } else {
    greeting = "Hello! I am your flood-proofing Guide Chicken. Press the start button beside me when you are ready to begin this challenge!";
  }

  // Replace existing N/A line or append new Short Greeting line
  if (match) {
    return updated.replace(/-?\s*short greeting:\s*(.+)/i, `- Short Greeting: "${greeting}"`);
  }
  return updated.trim() + `\n- Short Greeting: "${greeting}"`;
}
