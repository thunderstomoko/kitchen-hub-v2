-- Kitchen Hub: add recipes to meals, plus a "Sides & Extras" section
-- Paste into Supabase > SQL Editor > New query, then click Run. Safe to run twice.

alter table public.kh_meals add column if not exists recipe_url    text not null default '';
alter table public.kh_meals add column if not exists recipe_source text not null default '';
alter table public.kh_meals add column if not exists ingredients   text not null default '';
alter table public.kh_meals add column if not exists steps         text not null default '';

alter table public.kh_meals drop constraint if exists kh_meals_type_check;
alter table public.kh_meals add constraint kh_meals_type_check
  check (type in ('Breakfast','Lunch','Dinner','Dessert','Sides & Extras'));
