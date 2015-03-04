Feature: add and remove users

  As a administrator
  So that I can allow instructors to post projects
  I want to add and remove users to Jortal

Background: users in database

  Given the following users exist:
  | name        | email            | can_download | can_manage_users |
  | Armando Fox | afox@foxmail.com | False        | False            |
  | Arlan Jaska | ajaska@mail.mail | True         | False            |
  | Terry Tsai  | terry@terr.io    | False        | True             |
  | Elite Admin | root@root.com    | True         | True             |

# Happy
Scenario: add new unprivileged user using a privileged account
  Given I am on the admin page as "Elite Admin"
  When I click on "Add New User"
  And I fill in "Name" with "Test Person"
  And I fill in "email" with "example@example.org"
  And I uncheck "Download"
  And I uncheck "Manage users"
  And I click "Submit"
  Then I should see "Successfully added Test Person"
  And there should be a user named "Test Person"
  And the user "Test Person" should have the email "example@example.org" 
  And the user "Test Person" should not be able to download
  And the user "Test Person" should not be able to manage users

Scenario: add new privileged user using a privileged account
  Given I am on the admin page as "Terry Tsai"
  When I click on "Add New User"
  And I fill in "Name" with "Example Guy"
  And I fill in "email" with "guy@example.org"
  And I check "Download"
  And I check "Manage users"
  And I click "Submit"
  Then I should see "Successfully added Example Guy"
  And there should be a user named "Example Guy"
  And the user "Example Guy" should have the email "guy@example.org" 
  And the user "Example Guy" should be able to download
  And the user "Example Guy" should be able to manage users

Scenario: remove user using a privleged account
  Given I am on the admin page as "Elite Admin"
  When I click on "Remove Armando Fox"
  And I click on "Yes, I'm sure."
  And I click "Submit"
  Then I should see "Successfully removed Armando Fox"
  And there should not be a user named "Armando Fox"

# Fail
Scenario: add new unprivileged user using an unprivileged account
  When I go to the admin page as "Arlan Jaska"
  Then I should see be on the course list page

Scenario: add new unprivileged user with no account
  When I go to the admin page
  Then I should see be on the course list page

Scenario: add existing user using a privileged account
  Given I am on the admin page as "Elite Admin"
  When I click on "Add New User"
  And I fill in "Name" with "Conflicting Email"
  And I fill in "email" with "root@root.com"
  And I click "Submit"
  Then I should see "Failed to add user"
  And I should see "User with this email already exists"
  And there should not be a user named "Conflicting Email"

Scenario: add user with a malformed email address using a privileged account
  Given I am on the admin page as "Elite Admin"
  When I click on "Add New User"
  And I fill in "Name" with "Malformed Email"
  And I fill in "email" with "bad email !!$$$@@"
  And I click "Submit"
  Then I should see "Failed to add user"
  And I should see "Invalid email address"
  And there should not be a user named "Malformed Email"

