*** Settings ***
Resource    ../Resources/PageObject/Locator/Locator.robot
Resource    ../Resources/PageObject/KeywordDifinition/LoginKeyword.robot
Resource    ../Resources/PageObject/KeywordDifinition/Common.robot
Suite Setup    Common.Suite Setup UAT
Suite Teardown    Common.Suite Teardown
Test Setup    Common.Test Setup UAT
Test Teardown     Common.Test Teardown
Force Tags    SMT

*** Test Cases ***
SMT_001_01 Verify Login when user doesn't input password 
    [Documentation]    ตรวจสอบการ Login success
    [Tags]    SMT_001        SMT_001_01
    Set Selenium Speed   0.2
    Input Username for login    ${User02_login.username}
    Click Login Drivs Web
    Verify Login when user doesn't input password
    Capture Page Screenshot    RESULT_SMT_001_01.png

SMT_001_02 Verify Login Fail when don't input username and password
    [Documentation]    ตรวจสอบการ Login Fail กรณีไม่กรอกข้อมูล
    [Tags]    SMT_001        SMT_001_02
    Set Selenium Speed   0.2
    Run Keyword And Ignore Error    Click Login Drivs Web
    Verify Login Fail when don't input username and password
    Capture Page Screenshot    RESULT_SMT_001_02.png

SMT_001_03 Verify Login when user input wrong password
    [Documentation]    ตรวจสอบการ Login Fail เมื่อกรอกรหัสผ่านผิด(Password)
    [Tags]    SMT_001        SMT_001_03
    Set Selenium Speed   0.2
    Input Username for login    ${User01_login.username} 
    Input Password for login    ${User02_login.password}
    Click Login Drivs Web
    Verify Login when user input wrong password
    Capture Page Screenshot    RESULT_SMT_001_03.png
     

SMT_001_04 Verify Login when user doesn't input username
    [Documentation]    ตรวจสอบการ Login Fail เมื่อไม่กรอกชื่อผู้ใช้(username)
    [Tags]    SMT_001        SMT_001_04
    Set Selenium Speed   0.2
    Input Password for login    ${User01_login.password}
    Click Login Drivs Web
    Verify Login when user doesn't input username
    Capture Page Screenshot    RESULT_SMT_001_04.png

SMT_001_05 Verify Login when user doesn't input password Verify Login Success
    [Tags]    SMT_001        SMT_001_05
    Run Keyword And Ignore Error     Login DRIVS web             ${User01_login.username}         ${User01_login.password}
    Verify login Success
    Capture Page Screenshot    RESULT_SMT_001_05.png
    #Logout DRIVS web
