Feature: manager user rights

  As a administrator
  So that I can manage my users' access
  I want to add and remove user rights

Background: users in database

  Given the following users exist:
  | name        | email                       | uid     | admin |
  | Arlan Jaska | ajaska@berkeley.edu         | 1033859 | True  |
  | Terry Tsai  | iliveinabucket@berkeley.edu | 988433  | False |
  | Jack Chou   | jackchou@berkeley.edu       | 991334  | True  |
  | Kenneth Lam | lam.c.kenneth@berkeley.edu  | 994946  | False |

# Happy

Scenario: add privileges for a user using a privileged account
  Given I am on the edit user page for "Terry Tsai" as "Arlan Jaska"
  When I check "Terry Tsai admin"
  And I click "Submit Changes"
  Then I should see "Successfully changed permissions"
  And the user "Terry Tsai" should be an admin

Scenario: remove privileges for a user using a privileged account
  Given I am on the edit user page for "Jack Chou" as "Arlan Jaska"
  When I uncheck "Jack Chou admin"
  And I click "Submit Changes"
  Then I should see "Successfully changed permissions"
  And the user "Jack Chou" should not be an admin
