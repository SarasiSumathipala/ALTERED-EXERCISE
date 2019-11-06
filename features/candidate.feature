Background: Anonymous usage
    Given I am anonymous

Scenario: Testing getCandidates
     When I send a 'GET' request to '/candidates'
             Then I should receive a response with the status 200

Scenario: Testing createCandidate
   Given I am using basic authentication with the credentials:
    | username | priamo |
    | password | glutes |
        When I send a 'POST' request to '/candidates'
                And I add the request body:
                 """
                         {
                                "firstName": "Donald",
                                "lastName": "Trump",
                                "matchingScore": 3,
                                "vacancyTitle": "President"
                        }
                 """
                         Then I should receive a response with the status 201

Scenario: Testing getCandidateForId
    When GET "/candidates"
    And I add the query string parameters:
      | id     | {id}        |
        And I set the placeholder 'id' using the json path '$.[0].id' from the last 'GET' to '/candidates'
                        Then I should receive a response with the status 200

Scenario: Testing updateCandidate
    Given I am using basic authentication with the credentials:
    | username | priamo |
    | password | glutes |
        When I send a 'PUT' request to '/candidates'
            And I add the request body:
                """
                 {
                    "firstName": "Boris",
                    "lastName": "Johnson",
                    "matchingScore": 2,
                    "vacancyTitle": "Prime Minister"
                    }
                """
                    Then I should receive a response with the status 200


Scenario: Testing patchCandidate
    Given I am using basic authentication with the credentials:
    | username | priamo |
    | password | glutes |
        When I send a 'PATCH' request to '/candidates'
            And I add the request body:
                """
                 {
                "vacancyTitle": "Charlatan"
                }
                """
                    Then I should receive a response with the status 200

Scenario: Testing deleteCandidate
    Given I am using basic authentication with the credentials:
    | username | priamo |
    | password | glutes |
         When I send a 'DELETE' request to '/candidates/{id}'
         And I add the query string parameters:
      | id | {id} |
            And I set the placeholder 'id' using the json path '$.[0].id' from the last 'GET' to '/candidates'
                Then I should receive a response with the status 204
