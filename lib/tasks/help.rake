namespace :help do

  desc "Displays help for help:start"
  task :start => :environment do
    puts "***"
    puts "*** LAUNCHING VIDEO PRO"
    puts "***"
    puts "*** Default: use 'rails s' to start the application using the default conventions"
    puts "*** Foreman: use 'foreman start' to start the application using foreman*"
    puts "***"
    puts "*** - http://0.0.0.0:3000 in your browser to access application."
    puts "*** * Install the foreman gem with 'gem install foreman' before using foreman" 
    puts "*** "
    puts "*** ENVIRONMENT VARIABLES" 
    puts "***"
    puts "*** RAILS_ENV: [development, test, production] default: development"
    puts "*** PORT: [generally 1000-9999] default: 3000"
    puts "***"
    puts "*** Example: 'RAILS_ENV=development foreman start'" 
    puts "***"
    puts "*** DEFAULT ACCOUNT LOGIN" 
    puts "***"
    puts "*** When prompted for your email address and password use the generated default"
    puts "*** admin account below. For detailed info and credentials of all default"
    puts "*** generated accounts run: 'rake help:accounts'"
    puts "***"
    puts "*** Email:  admin@example.com"
    puts "*** Pass:   demo"
    puts "***"
    puts "*** 'rake help:rake' to re-display master help menu"
  end

  desc "Displays help for help:accounts"
  task :accounts => :environment do
    puts "***"
    puts "*** DEFAULT GENERATED ACCOUNTS"
    puts "***"
    puts "*** During installation, 5 default accounts are generated, one for each access"
    puts "*** level. The following is a list of credentials for each account. " 
    puts "***"
    puts "*** Admin"
    puts "*** Email:  admin@example.com"
    puts "*** Pass:   demo"
    puts "*** Role:   Admin"
    puts "***"
    puts "*** Developer"
    puts "*** Email:  developer@example.com"
    puts "*** Pass:   demo"
    puts "*** Role:   Developer"
    puts "***"
    puts "*** Manager"
    puts "*** Email:  manager@example.com"
    puts "*** Pass:   demo"
    puts "*** Role:   Manager"
    puts "***"
    puts "*** Moderator"
    puts "*** Email:  moderator@example.com"
    puts "*** Pass:   demo"
    puts "*** Role:   Moderator"
    puts "***"
    puts "*** Default"
    puts "*** Email:  default@example.com"
    puts "*** Pass:   demo"
    puts "*** Role:   Default"
    puts "***"
    puts "*** Note: User management can be accessed at 'http://0.0.0.0:3000/users'"
    puts "***       after logged in." 
    puts "***"
    puts "*** 'rake help:rake' to re-display master help menu"
  end

  desc "Displays help for help:demo"
  task :demo => :environment do
    puts "***"
    puts "*** SEEDING DEMO VIDEO CONTENT"
    puts "***"
    puts "*** This application comes bundled with a fixtures file containing demo content"
    puts "*** to populate the videos database. If evaluating the application it is highly" 
    puts "*** reccomended that you import this content."
    puts "***"
    puts "*** Import path: 'db/demo/fixtures/videos.yml'"
    puts "***"
    puts "*** 1. Run 'rake videos:clear' to clear the video database (skip if new install)" 
    puts "*** 2. Run 'rake videos:seed' to seed the demo video content"
    puts "*** 3. Stop and restart the server if running, Ctrl-C >> rails s / foreman start"
    puts "***"
    puts "*** 'rake help:rake' to re-display master help menu"
  end

  desc "Displays help for help:rake"
  task :rake => :environment do
    puts "***"
    puts "*** CUSTOM RAKE TASKS"
    puts "***"
    puts "*** VIDEO DATABASE ***"
    puts "*** rake videos:clear     Clear all content from the videos database. Used to clear demo content or to recover from unsuccessful data imports."
    puts "*** rake videos.seed      Load all demo video content from fixtures file located in db/dummy-data/fixtures/videos.yml"
    puts "*** rake videos.dump      Dump all video content currently in database to fixtures file located in db/export/fixtures/videos.yml"
    puts "***"
    puts "*** BITS ON THE RUN ***"
    puts "*** rake botr:import      Import all video information via the BOTR API. See 'rake help:botr:config' for details on configuring BOTR prior to import."
    puts "*** rake botr:info        Display basic Bits on the Run Account/API Configuration Info"
    puts "*** rake botr:usage       Display Month to Date Usage Metrics for Bits on the Run"
    puts "***"
    puts "*** HELP ***"
    puts "*** rake help:start       Display instructions for initial configuration and launching app server"
    puts "*** rake help:accounts       Display information on the default users automatically created by installation"
    puts "*** rake help:demo        Display instructions for setting up demo video content or removing demo video content when finished"
    puts "*** rake help:rake        Display list of all Custom Rake Tasks and what they do"
    puts "*** rake help:heroku      Display instructions on deploying to heroku"
    puts "*** rake help:botr:config Display instructions for setting up Bits on the Run API Integration"
    puts "*** rake help:botr:import Display instructions for importing content from Bits on the Run"
  end

  # TODO: Finish help:heroku rake task stub
  desc "Displays help for help:heroku"
  task :heroku => :environment do
    puts "Heroku Help Stub"
  end

  namespace :botr do
    
    # TODO: Finish help:botr:config rake task stub
    desc "Displays help for help:botr:config"
    task :config => :environment do
      puts "BOTR Config Help Stub"
    end

    # TODO: Finish help:botr:import rake task stub
    desc "Displays help for help:botr:import"
    task :import => :environment do
      puts "BOTR Import Help Stub"
    end

  end

end
