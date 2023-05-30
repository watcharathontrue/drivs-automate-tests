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


*** Test Case ***
SMP_011_01 Add member to team and Remove member
    [Tags]    SMT_011    SMT_011_01  
    Set Selenium Speed   0.3
    Run Keyword And Ignore Error    Login DRIVS web    ${shift_management_txt_username}    ${shift_management_txt_password}
    Validate Title name
    Select Menu Team Management    Gantt
    Search Team    ${team_management_team_name}
    Add member to team    ${user_team_management_technician_name}
    Verify toast add member         ${expected_team_management_toast_add_member}
    Capture Page Screenshot    RESULT_SMT_011_01_01.png
    Remove member from team    ${user_team_management_technician_name}    ${expected_team_management_toast_remove_member2}
    Verify toast remove member    ${expected_team_management_toast_remove_member}
    Capture Page Screenshot    RESULT_SMT_011_01_02.png

Verify Popup - 2nd Header
    [Tags]    SMT_011    SMT_011_02
    Set Selenium Speed   0.2
    Run Keyword And Ignore Error    Login DRIVS web    ${shift_management_txt_username}    ${shift_management_txt_password}
    Select Menu Team Management    Gantt
    Search Team    ${team_management_team_name}
    Click Add member button
    Verify 2nd Header popup    Select User to Team Member
    Verify Cancel button
    Capture Page Screenshot    RESULT_SMT_011_02.png

Validate Popup - Cancel button
    [Tags]    SMT_011    SMT_011_03
    Set Selenium Speed   0.2
    Run Keyword And Ignore Error    Login DRIVS web    ${shift_management_txt_username}    ${shift_management_txt_password}
    Select Menu Team Management    Gantt
    Search Team    ${team_management_team_name}
    Click Add member button
    Verify Cancel button
    Capture Page Screenshot    RESULT_SMT_011_03.png
    Sleep    4s




