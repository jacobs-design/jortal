Given /^I am on the projects list page$/ do
  visit "/projects"
end

Given /^the following projects exist:$/ do |table|
  table.hashes.each do |project|
  	Project.create(name: project[:name], desc: project[:desc])
  end
end

When(/^I create a project with the name "(.*?)" and description "(.*?)"$/) do |arg1, arg2|
  click_link('New Project')
  fill_in(:name, :with => arg1)
  fill_in(:desc, :with => arg2)
  click(f.submit)
end

Then(/^a new project named "(.*?)" with the description "(.*?)" should appear on the projects list$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end
