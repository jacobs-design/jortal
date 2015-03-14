require 'uri'
require 'cgi'

Given(/^I am on the users page with no account$/) do
  CASClient::Frameworks::Rails::Filter.fake("blah")
  visit "/users"
end

Given /^I am on the users page as "(.*?)"$/ do |u1|
  uid = User.where(name: u1).first.uid
  CASClient::Frameworks::Rails::Filter.fake(uid.to_s)
  visit "/users"
end


Given /^I am on the edit user page for "(.*?)" as "(.*?)"$/ do |u1, u2|
  uid = User.where(name: u2).first.uid
  CASClient::Frameworks::Rails::Filter.fake(uid.to_s)
  visit "/users/" + User.where(name: u1).pluck(:uid)[0].to_s
end

Given /^the following users exist:$/ do |table|
  table.hashes.each do |user|
    User.create(name: user[:name], email: user[:email], uid: user[:uid], admin: user[:admin])
  end
end 

When /^I go to the users page with no account$/ do
  visit "/users"
end

When /^I go to the users page as "(.*?)"$/ do |name|
  uid = User.where(name: name).first.uid
  CASClient::Frameworks::Rails::Filter.fake(uid.to_s)
  visit "/users"
end

When /^I add a new user with name "(.*?)" and email "(.*?)" and uid "(.*?)" and admin "(.*?)"$/ do |name, email, uid, admin|
  click_link("New User")
  fill_in("Name", :with => name)
  fill_in("user_email", :with => email)
  fill_in("user_uid", :with => uid)
  if admin == "True" or admin == "true"
    check("Admin")
  else 
    uncheck("Admin")
  end
  click_button("Create User")
end

When /^(?:|I )check "([^"]*)"$/ do |field|
  check(field)
end

When /^(?:|I )uncheck "([^"]*)"$/ do |field|
  uncheck(field)
end

Then(/^there should be a user named "(.*?)"$/) do |name|
  if page.respond_to? :should
    page.should have_content(name)
  else
    assert page.has_content?(name)
  end
end

Then(/^there should not be a user named "(.*?)"$/) do |name|
  if page.respond_to? :should
    page.should have_no_content(name)
  else
    assert page.has_no_content?(name)
  end
end

Then /^(?:|I )should not see "([^"]*)"$/ do |text|
  puts page.html
  if page.respond_to? :should
    page.should have_no_content(text)
  else
    assert page.has_no_content?(text)
  end
end

Then(/^the user "(.*?)" should be an admin/) do |name|
  user_admin = User.where(name: name).first.admin
  assert user_admin == true
end 

Then(/^the user "(.*?)" should not be an admin/) do |name|
  user_admin = User.where(name: name).first.admin
  assert user_admin == false, "#{name} is an admin, should not be"
end 
    
Then(/^I should be on the projects list page$/) do
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == '/projects'
  else
    assert_equal '/projects', current_path
  end
end

