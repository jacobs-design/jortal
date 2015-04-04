Feature: edit users

  As a administrator
  So that I can update users and change their permissions
  I want to be able to edit users in the database

Background: users in database

  Given the following users exist:
  | name        | email                       | uid     | admin |
  | Arlan Jaska | ajaska@berkeley.edu         | 1033859 | true  |
  | Terry Tsai  | iliveinabucket@berkeley.edu | 988433  | false |
  | Jack Chou   | jackchou@berkeley.edu       | 991334  | true  |
  | Kenneth Lam | lam.c.kenneth@berkeley.edu  | 994946  | false |

# Fail
Scenario: change user UID to a non-integer

Scenario: change user UID to nothing
  Given I am on the users page as "Arlan Jaska"
  When I change the uid of "Jack Chou" to ""
#Then I should see "UID cannot be blank"
  And the uid of "Jack Chou" should be "991334"

Scenario: change user UID to another existing UID
  Given I am on the users page as "Terry Tsai"
  When I change the uid of "Kenneth Lam" to "1033859"
#  Then I should see "UID has already been taken"
  And the uid of "Kenneth Lam" should be "994946"

# Happy
Scenario: change user UID to another integer
  Given I am on the users page as "Arlan Jaska"
  When I change the uid of "Jack Chou" to "12345"
  Then the uid of "Jack Chou" should be "12345"

Scenario: change user name to a different name
  Given I am on the users page as "Terry Tsai"
  When I change the name of "Jack Chou" to "Jack Black"
  Then I should see "Jack Black"
  And I should not see "Jack Chou"

Scenario: change user email to a different email
  Given I am on the users page as "Arlan Jaska"
  When I change the email of "Kenneth Lam" to "something@else.com"
  Then the email of "Kenneth Lam" should be "something@else.com"

Scenario: give user admin privileges
  Given I am on the users page as "Terry Tsai"
  When I change the admin of "Kenneth Lam" to "true"
  Then the user "Kenneth Lam" should be an admin

Scenario: revoke user admin privileges
  Given I am on the users page as "Arlan Jaska"
  When I change the admin of "Terry Tsai" to "false"
  Then the user "Terry Tsai" should not be an admin


