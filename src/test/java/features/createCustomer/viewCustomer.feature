@apiTest
Feature: Get Customer details

  Background:
    * def requestData = read ('classpath:resources/requests/createCustomer.json')
    * def responseData = read ('classpath:resources/responses/viewCustomer.json')

  Scenario: get all customers
    Given url baseUrl
    Given path 'users'
    When method get
    When status 200
    And match response == '#[12]'
    And  match each response contains deep responseData.viewCustomerResponse

  Scenario Outline: get customer by id <id>
    Given url baseUrl
    Given path 'users', <id>
    When method get
    Then status 200
    And match response.id == <id>

    Examples:
      | id |
      | 1  |
      | 2  |
      | 7  |
      | 9  |