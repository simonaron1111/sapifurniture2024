Feature: Create Component Lists via POST API
  As a furniture application user
  I want to create component lists directly via the POST API
  So that I can add component lists with specific data

  @endpoint @post @create
  Scenario: Successfully create a component list with valid data
    Given the application is running
    And the database is clean
    Given that we have prepared component list data with createdBy "42"
    When I create a component list from the furniture body with createdBy "42"
    Then I should get a 200 OK response
    And the created component list should have createdBy "42"
    And the created component list should be linked to the furniture body

  @endpoint @post @create @validation
  Scenario: Create component list with minimum required fields
    Given the application is running
    And the database is clean  
    Given that we have prepared component list data with createdBy "100"
    When I create a component list from the furniture body with createdBy "100"
    Then I should get a 200 OK response
    And the created component list should have createdBy "100"

  @endpoint @post @create @data-integrity
  Scenario: Create component list and verify all fields are populated correctly
    Given the application is running
    And the database is clean
    Given that we have prepared component list data with createdBy "999"  
    When I create a component list from the furniture body with createdBy "999"
    Then I should get a 200 OK response
    And the created component list should have createdBy "999"
    And the created component list should be linked to the furniture body

  @endpoint @post @create @business-logic
  Scenario: Create component list with raw materials integration
    Given the application is running
    And the database is clean
    Given that we have the following furniture bodies with raw materials for component lists:
      | width | heigth | depth |
      | 150   | 300    | 75    |
    When I create a new component list with POST request
    Then I should get a 200 OK response
    And the created component list should contain raw materials
    And the raw materials should have proper dimensions

  @endpoint @post @create @performance  
  Scenario: Create multiple component lists in sequence
    Given the application is running
    And the database is clean
    Given that we have prepared component list data with createdBy "10"
    When I create a component list from the furniture body with createdBy "10" 
    Then I should get a 200 OK response
    When I create a component list from the furniture body with createdBy "20"
    Then I should get a 200 OK response
    And the created component list should have createdBy "20"