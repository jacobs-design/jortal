Feature: course management

    As an instructor
    So that I can specify student projects
    I want to add my courses

Background: instructor is on the courses page with some existing courses

    Given I am on the courses page
    And I see "CS 186"
    And I do not see "CS 169"

Scenario: add new course that does not exist

    When I click on "Add new course"
    Then I should see the following fields: name, long_name, semester

    When I fill in "name" with "CS 169"
    And I fill in "long_name" with "Software Engineering"
    And I fill in "semester" with "Spring 2015"
    And I click "Add course"
    Then I should be on the courses page
    And I should see "CS 169"

Scenario: add course that already exists

    When I click on "Add new course"
    Then I should see the following fields: name, long_name, semester

    When I fill in "name" with "CS 186"
    And I fill in "long_name" with "Database Systems"
    And I fill in "semester" with "Spring 2015"
    And I click "Add course"
    Then I should be on the courses page
    And I should see "CS 186 already exists"

