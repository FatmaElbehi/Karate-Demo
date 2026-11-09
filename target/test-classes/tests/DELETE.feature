Feature: Delete API Demo

Background:
 * header x-api-key = apiKey
 * url baseUrl
 
Scenario: Delete API Demo1
	Given path '/users/2'
	When method DELETE
	Then status 204
	And print response
