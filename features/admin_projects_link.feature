Feature: admin projects link

  As a administrator
  So that I can see what projects each instructor has
  I want to have a page of projects filtered by instructor

Background: users and projects in the database

  Given the following users exist:
  | name        | email                       | uid     | admin |
  | Arlan Jaska | ajaska@berkeley.edu         | 1033859 | true  |
  | Terry Tsai  | iliveinabucket@berkeley.edu | 988433  | true  |
  | Jack Chou   | jackchou@berkeley.edu       | 991334  | false |
  | Kenneth Lam | lam.c.kenneth@berkeley.edu  | 994946  | false |

  And the following projects exist:
  | name                    | desc                        | users       |
  | "CS 186 Spark Intro"    | "Learning how to use Spark" | Arlan Jaska |
  | "CS 188 Solving Pacman" | "Using AI to solve Pacman"  | Jack Chou   |
  | "CS 666 Death Coding"   | "Face your doom"            | Arlan Jaska |

#Happy
Scenario: See projects associated with an instructor
  Given I am on the users page as "Terry Tsai"
  When I see projects for "Arlan Jaska"
  Then I should see "CS 186 Spark Intro"
  And I should see "CS 666 Death Coding"
  And I should not see "CS 188 Solving Pacman"
