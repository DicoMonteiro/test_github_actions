*** Settings ***
Documentation        SWAPI API na rota GET /people 


Resource             ../../resources/services.robot


*** Test Cases ***
List People
    [tags]    success
    
    ${endpoint}=        New Session

    ${resp}=            List All People     ${endpoint}

    Status Should Be    200            ${resp}

    Dictionary Should Contain Item      ${resp.json()}      count       82

    Log                 ${resp.text}


Get People For Id
    [tags]    success_by_id
    
    ${endpoint}=        New Session

    ${id_people}=       Convert To String       1

    ${resp}=            Get People By Id    ${id_people}    ${endpoint}

    Status Should Be    200            ${resp}

    Dictionary Should Contain Item      ${resp.json()}      name       Luke Skywalker

    Log                 ${resp.text}


# People Not Found
#     [tags]    not_found
    
#     ${endpoint}=        New Session

#     ${resp}=            Get People By Id    99999    ${endpoint}

#     Status Should Be    404            ${resp}

#     # Should Be Equal As Strings      Not found       ${resp.json()}['detail']

#     # Log                 ${resp["detail"]}

#     # Dictionary Should Contain Item      ${resp.json()}      detail       Not found

#     Log                 ${resp.text}
