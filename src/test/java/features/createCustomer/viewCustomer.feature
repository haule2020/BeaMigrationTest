@apiTest
Feature: Get Customer details

  Background:
    * url 'https://jsonplaceholder.typicode.com'
    * def requestData = read ('classpath:resources/requests/createCustomer.json')
    * def responseData = read ('classpath:resources/responses/viewCustomer.json')

  Scenario: get all Customer and then get the first user by id
    Given path 'users'
    When method get
    Then status 200
    * def first = response[0]
    Given path 'users', first.id
    When method get
    Then status 200
    And  match response == responseData.viewCustomerResponse
