*** Settings ***
Library            ../flygroups/core/scripts.py
Library            String
Library            Collections
Library            OperatingSystem
Library            SeleniumLibrary    run_on_failure=Capture Page Screenshot    screenshot_root_directory=EMBED

Variables          ../flygroups/resources/enviroment/URL.py


*** Variables ***
${timeoutSec}    80


*** Keywords ***
Open Application
    [Arguments]        ${env}    ${Browser}    ${RunTest}    ${debug}
    [Documentation]   Generic test setup to switch between local and remote Open Browser
    Set Global Variable    ${debugOption}    ${debug}
    Run Keyword If    '${RunTest}'=='LOCAL'     Open Local Browser   ${env}    ${Browser}
    ...     ELSE IF   '${RunTest}'=='REMOTE'    Remote Browser  ${env}    ${Browser}
    ...     ELSE      Log       testSetup went wrong. Check the value of the variable 'environmentToRunTest'.
    #Set Window Size    1920    1080
    Maximize Browser Window


    
    Close Browser

Open Local Browser
    [Arguments]      ${env}  ${BROWSER}
    Run Keyword If    '${env}'=='TST'     Open Browser     ${URL_TST}    ${BROWSER}    options=add_argument("--ignore-certificate-errors")
    ...     ELSE IF   '${env}'=='QLT'    Open Browser     ${URL_QLT}    ${BROWSER}    options=add_argument("--ignore-certificate-errors")

Remote Browser
    [Arguments]      ${env}  ${BROWSER}
    Run Keyword If    '${env}'=='TST'     Open Remote Browser     ${URL_TST}    ${BROWSER}
    ...     ELSE IF   '${env}'=='QLT'    Open Remote Browser     ${URL_QLT}    ${BROWSER}

Open Remote Browser
    [Arguments]  ${URL}  ${BROWSER}    

    Open Browser    ${URL}      browser=${BROWSER}      remote_url=${remoteUrl}     options=add_argument('--ignore-certificate-errors'); add_argument('--headless'); add_argument('--disable-infobars'); add_argument('--no-default-browser-check'); add_argument('--no-first-run'); add_argument('--disable-gpu'); add_argument('--disable-sandbox'); add_argument('--disable-notifications'); add_argument('--disable-dev-shm-usage'); add_argument('--disable-blink-features\=AutomationControlled'); add_argument('--window-size\=1920,1080')

Assert
    [Arguments]     ${locator}    ${first-term}    ${error-message}=${None}
    [Documentation]    Compare tow strings.
    SeleniumLibrary.Element Text Should Be    ${locator}    ${first-term}    message=${error-message}    ignore_case=${False}
    
Click
    [Arguments]     ${locator}    ${timeout}=${timeoutSec}
    [Documentation]    Waits for an element identified by ``locator`` and Click on it.
    ...
    ...    *Input Arguments:*
    ...    | *Name*  | *Description* |
    ...    | locator | xpath of the element to click |
    ...    | timeout | OPTIONAL: time to wait element on screen |
    
    SeleniumLibrary.Wait Until Page Contains Element    ${locator}     ${timeout}
    SeleniumLibrary.Click Element  ${locator}

Click checkBoxs
    [Arguments]     ${locator}    ${timeout}=${timeoutSec}

    [Documentation]     Obsolete.

    SeleniumLibrary.Wait Until Page Contains Element    ${locator}     ${timeout}
    SeleniumLibrary.Select Checkbox  ${locator}

Write
    [Arguments]    ${locator}    ${text}    ${timeout}=${timeoutSec}
    [Documentation]    Waits for an element identified by ``locator`` and writes ``text`` on it.
    ...
    ...    *Input Arguments:*
    ...    | *Name*   | *Description* |
    ...    | locator  | xpath of the element to write in |
    ...    | text     | text to write |
    ...    
    SeleniumLibrary.Wait Until Page Contains Element    ${locator}    ${timeout}
    SeleniumLibrary.Clear Element Text    ${locator}
    SeleniumLibrary.Input Text    ${locator}    ${text}
    
