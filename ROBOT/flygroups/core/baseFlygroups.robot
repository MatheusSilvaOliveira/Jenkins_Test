*** Settings ***
Library            scripts.py
Resource            ../../core/basePage.robot


*** Keywords ***
Return Passenger Name Locator
    [Arguments]    ${option}    ${name}
    [Documentation]    Return locators.
    ...
    ...    *Input Arguments:*
    ...    | *Option*    |
    ...    | passengerName |
    ...    | checkboxPassenger |
    ${passengerName}=    scripts.getPassengerName    ${option}     ${name}
    RETURN    ${passengerName}


Change Flight
    [Arguments]    ${airport}
    [Documentation]    Select new airport.
    ...
    ...    *Input Arguments:*
    ...    | *Option*    |
    ...    | new airport |
    ${airportLocator}=    scripts.changeFlight    ${airport}
    RETURN    ${airportLocator}



Verify GSO
    [Arguments]    ${name}    ${id}
    [Documentation]    Return locators.
    ...
    ...    *Input Arguments:*
    ...    | *Option*    |
    ...    | groupName |
    ...    | date |
    ...    | groupID  |
    ${locator}=    scripts.checkGSO     ${name}    ${id}
    Wait is visible    ${locator}
    Element Should Be Visible    ${locator}


Return specific locator
    [Arguments]    ${option}    ${id}
    [Documentation]    Return locators.
    ...
    ...    *Input Arguments:*
    ...    | *Option*    | *ID* |  Description  |
    ...    | detailsNewRequest | ID for this request |  Locators to click on details in the main screen   |
    ...    | selectFlightGSO | ID for this GSO |  Locator to click on the correct flight in the GSO Screen  |
    ...    | selectStatus     | Status for search |  Select the STATUS typed for search  |
    ...    | lookingFlightForStatus  | Search for status in flight |  Verify status  |
    ...    | clickByStatus     | Status for search |  Click on details for specific status  |
    ...    | clickDetailsInib     | ID for inib flight |  Click details for inib flight  |
    ${locator}=    scripts.locatorReturn     ${option}    ${id}
    RETURN    ${locator}


Get inib numbers
    [Arguments]    ${text}    ${init}    ${end}=${None}
    [Documentation]    Split strings.
    ...
    ...    *Input Arguments:*
    ...    | *Name*    | *Description* |
    ...    | text      | string to be splited |
    ...    | init | initial index |
    ...    | end     | final index |
    ${number}=    scripts.GetInibNumber    ${text}    ${init}    ${end}
    RETURN    ${number}

