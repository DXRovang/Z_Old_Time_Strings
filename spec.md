# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (Family has_many Categories)
- [x] Include at least one belongs_to relationship (Category belongs_to Family)
- [x] Include at least two has_many through relationships (User has_many Categories through Instruments, User has_many Makers through Instruments)
- [x] Include at least one many-to-many relationship (User has_many Categories through Instruments, Category has_many Users through Instruments)
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (instrument.year)
- [x] Include reasonable validations for simple model objects (User: username, email - presence & uniqueness)
- [x] Include a class level ActiveRecord scope method (Maker.search URL: /makers)
- [x] Include signup (User.new)
- [x] Include login (session[:user_id] = @user.id)
- [x] Include logout (session.clear)
- [x] Include third party signup/login (OmniAuth-Facebook)
- [x] Include nested resource show or index (families/1/categories)

- [x] Include nested resource "new" form (instruments/new?family%5Bid%5D=1)
(URL e.g. recipes/1/ingredients/new)

- [x] Include form display of validation errors 

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate