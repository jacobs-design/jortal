require 'uri'
require 'cgi'

Given /^I am a Student$/ do
  User.create(name: "Jack", email: "jackiscool@berkeley.edu", uid: 991334, admin: false)
  CASClient::Frameworks::Rails::Filter.fake("991334")
end

Given /the following project exists/ do |project_table|
  project_table.hashes.each do |project|
    Project.create(:name => project['name'],
        :desc => project['desc'])
  end
end

Given /^(?:|I )am on the project submission page$/ do
  visit '/projects/submit_submission'
end

Then /^(?:|I )should be on the project submission page$/ do
  visit '/projects/submit_submission'
end

When /^(?:|I )select "([^"]*)" from the dropdown menu$/ do |project|
  id = Project.where(name: project).pluck(:id)[0].to_s
  desc = Project.where(name: project).pluck(:desc)[0].to_s
  find("option[value='"+id+"']").click
  page.execute_script("$('#project').trigger('onChange');")
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
      current_path.should == '/submissions/thank_you'
#    current_path.should == '/projects/' + Project.where(name: page_name).pluck(:id)[0].to_s + '/submissions'
  else
      assert_equal ('/submissions/thank_you'), current_path
#    assert_equal ('/projects/' + Project.where(name: page_name).pluck(:id)[0].to_s + '/submissions'), current_path
  end
end

Then /^(?:|I )should see "([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end



#FROM THIS POINT ONWARD: JACK AND KENNETH CLAIM THIS DOMAIN
Given /^the following submissions exist:$/ do |table|
  table.hashes.each do |submission|
    Submission.create(title: submission[:title], desc: submission[:desc], project_id: submission[:project_id],
      attachment_file_name: submission[:attachment_file_name], like: submission[:like])
  end
end

When /I (un)?like the following submissions: (.*)/ do |unlike, submission_list|
  submission_list.delete(" ").split(",").each do |submission|
    @submission = Submission.where(:title => submission).first
    if unlike
      uncheck("likes_#{@submission.project_id}_#{@submission.id}")
    else
      check("likes_#{@submission.project_id}_#{@submission.id}")
    end
  end
  click_button("Submit Likes")
end

Then /^(?:|I )should be on the submissions page for "(.*)"$/ do |page_name|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == '/projects/' + Project.where(name: page_name).pluck(:id)[0].to_s
#    current_path.should == '/projects/' + Project.where(name: page_name).pluck(:id)[0].to_s + '/submissions'
  else
    assert_equal ('/projects/' + Project.where(name: page_name).pluck(:id)[0].to_s), current_path
#    assert_equal ('/projects/' + Project.where(name: page_name).pluck(:id)[0].to_s + '/submissions'), current_path
  end
end

Then /the following submissions should be (un)?liked: (.*)/ do |unliked, submission_list|
  submission_list.delete(" ").split(",").each do |submission|
    @submission = Submission.where(:title => submission).first
    if @submission.like.respond_to? :should
      if unliked
        @submission.like.should == false
      else
        @submission.like.should == true
      end
    else
      if unliked
        assert_equal @submission.like, false
#        @submission.like.should == false
      else
        assert_equal @submission.like, true
#        @submission.like.should == true
      end
    end
  end
end

Given /^(?:|I )am on the submissions page for (.+?)$/ do |page_name|
  visit '/projects/' + Project.where(name: page_name).pluck(:id)[0].to_s
end
