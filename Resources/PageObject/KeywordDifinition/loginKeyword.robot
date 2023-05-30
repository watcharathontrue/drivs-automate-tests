*** Settings ***
Resource   ../Locator/Locator.robot
Resource    ./Common.robot
Resource    ../TestData/MsgData.robot
Resource    ../TestData/TestData.robot

*** Keywords ***
Login DRIVS web
    [Arguments]    ${varusername}    ${varpassword}
    Sleep    2s
    Wait until Keyword Succeeds    3x    2s    Input Text    ${txt_username}     ${varusername}    
    Wait until Keyword Succeeds    3x    2s    Input password    ${txt_passwords}    ${varpassword}
    Wait until Keyword Succeeds    3x    2s    Click Element    ${btn_Login}   

Verify Login Fail when don't input username and password
    Wait until Element Is Visible           ${lbl_username_error}   
    ${text_user_error} =     SeleniumLibrary.Get Text    ${lbl_username_error} 
    Should Be Equal       ${text_user_error}     ${msg_username_error}
    Wait until Element Is Visible           ${lbl_password_error}     
    ${text_password_error}     SeleniumLibrary.Get Text     ${lbl_password_error}
    Should Be Equal        ${text_password_error}         ${msg_password_error}
    Wait until Location Does Not Contain    ${lbl_user_invalid}
    Capture page Screenshot           RESULT_SMT_001_01.png

Verify login Success
    Wait until Element Is Visible     ${lbl_Task_Management}
    ${text_task_management} =     SeleniumLibrary.Get Text     ${lbl_Task_Management} 
    Should Be Equal    ${text_task_management}     ${Task_Management}
    Capture page Screenshot           RESULT_SMT_001_02.png

Logout DRIVS web
    Wait until Keyword Succeeds         3x      2s      Click Element                       ${profile_Button} 
    Wait until Keyword Succeeds         3x      2s      Click Element                       ${Sign_out}
    Sleep    4s

Input username for login
    [Arguments]                   ${var_username_login}
    Input Text                    ${txt_username}     ${var_username_login} 

Input password for login
    [Arguments]                   ${var_password_username}
    Input password                ${txt_passwords}    ${var_password_username}

Click Login Drivs Web
    Wait until Keyword Succeeds    5x    5s    Click Element    ${btn_Login}   

Verify Login when user input wrong password
    Wait until Element Is Visible          ${lbl_user_invalid}     ${general_timeout} 
    ${text_user_invalid_error}     SeleniumLibrary.Get Text        ${lbl_user_invalid}
    Should Be Equal    ${text_user_invalid_error}     ${user_invalid}
    Wait until Location Does Not Contain   ${lbl_username_error} 
    Wait until Location Does Not Contain   ${lbl_password_error} 
    Capture page Screenshot                 RESULT_SMT_001_03.png

Verify Login when user doesn't input username
    Wait until Element Is Visible           ${lbl_username_error}   
    ${text_user_error}     SeleniumLibrary.Get Text         ${lbl_username_error} 
    Should Be Equal                     ${text_user_error}     ${msg_username_error}
    Wait until Location Does Not Contain    ${lbl_password_error} 
    Capture page Screenshot                 RESULT_SMT_001_04.png
    

Verify Login when user doesn't input password
    Wait until Element Is Visible          ${lbl_password_error}     
    ${text_password_error}     SeleniumLibrary.Get Text    ${lbl_password_error}
    Should Be Equal        ${text_password_error}         ${msg_password_error}
    Wait until Location Does Not Contain   ${lbl_username_error}   
    Capture page Screenshot                RESULT_SMT_001_05.png