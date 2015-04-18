# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

projects = [{:name => 'CS 169 Rails App', :desc => 'Make a rails app for a nonprofit bruh.'},
            {:name => 'CS 186 Spark Intro', :desc => 'Good luck! LOL'},
            {:name => 'CS 168 Distance-Vector Router', :desc => 'Encapsulate! Create a DV router class that can be instantiated and work along other router objects in a simulated network.'},
            {:name => 'CS 161 Password Cracker', :desc => 'Something about rainbow tables to do the thing.'}
]

user_list = [["Terry Tsai", 988433, "iliveinabucket@berkeley.edu", true],
             ["Arlan Jaska", 1033859, "ajaska@berkeley.edu", true],
             ["Jack Chou", 991334, "jackchou@berkeley.edu", true],
             ["Albert Hu", 998455, "alberthu@berkeley.edu", true]
]

user_list.each do |name, uid, email, admin|
  User.create( name: name, uid: uid, email: email, admin: admin )
end

projects.each do |t|
  p = Project.create(t)
  # TODO: add seed attachment in db/fixtures
  Submission.create(:title => "TITLE FOR #{p.id}",
                    :desc => "DESC FOR #{p.id}",
                    :project_id => p.id,
                    :attachment => File.new("#{Rails.root}/test_files/test.txt"),
                    :like => false)

  Submission.create(:title => "second title for #{p.id}",
                    :desc => "second desc for #{p.id}",
                    :project_id => p.id,
                    :attachment => File.new("#{Rails.root}/test_files/test.txt"),
                    :like => true)
end

