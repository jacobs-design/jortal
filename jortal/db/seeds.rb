# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
courses_list = [
  ['CS 169', 'Software Engineering', 'Understand the new challenges, opportunities something Armando Fox.'],
  ['CS 186', 'Database Systems', 'Something lorem ipsum with Professor lorem Joe Hellerstein.'],
  ['EE 20', 'Signals and Systems', 'The worst class ever ew like why no ok.']
]

courses_list.each do |short, long, desc|
  Course.create(short_name: short, long_name: long, description: desc)
end


projects_list = [
  ['Jortal', 'CS 169'],
  ['Rotten Potatoes', 'CS 169'],
  ['Vitamin 876', 'CS 186'],
]


projects_list.each do |name, course|
  (Course.where short_name: course).first.projects.create(name: name)
end
