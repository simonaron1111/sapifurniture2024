Feature: Component List Controller - Get All Component Lists Endpoint

  Background:
    Given the application is running
    And the database is clean

  @endpoint @get-all
  Scenario: GET /api/component-lists returns empty array when no component lists exist
    Given that we have no component lists
    When I invoke the component lists all endpoint
    Then I should get an empty list
    And I should get a 200 OK response
    And the response content type should be application/json

  @endpoint @get-all  
  Scenario: GET /api/component-lists returns component lists with correct HTTP headers
    Given that we have the following component lists:
      | createdBy | furnitureBodyId |
      | 42        | 1               |
    When I invoke the component lists all endpoint  
    Then I should get 1 component list in the response
    And I should get a 200 OK response
    And the response content type should be application/json
    And the response should contain valid component list data structure

  @endpoint @get-all @performance
  Scenario: GET /api/component-lists handles multiple requests consistently
    Given that we have the following component lists:
      | createdBy | furnitureBodyId |
      | 100       | 1               |
      | 200       | 2               |
    When I invoke the component lists all endpoint
    Then I should get 2 component lists in the response
    When I invoke the component lists all endpoint
    Then I should get 2 component lists in the response
    And the component list at position "0" should have createdBy "100"
    And the component list at position "1" should have createdBy "200"
    And I should get a 200 OK response

  @endpoint @get-all @data-integrity
  Scenario: GET /api/component-lists returns component lists with all required fields
    Given that we have the following component lists:
      | createdBy | furnitureBodyId |
      | 999       | 1               |
    When I invoke the component lists all endpoint
    Then I should get 1 component list in the response
    And the response should contain valid component list data structure
    And each component list should have an id field
    And each component list should have a createdBy field
    And each component list should have a furnitureBodyId field
    And I should get a 200 OK response

  @endpoint @get-all @scalability
  Scenario: GET /api/component-lists handles larger datasets correctly
    Given that we have the following component lists:
      | createdBy | furnitureBodyId |
      | 1         | 1               |
      | 2         | 2               |
      | 3         | 3               |
      | 4         | 4               |
      | 5         | 5               |
    When I invoke the component lists all endpoint
    Then I should get 5 component lists in the response
    And the component list at position "0" should have createdBy "1"
    And the component list at position "4" should have createdBy "5"
    And the response should contain valid component list data structure
    And I should get a 200 OK response