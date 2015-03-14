Feature: add and remove users

  As a administrator
  So that I can allow instructors to post projects
  I want to add and remove users to Jortal

Background: users in database

  Given the following users exist:
  | name        | email                       | uid     | admin |
  | Arlan Jaska | ajaska@berkeley.edu         | 1033859 | true  |
  | Terry Tsai  | iliveinabucket@berkeley.edu | 988433  | false |
  | Jack Chou   | jackchou@berkeley.edu       | 991334  | true  |
  | Kenneth Lam | lam.c.kenneth@berkeley.edu  | 994946  | false |

# Fail
Scenario: add new unprivileged user with no account
  Given I am on the users page with no account
  Then I should be on the projects list page

Scenario: add existing UID using a privileged account
  Given I am on the users page as "Arlan Jaska"
  When I add a new user with name "Bad Person" and email "badperson@badpeople.org" and uid "994946" and admin "False"
  Then I should not see "Bad Person"
  And there should not be a user named "Bad Person"

# Happy
Scenario: add new unprivileged user using a privileged account
  Given I am on the users page as "Arlan Jaska"
  When I add a new user with name "Mina Li" and email "limina@berkeley.edu" and uid "994351" and admin "False"
  Then I should see "Mina Li"
  And there should be a user named "Mina Li"
  And the user "Mina Li" should not be an admin

Scenario: add new privileged user using a privileged account
  Given I am on the users page as "Jack Chou"
  When I add a new user with name "Albert Hu" and email "alberthu@berkeley.edu" and uid "998455" and admin "True"
  Then I should see "Albert Hu"
  And there should be a user named "Albert Hu"
  And the user "Albert Hu" should be an admin
