Feature: User get all posts data

  Background:
    * url baseURL

  Scenario: get all posts users
    Given path 'posts'
    When method get
    Then status 200
    And match response == '#array'
    And match each response == '#object'
    And match each response[*].userId == '#number'
    And match each response[*].id == '#number'
    And match each response[*].title == '#string'
    And match each response[*].body == '#string'
    And match response == '#[100]'

    * def expectedJSONEachPost =
    """
    {
      "userId": '#number',
      "id": '#number',
      "title": '#string',
      "body": '#string'
    }
    """

    And match each response == expectedJSONEachPost

