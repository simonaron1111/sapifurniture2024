Feature: Get All Component Lists API

  Scenario: Get all component lists when database is empty
    Given that we have no component lists
    When I invoke the component lists all endpoint
    Then I should get an empty list
    And I should get a 200 OK response

  Scenario: Get all component lists with one component list
    Given that we have the following component lists:
      | createdBy | furnitureBodyId |
      | 1         | 1               |
    When I invoke the component lists all endpoint
    Then I should get 1 component list in the response
    And the component list at position "0" should have createdBy "1"
    And I should get a 200 OK response

  Scenario: Get all component lists with multiple component lists
    Given that we have the following component lists:
      | createdBy | furnitureBodyId |
      | 1         | 1               |
      | 2         | 2               |
      | 3         | 3               |
    When I invoke the component lists all endpoint
    Then I should get 3 component lists in the response
    And the component list at position "0" should have createdBy "1"
    And the component list at position "1" should have createdBy "2"
    And the component list at position "2" should have createdBy "3"
    And I should get a 200 OK response

  Scenario: Component lists return correct data structure
    Given that we have the following component lists:
      | createdBy | furnitureBodyId |
      | 5         | 1               |
    When I invoke the component lists all endpoint
    Then I should get 1 component list in the response
    And the component list at position "0" should have createdBy "5"
    And the response should contain valid component list data structure
    And I should get a 200 OK response

  Scenario: Get all component lists performs correctly after modifications
    Given that we have the following component lists:
      | createdBy | furnitureBodyId |
      | 10        | 1               |
    When I invoke the component lists all endpoint
    Then I should get 1 component list in the response
    When I invoke the component lists all endpoint
    Then I should get 1 component list in the response
    And the component list at position "0" should have createdBy "10"
    And I should get a 200 OK response