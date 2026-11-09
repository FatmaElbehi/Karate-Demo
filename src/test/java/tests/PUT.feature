Feature: PUT API Demo

Background:
 * header x-api-key = apiKey

Scenario: PUT API Demo1
	Given url 'https://reqres.in/api/users/2'
	And request {"name": "morpheus","job": "zion resident"}
	When method PUT
	Then status 200
	And print response