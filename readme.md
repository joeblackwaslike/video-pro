### Synopsis

A tool created in Ruby on Rails for the management of video assets, especially for 
websites who have needs that can't be met by the or have outgrown the standard backend
interface.  

Basic user management(Create, edit, delete) and template fragments are also implemented.
Users can be authorized against 5 different access levels and template fragments(for 
static content) are compiled from markdown with support for adding any template language.

This should be more than enough for most needs and for those that need more, it's very 
easy to extend upon by design.

This project was developed with:
* Ruby 2.0
* Rails 4.0 (originally project was built in Rails 4.0.0beta)
* SQLite 3
* Sass, HAML, Twitter Bootstrap
* Thin
* Bits on the Run
* Maruku, Redcloth, Rouge, Nokogiri
* Heroku

## Hosting
This project was launched and hosted on Heroku, where it remains to this day. This application is heavily integrated with a video content host called Bits on the Run.

## Models
1. Video
2. User
3. Fragment

## Installation

1. Clone this git repo:
  
  `git clone `

2. Run the app:install task from rake:

  `rake app:install`

3. Configure BOTR API Key(optional)

  For those that have an account with Bits on the Run, open 
  `config/initializers/bitsontherun.rb` and enter your API Key and Secret.

3. Start the Application Server:
  
  `rails s` or `foreman start`

4. Open the site in your browser

  `http://0.0.0.0:3000`

5. Login using the default admin account created during installation:

  Admin
  email: admin@example.com
  pass: demo

## License

Developed and maintained under the GPL v2 License.