# Gear Shop / ConGears — DevOps Demo Video Script

**Course:** SWE40006 — Software Deployment and Evaluation
**Target runtime:** 4:30 – 5:00
**Repo state this script is written against:** `main` @ `0bda0a4` — *"Added manual approval before deploying to Production"*
**Presenter:** team representative  
**Audience:** lecturer (will be embedded in slides or played before Q&A)

---

## 0. What the video has to prove (the marking map)

| Level | Requirement | Where it appears in the video |
|---|---|---|
| **L1** | Repository server, CI/build server, test server, production server | 0:00–1:45 (architecture + `deploy.yml` stages 1–2) |
| **L2** | Instrumentation on the production server | 2:20–2:40 (Netdata on Production) |
| **L3** | Deploy a real app through the pipeline and verify it works | 2:40–3:00 and 3:20–3:50 (live storefront + Testing verification) |
| **L4** | Change source code → triggered/deferred deployment of the new build | 3:00–4:40 (commit → auto Testing → approval gate → Production) |

Everything after 3:00 is one continuous unbroken take of the same commit moving through the pipeline. **Do not cut inside the pipeline run** — the lecturer is looking for cause and effect.

---

## 1. Pre-flight checklist (do this the night before, not 10 minutes before)

### 1.1 Verify the pipeline itself is healthy
- [ ] `main` is green: GitHub → **Actions** → the latest run on `main` has all four stages ticked.
- [ ] GitHub → **Settings → Environments → PRODUCTION** exists and has **Required reviewers** set to `Skynoshy1` and `hung7405`. *This is not in the repo — without it, Stage 4 runs immediately and Levels 4's "deferred deployment" claim is false.*
- [ ] GitHub → **Settings → Secrets and variables → Actions** lists: `DOCKER_USERNAME`, `DOCKER_PASSWORD`, `EC2_SSH_KEY`, `TESTING_HOST`, `PRODUCTION_HOST`, `NEXT_PUBLIC_SUPABASE_URL`, `NEXT_PUBLIC_SUPABASE_ANON_KEY`, `NEXT_PUBLIC_SUPABASE_PUBLISHABLE_KEY`. Confirm names only — never open a value.
- [ ] Docker Hub shows both `gearshop-frontend:latest` and `gearshop-backend:latest` pushed today.

### 1.2 Verify both servers
SSH into each (keep both terminals open, one tab per server):

```bash
ssh -i gearshop-key.pem ubuntu@13.214.157.85    # Testing
ssh -i gearshop-key.pem ubuntu@47.129.85.89     # Production
```

On each, run and **leave the output on screen**:

```bash
hostname
docker compose ps
free -h
swapon --show
curl -i http://localhost:5000/health
curl -i http://localhost:5000/health/db
```

