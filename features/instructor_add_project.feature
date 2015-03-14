Feature: Add a new project

    As a proud instructor
    So that my students can show me their awesome projects
    I want to be able to add my awesome project assignment to the projects list page

Background: the instructor is on the projects list page and "CS 169 Software Engineering" does not already exist

    Given I am an admin
    And the following projects exist:
    | name                    | desc                        |
    | "CS 186 Spark Intro"    | "Learning how to use Spark" |
    | "CS 188 Solving Pacman" | "Using AI to solve Pacman"  |

Scenario: successfully add a new project to the list of projects

    When I am on the projects list page
    And I create a project with the name "CS 169 Software Engineering" and description "Learning Rails for days"
    Then I should be on the project show page for "CS 169 Software Engineering"
    And a new project named "CS 169 Software Engineering" should exist

Scenario: failure to fill out all the required project fields

    When I am on the new project page
    And I enter the name "CS 169 Software Engineering" into the name field and click submit
    Then I should be on the new project page
    And I should see the error message: "Desc can't be blank"
