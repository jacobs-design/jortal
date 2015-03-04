Feature: manager user rights

  As a administrator
  So that I can manage my users' access
  I want to add and remove user rights

Background: users in database

  Given the following users exist:
  | name        | email            | can_download | can_manage_users |
  | Armando Fox | afox@foxmail.com | False        | False            |
  | Arlan Jaska | ajaska@mail.mail | True         | False            |
  | Terry Tsai  | terry@terr.io    | False        | True             |
  | Elite Admin | root@root.com    | True         | True             |

# Happy

Scenario: add privileges for a user using a privileged account
  Given I am on the admin page as "Elite Admin"
  When I check "Arlan Jaska Download"
  And I check "Arlan Jaska Manage Users"
  And I click "Submit Changes"
  Then I should see "Successfully changed permissions"
  And the user "Arlan Jaska" should be able to download
  And the user "Arlan Jaska" should be able to manage users

Scenario: remove privileges for a user using a privileged account
  Given I am on the admin page as "Elite Admin"
  When I uncheck "Arlan Jaska Download"
  And I uncheck "Arlan Jaska Manage Users"
  And I click "Submit Changes"
  Then I should see "Successfully changed permissions"
  And the user "Arlan Jaska" should not be able to download
  And the user "Arlan Jaska" should not be able to manage users

Scenario: add and remove privileges from users using a privileged account
  Given I am on the admin page as "Elite Admin"
  When I check "Armando Fox Download"
  And I check "Armando Fox Manage Users"
  And I check "Terry Tsai Download"
  And I uncheck "Terry Tsai Manage Users"
  And I click "Submit Changes"
  Then I should see "Successfully changed permissions"
  And the user "Armando Fox" should be able to download
  And the user "Armando Fox" should be able to manage users
  And the user "Terry Tsai" should be able to download
  And the user "Terry Tsai" should not be able to manage users
