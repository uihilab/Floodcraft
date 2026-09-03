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

      const responseData = await upstreamResponse.text();

      return new Response(responseData, {
        status: upstreamResponse.status,
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
