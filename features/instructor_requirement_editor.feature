Feature: set project submission requirements

    As an instructor
    So that students know how to submit their projects 
    I want to describe project submission requirements 

Background: instructor is on the class page

    Given I am on my class page 

Scenario: change media type for file submissions

    When I click on "Edit Submissions"
    And I should see the following fields: file_type

    When I fill in the "files" "field_type" with "video"
    And I fill in the "files" "optional" with "false"
    And I click on "Save"

    Then the following course requirements exist for my class:
    | field_name  | field_type | optional |
    | files       | video      | false    |
