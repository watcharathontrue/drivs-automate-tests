*** Settings ***
Resource    ../Resources/PageObject/KeywordDifinition/MonitorListKeyword.robot
Resource    ../Resources/PageObject/Locator/Locator.robot
Resource    ../Resources/PageObject/TestData/TestData.robot 
Resource    ../Resources/PageObject/KeywordDifinition/Common.robot
Resource    ../Resources/PageObject/KeywordDifinition/LoginKeyword.robot
Suite Setup    Common.Suite Setup UAT
Suite Teardown    Common.Suite Teardown
Test Setup    Common.Test Setup UAT
Test Teardown     Common.Test Teardown
Force Tags    SMT

** Test Cases ***
SMT_004_001 Display reassing button
    [Documentation]    รอ Fix
    [Tags]    SMT_004    SMT_004_01
    Set Selenium Speed   0.2
    Run Keyword And Ignore Error    Login DRIVS web                   ${shift_management_txt_username}    ${shift_management_txt_password}
    Go to Monitor List Page
    Search service no                 ${search_monitor_list}[1]
    Search team       
    Select date
    #Click clear calendar button
    #Pause Execution
    #Verify display re-assing button    ${excpected_assign_techician}    RESULT_SMT_004_01.png

SMT_004_002 Able Search and Status task correct
    [Tags]     SMT_004    SMT_004_02   
    Set Selenium Speed   0.2
    Run Keyword And Ignore Error    Login DRIVS web                   ${shift_management_txt_username}    ${shift_management_txt_password}
    Go to Monitor List Page
    Search team
    Select date
    Verify Able status correct    RESULT_SMT_004_02.png

SMT_004_004 Able search request no
    [Tags]     SMT_004    SMT_004_03
    Set Selenium Speed   0.2
    Run Keyword And Ignore Error    Login DRIVS web                   ${shift_management_txt_username}    ${shift_management_txt_password}
    Go to Monitor List Page
    Search request no    ${Search_MonitorList}[0]    RESULT_SMT_004_03.png
    Search team
    Select date

SMT_004_005 Able search service no
    [Tags]     SMT_004    SMT_004_04
    Set Selenium Speed   0.2
    Run Keyword And Ignore Error    Login DRIVS web                   ${shift_management_txt_username}    ${shift_management_txt_password}
    Go to Monitor List Page
    Search service no                 ${search_monitor_list}[1]
    Search team
    Select date
    Capture Page Screenshot    RESULT_SMT_004_04.png
    Sleep    4s

    
    
    
    

