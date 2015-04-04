Feature: Download projects

    As a proud instructor or admin
    So that I may post student projects on the Jacobs website
    I want to be able to download desired projects from the student submissions page

Background: the instructor is on the project submissions page listing some submissions

    Given I am an admin
    And the following projects exist:
    | id | name   | desc                  |
    | 69 | CS 169 | Non-profit rails apps |
    And the following submissions exist:
    | title   | desc                     | project_id | attachment_file_name | like  |
    | Jortal  | Jacobs Project Portal    | 69         | test_files/test.txt  | false |
    | Sportal | Spacobs Project Portal   | 69         | test_files/test.txt  | true  |
    | Swortal | Swaggiest Project Portal | 69         | test_files/test.txt  | true  |
    | Swole   | Swole Portal             | 69         | test_files/test.txt  | false |
    And I am on the submissions page for CS 169

Scenario: download a submission

    When I download the Jortal submission
    Then I should have successfully downloaded Jortal 
    And I should be on the submissions page for "CS 169"
    And I should see a successful download message for Jortal
