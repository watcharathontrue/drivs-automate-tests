*** Settings ***
Resource   ../Resources/PageObject/KeywordDifinition/UserMangementKeyword.robot
Resource   ../Resources/PageObject/Locator/Locator.robot
Resource   ../Resources/PageObject/TestData/MsgData.robot
Resource   ../Resources/PageObject/TestData/TestData.robot
Resource   ../Resources/PageObject/KeywordDifinition/Common.robot
Resource   ../Resources/PageObject/KeywordDifinition/LoginKeyword.robot
Suite Setup    Common.Suite Setup UAT
Suite Teardown    Common.Suite Teardown
Test Setup    Common.Test Setup UAT
Test Teardown     Common.Test Teardown
Force Tags    SMT

*** Test Cases ***
SMP_005_01 Search User
    [Tags]    SMT_005    SMT_005_01 
    Set Selenium Speed   0.2
    Run Keyword And Ignore Error    Login DRIVS web                   ${shift_management_txt_username}    ${shift_management_txt_password}
    Goto menu user Management    
    Able to search user management    ${user_management_txt_create_new_user_search}
    Verify Search user    ${expected_user_management_search_staff}    RESULT_SMT_005_01.png
                             
SMP_005_02 Edit User
    [Tags]    SMT_005    SMT_005_02
    Set Selenium Speed   0.2
    Run Keyword And Ignore Error    Login DRIVS web                   ${shift_management_txt_username}    ${shift_management_txt_password}
    Goto menu user Management
    Able to edit user management    ${user_management_txt_create_new_user_search}    ${user_management_txt_create_new_user_edit}    RESULT_SMT_005_02.png

SMP_005_03 Add Skill
    [Tags]    SMT_005    SMT_005_03
    Set Selenium Speed   0.2
    Run Keyword And Ignore Error    Login DRIVS web                   ${shift_management_txt_username}    ${shift_management_txt_password}
    Goto menu user Management           
    Able to Add skill    ${user_management_txt_create_new_user_search}    RESULT_SMT_005_03.png
              
SMT_006_04 Validate button clear user
    [Tags]    SMT_005    SMT_005_04
    Set Selenium Speed   0.2
    Run Keyword And Ignore Error    Login DRIVS web                   ${shift_management_txt_username}    ${shift_management_txt_password}
    Goto menu user Management          
    Wait Until Page Contains                   ${user_management_active_main}
    Click Element                              ${user_management_search_userpage}
    Page Should Contain Button                 ${user_management_button_Clear}
    Input Text                                 ${user_management_input_searchUser}          ${user_management_txt_create_new_user_search}
    Click Button                               ${user_management_button_Clear}
    Capture Page Screenshot    RESULT_SMT_005_04.png
    Sleep    4s