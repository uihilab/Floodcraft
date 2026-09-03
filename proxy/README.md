# FloodCraft AI Proxy (Cloudflare Worker)

This lightweight, free proxy allows students and teachers to chat with the in-game **AI Guide Chicken** without needing their own Google Gemini API keys or accounts.

Your private `GEMINI_API_KEY` is securely stored as an environment secret inside your Cloudflare Worker, completely hidden from players and public repositories.

---

## ⚡ Deployment Options (Takes ~2 minutes)

### Option A: 1-Click via Cloudflare Web Dashboard (No Command Line Needed)

1. Go to the [Cloudflare Dashboard](https://dash.cloudflare.com/) and log in (create a free account if you don't have one).
2. On the left sidebar, navigate to **Compute (Workers & Pages)** > **Create application** > **Create Worker**.
3. Name it `floodcraft-ai-proxy` and click **Deploy**.
4. Click **Edit code**:
   - Delete any default code in `worker.js`.
   - Copy and paste the full contents of [`worker.js`](worker.js) into the editor.
   - Click **Deploy** in the top right.
5. Go to **Settings** > **Variables and Secrets**:
   - Click **Add** under **Secrets**.
   - Name: `GEMINI_API_KEY`
   - Value: Paste your Google Gemini API key (from [Google AI Studio](https://aistudio.google.com/app/apikey)).
   - Click **Save and Deploy**.
6. Copy your Worker URL from the dashboard (e.g., `https://floodcraft-ai-proxy.<your-subdomain>.workers.dev`).

---

### Option B: Deploy via Command Line (`wrangler`)

If you have Node.js installed, you can deploy in 2 commands:

```bash
# 1. From the proxy/ directory, deploy the worker
npx wrangler deploy

# 2. Add your Gemini API Key as an encrypted secret
npx wrangler secret put GEMINI_API_KEY
# (Paste your Gemini API key when prompted)
```

---

## 🔗 Updating `creaturechat.json`

Once your Worker is deployed, update the `"url"` field in both world save files:
- `minecraft/saves/Greenville Backup 5/creaturechat.json`
- `minecraft/saves/St. Bernard Parish/creaturechat.json`

Replace `<YOUR_WORKER_SUBDOMAIN>` with your Cloudflare Worker domain:
```json
{
  "url": "https://floodcraft-ai-proxy.campbell-endries.workers.dev/v1/chat/completions",
  ...
}
```

Now anyone who downloads FloodCraft can play immediately with full AI support!
