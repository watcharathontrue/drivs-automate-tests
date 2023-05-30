*** Settings ***
Resource            ../Resources/PageObject/KeywordDifinition/TeamManagementKeyword.robot
Resource            ../Resources/PageObject/Locator/Locator.robot
Resource            ../Resources/PageObject/TestData/MsgData.robot
Resource            ../Resources/PageObject/TestData/TestData.robot
Resource            ../Resources/PageObject/KeywordDifinition/LoginKeyword.robot
Suite Setup         Common.Suite Setup UAT
Suite Teardown      Common.Suite Teardown
Test Setup          Common.Test Setup UAT
Test Teardown       Common.Test Teardown
Force Tags          SMT

*** Test Cases ***
SMT_010_01 Add approver and Edit approver and Remove approver
    [Tags]    SMT_010    SMT_010_01
    Set Selenium Speed   0.3
    Run Keyword And Ignore Error    Login DRIVS web     ${team_management_team_shift_username}    ${team_management_team_shift_password}
    Verify Work forz Home page  
    Go to Tab Team Management
    Search Team Approval    ${team_management_team_shift_team_benz}
    Add_approver    ${team_management_team_shift_team_technician_name}
    Verify toast add approver success    ${expected_toast_add_approve_success}
    Capture Page Screenshot    RESULT_SMT_010_01.png
    Edit_approve_request    ${expected_edit_approve}
    Verify toast edit approve    ${expected_edit_approve}    ${expected_toast_add_approve_success}
    Capture Page Screenshot    RESULT_SMT_010_02.png
    Remove_approver    ${expected_toast_add_approve_success}
    Verify toast remove approve    ${expected_toast_remove_approve}    ${expected_toast_add_approve_success}    ${expected_edit_approve}
    Capture Page Screenshot    RESULT_SMT_010_03.png
    Sleep    3s


    
