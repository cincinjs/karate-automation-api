Feature: User get comment by some post id

  Background:
    * url baseURL

  Scenario: User get comment by postId
    Given path 'posts'
    When method get
    Then status 200

    * def firstPost = response[0]

    Given path 'posts', firstPost.id, 'comments'
    When method get
    Then status 200
    And match response == '#array'
    And match each response == '#object'
    And match each response[*].postId == firstPost.id
    And match each response[*].id == '#number'
    And match each response[*].name == '#string'
    And match each response[*].email == '#regex ^(?=.{1,64}@)[\\p{L}0-9_-]+(\\.[\\p{L}0-9_-]+)*@[^-][\\p{L}0-9-]+(\\.[\\p{L}0-9-]+)*(\\.[\\p{L}]{2,})$'
    And match each response[*].body == '#string'

    * def schemaEachComment =
    """
    {
      "postId": '#number',
      "id": '#number',
      "name": '#string',
      "email": '#string',
      "body": '#string'
    }
    """
    And match each response == schemaEachComment

