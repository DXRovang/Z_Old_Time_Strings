OLD TIMEY STRINGS

A Craigslist-style app focused on the buying/selling of American Folk Instruments built entirely with Ruby on Rails.

Installation instructions
-This app is using Ruby 2.7.2 (rvm use 2.7.2)  
-bundle install  
-rails s  
-first time users should navigate to '/signup'  
-current users may navigate to '/login'  
-if signing up w/ FB, click "Edit My Info" and set a new password to be able to use '/login'   
-instruments will default to "for sale" status upon addition to the database  
-to take an instrument off the available instruments list, edit the instrument and set it's "for_sale" attribute to FALSE

Key Features

Database Design  
The relational database (sqlite3) is centered around 5 models:  Family, Category, Maker, Instrument, and User.  Families have many categories, and through categories many instruments.  A category has many makers and users through instruments, while a maker has many categories and users (also through instruments).  This relationship has been changed in the updated version (PostreSQL), and will be available soon.

Search Instruments  
From the dashboard, you can search for instruments based on their family ("Banjo", "Guitar", or "Mandolin").  Once you have navigated to the appropriate page, you will have a dropdown menu which contains the categories for that family.  Choosing a category will create a list of available instruments with links to their show page and the seller's index.

Add Instruments  
As with the search function, the add button will navigate to a new instrument page with attributes specific to that family.  Once created, that instrument will live in the current user's database.

Navigation  
The navbar contains 4 buttons ("Home", "Everything", "My Instruments", "Logout"), which are hopefully self-explanatory.  

What's Next?  
The next iteration of this project will include a PostgreSQL db, with revised associations, as well as Bootstrap styling and functional email links.

