*** Settings ***
Resource    ../../core/basePage.robot


*** Variables ***
${env}                     QLT


*** Test Cases ***

TC001_Test
    [Tags]        TC001
    Open Browser     https://www.google.com    chrome    options=add_argument("--ignore-certificate-errors")
