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
This project was launched and hosted on Heroku, where it remains to this day. This 
application is heavily integrated with a video content host called Bits on the Run.


## Models
1. Video
2. User
3. Fragment


## Installation

1. Clone this git repo:
  
  `git clone git@github.com:joeblackwaslike/video-pro.git`

2. Run Bundle install:

  `bundle install`

3. Run the app:install task from rake:

  `rake app:install`

4. Say yes when asked if you want to install demo video content:
  
   `y + enter`

5. Configure BOTR API Key(optional):

  For those that have an account with Bits on the Run, open 
  `config/initializers/bitsontherun.rb` and enter your API Key and Secret.

6. Start the Application Server:
  
  `rails s` or `foreman start`
  * foreman (gem install foreman) reccomended for those considering or planning on 
    deploying to heroku.

7. Open the site in your browser:

  `http://0.0.0.0:3000`

8. Login using the default admin account created during installation:

  `Admin
   email: admin@example.com
   pass: demo`


## Deploy to Heroku

1.  Clone this git repo:
  
   `git clone git@github.com:joeblackwaslike/video-pro.git`

2.  Run Bundle install:

   `bundle install`

3.  Configure BOTR API Key(optional):

    For those that have an account with Bits on the Run, open: 
   `config/initializers/bitsontherun.rb` and enter your API Key and Secret.

4.  Create app on Heroku:
    *Be sure you're logged into Heroku and have the Heroku Toolbelt installed

   `heroku create`

5.  Push App to Heroku:

   `git push heroku master`

6.  Run the app:install task from rake:

   `heroku run rake app:install RAILS_ENV=production`

7. Say yes when asked if you want to install demo video content:
  
   `y + enter`

8.  Precompile assets for production:

   `heroku run rake assets:precompile RAILS_ENV=production`

9.  Restart the Application Server:
  
   `heroku restart`

10. Open the site in your browser:

   `heroku open`

11. Login using the default admin account created during installation:

   `Admin
    email: admin@example.com
    pass: demo`


## License

Developed and maintained under the GPL v2 License.