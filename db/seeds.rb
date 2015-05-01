# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

projects = [{:name => 'Personal Project', :desc => 'Submit here if none of the other project categories apply.'}]

user_list = [["Emily Rice", 921828, "emilyrice@berkeley.edu", true],
             ["Nicholas Herson", 945369, "nicholas.herson@berkeley.edu", true],
             ["Terry Tsai", 988433, "iliveinabucket@berkeley.edu", true],
             ["Arlan Jaska", 1033859, "ajaska@berkeley.edu", true],
             ["Jack Chou", 991334, "jackchou@berkeley.edu", true],
             ["Albert Hu", 998455, "alberthu@berkeley.edu", true],
             ["Mina Li", 994351, "li.mina888@berkeley.edu", true]
]

user_list.each do |name, uid, email, admin|
  User.create( name: name, uid: uid, email: email, admin: admin )
end

projects.each do |t|
  p = Project.create(t)
end

