# Xo & Niclas: Our Enchanted Pond

Two pages:

- **index.html**: the storybook with its own fairy tale music. It's public, so this is the link for the NFC sticker.
- **pond.html**: our world, with the countdown, the calendar, surprise dates and our photos. You open it with a magic word.

Until Supabase is connected, `pond.html` runs in **preview mode**: nothing is saved, and a time-travel slider shows how the frog hops.

---

## Step 1. Supabase (the pond's memory), about 10 minutes

1. Go to **supabase.com** → *Start your project* → sign in with GitHub.
2. **New project** → name it `our-pond` → set a database password (save it somewhere) → pick the region **Stockholm (eu-north-1)** → *Create*.
3. Open **SQL Editor → New query**, paste the whole of `supabase-setup.sql`, and press **Run**. This creates the dates, the photos bucket, the privacy rules and your first three adventures.
4. Open **Authentication → Users → Add user → Create new user**:
   - Email: any email you control, for example your own. This is the shared pond account, and Niclas never needs to see it.
   - Password: **your magic word**. Pick something you both will remember, at least 6 characters.
   - Tick **Auto Confirm User**.
5. Open **Project Settings → API** and copy two values: the **Project URL** and the **anon public** key.

## Step 2. Fill in config.js

Open `config.js` and fill in:

```js
supabaseUrl: "https://xxxx.supabase.co",
supabaseAnonKey: "eyJ...",
pondEmail: "the email from step 1.4",
siteUrl: "https://YOUR-GITHUB-NAME.github.io/our-pond/pond.html"
```

The anon key is safe to put on the web. The privacy rules only let the signed-in pond account read or change anything.

## Step 3. GitHub Pages (the pond's home), about 5 minutes

1. On **github.com** → **New repository** → name it `our-pond` → **Public** → *Create*.
2. Click **uploading an existing file** and drag in every file from this folder. Then **Commit changes**.
3. Go to **Settings → Pages → Branch: main / (root) → Save**.
4. After about a minute your site is live:
   - Story: `https://YOUR-GITHUB-NAME.github.io/our-pond/`
   - Pond: `https://YOUR-GITHUB-NAME.github.io/our-pond/pond.html`

To change something later, open the file on GitHub and click the pencil icon, or upload a new version.

## Step 4. The NFC sticker

1. Install **NFC Tools** (free, iPhone or Android).
2. **Write → Add a record → URL** → paste the story link.
3. Tap **Write** and hold your phone to the sticker. An NTAG213 sticker is plenty.

## Changing or cancelling a date

- **Change:** open **Calendar → Coming up → Change**, or tap *Change or cancel this date* under the countdown. You can edit the name, time, place and note. If you move the time, the frog recalculates his lily pads.
- **Cancel:** tap **Cancel** next to the date, then *Yes, cancel it*.
- **Surprises:** only the person who planned a surprise can see and change its details. The other person can only move the time.
- **Old adventures:** past adventures can get a date and photos, or be removed.

## The big day

- **The morning of:** the frog reaches the heart and the card glows pink with sparkles. It says *"Today is the day!"*, hearts burst the first time you open it, and the frog does a little dance.
- **Every hour:** a new line counts down the final hours.
- **Surprises:** 3 hours before, the secret is revealed with *"The secret is out!"* and more hearts.
- **At date time:** the numbers hit zero and it says *"It's date time! Phone down. Go kiss the frog."*
- **The morning after:** a card asks *"How was …?"* with a button to add your photos to the scrapbook. It stays for 3 days.

## How it works

- **Book it**: dates go straight onto the calendar. Choose *We planned it together* or *A surprise from me*.
- **Surprises**: the other person only sees the time and your clues. The frog reveals the secret 3 hours before.
- **Countdown**: every lily pad is one day. Each midnight the frog hops one pad closer, and his message changes every hour. The messages match the activity (dancing, comedy, karaoke, dinner and more).
- **WhatsApp**: every date has a *Share on WhatsApp* button with a ready-made message.
- **Memories**: add photos to any adventure. They're shrunk to about 1800px and stored privately in Supabase, and the free tier holds thousands.
- **Each phone** asks once "Who's hopping in?" and remembers the answer.

Note: the surprise secret is hidden by the page, not locked by the database. Someone who digs through the browser's developer tools could peek, but the frog trusts you both.
