Feature: upload a project

    As a proud student
    So that I can upload my awesome project
    I want to submit my project with the required submission details

Background: course exists and is ready for submissions

    Given the following course exists:
    | name   | long_name            | instructor  | requirements_id |
    | CS 169 | Software Engineering | Armando Fox | 1               |

    And the following course requirements exist for requirements_id 1:
    | field_name  | field_type | optional |
    | title       | text       | false    |
    | description | paragraph  | true     |
    | video       | video      | false    |

    And we are on the student page

Scenario: submit a project with all required fields present

    When I select "CS 169" from the "Courses" dropdown
    Then I should see the following fields: title, description, video

    When I fill in "title" with "My Cool Project"
    And I fill in "description" with "I worked really hard on this project. Please look at it"
    And I fill in "video" with an upload of test_files/test.mp4
    And I press "Submit"
    Then I should be on the successful submission page.

Scenario: submit a project with a mismatched field type

    When I select "CS 169" from the "Courses" dropdown
    Then I should see the following fields: title, description, video

    When I fill in "title" with "My Cool Project"
    And I fill in "video" with an upload of test_files/test.jpg
    And I press "Submit"
    Then I should be on the student page
    And I should see "File type not allowed"

Scenario: submit a project with missing required fields

    When I select "CS 169" from the "Courses" dropdown
    Then I should see the following fields: title, description, video

    When I fill in "title" with ""
    And I fill in "description" with "I worked really hard on this project. Please look at it"
    And I fill in "video" with an upload of test_files/test.mp4
    And I press "Submit"

    Then I should be on the student page
    And I should see "Missing required field"