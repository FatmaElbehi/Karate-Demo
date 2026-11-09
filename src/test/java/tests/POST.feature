Feature: POST API Demo

Background:
	* url 'https://reqres.in/api'
	* header Accept = 'application/json'
	* header x-api-key = apiKey
	# * header Authorization = 'Bearer ' + <token> 
	# * configure headers = { Authorization: '#("Basic " + encoded)' }

	#* def expectedOutput = read("response.json")
	
#Simple POST Scenario
Scenario: POST Demo1
	Given url 'https://reqres.in/api/users'
	And request {"name": "Fatma", "job": "QA Engineer"}
	When method POST
	Then status 201
	And print response


#POST Scenario with Background
Scenario: POST Demo2
	Given path '/users'
	And request {"name": "DD", "job": "Teacher"}
	When method POST
	Then status 201
	And print response
	
	
#POST Scenario with Assertions
Scenario: POST Demo3
	Given path '/users'
	And request {"name": "FF", "job": "Teacher"}
	When method POST
	Then status 201
	And  match response == {"name": "FF","job": "Teacher","id": "#string","createdAt": "#ignore","support": "#ignore","_meta": "#ignore"}
	And print response


#POST Scenario with read response with file
Scenario: POST Demo4
	Given path '/users'
	And request {"name": "FF", "job": "Teacher"}
	When method POST
	Then status 201
	#And def projectPath = karate.properties['user.dir']
	#And print projectPath
	#And def filePath = projectPath + '/src/test/java/Data/response.json'
	And def filePath1 = read('classpath:Data/response.json')
	And print filePath1
	And  match response == filePath1.res1
	#And  match $ == filePath.res1
	And print response	

	
#POST Scenario with read request with file
Scenario: POST Demo5
	Given path '/users'
	#And def requestBody = read('request.json')
	And def filePath1 = read('classpath:Data/request.json')
	And print filePath1
	And request filePath1
	When method POST
	Then status 201
	And def filePath2 = read('classpath:Data/response.json')
	And print filePath2
	And  match $ == filePath2.res2
	And print response
	
	
	
#POST Scenario and update one of the param
Scenario: POST Demo6
	Given path '/users'
	And def filePath1 = read('classpath:Data/request.json')
	And set filePath1.job = "Tester"
	And request filePath1
	When method POST
	Then status 201
	And def filePath2 = read('classpath:Data/response.json')
	And print filePath2
	And set filePath2.res3.job = "Tester"
	And  match $ == filePath2.res3
	And print response