*** Settings ***
Documentation    Aqui nós vamos encapsular algumas chamadas de serviços

Library          RequestsLibrary
Library          libs/config.py
Library          Collections
Library          OperatingSystem
Library          DebugLibrary


*** Keywords ***
### Specifications Actions
New Session
    Create Session      swapi           https://swapi.dev/api
    [return]        swapi


List All People
    [Arguments]        ${endpoint}

    &{headers}=        Create Dictionary        Content-Type=application/json

    ${resp}=           Get On Session    ${endpoint}    /people    headers=${headers}
    
    [Return]        ${resp}



Get People By Id
    [Arguments]        ${id_people}     ${endpoint}

    # Debug
    &{headers}=        Create Dictionary        Content-Type=application/json

    # Log      &{headers}

    ${resp}=           Get On Session    ${endpoint}    /people/${id_people}    headers=${headers}
    
    # Debug

    # Log      ${resp}

    [Return]        ${resp}