- [ ] `swapon --show` really shows ~2G. If not, do not say "2GB swap" in the video.
- [ ] `docker compose ps` shows `gearshop-frontend` and `gearshop-backend` up. (There is **no compose file in the repo** — it lives only at `~/app/docker-compose.yml` on each server. Open it on the server when you talk about runtime config; don't show a local copy.)
- [ ] Production `swapon`/`free` look calm — Netdata is running and hasn't eaten the box.

### 1.3 Verify the URLs you will click in front of the camera
- Testing frontend — `http://13.214.157.85:3000`
- Testing backend — `http://13.214.157.85:5000/health`
- Production frontend — `http://47.129.85.89:3000`
- Production backend — `http://47.129.85.89:5000/health`
- Netdata — `http://47.129.85.89:19999`
- Admin login — `/admin/login` on both (keep a working admin account ready; do **not** show the password field while typing, or blur it in editing).

Do one **dummy dry run** of the whole flow on a throwaway branch and delete it. The first time you record must not be the first time it runs.

### 1.4 Prepare the Level 4 change
Open a terminal in the repo at `main`, already pulled (`git pull origin main`), clean working tree. The change we use is deliberately cosmetic and trivially verifiable on screen:

**File:** `frontend/app/components/Footer.tsx`

```diff
-          . All Rights Reserved.
+          . All Rights Reserved. — Release v2.0
```

That renders in the footer of **every** storefront page, so you can prove "old build" vs "new build" from the browser without logging in.

Have this one-line commit message ready: `chore(demo): stamp release v2.0 in footer`

### 1.5 Tabs to pre-open, left to right
1. GitHub → repo → **Actions** tab (run list)
2. GitHub → `.github/workflows/deploy.yml` (blame view is fine)
3. GitHub → **Settings → Environments → PRODUCTION**
4. `frontend/Dockerfile` in the GitHub editor or VS Code
5. `backend/server.js` around `/health`
6. GitHub → **Settings → Secrets → Actions**
7. Testing frontend browser tab
8. Production frontend browser tab
9. Netdata tab
10. AWS Console → EC2 → Instances (filter: `gearshop`)
11. Two SSH terminals (Testing, Production)

### 1.6 Recording setup
- 1920×1080, 30 fps, browser zoom **110–125%** so text is legible after compression.
- OBS: one scene = full screen, one scene = webcam small in the corner. Separate audio track if you can.
- Mic test: record 10 seconds, play it back, check for fan noise.
- Turn off notifications (Windows Focus Assist), close email/Slack/Discord.
- Cursor: enable "highlight mouse clicks" if available.
- **Never show:** `.env` contents, private keys, Docker Hub password, Supabase service-role/secret key, GitHub secret values.

---

## 2. The script

Format: **SCREEN** = what is on screen · **SAY** = read this, in English, roughly word-for-word.
Spoken word budget is ~600 words — do not improvise extra explanation, it will push you past five minutes.

---

### 0:00 – 0:25 · Cold open — the problem (25 s)

**SCREEN:** Production storefront, scrolled once slowly. Then cut to the whole picture: two browser tabs side by side (Testing left, Production right).

**SAY:**

> "This is Gear Shop — a Next.js and Express e-commerce application backed by Supabase. But the interesting part of this project isn't the shop. It's how the shop gets delivered. We built a four-stage DevOps pipeline on AWS: from a commit on GitHub, to a lint and build stage, to an automatic deployment on a test server, and finally a gated release to production. I'll walk you through the whole chain, then prove it live with a real code change."

**Notes:** do not start with "hi my name is…". Start on the product, name the pipeline in the first fifteen seconds.

---

### 0:25 – 1:05 · Level 1 — the two environments (40 s)

**SCREEN:** AWS Console → EC2 → Instances, both `gearshop-testing` and `gearshop-production` visible with names and public IPv4. Then the Security Groups inbound rules. Then back to the two browser tabs.

**SAY:**

> "Level one asks for separated servers. We have four moving parts. GitHub is the code repository server. GitHub-hosted runners are the CI and build server. And two independent Ubuntu EC2 instances on AWS: `gearshop-testing` at 13.214.157.85, and `gearshop-production` at 47.129.85.89. They are separate machines — separate operating systems, separate Docker daemons, separate data in transit. Each security group opens only what its role needs: SSH for the pipeline to deploy, 3000 for the frontend, 5000 for the backend API, 80 and 443, and on production only, port 19999 for monitoring. We also added a two gigabyte swap file on both instances, because pulling a new image and recreating containers at the same time can exhaust the memory of a small instance."

**Notes:** if `swapon --show` didn't confirm 2 GB in pre-flight, replace the swap sentence with "we configured a swap file on both instances to avoid out-of-memory failures during redeploys."

---

### 1:05 – 1:45 · Level 1 — pipeline stages 1 and 2 (40 s)

**SCREEN:** GitHub → `.github/workflows/deploy.yml`, scrolled so the job names are visible. Highlight `on: push: branches: [main]`, then `needs:` between jobs. Then `frontend/Dockerfile`, focused on the `ARG`/`ENV` block above `RUN npm run build`.

**SAY:**

> "Everything is driven by one workflow file, triggered by a push to main. Stage one is lint: both services are installed on a clean Ubuntu runner with Node 22, and ESLint runs on the frontend. This is fail-fast — a syntax error stops the pipeline before we spend time building or touching a server. Stage two depends on stage one and builds two Docker images, then pushes them to Docker Hub. The frontend image receives its public Supabase configuration as build arguments, because Next.js inlines `NEXT_PUBLIC_` variables into the JavaScript bundle at build time. The high-privilege Supabase secret key is never passed here — it only exists in the runtime environment file on the server."

**Notes:** the Dockerfile is **single-stage** (one `FROM`). Do not say "multi-stage build"; the earlier draft materials said that and it is not what the code does. If asked later, frame it as a possible improvement.

---

### 1:45 – 2:20 · Stage 3 and 4 — automatic vs deferred (35 s)

**SCREEN:** Back to `deploy.yml`, bottom half. Highlight `stage-3-deploy-testing` with its SSH step, then `environment: PRODUCTION` on stage four. Then the Testing SSH terminal with `~/app/docker-compose.yml` open (`cat` the file — it has no secrets in it).

**SAY:**

> "Stage three connects over SSH to the testing instance, pulls the new images, recreates the containers with Docker Compose and prunes the old ones. Then it waits twenty seconds and calls the backend's `/health` endpoint with a failing curl — so if the API doesn't answer, the pipeline goes red and production is never reached. Stage four is the same deploy against the production host, but with one line that changes everything: `environment: PRODUCTION`. That binds the job to a GitHub Environment with required reviewers, which is how we get a deferred deployment instead of an automatic one."

**Notes:** the compose file is on the server only. On the file, point at the two services, the `3000:3000` and `5000:5000` mappings, `restart: always`, and `env_file` — plus the `PORT=3000` override for the frontend (the shared env file carries the backend's `PORT=5000`). That port clash is a good "problem we solved" story if you have ten spare seconds; cut it if you're behind schedule.

---

### 2:20 – 2:40 · Level 2 — instrumentation (20 s)

**SCREEN:** Netdata dashboard at `http://47.129.85.89:19999`, on Production only. Show the CPU/RAM/disk charts, then scroll to the Docker containers section showing `gearshop-frontend` and `gearshop-backend` separately.

**SAY:**

> "Level two is instrumentation. On the production server only, Netdata runs as its own container with read access to the host and to the Docker daemon. It gives us live CPU, memory, swap, disk I/O and network, and because it reads cgroup metrics we can see each application container separately — this is how we would notice the frontend leaking memory after a deploy. Threshold alerts are configured on the same dashboard."

**Notes:** open the Alarms panel for two seconds if it renders quickly. If Netdata is slow to load, pre-warm the tab before recording — never sit in silence waiting for a dashboard.

---

### 2:40 – 3:00 · Level 3 — the deployed application (20 s)

**SCREEN:** Production storefront → scroll through the catalog loaded from Supabase → open one product → add to cart → open admin login page → admin dashboard. Keep it fast; do not demo every feature.

**SAY:**

> "Level three: this is a real application, not a placeholder. The catalog, products and prices are read from Supabase PostgreSQL, the cart and checkout run through server-side API routes, and there's an admin console with role-based access. The same build is running on both servers right now — but they are not the same version, and that's the point of the next part."

---

### 3:00 – 3:20 · Level 4 — trigger the change (20 s)

**SCREEN:** VS Code, `frontend/app/components/Footer.tsx`. Type the change on camera, save, then the terminal:

```bash
git status
git diff
git add frontend/app/components/Footer.tsx
git commit -m "chore(demo): stamp release v2.0 in footer"
git push origin main
```

**SAY:**

> "Level four is automatic evolution. I'm making a real source change — a release stamp in the footer component — then committing and pushing to main. Nobody is going to click deploy. From here, the pipeline takes over."

**Notes:** push **before** you start narrating the Actions tab, so stage one is already running when you cut to it. Keep the `git diff` on screen for a beat: it proves the change is real.

---

### 3:20 – 3:50 · Stages 1 to 3 — automatic (30 s)

**SCREEN:** GitHub → Actions → the new run. Stage 1 running → green. Stage 2 building/pushing → green. Stage 3 SSH + health check → green. Then switch to the Testing frontend and scroll to the footer.

**SAY:**

> "Stage one lints again — the same checks, on the new commit. Stage two rebuilds both images and pushes them. Stage three has already deployed to testing, and there's the automated health check on the API. Let's look at the test server: the footer now says release v2.0. The new build is live on testing, confirmed by the application itself, not by me."

**Notes:** if the run is slow, do not fill the silence with explanation — speed up that segment in editing (2–4× with an on-screen "2×" label) and re-enter real time at stage three. Optionally show `docker compose ps` on the Testing SSH terminal to prove fresh containers.

---

### 3:50 – 4:15 · The deferred gate (25 s)

**SCREEN:** Back to Actions. Stage 4 shows **Waiting** / "Review deployments". Then the Production frontend tab — scroll to the footer, still the old text. Split screen if you can: Actions on the left, Production on the right.

**SAY:**

> "And here the pipeline stops. Stage four is waiting for a reviewer. This is the deferred deployment: the new build has been verified on testing, but production is still serving the previous release — you can see the footer has no version stamp. Nothing reaches a customer until a human approves it."

**Notes:** this is the highest-value 25 seconds in the video. Take your time, keep the two facts on screen at once: stage 4 waiting, and production unchanged. If GitHub already shows the approval dialog automatically, fine — but refresh once so the panel appears while you're talking.

---

### 4:15 – 4:40 · Approve and release (25 s)

**SCREEN:** Click **Review deployments** → tick `PRODUCTION` → comment e.g. `Testing verified — approved for release` → **Approve and deploy**. Stage 4 turns green. Switch to Production frontend, scroll to the footer.

**SAY:**

> "I'm the reviewer. I select the PRODUCTION environment, leave an approval comment, and approve. Stage four now connects to the production instance, pulls the exact images that passed testing, recreates the containers, and runs the same health check before finishing green. And production now serves release v2.0. Same commit, three environments, one gate — and no manual deployment anywhere in the chain."

---

### 4:40 – 4:55 · Close (15 s)

**SCREEN:** Back to the two browser tabs, or a simple slide with the four stages: `commit → lint/build → test → approve → production`.

**SAY:**

> "So: repository, CI, test and production are separate servers. Monitoring runs on production. The application is deployed through the pipeline, and a source change flows all the way to the customer — automatically where it's safe, and behind a human approval where it matters. Thank you."

---

## 3. Accuracy guardrails — what NOT to say

These are checked against the code on `main`. Saying the opposite is the fastest way to lose marks in Q&A.

1. **Do not say "multi-stage Docker build."** Both Dockerfiles have a single `FROM`. Say "a Dockerfile that separates public build-time configuration from runtime secrets."
2. **Do not say the pipeline health-checks the frontend.** Stage 3 and 4 only `curl` the backend `:5000/health`. Say "the pipeline verifies the backend API; the frontend was verified manually on the test server."
3. **Do not claim the environments are completely isolated.** Stage 2 bakes `NEXT_PUBLIC_API_URL` with the **production** host, and the Next.js auth proxy (`frontend/app/api/auth/[action]/route.ts`) forwards login/register calls to that URL. Catalog browsing and order placement go straight to Supabase from each server, so they are per-environment — but the auth proxy on Testing talks to the Production backend. If asked, this is an honest, strong answer: *"The storefront data path is per environment; the authentication proxy is built against the production API, which is a known limitation we'd fix by building one image per environment."*
4. **Do not say images are immutable/versioned.** They are tagged `latest`. Say "the same image that passed testing is promoted to production."
5. **Do not say `/health` proves the database works.** `/health` is liveness only; `/health/db` is the readiness check that actually pings Supabase. Show both if you have time (`backend/server.js`).
6. **Do not say the approval gate is defined in the repo.** `environment: PRODUCTION` only *references* it. The reviewers are configured in Settings → Environments.
7. **EC2 names, IPs, swap size, Netdata URL, and security group rules are infrastructure** — verify on screen before asserting them. They are not in the repository.

---

## 4. If something breaks mid-recording

| Failure | What to do on camera | Recovery |
|---|---|---|
| Stage 1 fails on lint | Pause, say "a real failure — and this is fail-fast working", fix locally, push again | Keep the failed run; it's evidence for the report |
| Stage 2 fails on Docker login | Do not show the error detail; cut, verify secrets, re-record that segment | Use the previous successful run as b-roll |
| Stage 3 health check times out | Show `docker compose ps` on Testing, wait, retry the curl | The 20 s sleep is tight on a cold pull; a retry in the workflow already exists |
| Stage 4 does not show Waiting | Approval rule missing → stop recording, fix Settings → Environments, re-record | Without this the Level 4 claim is unsupported |
| Netdata slow / 502 | Skip the section, record it separately after the pipeline segment | It is an independent proof, can be a cut-away |

---

## 5. Editing and delivery

- **Intro card (2 s):** team name, course code, "Level 4 demonstration".
- **Lower-third on the environment section:** `gearshop-testing 13.214.157.85` / `gearshop-production 47.129.85.89`.
- **Speed up** waiting segments (image build, `sleep 20`) with a visible `2×` marker. Never speed up the approval click or the verification — those are the evidence.
- **Zoom call-outs** on: `needs:` lines, `environment: PRODUCTION`, the `ARG`/`ENV` block, the green stage 4, and the v2.0 footer.
- **Blur** any email address, token, key, or `.env` line that slips into frame.
- Export 1080p, upload to YouTube as **Unlisted**, put the link in the slide deck and the report appendix.
- Keep the raw recording and the Actions run URLs (`.../actions/runs/<id>`) — they are excellent report evidence.

---

## 6. One-page shot list (print this)

| Time | Screen | Beat |
|---|---|---|
| 0:00 | Production storefront | Problem + pipeline in one sentence |
| 0:25 | AWS EC2 console, security groups, 2 browser tabs | 4 components, 2 servers, ports, swap |
| 1:05 | `deploy.yml` stages 1–2, `frontend/Dockerfile` | Lint fail-fast, build & push, build args |
| 1:45 | `deploy.yml` stages 3–4, compose on EC2 | Auto Testing vs `environment: PRODUCTION` |
| 2:20 | Netdata 19999 | CPU/RAM/disk + per-container metrics |
| 2:40 | Production storefront + admin | Real app, Supabase-backed, RBAC |
| 3:00 | VS Code footer, git push | Real commit, no manual deploy |
| 3:20 | Actions run green ×3, Testing footer | Auto chain + v2.0 on Testing |
| 3:50 | Stage 4 Waiting + Production footer unchanged | Deferred deployment proven |
| 4:15 | Review → Approve → green, Production footer v2.0 | Gated release |
| 4:40 | Recap slide | Close |
