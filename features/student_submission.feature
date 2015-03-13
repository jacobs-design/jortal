Feature: upload a project

    As a proud student
    So that I can upload my awesome project
    I want to submit my project with the required submission details

Background: course exists and is ready for submissions

    Given the following project exists
    | name   | desc                 |
    | CS 169 | Software Engineering |

    And I am on the CS 169 project submission page

Scenario: submit a project with all required fields present

    When I fill in "submission_title" with "My Cool Project"
    And I fill in "submission_desc" with "I worked really hard on this project. Please look at it"
    And I upload in "attachment_Browse" with "test_files/test.mp4"
    And I follow "Submit"
    Then I should be on the CS 169 successful submission page

Scenario: submit a project with missing required fields

    When I fill in "submission_title" with ""
    And I fill in "submission_desc" with "I worked really hard on this project. Please look at it"
    And I upload in "attachment_Browse" with "test_files/test.mp4"
    And I follow "Submit"

    Then I should still be on the CS 169 project submission page
    And I should see "Missing required field"
