*** Test Cases ***
Simple Arithmatic Calculation
    ${x}=    Set Variable    ${10}
    ${y}=    Set Variable    ${20}
    ${z}=    Set Variable    ${${x} + ${y}}
    Should Be Equal    ${z}    ${30}

Destructuring Array
    @{a}=    Set Variable    ant    bird    cat
    ${animal1}    ${animal2}    ${animal3}    Set Variable    ${a}
    Should Be Equal    ${animal1}    ant
    Should Be Equal    ${animal2}    bird
    Should Be Equal    ${animal3}    cat

Using VAR Syntax To Do Arithmatic Calculation
    VAR    ${x}    ${10}
    VAR    ${y}    ${20}
    VAR    ${z}    ${${x} + ${y}}
    Should Be Equal    ${z}    ${30}

Accessing List Value
    VAR    @{list}    ant    bird    cat
    Should Be Equal    ${list}[0]    ant
    Should Be Equal    ${list}[1]    bird
    Should Be Equal    ${list}[2]    cat

Accessing Dictionary Value
    VAR    &{dict}    first_name=Jessie    last_name=Pinkman
    Should Be Equal    ${dict}[first_name]    Jessie
    Should Be Equal    ${dict}[last_name]    Pinkman