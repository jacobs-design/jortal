require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "selectors"))

module WithinHelpders
  def with_scope(locator)
    locator ? within(*selector_for(locator)) { yield } : yield
  end
end
World(WithinHelpers)

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

When /^(?:|I )upload in "([^"]*)" with "([^"]*)"$/ do |field, path|
  # ??
  attach_file(field, File.expand_path(path))
end

When /^(?:|I )follow "([^"]*)"$/ do |link|
  click_link(link)
end

Then /^(?:|I )should be on the (.+?) successful submission page$/ do |page_name|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == '/projects/' + Project.where(:title: page_name).pluck(:id)[0].to_s + '/submissions'
  else
    assert_equal ('/projects/' + Project.where(:title: page_name).pluck(:id)[0].to_s + '/submissions'), current_path
  end
end

Then /^(?:|I )should see "([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_context(text)
  else
    assert page.has_content?(text)
  end
end
