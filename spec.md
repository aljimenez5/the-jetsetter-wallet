# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project 
>>_using rails_
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) 
>>_I have implemented has_many in User, Country, City, Trip Models_
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
>>_I have implemented belongs_to in Activity, City, Trip, FavoriteTrip Models_
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
>>_Country, Trip, User Models have has_many through relationships_
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
>>_City has many Users through Trips and Users has many Cities through trips_
- [ ] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
- [ ] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
- [ ] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
- [x] Include signup (how e.g. Devise)
>>_Created sign_up_path with validations_
- [x] Include login (how e.g. Devise)
>>_Created log_in_path with authentication_
- [x] Include logout (how e.g. Devise)
>>_Created log_out_path with link in user show page_
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
>>_Can log in and sign up with Google_
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
- [x] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [ ] Views use helper methods if appropriate
- [ ] Views use partials if appropriate
