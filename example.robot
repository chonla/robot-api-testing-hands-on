*** Settings ***
Library           RequestsLibrary

*** Variables ***
${AUTH_URL}    https://twittah-api.onrender.com/auth
&{VALID_CREDENTIAL}    login=maitree    password=123456
&{INVALID_CREDENTIAL}    login=nobody    password=123456

*** Test Cases ***
Authentication With Valid Credential
    ${response}=    Authenticate With    &{VALID_CREDENTIAL}
    Should Not Be Empty    ${response}[accessToken]

Authentication With Invalid Credential
    ${payload}    Create Dictionary    &{INVALID_CREDENTIAL}
    ${response}=    POST    url=${AUTH_URL}    json=${payload}    expected_status=401

*** Keywords ***
Authenticate With
    [Arguments]    ${login}    ${password}
    ${payload}    Create Dictionary    login=${login}    password=${password}
    ${response}=    POST    url=${AUTH_URL}    json=${payload}    expected_status=200
    RETURN    ${response.json()}
