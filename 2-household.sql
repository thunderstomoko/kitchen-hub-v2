-- Kitchen Hub: who can sign in
-- 1. Replace the two example addresses with your email and Zachary's.
-- 2. Paste into Supabase > SQL Editor > New query, then click Run.
-- To add someone later, run another insert line with their email.

insert into public.kh_household (email) values
  ('your-email@example.com'),
  ('zachary-email@example.com')
on conflict do nothing;
