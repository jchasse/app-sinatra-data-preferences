# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
        Sinatra is DSL[Domain Specific Language] for creating web appications. A route is a HTTP method paired with a URL-matching pattern.
- [x] Use ActiveRecord for storing information in a database
        ActiveRecord allows for easy accessibility to CRUD functionality of a database.
- [x] Include more than one model class (e.g. User, Post, Category)
        This app utilizes both a USER and SERVICE class.
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
        A USER has_many services
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
        A SERVICE belongs_to a user
- [x] Include user accounts with unique login attribute (username or email)
        The USER is required to have a login email (validation for presence and uniqueness included)
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
        Each SERVICE has CRUD functionality [/new, /show, /edit, /delete]
- [x] Ensure that users can't modify content created by other users
        For edit/delete, an additional level to check if service user_id matches current id is used to protect from changes.
- [x] Include user input validations
        ActiveRecord 'validates' methods are used to enforce inputs are entered for users.
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
        Error functionality included to guide the user when inputs or actions are incorrect.
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message