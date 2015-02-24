Feature: course management

    As a proud instructor
    So that students can show me their awesome projects
    I want to be able to add my awesome course

Background: instructor is on the instructor page and "CS 169" does not already exist

    Given I am on the instructor page
    And I do not see "CS 169"

Scenario: add new course

    When I click on "Add new course"
    Then I should see the following fields: name, long_name, semester

    When I fill in "name" with "CS 169"
    And I fill in "long_name" with "Software Engineering"
    And I fill in "semester" with "Spring 2015"
    And I click "Add course"
    Then I should be on the instructor page
    And I should see "CS 169"