@MarvelFeature
Feature:

  Background:
    * def baseUrl = 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api'
    * def headers = { "Content-Type": "application/json" }

    @allCharacters
    Scenario: Get all characters
      Given url baseUrl + '/characters'
      When method get
      Then status 200
      And print response.length
      * def size = response.length
      And print size
      * assert size > 0

    @createUpdateDeleteCharacter  
    Scenario: Crear y actualizar un nuevo Character
      Given url baseUrl + '/characters'
      And request {"name": 'SF Hero 5', "alterego": "Salesforce Developer", "description": "Genius billionaire", "powers": ["Armor", "Flight"]}
      When method post
      Then status 201
      And print response
      * def characterId = response.id

      Given url baseUrl + '/characters/' + characterId
      And request {"name": 'SF Hero 5', "alterego": "Salesforce Developer", "description": "Genius billionaire", "powers": ["Armor", "Flight"]}
      When method put
      Then status 200
      And print response

      Given url baseUrl + '/characters/' + characterId
      When method delete
      Then status 204
      And print response