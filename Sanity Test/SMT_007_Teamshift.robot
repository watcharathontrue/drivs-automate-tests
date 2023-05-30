*** Settings ***
Resource            ../Resources/PageObject/KeywordDifinition/TeamManagementKeyword.robot
Resource            ../Resources/PageObject/Locator/Locator.robot
Resource            ../Resources/PageObject/TestData/MsgData.robot
Resource            ../Resources/PageObject/TestData/TestData.robot
Resource            ../Resources/PageObject/KeywordDifinition/Common.robot
Resource            ../Resources/PageObject/KeywordDifinition/LoginKeyword.robot
Suite Setup         Common.Suite Setup UAT
Suite Teardown      Common.Suite Teardown
Test Setup          Common.Test Setup UAT
Test Teardown       Common.Test Teardown
Force Tags          SMT

*** Test Cases ***
SMT_007_01 able search and assign shift and ble delete shift : haven't task
    [Tags]    SMT_007    SMT_007_02
    Set Selenium Speed   0.2
    Run Keyword And Ignore Error    Login DRIVS web    ${team_management_team_shift_username}    ${team_management_team_shift_password}
    Verify Work forz Home page
    Go to Tab Team Management
    Click team shift
    Search team page team shift    ${team_management_team_shift_team_benz}
    Search shift with name    ${team_management_team_shift_team_technician_name}
    Assign shift    ${team_management_shift_06:00-20:00}
    Verify assign shift    ${msg_toast_assignshift_success}
    Capture Page Screenshot    RESULT_SMT_007_01.png
    Delete shift
    Verify remove shift    ${msg_toast_removeshift_success}
    Capture Page Screenshot    RESULT_SMT_007_02.png
    Sleep    4s