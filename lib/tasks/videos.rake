namespace :videos do

  desc "Resets/Empties videos table"
  task :clear => :environment do
    puts "*** Clearing videos database table..."
    Video.clear_table!
    puts "*** DONE: Videos database clear"
  end
  
  desc "Seeds Video Database with Demo Content imported from db/demo/fixtures/videos.yml"
  task :seed => :environment do
    puts "*** Retrieving default users..."
    users = []
    for name in User::ACCESS_LEVELS
      users.push(User.find_by_name(name)) 
    end
    puts "*** Parsing demo video object fixtures from db/demo/fixtures/videos.yml ..."
    vs = YAML::load_stream(File.read(File.join(Rails.root, 'db', 'demo', 'fixtures', 'videos.yml')))
    puts "*** Creating database objects for each video and assigning random default user as author..."
    for v in vs
      new_v = Video.new(v)
      user = users.sample
      new_v.user_id = user.id
      new_v.author = user.name
      new_v.save!
    end
    puts "*** DONE: Demo video content seeded."
  end

  desc "Exports current video database objects as fixtures to db/export/fixtures/videos.yml"
  task :dump => :environment do
    puts "*** Exporting current video database objects as fixtures to db/export/fixtures/videos.yml"
    vs = Video.find(:all)
    File.open(File.join(Rails.root, 'db', 'export', 'fixtures', 'videos.yml'), 'w') do |f|
      for v in vs
        f.puts v.to_yml
      end
    end
    puts "*** DONE: Video Database exported."
  end  

end