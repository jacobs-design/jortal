Feature: project management

    As a proud instructor
    So that students can show me their awesome projects
    I want to be able to add my awesome project to the projects list

Background: instructor is on the projects list page and "CS 169 Software Engineering" does not already exist

    Given I am on the projects list page
    And the following projects exist:
    | name                    | desc                        |
    | "CS 186 Spark Intro"    | "Learning how to use Spark" |
    | "CS 188 Solving Pacman" | "Using AI to solve Pacman"  |

Scenario: add new project to the list of projects

    When I create a project with the name "CS 169 Software Engineering" and description "Learning Rails for days"
    Then I should be on the project show page for "CS 169 Software Engineering"
    And a new project named "CS 169 Software Engineering" should exist