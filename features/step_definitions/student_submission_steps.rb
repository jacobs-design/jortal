require 'uri'
require 'cgi'

Given /the following project exists/ do |project_table|
  ActiveRecord::Migrator.migrate('db/migrate')
  project_table.hashes.each do |project|
    Project.create(:name => project['name'],
        :desc => project['desc'])
  end
end

Given /^(?:|I )am on the (.+?) project submission page$/ do |page_name|
  visit '/projects/' + Project.where(name: page_name).pluck(:id)[0].to_s + '/submissions/new'
end

Then /^(?:|I )should still be on the (.+?) project submission page$/ do |page_name|
  visit '/projects/' + Project.where(name: page_name).pluck(:id)[0].to_s + '/submissions/new'
end


When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

When /^(?:|I )upload in "([^"]*)" with "([^"]*)"$/ do |field, path|
  # ??
  attach_file(field, File.expand_path(path))
end

When /^(?:|I )follow "([^"]*)"$/ do |link|
  click_button(link)
end

Then /^(?:|I )should be on the (.+?) successful submission page$/ do |page_name|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == '/projects/' + Project.where(name: page_name).pluck(:id)[0].to_s + '/submissions'
  else
    assert_equal ('/projects/' + Project.where(name: page_name).pluck(:id)[0].to_s + '/submissions'), current_path
  end
end

Then /^(?:|I )should see "([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end