Wait is visible
    [Arguments]     ${locator}     ${timeout}=${timeoutSec}
    [Documentation]    Waits for an element visible identified by ``locator``
    ...
    ...    *Input Arguments:*
    ...    | *Name* | *Description* |
    ...    | locator | xpath of the element to wait |
    ...    | text     | text to write |
    ...    
    SeleniumLibrary.Wait Until Element Is Visible  ${locator}   ${timeout}

Wait is clickable
    [Arguments]     ${locator}     ${timeout}=${timeoutSec}
    [Documentation]    Waits for an element clickable identified by ``locator``
    ...
    ...    *Input Arguments:*
    ...    | *Name* | *Description* |
    ...    | locator | xpath of the element to wait |
    ...    | text     | text to write |
    ...   
    SeleniumLibrary.Wait Until Element Is Enabled    ${locator}    ${timeout}
    SeleniumLibrary.Click Element  ${locator}



Write and select
    [Arguments]    ${locator}    ${TEXT}    ${locatorItem}    ${timeout}=${timeoutSec}
    [Documentation]    Waits for an element identified by ``locator`` click on it and select the correct dropdown by ``locatorItem``.
    ...
    ...    *Input Arguments:*
    ...    | *Name* | *Description* |
    ...    | locator | xpath of the element to click |
    ...    | locatorItem | xpath of the element to click |
    ...    | timeout | OPTIONAL: time to wait element on screen |
  
    Write    ${locator}    ${TEXT}
    SeleniumLibrary.wait until element is visible       ${locatorItem}  ${timeout}
    Click    ${locatorItem}

Select option
    [Arguments]    ${locator}   ${locatorItem}    ${type}    ${timeout}=${timeoutSec}
    [Documentation]    Waits for an element identified by ``locator`` click on it and select the correct dropdown by ``locatorItem``.
    ...
    ...    *Input Arguments:*
    ...    | *Name* | *Description* |
    ...    | locator | xpath of the element to select |
    ...    | locatorItem | select item |
    ...    | type | Select by INDEX, VALUE or LABEL |
    ...    | timeout | OPTIONAL: time to wait element on screen |
    IF    '${type}' == 'VALUE'
        Select From List By Value    ${locator}    ${locatorItem}
    ELSE IF    '${type}' == 'INDEX'
        Select From List By Index    ${locator}    ${locatorItem}
    ELSE IF    '${type}' == 'LABEL'
        Select From List By Label    ${locator}    ${locatorItem}
    END
Scroll Screen
    [Arguments]    ${pixels}
    [Documentation]    Scroll up or down, by the value. If positive, scroll down. If negative, scroll up.
    ...
    ...    *Input Arguments:*
    ...    | *Name* | *Description* |
    ...    | pixels | value to scroll |

    Execute Javascript    window.scrollTo(0,${pixels})

Split strings
    [Arguments]    ${text}    ${separator}    ${index}
    [Documentation]    Split strings.
    ...
    ...    *Input Arguments:*
    ...    | *Name*    | *Description* |
    ...    | text      | string to be splited |
    ...    | separator | delimiter string |
    ...    | index     | index to get value|
    ${list}=    String.Split String          ${text}    ${separator}
    ${splited}=    Collections.Get From List    ${list}    ${index}
    RETURN    ${splited}


New Window
    [Arguments]    ${URL}
    [Documentation]    Open a new Tab/Window and focus.
    ...
    ...    *Input Arguments:*
    ...    | *Name*    | *Description* |
    ...    |   URL     | URL for new tab |
    Execute Javascript  window.open()
    ${windowHandles}=    Get Window Handles
    Set Global Variable    ${windowHandles}
    ${ParentWindow}=    Switch Window  locator=NEW
    Go To    ${URL}

Click radio button
    [Arguments]    ${group_name}    ${value}
    Select Radio Button    ${group_name}    ${value}

Switch Tab
    Switch Window    ${windowHandles}[0]

