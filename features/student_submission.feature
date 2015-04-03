Feature: upload a project

    As a proud student
    So that I can upload my awesome project
    I want to submit my project with the required submission details

Background: course exists and is ready for submissions
    Given I am a Student

    And the following project exists
    | name   | desc                 |
    | CS 169 | Software Engineering |
    | "CS 186 Spark Intro"    | "Learning how to use Spark" |

    And I am on the project submission page

Scenario: submit a project with all required fields present

    When I select "CS 169" from the dropdown menu
    And I fill in "submission_title" with "My Cool Project"
    And I fill in "submission_desc" with "I worked really hard on this project. Please look at it"
    And I upload in "submission_attachment" with "test_files/test.mp4"
    And I follow "Submit"
    Then I should be on the CS 169 successful submission page

Scenario: submit a project with missing required fields

    When I select "CS 186" from the dropdown menu
    When I fill in "submission_title" with ""
    And I fill in "submission_desc" with "I worked really hard on this project. Please look at it"
    And I upload in "submission_attachment" with "test_files/test.mp4"
    And I follow "Submit"

    Then I should still be on the CS 186 project submission page
    And I should see "Missing requirement(s)"
