# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

demo_domain = 'example.com'
demo_password = 'demo'

User::ACCESS_LEVELS.each do |level|
  r = User.create( { name: level, 
                     email: "#{level}@#{demo_domain}", 
                     access_level: level, 
                     password: demo_password,
                     password_confirmation: demo_password
                 } )
  raise "Error creating user seeds" unless r
end

fragments = YAML.load_stream(File.read(File.join(Rails.root, 'db', 'demo', 'fixtures', 'fragments.yml')))
Fragment.create(fragments)