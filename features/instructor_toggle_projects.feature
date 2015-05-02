Feature: instructor toggle projects

  As a proud instructor or admin
  So that I may see which projects belong to me only
  I want to be able to toggle between all projects and my projects

Background: the instructor is on the project submissions page listing some submissions

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

Scenario: toggle projects as an instructor
  Given I am on the projects page as "Jack Chou"
  And I click on "View my projects only"
  Then I should not see "CS 666 Death Coding"
  And I should see "CS 188 Solving Pacman"

Scenario: toggle projects as an admin
  Given I am on the projects page as "Arlan Jaska"
  And I click on "View my projects only"
  Then I should not see "CS 188 Solving Pacman"
  And I should see "CS 666 Death Coding"
