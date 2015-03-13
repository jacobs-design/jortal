Feature: failure to add new project

    As a proud instructor
    So that students know the scopes of the class and project
    I want to be able to make sure I fill out the proper project fields correctly

Background: instructor is on the new project page and is filling out the project fields

    Given I am on the new project page

Scenario: failure to fill out all the proper project fields

    I enter the name "CS 169 Software Engineering" into the name field and click submit
    Then I should be on the new project page
    And I should see the error message: "Desc can't be blank"