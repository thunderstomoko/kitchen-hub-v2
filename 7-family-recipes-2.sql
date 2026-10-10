-- Kitchen Hub: 20 more recipes from your family recipe book
-- Paste into Supabase > SQL Editor > New query, then click Run. Safe to run twice.

insert into public.kh_meals (id, type, name, recipe_source, ingredients, steps, kids, adults, uses, sort_order) values
  ('book-10', 'Dessert', 'Blueberry Crumble', 'Family recipe book · Prep 5 min · Cook 35 min · Serves 6', '1 1/2 lb fresh blueberries
2 Tbsp sugar
2 Tbsp AP flour
1 Tbsp lemon juice
Pinch fine sea salt
Crumble topping:
3/4 C AP flour
3/4 C old fashion oats
1/2 C melted butter
1/4 C EACH sugar + brown sugar
1/8 tsp fine sea salt', 'Preheat oven to 375°.
Add the blueberries, lemon juice, flour, sugar, + salt to a 9 inch pie dish or 2 qt baking dish. Toss well to combine.
In a medium bowl, combine flour, oats, sugar, + salt. Add the melted butter, then stir until the butter has moistened all the flour and the topping is crumbly.
Sprinkle the crumble topping over the blueberry filling.
Bake until the juices thicken and the topping turns light golden brown, 25 to 35 minutes.
Cool for 10 minutes then serve with vanilla ice cream.
Note: Can use frozen blueberries - thaw + drain well.
Note: Sugar - if berries are tart, add 1-2 more Tbsp sugar to taste.
Note: Can be made ahead + frozen before baking. Bake 40-60 min from frozen.
Note: Can be doubled for a 9x13 pan.', '', '', 'Frozen blueberries, oats, flour, butter, sugar, brown sugar, lemon juice, vanilla ice cream', 110),
  ('book-11', 'Sides & Extras', '5-Spice Brussels Sprouts', 'Family recipe book · Prep 5 min · Cook 25 min · Serves 6', '2 slices bacon, diced
2 lb brussels sprouts, trim + halved
1 Tbsp olive oil
1 tsp salt
2 Tbsp pure maple syrup
1 tsp cider vinegar
1 tsp Chinese 5-spice powder', 'In a skillet over medium heat, cook bacon until crisp. Set bacon aside and reserve one teaspoon of drippings.
In a large bowl, toss brussels sprouts w/ reserved drippings, olive oil, + salt.
Arrange sprouts on a lightly greased baking sheet. Bake, uncovered, at 350° for 15-20 mins, until just tender.
Turn oven to broil + broil sprouts for 2-3 mins, just until slightly charred.
Meanwhile, combine syrup, vinegar, + spice in a small saucepan; simmer over low heat for several minutes.
Toss sprouts with syrup mixture + reserved bacon.', '', '', 'Bacon, olive oil, real maple syrup, apple cider vinegar', 111),
  ('book-12', 'Sides & Extras', 'Maple-Orange Glazed Carrots', 'Family recipe book · Prep 5 mins · Cook 25 mins · Serves 6', '3 Tbsp butter, sliced
1/4 c pure maple syrup
1/4 c orange juice
1/4 c water
1/4 tsp kosher salt
16 oz pkg baby carrots', 'Melt butter in a saucepan over medium heat.
Stir in remaining ingredients except carrots.
Add carrots + toss to coat.
Bring to a boil, stirring occasionally.
Reduce heat to medium-low. Cover + cook until carrots are tender, about 15 mins.
Serve carrots w/ sauce from pan.', 'Carrots on their own, a little sauce or none', '', 'Butter, real maple syrup, kosher salt', 112),
  ('book-13', 'Sides & Extras', 'Broccoli Rice Casserole', 'Family recipe book · Prep 20 min · Cook 35 min · Serves 8', '6 c. broccoli florets cut into bite-size pieces
2 c. cooked white rice
3 Tbsp butter
3/4 c. diced onion
3 Tbsp flour
2 c. milk
1 tsp garlic powder
1 tsp each pepper, paprika, mustard powder
3/4 tsp salt
3 Tbsp cream cheese
2 c. shredded sharp cheddar cheese', 'Preheat oven to 350°.
Cook onion in butter on medium-low heat until softened + translucent.
Stir in flour, garlic powder, + pepper. Cook for 2 mins.
Gradually pour in milk while whisking. Continue whisking over medium heat until thick + bubbly.
Remove from heat and add mustard, paprika, cream cheese, salt, + 1 1/2 c. cheddar. Stir until melted. Taste + season w/ additional salt + pepper as needed.
Place broccoli in boiling water for about 2 mins. It should still be slightly crisp as it cooks more in the oven.
Stir together rice, broccoli, + cheese sauce. Place in a greased 2 qt casserole dish.
Top w/ remaining cheese + bake 35 mins or until bubbly and cheese is lightly browned.', 'Set aside plain rice and steamed broccoli before mixing', '', 'Broccoli, long grain white rice, butter, onions, flour, milk, cream cheese, cheddar', 113),
  ('book-14', 'Sides & Extras', 'New York Style Pizza Sauce', 'Family recipe book · Makes enough for 2-4 pies', '1 28 oz can whole peeled tomatoes
1 Tbsp extra-virgin olive oil
1 Tbsp unsalted butter
2 tsp grated garlic cloves
1 tsp dried oregano
Pinch red pepper flakes
Kosher salt
2 6 inch sprigs basil (stems + leaves)
1 medium yellow onion, split in half
1 tsp sugar', 'Puree tomatoes with a food processor or hand blender. Puree should not be completely smooth, with chunks 1/16 or smaller.
Combine butter + oil in a medium sauce pan and heat over medium-low until butter melts.
Add garlic, oregano, pepper flakes, and salt and cook, stirring frequently until fragrant, but not brown, about 3 minutes.
Add tomatoes, basil, onion, + sugar.
Bring to a simmer, reduce heat to lowest setting and cook, stirring occasionally, until reduced by half, about 1 hour.
Discard onion and basil stems. Season to taste with salt.
Allow to cool and store in a covered container in fridge for up to 2 weeks.', '', '', 'Whole peeled tomatoes, extra virgin olive oil, butter, onions, kosher salt, sugar', 114),
  ('book-15', 'Dessert', 'Rice Krispie Treats', 'Family recipe book · Prep 15 min · Cook 5 min · Serves 20', '6 Tbsp salted butter, sliced
15 oz miniature marshmallows
1 tsp pure vanilla extract
6 c. rice krispies cereal
3 Tbsp colored sprinkles (optional)', 'Lightly grease a 9x13 pan + set aside.
Place butter in large pot over medium-low heat. Stir occasionally until completely melted.
Add 10 oz marshmallows + stir until just melted. Stir frequently + be sure it doesn''t separate much.
Stir in vanilla, then add cereal and remaining 5 oz marshmallows. Stir until combined + marshmallows are just beginning to melt.
Scatter sprinkles over mixture + stir briefly to combine.
Immediately transfer mixture to prepared 9x13 dish and use a silicone spatula to gently pat down evenly into pan. Don''t over-handle them or they will come out hard.
Allow to cool completely at room temperature before cutting + serving, about 30-60 mins.', '', '', 'Butter, mini marshmallows, vanilla extract', 115),
  ('book-16', 'Sides & Extras', 'No Knead Bread', 'Family recipe book · Prep 5 min · Cook 40 min · Serves 10-12', '3 c King Arthur Bread Flour
2 tsp Instant or Rapid Rise Yeast
2 tsp Kosher Salt
1 1/2 c very warm tap water
1 1/2 Tbsp flour for shaping', 'Mix dough: Mix flour, yeast, + salt in a large bowl. Add water then use the handle of a wooden spoon to mix until incorporated. Dough will be wet and sloppy. Adjust with more water/flour if needed.
Rise: Cover with cling wrap + leave on counter 2-3 hours until it doubles in size + is bubbly + wobbly.
Optional - refrigerate for up to 3 days if not baking right away. If you do, take bowl out 45 min before baking.
Preheat Oven: Put dutch oven in oven with lid. Preheat to 450° 30 min before baking.
Shape Dough: Sprinkle work surface with 1 Tbsp flour, scrape dough from bowl + sprinkle top w/ flour. Using a dough scraper, fold the sides inward to form a round shape.
Transfer to Parchment Paper by flipping the dough upside down onto it. Slide it to the middle + reshape it if necessary to be round.
Bake: Remove dutch oven from oven and use paper to place dough inside. Put lid on, return to oven, and bake 30 minutes covered, then 12 minutes uncovered or until deep golden and crispy.
Cool on rack at least 10 min before slicing.', '', '', 'Bread flour, quick-rise yeast, kosher salt', 116),
  ('book-17', 'Sides & Extras', 'Bialys', 'Family recipe book · Prep 45 min · Cook 10 min · Serves 12', '7 cups (840g) bread flour
2 3/4 tsp table salt
1 1/4 tsp instant yeast
1/2 tsp onion powder
2 1/4 c (510g) water
Farina or yellow cornmeal for pans
Filling:
1 onion, peeled + quartered
1 tsp poppy seeds
1/8 tsp table salt
3-4 grinds black pepper
1 Tbsp olive oil', 'To make the dough: Combine flour, salt, yeast, + onion powder in the bowl of a stand mixer fitted with a beater attachment.
Switch to a dough hook and add water, mixing until just combined, 1-2 min at low speed.
Stop mixer, cover bowl, and let sit for 20 min.
After the rest, uncover the bowl and continue kneading at medium speed for 8 min, or until dough is smooth + elastic.
Transfer to an oiled bowl, cover, and refrigerate dough overnight.
Next day, divide the dough into 12 pieces and round each into a ball. Place on a lightly oiled baking sheet, cover with greased plastic, and let rise at room temp for 1 hour or until puffy.
Preheat oven to 475°F.
To make the filling: Pulse the onion in a food processor until finely chopped, but not liquid. Mix in the poppy seed, salt, and pepper.
Heat the oil in a saucepan and cook the onion mix for a few min. over medium-low heat until liquid cooks off and onion is very slightly carmelized. Let cool.
Shape + bake: Lightly sprinkle 2 baking sheets with farina or cornmeal.
Stretch each dough ball to 6" in diameter leaving a wide flat indent in the center.
Place 6 per pan + add scant tsp of onion to center, spreading.
Bake 8-10 min until light golden brown.
Note: Don''t overfill with onion - a little goes a long way.', '', '', 'Bread flour, quick-rise yeast, onions, cornmeal, olive oil', 117),
  ('book-18', 'Breakfast', 'Banana Walnut Coffee Cake', 'Family recipe book', '2 eggs, beaten
1/2 cup shortening
1 1/2 cups sugar
3 ripe bananas, mashed
1 tsp vanilla extract
1 tsp baking soda
1/4 cup buttermilk
1 1/2 cups all-purpose flour
3/4 tsp salt
1 cup chopped walnuts
Topping: 5 Tbsp butter, softened; 3/4 c. flour; 1/2 c. packed brown sugar; 1 Tbsp cinnamon', 'In a large bowl, stir together eggs, shortening, sugar, bananas, and vanilla until well blended; set aside.
Dissolve baking soda in buttermilk; add to egg mixture and stir well.
Add flour + salt and mix well. Fold in walnuts.
Pour batter into a greased and floured 13" x 9" baking pan.
Mix topping ingredients in a bowl w/ a fork or blend in a food processor until coarse crumbs form.
Spoon topping mixture over batter.
Bake at 350° for 45 minutes, or until a toothpick comes out clean.', '', '', 'Eggs, vegetable shortening, sugar, bananas, vanilla, baking soda, flour, butter, brown sugar', 118),
  ('book-19', 'Breakfast', 'Cherry Brunch Muffins', 'Family recipe book · Prep 5 mins · Cook 25 mins · Serves 18', '1 Box French vanilla cake mix
21 oz can cherry pie filling
1 c. flour
1/2 c. brown sugar, packed
1/2 c. butter, softened', 'In a large bowl, mix dry cake mix + pie filling.
Spoon batter into 18 paper-lined muffin cups, filling 2/3 full.
In a separate bowl, combine flour, brown sugar, + butter; stir until crumbly.
Sprinkle crumb mixture over muffins.
Bake at 350° for 25 mins.', '', '', 'Cherry pie filling, flour, brown sugar, butter (needs a box of cake mix)', 119),
  ('book-20', 'Breakfast', 'Overnight Oats (Cookie Dough + Tiramisu)', 'Family recipe book', 'Cookie Dough:
1 1/2 c. rolled oats
2 Tbsp chia seeds
3 Tbsp chocolate chips
2 Tbsp peanut or almond butter
3 Tbsp maple syrup
1 tsp vanilla extract
2 c. milk
1 scoop protein powder
Tiramisu:
2 c. whole milk
1/2 c. strong espresso
6 Tbsp maple syrup or honey, divided
2 1/2 tsp vanilla extract, divided
2 c. old fashioned rolled oats
8 tsp chia seeds
2 oz cream cheese, cubed + softened
5.3 oz vanilla greek yogurt
Cocoa powder', 'Cookie Dough: In a large bowl, mix all dry ingredients together. Add wet ingredients and mix thoroughly until combined.
Divide mixture between containers + cover. Store in fridge for 4+ hours, or overnight until ready to eat. Can be stored up to 5 days in fridge.
Tiramisu: In a large measuring cup, combine milk, coffee, 1/4 c. maple syrup, and 1 1/2 tsp vanilla. Divide among 4 jars.
Stir 1/2 cup oats and 2 tsp chia seeds into each container, ensuring oats are submerged in liquid. Cover + refrigerate for at least 4 hours, up to 12.
In a medium bowl, whisk cream cheese until smooth. Whisk in yogurt, remaining 2 Tbsp of maple syrup, and remaining 1 tsp of vanilla until well combined + creamy.
Spoon mixture over oats, spreading into a smooth layer. Dust with cocoa powder.
Can be stored up to 4 days in fridge.', '', 'Grown-up breakfast for you and Zachary', 'Old fashioned oats, chocolate chips, peanut butter, maple syrup, milk, protein powder, espresso, cream cheese, Greek yogurt, cocoa powder', 120),
  ('book-21', 'Breakfast', 'Cinnamon Rolls', 'Family recipe book · Prep 2 hours · Cook 20 mins · Serves 9', '3/4 c. milk
2 1/4 tsp instant or active dry yeast
1/4 c. granulated sugar
4 Tbsp salted butter, melted + cooled
1 large egg plus 1 large egg yolk, room temp
3 c. bread flour
3/4 tsp kosher salt
Filling: 4 Tbsp salted butter, softened
2/3 c. packed dark brown sugar
1 1/2 Tbsp ground cinnamon
Frosting: 4 oz soft cream cheese, 1/2 tsp vanilla ext., 3/4 c. powdered sugar, 3 Tbsp soft salted butter', 'In a small microwave-safe bowl, warm the milk 45 sec to 1 min, until 115°.
Place warmed milk in bowl of stand mixer w/ paddle attachment. Sprinkle yeast on top (if using active, add sugar + let sit 5 min til foamy).
If you haven''t already, add the sugar, then the melted butter, egg + egg yolk. Mix on medium until well combined, 30 sec.
Remove bowl from mixer + use a wooden spoon to stir in the flour + salt until a dough begins to form.
Place the dough hook on the mixer and return the bowl. Knead dough on medium 8-10 mins, until soft + slightly sticky. If too sticky - add 1 Tbsp flour at a time.
Lightly grease a large bowl w/ olive oil. Transfer dough to bowl + cover w/ plastic wrap. Allow to rise until double in size, 1 to 1 1/2 hours. You will know it is ready if you poke it and the indentation doesn''t come back out immediately.
Generously dust a surface w/ flour. Turn out dough + use a rolling pin to roll into an 10" x 14" rectangle.
Spread the filling softened butter over dough, leaving 1/4 margin at far short side of rectangle.
In a small bowl, mix brown sugar + cinnamon. Sprinkle mix over butter + gently rub it in.
Starting from short side without margin, very tightly roll up. Seal far edge by pinching dough together slightly + put seam side down.
Cut 1/2 in off ends - not enough filling (bake separate or discard). Gently push ends in so log is uniform + compact.
Cut dough into 1 in. slices. Line a round or square 9" pan w/ parchment.
Place rolls in pan, cover + rise again until double in size, 45 min to 1 hour.
Preheat oven to 350°. Remove wrap + bake until golden brown on edges, 20-25 mins. Cool 10 mins.
Frosting: whisk cream cheese, powdered sugar, butter, + vanilla, until smooth + fluffy. Spread over warm rolls to serve.
Note: Store leftovers in fridge for up to 5 days. Reheat in microwave in 15 sec intervals til warm.
Note: Overnight: After placing into pan, cover + refrigerate. Sit on counter 30-45 mins before baking.', '', '', 'Milk, quick-rise yeast, sugar, butter, eggs, bread flour, kosher salt, brown sugar, cream cheese, powdered sugar, vanilla', 121),
  ('book-22', 'Dessert', 'Snickerdoodle Cookies', 'Family recipe book · Prep 20 min · Cook 10 min · Serves 24', '1 Cup Butter
1 1/2 Cups Sugar
2 large Eggs
2 3/4 Cups Flour
2 tsp Cream of Tartar
1 tsp Baking Soda
1/4 tsp Salt
1 tsp vanilla
Coating:
3 Tbsp Sugar
3 tsp cinnamon', 'Mix the butter, sugar, vanilla, + eggs.
Combine the flour, cream of tartar, baking soda, + salt in a separate bowl.
Blend the dry ingredients into the butter mixture.
Chill the dough and cookie sheets for 10-15 minutes.
Preheat the oven to 350°.
Roll the dough into 1 inch balls + roll in the coating.
Bake for 10 minutes. Remove from the pan immediately + cool on a rack.', '', '', 'Butter, sugar, eggs, flour, baking soda, vanilla (needs cream of tartar and cinnamon)', 122),
  ('book-23', 'Dessert', 'Chocolate Chip Cookies', 'Family recipe book · Prep 10 min · Cook 10 min · Serves 12', '8 Tbsp Butter
1/2 Cup white sugar
1/4 Cup packed Brown Sugar (light)
1 tsp vanilla
1 egg
1 1/2 Cups flour
1/2 tsp Baking Soda
1/4 tsp salt
3/4 Cup chocolate chips', 'Preheat the oven to 350°.
Microwave the butter for 40 seconds.
Using a mixer, beat the butter and sugars until creamy.
Add the vanilla and egg and beat on low for 15 seconds.
Add the flour, baking soda, and salt. Beat just until incorporated.
Add the chocolate chips and fold them in with a spatula.
Roll the dough into 12 balls and bake for 9-11 minutes - they should be barely turning golden brown. Do not over bake!
Let the cookies cool on the pan for 30 minutes.', '', '', 'Butter, sugar, brown sugar, vanilla, eggs, flour, baking soda, chocolate chips', 123),
  ('book-24', 'Dinner', 'Pastina Soup', 'Family recipe book · Prep 5 min · Cook 25 min · Serves 4', '6 Cups chicken broth
1 medium yellow onion, sliced large
2 carrots, peeled + sliced large
2 celery ribs, sliced large
1 parmesan rind (appx 2 inches)
Kosher salt
1 1/2 cups pastina
1/4 cup finely chopped parsley, garnish
Grated parmesan for serving', 'In a large pot, stir together the broth, onion, carrots, celery, parmesan rind, and a pinch of salt.
Cook over high heat until boiling, then lower the heat to a simmer and cover. Continue to simmer until the vegetables are very tender, 20-30 minutes.
Discard the parmesan rind, then use a slotted spoon to transfer the vegetables to a food processor.
Add a couple ladles of broth and blend until fully smooth. Scrape the pureed vegetables back into the pot.
Turn the heat to high and bring the broth back to a boil.
Once boiling, stir in the pastina. Cook until the pastina is tender, about 3 minutes or so.
Remove from heat, taste and adjust seasoning if necessary, then serve with parsley and shredded parmesan on top.', 'A small bowl with extra pastina and less broth, parmesan on the side', '', 'Chicken broth, onions, parmesan block, kosher salt, pasta, parsley', 124),
  ('book-25', 'Sides & Extras', 'Quick Pizza Dough', 'Family recipe book · Prep 1 hour · Cook 15 min · Makes 1 pie', '2 - 2 1/3 cups flour
1 packet instant yeast
1 1/2 tsp sugar
3/4 tsp salt
1/4 tsp garlic powder
1/4 tsp dried basil
2 Tbsp olive oil
3/4 Cup warm water', 'Combine 1 cup flour, yeast, sugar, and salt in a large bowl. Add garlic and basil.
Add olive oil and warm water. Stir very well with a wooden spoon.
Gradually add 1 cup of flour. Add more flour if needed to form a cohesive, elastic ball that begins to pull from the sides of the bowl. Dough will still be sticky, but should be manageable with your hands.
Drizzle a separate large bowl generously with olive oil + use a pastry brush to brush it up the sides of the bowl.
Lightly dust hands with flour and form dough into a ball. Transfer to oiled bowl and roll it around until coated in oil.
Cover with plastic wrap and allow to rise in a warm place for 30 minutes, or until doubled in size.
Once risen, use hands to gently deflate and transfer to a lightly floured surface; knead 3-5 times until smooth.
Roll into a circle with hands or rolling pin. Transfer to a parchment paper lined pan + pinch or fold edges to create crust.
Note: Brush with olive oil, poke holes with fork, bake 13-15 min 425°.', '', '', 'Flour, quick-rise yeast, sugar, salt, granulated garlic, olive oil', 125),
  ('book-26', 'Lunch', 'Barley with Eggs + Spinach', 'Family recipe book · Prep 5 min · Cook 10 min · Serves 4', '2 Tbsp olive oil
3 garlic cloves minced or pressed
1 Tbsp tomato paste
1/2 tsp ground cumin OR curry pwdr
2-3 c cooked barley
1-2 large handfulls baby spinach
2-4 eggs
1/4 tsp salt', 'Saute olive oil, garlic, + tomato paste in a wide skillet over medium heat.
Add spice + cook for 2 min, stirring constantly.
Add 1/4 c water + stir until smooth, simmering 30 seconds.
Add the cooked barley and mix well, cooking 3 more minutes. Add salt to taste.
Add spinach + turn heat to medium-low, cooking until wilted.
Push to one side of skillet and cook eggs on empty side in some olive oil, to your liking.
Serve eggs over barley mixture.', '', 'Grown-up lunch', 'Olive oil, tomato paste, spinach, eggs (needs barley)', 126),
  ('book-27', 'Breakfast', 'Blueberry Muffins', 'Family recipe book · Prep 15 min · Cook 20 min · Serves 12', '2 C flour
1 C granulated sugar
2 tsp baking powder
1/2 tsp salt
2 eggs
1/2 C butter, melted
1/2 C milk
1 tsp vanilla extract
2 cups/1 pint blueberries
Streusel topping: 1/4 C flour, 2 Tbsp brown sugar, 2 Tbsp granulated sugar, 1/4 tsp cinnamon, 1/8 tsp salt, 2 Tbsp butter', 'Preheat oven to 400°. Prepare a muffin pan with cupcake liners.
In a large bowl, sift together flour, sugar, baking powder, + salt.
In a medium bowl, whisk eggs until smooth. Add butter, milk, + vanilla and whisk until combined.
Add egg mixture to flour mixture and stir until combined. (It will be lumpy) Fold in blueberries.
To prepare streusel topping, in a medium bowl combine all the dry ingredients. Using a pastry cutter or fork, cut in the very cold butter until topping is crumbly + coarse.
Fill prepared muffin cups with batter. Top each muffin with streusel - about 1 Tbsp each.
Bake until muffin centers bounce back when lightly pressed, about 18-22 minutes.
Cool muffins on a rack for several minutes before removing from pan. Cool completely and store in an airtight container, up to 4 days.
Note: Can be frozen after baking for up to 3 months. Thaw overnight at room temp and reheat at 300° for 3-5 minutes.', '', '', 'Flour, sugar, baking powder, eggs, butter, milk, vanilla, frozen blueberries, brown sugar', 127),
  ('book-28', 'Sides & Extras', 'New York Pizza Dough', 'Family recipe book · Prep 1 hr 15 min · Cook 6 min · Serves 4', '6 1/2 c bread flour (813 grams)
2 1/4 c cold tap water (521 grams)
1 tsp instant yeast (3 grams)
2 3/4 tsp fine sea salt (16 grams)
2 1/4 tsp sugar (9.5 grams)
2 Tbsp olive oil (27 grams)', 'Place the water in a large bowl. Mix the dry ingredients in a separate bowl.
Add dry ingredients to water a bit at a time and mix thoroughly with a wooden spoon to form a dry rough mass.
Pour the oil over the dough, mix it in, and place all the rough dough onto a clean work surface.
Knead the dough for 5 minutes. If it is too sticky, place a clean bowl inverted over the dough and wait 30 min. before resuming. Return to kneading and make sure to knead for at least 5 min total.
Place the bowl over the dough once more and let sit for 30-40 minutes to warm up.
Divide the dough into 4 equal-sized balls - 12 oz or 345 grams each.
Pull each dough ball towards its end repeatedly to form a smooth ball, pinching the seam side + leaving it on the bottom.
Place the balls into oiled bowls. (wipe olive oil over bowl) Cover + refrigerate for at least 24 hours before using, preferably 48 hours. Can be frozen after 24 hours.
Note: If using Kitchen Aid mixer - combine water + half the dry ingredients and mix on speed 1 with dough hook. Slowly add remaining dry ingredients then the olive oil and mix for 4 minutes more on speed 1. Remove dough + hand knead for 1-2 minutes then ball.', '', '', 'Bread flour, quick-rise yeast, fine sea salt, sugar, olive oil', 128),
  ('book-29', 'Breakfast', 'French Toast', 'Family recipe book · Prep 5 min · Cook 10 min · Serves 4', '4 large eggs
2/3 cup milk
1/4 cup flour
1/4 cup granulated sugar
1/4 tsp salt
1 tsp cinnamon
1 tsp vanilla extract
8 thick slices of bread
Butter + syrup for serving or fruit + powdered sugar', 'Add all ingredients to a blender (except bread) or whisk in a shallow dish to combine.
Dip bread slices in batter, dredging them well on both sides.
Heat a griddle or skillet + add bread. Cook for a few minutes, until bottom starts to get golden brown.
Flip and cook the other side the same.
Remove to a plate and repeat process until all of the bread has been cooked.', 'French toast sticks with syrup to dip, fruit on the side', '', 'Eggs, milk, flour, sugar, vanilla, bread, butter, real maple syrup, strawberries', 129)
on conflict (id) do nothing;
