@apiTest
Feature: Create customers test

  Background:
    * def URL  = 'https://jsonplaceholder.typicode.com/users'
    * def requestData = read ('classpath:resources/requests/createCustomer.json')
    * def responseData = read ('classpath:resources/responses/createCustomer.json')

  Scenario: create a customers
    Given url URL
    * print requestData.createCustomer
    And request requestData.createCustomer
    When method post
    Then status 201