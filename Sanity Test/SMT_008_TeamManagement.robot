*** Settings ***  
Resource            ../Resources/PageObject/KeywordDifinition/TeamManagementKeyword.robot
Resource            ../Resources/PageObject/KeywordDifinition/Common.robot
Resource            ../Resources/PageObject/Locator/Locator.robot
Resource            ../Resources/PageObject/TestData/MsgData.robot
Resource            ../Resources/PageObject/TestData/TestData.robot
Resource            ../Resources/PageObject/KeywordDifinition/LoginKeyword.robot
Suite Setup         Common.Suite Setup UAT
Suite Teardown      Common.Suite Teardown
Test Setup          Common.Test Setup UAT
Test Teardown       Common.Test Teardown
Force Tags          SMT

*** Test Case ***
SMT_008_01 Create team
    [Tags]     SMT_008     SMT_008_01 
    Set Selenium Speed   0.3
    Run Keyword And Ignore Error    Login DRIVS web    ${shift_management_txt_username}    ${shift_management_txt_password}
    Select Menu Team Management   Gantt
    Create New Team    Team Information
    Input Team Information
    Input Config depot code
    Input Area
    Add Adrea
    Click Create    
    Capture Page Screenshot    RESULT_SMT_008_01.png
    Search Team Then Create Success    ${team_management_team_name_create_team}

SMT_008_02 Edit team
    [Tags]     SMT_008     SMT_008_02 
    Set Selenium Speed   0.3  
    Run Keyword And Ignore Error    Login DRIVS web                   ${shift_management_txt_username}    ${shift_management_txt_password}
    Select Menu Team Management    Gantt
    Search Team for Edit
    Click Edit
    Edit Team Information
    Save Edit Member
    Verify toast edit successful
    Capture Page Screenshot    RESULT_SMT_008_02.png
    Search Team Then Edit Success

SMT_008_03 Create child team
    [Tags]     SMT_008     SMT_008_03
    Set Selenium Speed   0.3 
    Run Keyword And Ignore Error    Login DRIVS web                   ${shift_management_txt_username}    ${shift_management_txt_password}
    Select Menu Team Management    Gantt
    Create New Team    Team Information
    Input Sub Team Information
    Input Config depot code
    Input Area
    Add Adrea
    Click Create
    Capture Page Screenshot    RESULT_SMT_008_03.png
    Search Team Then Create Sub team Success

SMT_008_04 Delete team
    [Tags]     SMT_008     SMT_008_04
    Set Selenium Speed   0.3 
    Run Keyword And Ignore Error    Login DRIVS web                   ${shift_management_txt_username}    ${shift_management_txt_password}
    Select Menu Team Management    Gantt
    Search Team for Delete
    Delete Subteam    ${team_management_team_name_create_team}
    Delete Company Team    ${team_management_team_name_create_team}
    Capture Page Screenshot    RESULT_SMT_008_04.png
    Sleep    4s