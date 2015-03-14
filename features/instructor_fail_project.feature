Feature: Add a new project with missing required fields

    As a proud instructor
    So that my project is correctly created
    I want an error to occur when I do not fill out all the required project fields

Background: instructor is on the new project page and is filling out the project fields

    Given I am an admin
    And I am on the new project page

Scenario: failure to fill out all the required project fields

    When I enter the name "CS 169 Software Engineering" into the name field and click submit
    Then I should be on the new project page
    And I should see the error message: "Desc can't be blank"