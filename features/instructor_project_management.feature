Feature: project management

    As an instructor
    So that I can specify student project submissions
    I want to add my projects

Background: instructor is on the projects page with some existing projects

    Given I am on the projects page
    And I see "CS 186: Spark Intro"
    And I do not see "CS 169: Nonprofit Rails Web App"

Scenario: add new project that does not exist

    When I click "Add new project"
    Then I should see the following fields: name

    When I fill in "name" with "CS 169: Nonprofit Rails Web App"
    And I click "Add project"
    Then I should be on the projects page
    And I should see "CS 169: Nonprofit Rails Web App"

Scenario: add project that already exists

    When I click "Add new project"
    Then I should see the following fields: name

    When I fill in "name" with "CS 186: Spark Intro"
    And I click "Add project"
    Then I should be on the projects page
    And I should see ""CS 186: Spark Intro" already exists"

Scenario: remove project

    When I click "CS 186: Spark Intro"
    Then I should be on the project page for "CS 186: Spark Intro"

    When I click "Remove project"
    Then I should see "Are you sure?"
    
    When I click "Yes"
    Then I should be on the projects page
    And I should not see ""CS 186: Spark Intro"
