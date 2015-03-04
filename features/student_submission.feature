Feature: upload a project

    As a proud student
    So that I can upload my awesome project
    I want to submit my project with the required submission details

Background: course exists and is ready for submissions

    Given the following course exists:
    | name   | long_name            | instructor  | requirements_id |
    | CS 169 | Software Engineering | Armando Fox | 1               |

    And the following course requirements exist for requirements_id 1:
    | field_name  | field_type | optional | order | project_id | course_id | submission_id |
    | title       | text       | false    |   0   |     1      |    169    |      0        |
    | description | paragraph  | true     |   1   |     1      |    169    |      0        |
    | video       | video      | false    |   2   |     1      |    169    |      0        |
    | other       | any        | true     |   3   |     1      |    169    |      0        |

    And we are on the student page

Scenario: submit a project with all required fields present

    When I select "CS 169" from the "Courses" dropdown
    Then I should see the following fields: title, description, video, other # checks if fields are in this order

    When I fill in "title" with "My Cool Project"
    And I fill in "description" with "I worked really hard on this project. Please look at it"
    And I fill in "video" with an upload of test_files/test.mp4
    And I press "Submit"
    Then I should be on the successful submission page.

Scenario: submit a project with a mismatched field type

    When I select "CS 169" from the "Courses" dropdown
    Then I should see the following fields: title, description, video, other

    When I fill in "title" with "My Cool Project"
    And I fill in "video" with an upload of test_files/test.jpg
    And I press "Submit"
    Then I should be on the student page
    And I should see "File type not allowed"
    And the "video" field should be highlighted

Scenario: submit a project with missing required fields

    When I select "CS 169" from the "Courses" dropdown
    Then I should see the following fields: title, description, video, other

    When I fill in "title" with ""
    And I fill in "description" with "I worked really hard on this project. Please look at it"
    And I fill in "video" with an upload of test_files/test.mp4
    And I press "Submit"

    Then I should be on the student page
    And I should see "Missing required field"
    And the "title" field should be highlighted

Scenario: submit a project with title text too long

    When I select "CS 169" from the "Courses" dropdown
    Then I should see the following fields: title, description, video, other

    When I fill in "title" with "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
    And I fill in "description" with "Please see title"
    And I fill in "video" with an upload of test_files/test.mp4
    And I press "Submit"

    Then I should be on the student page
    And I should see "Title text too long"
    And the "title" field should be highlighted

Scenario: stop editing required field while blank
    
    When I select "CS 169" from the "Courses" dropdown
    Then I should see the following fields: title, description, video, other

    When I click on the "title" form
    And I click on the page
    Then the "title" field should be highlighted
    And I should see "This field is required"

