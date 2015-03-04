Feature: set project submission requirements

    As an instructor
    So that students know how to submit their projects 
    I want to describe project submission requirements 

Background: instructor is on a course page

    Given I am on the course page for "CS 169"

Scenario: create a project with default requirements

    When I click on "Create project"
    Then I should see "Project name"
    And I should see "Project description"
    And I should see "Title"
    And I should see "Description"
    And I should see "Image"

    When I fill in "Project name" with "Rails app"
    And I fill in "Project description" with "Software as a service"
    And I click "Save"
    Then I should be on the course page for "CS 169"
    And I should see "Rails app"

Scenario: create a project with only text field requirements

    When I click on "Create project"
    Then I should see "Project name"
    And I should see "Project description"
    And I should see "Title"
    And I should see "Description"
    And I should see "Image"

    When I click "remove_req_2"
    Then I should not see "Image"

    When I select "Text"
    And I fill in "new_field_name" with "Link"
    And I click "Add"
    Then I should see "Link"

Scenario: change media type for file submissions

    When I click on "Edit Submissions"
    And I should see the following fields: file_type

    When I fill in the "files" "field_type" with "video"
    And I fill in the "files" "optional" with "false"
    And I click on "Save"

    Then the following course requirements exist for my class:
    | field_name  | field_type | optional |
    | files       | video      | false    |
