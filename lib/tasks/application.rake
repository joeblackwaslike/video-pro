namespace :app do

  desc "Install the application for local development"
  task :install => :environment do
    Rake::Task['app:bootstrap'].invoke
  end

  desc "Bootstrap the application -- create admin/admin user, migrate database, etc"
  task :bootstrap => :environment do
    puts "*** VIDEO PRO INSTALLATION"
    puts "***"
    puts "*** Installation will clear any content existing in the database. If this"
    puts "*** is a fresh installation, you can safely ignore this warning."
    puts "*** Continue? Y/n"
    continue = STDIN.gets.chomp
    if continue.downcase! == 'n'
      puts "*** Exiting..."
      exit!
    end
    puts "***"
    puts "*** BEGINNING INSTALLATION ..."
    puts "***"
    puts "*** Install Tasks 1 of 5: Drop tables if exist"
    Rake::Task['db:drop'].invoke
    puts "*** Install Tasks 2 of 5: Create database from schema"
    Rake::Task['db:create'].invoke
    puts "*** Install Tasks 3 of 5: Run migrations against database schema"
    Rake::Task['db:migrate'].invoke
    puts "*** Install Tasks 4 of 5: Seed database with Default accounts"
    Rake::Task['db:seed'].invoke
    puts "*** Default accounts created. Run 'rake help:accounts' at anytime for full" 
    puts "*** details on the accounts created."
    puts "*** Install Tasks 5 of 5: Seed database with demo video content"
    puts "***"
    puts "*** Important: It is highly reccomended that you load the demo video content" 
    puts "*** if this is your first time!"
    puts "*** Continue? Y/n"
    continue = STDIN.gets.chomp
    if continue.downcase! == 'n'
      puts "*** Demo video content not installed by user request. You can install it"
      puts "*** at anytime in the future by running: 'rake videos:seed'"
    else
      puts "*** Demo content installed to database. To remove the demo content and begin"
      puts "*** using the app for your own project(s), run: 'rake app:videos:clear'"
    end
    puts "***"
    puts "*** VIDEO PRO INSTALL COMPLETE"
    puts "***"
    Rake::Task['help:start'].invoke
    puts "***"
    puts "*** type: 'rake help:rake' for help"
  end

  task :exit_or_continue_in_production? do
    if Rails.env.production?
      puts "*** !!!WARNING!!! This task will DESTROY your production database and"
      puts "*** RESET all application settings"
      puts "*** Continue? y/n"
      continue = STDIN.gets.chomp
      unless continue == 'y'
        puts "*** Exiting..."
        exit! 
      end
    end
  end

end