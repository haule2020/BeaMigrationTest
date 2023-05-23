Feature: sample karate test script
  for help, see: https://github.com/karatelabs/karate/wiki/IDE-Support

  Background:
    * url 'https://jsonplaceholder.typicode.com'
    * def requestData = read ('classpath:resources/requests/createCustomer.json')
    * def responseData = read ('classpath:resources/responses/createCustomer.json')

@FunctionalTest
  Scenario: get all users and then get the first user by id
    Given path 'users'
    When method get
    Then status 200

    * def first = response[0]

    Given path 'users', first.id
    When method get
    Then status 200

@FunctionalTest1
  Scenario: create a user and then get it by id
    Given url 'https://jsonplaceholder.typicode.com/users'
    * print requestData.createCustomer
    And request requestData.createCustomer
    When method post
    Then status 201

    # * def id = response.id
    # * print 'created id is: ', id

    # * print responseData


    # When method get
    # Then status 200
    # And match response contains user
  