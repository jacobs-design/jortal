#successfully add a new project
Given /^I am an admin$/ do
  User.create(name: "Jack", email: "jackiscool@berkeley.edu", uid: 991334, admin: true)
  CASClient::Frameworks::Rails::Filter.fake("991334")
end

Given /^I am on the projects list page$/ do
  visit "/projects"
end

Given /^I am on the projects page as "(.*?)"$/ do |u1|
  uid = User.where(name: u1).first.uid
  CASClient::Frameworks::Rails::Filter.fake(uid.to_s)
  visit "/projects"
end


Given /^the following projects exist:$/ do |table|
  table.hashes.each do |project|
  	Project.new do |p|
      p.id = project[:id]
      p.name = project[:name]
      p.desc = project[:desc]
      p.users = User.where(name: project[:users])
      p.save
    end
  end
end

When(/^I click on "(.*?)"$/) do | lnk |
  click_on(lnk)
end

When(/^I create a project with the name "(.*?)" and description "(.*?)"$/) do |name, desc|
  click_link("add_project")
  fill_in("project_name", :with => name)
  fill_in("project_desc", :with => desc)
  click_button("Create Project")
end

When(/^I see projects for "(.*?)"$/) do |name|
  visit "/users/" + User.where(name: name).pluck(:id)[0].to_s + "/projects"
end


Then /^I should be on the project show page for "(.*?)"$/ do |name|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == '/projects/' + Project.where(name: name).pluck(:id)[0].to_s
  else
    assert_equal '/projects/' + Project.where(name: name).pluck(:id)[0].to_s, current_path
  end
end

Then /^a new project named "(.*?)" should exist$/ do |name|
  if page.respond_to? :should
    page.should have_content(name)
  else
    assert page.has_content?(name)
  end
end




#failure to add a new project
Given(/^I am on the new project page$/) do
  visit "/projects/new"
end

When(/^I enter the name "(.*?)" into the name field and click submit$/) do |name|
  fill_in("project_name", :with => name)
  click_button("Create Project")
end

Then(/^I should be on the new project page$/) do
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == "/projects"
  else
    assert_equal "/projects", current_path
  end
end

Then(/^I should see the error message: "(.*?)"$/) do |error|
  if page.respond_to? :should
    page.should have_content(error)
  else
    assert page.has_content?(error)
  end
end

