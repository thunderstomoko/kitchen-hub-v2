# Kitchen Hub setup checklist

About an hour, mostly copy and paste. Do it on a computer if you can, since the Supabase and Vercel sites are easier on a big screen.

What's in this folder:

| File | What it is |
|---|---|
| `index.html`, `app.js`, `icon.png` | The app itself |
| `config.js` | Where your two Supabase values go |
| `1-setup.sql` | Creates the database tables and locks them down |
| `2-household.sql` | The list of emails allowed in (you and Zachary) |
| `3-your-data.sql` | Your 247 inventory items and 46 meals |

---

## Part 1: Supabase (your existing project)

The setup only adds new tables whose names start with `kh_`. Nothing from the old Kitchen Hub gets changed or deleted.

1. Open your project at supabase.com and click **SQL Editor** in the left sidebar.
2. Click **New query**. Open `1-setup.sql`, copy all of it, paste it in, and click **Run**. It should say "Success. No rows returned."
3. Open `2-household.sql`. Replace the two example addresses with **your email and Zachary's**, keeping the quote marks. Paste it into a new query and click **Run**.
4. Open `3-your-data.sql`, paste it into a new query, and click **Run**.
5. Click **Table Editor** and check that `kh_items` has 247 rows and `kh_meals` has 46.
6. Go to **Authentication**, then the **Email** sign-in settings (under Sign In / Providers). Turn **off** "Confirm email" and save. This lets you two log in with a password without waiting on emails, which Supabase's free email service can't reliably send.
7. Go to **Project Settings → API** (it may be called **API Keys**) and copy two things into a note:
   - the **Project URL** (looks like `https://abcd1234.supabase.co`)
   - the **anon public** key (or the **publishable** key, if that's what you see)

   Do **not** copy the `service_role` or `secret` key. That one never goes in the app.

## Part 2: GitHub

8. Open `config.js` in a text editor (Notepad or TextEdit is fine). Replace `PASTE_PROJECT_URL_HERE` and `PASTE_ANON_KEY_HERE` with your two values, keeping the quote marks, and save.
9. On github.com, click **+ → New repository**. Name it `kitchen-hub-v2`. Private is fine. Click **Create repository**.
10. On the new repo page, click **uploading an existing file**. Drag in every file from this folder and click **Commit changes**.

## Part 3: Vercel

11. On vercel.com, click **Add New → Project**, then **Import** next to `kitchen-hub-v2`. If you don't see it, use the option to adjust GitHub app permissions and give Vercel access to that repo.
12. For **Framework Preset**, choose **Other**. Leave the build settings empty and click **Deploy**.
13. When it finishes, copy your site address. It will look like `kitchen-hub-v2.vercel.app`, maybe with extra letters.

## Part 4: Sign in

14. Open your site address on your phone. Tap **First time here? Create an account**, enter your email (the same one from step 3) and a password, and tap **Create account**. Your kitchen should load.
15. Add it to your home screen:
    - **iPhone (Safari):** Share button → **Add to Home Screen**
    - **Android (Chrome):** ⋮ menu → **Add to home screen**
16. Send Zachary the address so he can do steps 14 and 15 with his own email and password.
17. Optional but recommended: once you both have accounts, go to Supabase **Authentication** settings and turn off **Allow new users to sign up**. Nobody else could see your data anyway, but this keeps strangers from making accounts at all.

---

## If something goes wrong

| What you see | Fix |
|---|---|
| "Setup isn't finished" | `config.js` still has the PASTE_ placeholders, or a value is missing a quote mark. Edit it on GitHub (open the file, then the pencil icon) and Vercel will update the site within a minute. |
| "This email isn't on the household list" | The email you signed up with doesn't exactly match `2-household.sql`. In Supabase **Table Editor → kh_household**, fix or add the address. |
| "Wrong email or password" on first visit | You need to create an account first. Tap **First time here? Create an account**. |
| "Waiting for email confirmation" | Step 6 was missed. Turn off "Confirm email", then in **Authentication → Users**, delete the unconfirmed user and create the account again. |
| A change doesn't show on the other phone | Pull down to refresh, or close and reopen the app. |

## Making changes later

Edit any file on GitHub and Vercel republishes the site by itself. You can also ask Claude for a change and upload the new file.

Your old Kitchen Hub repo, the old Vercel project, and the old tables in Supabase are untouched. Delete them whenever you're sure you don't need them.
