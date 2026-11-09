Feature: Get API Call

Background:
* url 'https://reqres.in/api'
* header Accept = 'application/json'

#Simple Get Call
@firstTest
Scenario: Get demo1
Given url 'https://reqres.in/api/users?page=2' 
When method GET
Then status 200
And print response
And print responseStatus
And print responseTime
And print responseHeaders
And print responseCookies


#Get Call with background
Scenario: Get demo2
Given path '/users?page=2' 
When method GET
Then status 200
And print response


#Get with Path and Params
Scenario: Get demo3
Given path '/users' 
And param page = 2
When method GET
Then status 200
And print response



#Get with Assertions
Scenario: Get demo4
Given path '/users' 
And param page = 2
When method GET
Then status 200
And print response
And match response.data[0].first_name != null
And assert response.data.length == 6
And match $.data[3].id == 10
And match response.data[3].last_name == 'Fields'
