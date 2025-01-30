*** Settings ***
Resource          ../../../../core/basePage.robot
Variables         ../../../resources/locators/flygroup/loginLocators.py
Variables         ../../../resources/locators/GSO/loginGSOLocators.py
Variables         ../../../resources/datapool/loginData.py
Variables         ../../../resources/enviroment/URL.py
Variables         ../../../resources/enviroment/loginData.py


*** Keywords ***
Login as "${user}"
    Run Keyword    Login   ${user}

Logout
    Sleep    2
    Click    ${logoutSelect}
    Click    ${lougoutButton}

Open GSO
    New Window    ${URLGSO} 

Login GSO as "${user}"
    Write    ${inputEmailGSO}        ${${user}.get('email')}
    Write    ${inputPasswordGSO}     ${${user}.get('password')}
    Click    ${loginButtonGSO}

Login
    [Arguments]    ${user}
    Click    ${industryProfessionallFLYGROUPS}
    Write    ${inputEmailFLYGROUPS}        ${${user}.get('email')}
    Write    ${inputPasswordlFLYGROUPS}     ${${user}.get('password')}
    Click    ${loginButtonlFLYGROUPS}
