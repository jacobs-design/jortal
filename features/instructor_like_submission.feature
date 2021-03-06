Feature: Like and unlike projects

    As a proud instructor
    So that I can recommend certain student submissions
    I want to be able to record which submissions I like

Background: the instructor is on the project submissions page listing some submissions

    Given I am an admin
    And the following projects exist:
    | id | name   | desc                  |
    | 69 | CS 169 | Non-profit rails apps |
    And the following submissions exist:
    | title   | name       | desc                     | project_id | attachment           | like  |
    | Jortal  | Nobody     | Jacobs Project Portal    | 69         | test_files/test.txt  | false |
    | Sportal | Hella      | Spacobs Project Portal   | 69         | test_files/test.txt  | true  |
    | Swortal | Swag       | Swaggiest Project Portal | 69         | test_files/test.txt  | true  |
    | Swole   | Swanderful | Swole Portal             | 69         | test_files/test.txt  | false |
    And I am on the submissions page for CS 169

#iteration3-1: make likes/unlikes save upon click
@javascript
Scenario: like a submission

    When I like the following submissions: Jortal
    Then I should be on the submissions page for "CS 169"
    And the following submissions should be liked: Jortal, Sportal, Swortal

@javascript
Scenario: unlike a submission

    When I unlike the following submissions: Sportal
    Then I should be on the submissions page for "CS 169"
    And the following submissions should be unliked: Jortal, Sportal, Swole

@javascript
Scenario: like and unlike multiple submissions

    When I like the following submissions: Jortal, Swole
    And I unlike the following submissions: Sportal, Swortal
    Then I should be on the submissions page for "CS 169"
    And the following submissions should be liked: Jortal, Swole
    And the following submissions should be unliked: Sportal, Swortal

