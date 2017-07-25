# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (User has many inventories)
- [x] Include at least one belongs_to relationship (Inventory belongs to User)
- [x] Include at least one has_many through relationship (Inventory has_many items through inventory items)
- [x] The "through" part of the has_many through includes at least one user submittable attribute (name, description,url for items)
- [x] Include reasonable validations for simple model objects (Validates name for inventory and validates email, password length for user)
- [x] Include a class level ActiveRecord scope method (users/my_wishlists)
- [x] Include a nested form writing to an associated model using a custom attribute writer (Item writes to inventory)
- [X] Include signup (how e.g. Devise)
- [X] Include login (how e.g. Devise)
- [X] Include logout (how e.g. Devise)
- [X] Include third party signup/login (OmniAuth Facebook)
- [x] Include nested resource show or index (inventories/1/items/1 show page)
- [x] Include nested resource "new" form (URL e.g. inventory/1/items/new)
- [x] Include form display of validation errors (users, inventory, items)

Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [ ] Views use helper methods if appropriate
- [ ] Views use partials if appropriate
