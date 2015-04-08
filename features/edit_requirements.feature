Feature: edit requirements

  As a proud instructor
  So that I may customize my project 
  I wish to be able to edit requirements for project submissions

Background: Projects in the database

  Given the following users exist:
  | name        | email                       | uid     | admin |
  | Arlan Jaska | ajaska@berkeley.edu         | 1033859 | true  |
  | Terry Tsai  | iliveinabucket@berkeley.edu | 988433  | true  |
  | Jack Chou   | jackchou@berkeley.edu       | 991334  | false |
  | Kenneth Lam | lam.c.kenneth@berkeley.edu  | 994946  | false |

  And the following projects exist:
  | id | name   | desc                  |
  | 69 | CS 169 | Non-profit rails apps |

#happy
Scenario: add a requirement successfullyi
  Given I am signed in as "Arlan Jaska"
  And I am on the edit requirements page for "CS 169"
  When I add a new "video" requirement
  Then the project should have a "video" requirement

Scenario: creating a new project with default requirements
  Given I am signed in as "Arlan Jaska"
  When I am on the projects list page
  And I create a project with the name "CS 169 Software Engineering" and description "Learning Rails for days"
  Then I should be on the project edit page for "CS 169 Software Engineering" #changed show to edit (steps too)

  #And I am on the new project page
  #When I fill in Name with "hi"
  #And I fill in Description with "bye"
  #And I follow "Submit"
  #Then I should be on the edit requirements page
  #And I should see a name field
  #And I should see a description field
  #And I should not see any other fields

#sad
Scenario: editing as not a user
  Given I am on the edit requirements page for "CS 169"
  Then I should see "page you were looking for doesn't exist"
 
