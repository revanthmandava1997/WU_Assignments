Feature: API Testing with Restful Booker

  Background: 
    * url 'https://restful-booker.herokuapp.com'
    * header Accept = 'application/json'

  Scenario: Retrieve information using GET request
    Given path '/booking/1'
    When method GET
    Then status 200
    And match response contains { "bookingid": 1 }

  Scenario: Create a new booking using POST request
    Given path '/booking'
    And request { "firstname": "Mandava", "lastname": "Revanth", "totalprice": 100, "depositpaid": true, "bookingdates": { "checkin": "2024-02-15", "checkout": "2024-02-20" } }
    When method POST
    Then status 200
    And match response contains { "firstname": "Mandava", "lastname": "Revanth" }

  Scenario: Update an existing booking using PUT request
    Given path '/booking/1'
    And request { "firstname": "LTI", "lastname": "Mindtree", "totalprice": 150, "depositpaid": false, "bookingdates": { "checkin": "2024-02-18", "checkout": "2024-02-25" } }
    When method PUT
    Then status 200
    And match response contains { "firstname": "LTI", "lastname": "Mindtree" }

  Scenario: Partially update an existing booking using PATCH request
    Given path '/booking/1'
    And request { "totalprice": 120, "depositpaid": true }
    When method PATCH
    Then status 200
    And match response contains { "totalprice": 120, "depositpaid": true }

  Scenario: Delete an existing booking using DELETE request
    Given path '/booking/1'
    When method DELETE
    Then status 201
    And match response == 'Created'
