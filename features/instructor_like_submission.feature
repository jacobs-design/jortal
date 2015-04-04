Feature: Like and unlike projects

    As a proud instructor
    So that I can recommend certain student submissions
    I want to be able to record which submissions I like

Background: the instructor is on the project submissions page listing some submissions

    Given I am an admin
    And the following projects exist:
    | id | name     | desc                    |
    | 69 | "CS 169" | "Non-profit rails apps" |
    And I am on the show page for project CS 169
    And the following submissions exist:
    | title     | desc                       | project_id | attachment_file_name | like  |
    | "Jortal"  | "Jacobs Project Portal"    | 69         | test_files/test.txt  | false |
    | "Sportal" | "Spacobs Project Portal"   | 69         | test_files/test.txt  | true  |
    | "Swortal" | "Swaggiest Project Portal" | 69         | test_files/test.txt  | true  |
    | "Swole"   | "Swole Portal"             | 69         | test_files/test.txt  | false |

Scenario: like a submission

    When I like the following submissions: Jortal
    Then I should be on the submissions page for "CS 169"
    And the following submissions should be liked: Jortal, Sportal, Swortal

Scenario: unlike a submission

    When I unlike the following submissions: Sportal
    Then I should be on the submissions page for "CS 169"
    And the following submissions should be unliked: Jortal, Sportal, Swole

Scenario: like and unlike multiple submissions

    When I like the following submissions: Jortal, Swole
    And I unlike the following submissions: Sportal, Swortal
    Then I should be on the submissions page for "CS 169"
    And the following submissions should be liked: Jortal, Swole
    And the following submissions should be unliked: Sportal, Swortal

