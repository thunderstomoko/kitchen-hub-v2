-- Kitchen Hub: 9 recipes from your family recipe book
-- Run 5-add-recipes.sql first if you haven't yet.
-- Paste into Supabase > SQL Editor > New query, then click Run. Safe to run twice.

insert into public.kh_meals (id, type, name, recipe_source, ingredients, steps, kids, adults, uses, sort_order) values
  ('book-01', 'Dinner', 'Hungarian Mushroom Soup', 'Family recipe book · Prep 15 min · Cook 30 min · Serves 4', '4 Tbsp salted butter
1 large yellow onion, diced
1 lb cremini mushrooms, sliced
2 c. vegetable or chicken stock
1/2 c. dry white wine
2 tsp dried dill
2 tsp fresh thyme leaves
2 tsp sweet paprika
2 Tbsp Worcestershire sauce
1 tsp salt
1 c. whole milk
1 Tbsp fresh lemon juice
3 Tbsp flour
1/4 c. sour cream
2 Tbsp parsley', 'Melt butter in a large pot over medium heat. Once bubbling, add the onion + mushrooms.
Cook, stirring occasionally, until the onion is softened + translucent and the mushrooms have released their liquid, about 8 mins.
Add the stock, wine, dill, thyme, paprika, Worcestershire sauce, + salt. Increase the heat to high + bring to a boil.
Reduce to low + simmer, stirring occasionally, until the liquid has reduced by one third, about 10 mins.
In a small bowl, whisk together the flour + milk until smooth. Slowly pour the milk mixture into the soup, stirring constantly.
Continue to cook, stirring occasionally, until the soup thickens, about 10 more mins.
Remove the pot from the heat. Stir in the sour cream + lemon juice until fully incorporated + smooth.
Ladle soup into bowls + top with parsley. Can also top with more sour cream + freshly cracked pepper.', 'Buttered noodles or rice, chicken strips, and a veggie', 'Soup with bread on the side', 'Butter, onions, broth, Worcestershire, milk, lemon juice, flour', 101),
  ('book-02', 'Dinner', 'Chicken + Rice Soup', 'Family recipe book · Prep 10 min · Cook 6 hours (slow cooker) · Serves 8', '4 1/2 c. chicken broth
2 c. water
1 c. carrots, peeled + grated
1 c. celery, diced
2 boneless, skinless chicken breasts
6.2 oz pkg quick-cooking long grain + wild rice mix
1/2 c. flour
1/2 tsp salt
1/2 tsp pepper
1/2 c. butter, sliced
2 c. half + half', 'In a large slow cooker, combine broth, water, carrots, celery, chicken, and rice mix with seasoning packet.
Cover + cook on low for 6-8 hours, or on high 4-6 hours.
Remove chicken to a plate; shred + return to slow cooker.
In a small bowl, combine flour, salt, + pepper.
Melt butter in a saucepan over medium heat. Gradually stir in flour mixture; cook + stir until golden.
Gradually stir in half + half until smooth.
Stir this mixture into the soup in the slow cooker. Cover + cook 15 mins more.', 'Scoop out the chicken, rice and carrots before adding the cream; serve in separate piles', 'Creamy soup', 'Chicken breast, chicken broth, butter, flour, Rice-a-Roni or rice', 102),
  ('book-03', 'Dinner', 'Zuppa Toscana (Sausage + Kale) Soup', 'Family recipe book · Prep 10 min · Cook 35 min · Serves 6', '5 strips thick-cut bacon
1 lb italian sausage
1 medium onion, diced
5 cloves garlic, minced
2 c. chicken broth
4 c. water
4 large red potatoes, diced + skin on
1/4 tsp 1 [?] Italian seasoning
1 c. heavy cream
1 small bunch kale, chopped small
Salt + pepper', 'Using kitchen shears, cut the bacon into small pieces + add it to a pot. Cook for 5 mins over medium-high heat.
Add the sausage to the pot. Allow to get nicely browned + crispy, stirring occasionally, about 15-20 mins. Do not drain.
Add onions + garlic + cook 2-3 mins.
Add broth, water, potatoes, + Italian seasoning. Increase heat to high + bring to a boil.
Reduce to medium-low + simmer 10-15 mins until potatoes are tender.
Add in cream + kale + cook 5 more mins. Season w/ salt + pepper to taste.
Note: Russet potatoes or Yukon Gold work too, approx. 1 1/2 lb.', 'Pull out potatoes and sausage before the cream and kale go in; serve separately', 'Full soup', 'Bacon, Italian sausage, onions, chicken broth, russet potatoes, heavy cream, chopped kale', 103),
  ('book-04', 'Sides & Extras', 'Ranch Seasoning', 'Family recipe book · Prep 10 min · Serves 12', '2/3 C buttermilk powder
1/4 C dried parsley
1 1/2 Tbsp dried minced onion flakes
1 1/2 Tbsp garlic powder
1 1/2 Tbsp onion powder
3 tsp dried dill
2 tsp dried chives
2 tsp ground black pepper
2 tsp salt', 'In an airtight container, add all ingredients. Put the lid on tightly and shake.
Store in refrigerator for up to 3 months. Shake before each use.
To make dressing: Combine 1 Tbsp mix with 1/3 C mayo or greek yogurt and 1/3 C milk. Whisk to combine.
When using as a substitute for a packet of ranch seasoning, use 2 Tbsp.', '', '', 'Parsley flakes, granulated garlic and onion, pepper, salt', 104),
  ('book-05', 'Sides & Extras', 'Onion Soup Mix', 'Family recipe book · Prep 5 min · Makes 1 oz', '1/4 C dried onion flakes
2 Tbsp beef bouillon granules
1/4 tsp onion powder
1/4 tsp parsley flakes
1/8 tsp celery seed
1/8 tsp paprika
1/8 tsp ground black pepper', 'Place all ingredients into an air-tight container and stir or shake well. Store up to 6 months.
To make soup: Place mix into a saucepan. Stir in 4 cups water and bring to a boil, stirring occasionally, for 10 minutes. Makes about 3 1/2 cups of soup.
To make onion dip: Combine mix with 1 container (16 oz) sour cream.
When using as a substitute for a packet of onion soup mix, use about 3 Tbsp.', '', '', 'Beef bouillon, granulated onion, parsley flakes, celery seed, paprika', 105),
  ('book-06', 'Sides & Extras', 'Taco Seasoning', 'Family recipe book · Prep 5 min · Serves 8', '1/2 C chili powder
1/4 C onion powder
2 Tbsp ground cumin
2 Tbsp garlic powder
1 Tbsp smoked paprika
2 Tbsp kosher or sea salt
1 Tbsp black pepper
1/8 tsp cayenne pepper (optional)', 'In an airtight container, add all ingredients. Put the lid on tightly and shake. Makes about 1 cup. Shake before each use.
To make taco beef: Brown 1 lb ground beef, drain, add 3 Tbsp seasoning and 3/4 cups of water.
When using as a substitute for a packet of taco seasoning, use 3 Tbsp.', '', '', 'Granulated onion and garlic, smoked paprika, kosher salt, black pepper', 106),
  ('book-07', 'Sides & Extras', 'House-Blend Seasoning', 'Family recipe book · Makes 1/3 cup', '5 tsp onion powder
1 Tbsp garlic powder
1 Tbsp paprika
1 Tbsp dry mustard
1 tsp dried thyme
1/2 tsp celery seed
1/2 tsp white pepper', 'Mix all ingredients together + store in air tight container.', '', '', 'Granulated onion and garlic, paprika, celery seed', 107),
  ('book-08', 'Sides & Extras', 'Cream of Chicken Soup (condensed)', 'Family recipe book · Prep 2 min · Cook 10 min · Serves 2', '1/4 C salted butter
1/3 C flour
1/4 tsp black pepper
1/4 tsp garlic powder
1/4 tsp onion powder
1/4 tsp salt
1/8 tsp celery seed
1 C chicken broth
1 C milk', 'In a small sauce pan over medium-low heat, melt butter.
Add all the dry ingredients, whisking to combine. Once smooth, cook for 1 minute whisking occasionally.
Slowly pour in chicken broth while constantly whisking to avoid lumps.
Slowly pour in milk, again whisking constantly.
Bring mixture to a slow simmer while whisking often. Allow to simmer 2-3 minutes until thickened.
Remove from heat until ready to use. If it is too thick, thin it out with milk.
Once at room temp, store in an airtight container + refrigerate up to 3 days.
This recipe makes the equivalent of 2 cans of condensed soup.', '', '', 'Butter, flour, chicken broth, milk, celery seed', 108),
  ('book-09', 'Sides & Extras', 'Dill Ranch Crackers', 'Family recipe book', '24 oz oyster crackers
12 oz Cheez-its
3-4 cups pretzel sticks
16 oz bottle butter-flavored popcorn oil
1 oz ranch salad dressing mix
2 Tbsp dill weed', 'Combine crackers + pretzels in a very large bowl; toss to mix.
In a separate bowl, combine oil, dressing mix, + dill weed; mix well.
Drizzle oil mixture over cracker mixture; stir well.
Cover + let stand for one day before serving. Flip container occasionally until oil is completely absorbed.', 'Snack', 'Snack', 'Pretzels, ranch seasoning (or your homemade Ranch Seasoning)', 109)
on conflict (id) do nothing;
