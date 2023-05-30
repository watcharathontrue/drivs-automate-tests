*** Settings ***
Resource    ../Resources/PageObject/Locator/Locator.robot
Resource    ../Resources/PageObject/KeywordDifinition/ShiftManagementKeyword.robot
Resource    ../Resources/PageObject/KeywordDifinition/Common.robot
Resource    ../Resources/PageObject/KeywordDifinition/LoginKeyword.robot
Suite Setup    Common.Suite Setup UAT
Suite Teardown    Common.Suite Teardown
Test Setup    Common.Test Setup UAT
Test Teardown     Common.Test Teardown
Force Tags    SMT

*** Test Cases ***
SMT_006_01 Able to search shift success
    [Tags]    SMT_006        SMT_006_01
    Set Selenium Speed   0.1
    Run Keyword And Ignore Error    Login DRIVS web                   ${shift_management_txt_username}    ${shift_management_txt_password}
    Goto menu Shift Management
    Able to search shift    ${shift_management_txt_search_value}    RESULT_SMT_006_01.png


SMT_006_02 Able to create shift success
    [Tags]    SMT_006        SMT_006_02 
    Set Selenium Speed   0.3
    Run Keyword And Ignore Error    Login DRIVS web                   ${shift_management_txt_username}    ${shift_management_txt_password}
    Goto menu Shift Management
    Able to create shift    ${shift_management_txt_create_value}    RESULT_SMT_006_02.png

SMT_006_03 Able to edit shift success
    [Tags]    SMT_006        SMT_006_03
    Set Selenium Speed   0.3
    Run Keyword And Ignore Error     Login DRIVS web                   ${shift_management_txt_username}    ${shift_management_txt_password}
    Goto menu Shift Management
    ${get_time}=    Get Current Date    result_format=%H%M%S    #ไว้ edit ไม่ซ้ำกัน
    Able to edit shift    ${shift_management_txt_create_value}    ${shift_management_txt_edit_value}${get_time}    RESULT_SMT_006_03.png

SMT_006_04 Able to delete shift success
    [Tags]    SMT_006        SMT_006_04
    Set Selenium Speed   0.3
    Run Keyword And Ignore Error    Login DRIVS web                   ${shift_management_txt_username}    ${shift_management_txt_password}
    Goto menu Shift Management
    Able to delete shift    ${shift_management_txt_edit_value}    RESULT_SMT_006_04.png
    Sleep    2s

SMT_006_05 Validate button clear shift name
    [Tags]    SMT_006        SMT_006_05
    Set Selenium Speed   0.3
    Run Keyword And Ignore Error     Login DRIVS web    ${shift_management_txt_username}    ${shift_management_txt_password}
    Goto menu Shift Management
    Page Should Contain Button        ${shift_management_btn_clear}
    Wait Until Keyword Succeeds    3x    5s    Input Text                        ${shift_management_field_search}    ${shift_management_txt_search_value} 
    Wait Until Keyword Succeeds    3x    5s    Click Button                      ${shift_management_btn_clear} 
    ${textSearch}=      Get Text      ${shift_management_field_search}
    Should Be Empty    ${textSearch}
    Capture Page Screenshot    RESULT_SMT_006_05.png
    Sleep    2s  

SMT_006_06 Validate display start time
    [Tags]    SMT_006        SMT_006_06
    Set Selenium Speed   0.3
    Run Keyword And Ignore Error    Login DRIVS web                   ${shift_management_txt_username}    ${shift_management_txt_password}
    Goto menu Shift Management
    Wait Until Keyword Succeeds    3x    5s    Click Button                      ${shift_management_btn_createNewShift} 
    Wait Until Page Contains          ${shift_management_msg_shiftInfo} 
    Element Should Be Visible         ${shift_management_ele_startTime} 
    Wait Until Keyword Succeeds    3x    5s    Click Element                     ${shift_management_ele_startTime}
    Scroll Element Into View          ${shift_management_ele_selectMinute} 
    Wait Until Keyword Succeeds    3x    5s    Click Element                     ${shift_management_ele_selectMinute}
    ${textStartTime}=   Get Value     ${shift_management_ele_valueStartTime} 
    Should Be Equal                   ${shift_management_msg_expecte.starttime}          ${textStartTime}
    Capture Page Screenshot    RESULT_SMT_006_06.png
    Sleep    2s

SMT_006_07 Validate display end time of shift
    [Tags]    SMT_006        SMT_006_07 
    Set Selenium Speed   0.3
    Run Keyword And Ignore Error    Login DRIVS web                   ${shift_management_txt_username}    ${shift_management_txt_password}
    Goto menu Shift Management
    Wait Until Keyword Succeeds    3x    5s    Click Button                      ${shift_management_btn_createNewShift} 
    Wait Until Page Contains          ${shift_management_msg_shiftInfo}
    Wait Until Keyword Succeeds    3x    5s    Click Element                     ${shift_management_ele_startTime}
    Scroll Element Into View          ${shift_management_ele_selectMinute}
    Wait Until Keyword Succeeds    3x    5s    Click Element                     ${shift_management_ele_selectMinute}               
    ${endTime}=            Get Value                ${shift_management_ele_valueStartTime}
    ${endTime_cut}=        Get Substring            ${endTime}    3   5
    ${endTime_value}       Convert To Integer       ${endTime_cut}
    ${endTime_result}=     Evaluate                 ${endTime_value} + 15
    ${expect.endTime}=     Get Value                ${shift_management_ele_valueEndTime}
    Should Be Equal        ${expect.endTime}        00:${endTime_result}
    Capture Page Screenshot    RESULT_SMT_006_07.png
    Sleep    2s

SMT_006_08 Validate error massage when create shift failed
    [Tags]    SMT_006        SMT_006_08
    Set Selenium Speed   0.3
    Run Keyword And Ignore Error     Login DRIVS web    ${shift_management_txt_username}    ${shift_management_txt_password}  
    Goto menu Shift Management
    Wait Until Keyword Succeeds    3x    5s    Click Button                          ${shift_management_btn_createNewShift} 
    Wait Until Page Contains              ${shift_management_msg_shiftInfo} 
    Page Should Contain Radio Button      ${shift_management_ele_normal} 
    Wait Until Keyword Succeeds    3x    5s    Click Button                          ${shift_management_btn_create}
    ${get_nameError}=        Get Text     ${shift_management_ele_nameError}
    Should Be Equal                       ${shift_management_msg_expecte.nameError}         ${get_nameError}    
    ${get_startTimeError}=   Get Text     ${shift_management_ele_starttimeError}
    Should Be Equal                       ${shift_management_msg_expecte.starttimeError}    ${get_startTimeError}
    ${get_endTimeError}=     Get Text     ${shift_management_ele_endtimeError}
    Should Be Equal                       ${shift_management_msg_expecte.endtimeError}      ${get_endTimeError}
    Capture Page Screenshot    RESULT_SMT_006_08.png
    Sleep    2s

SMT_006_09 Validate hour time of shift
    [Tags]    SMT_006        SMT_006_09 
    Set Selenium Speed   0.3
    Run Keyword And Ignore Error    Login DRIVS web    ${shift_management_txt_username}    ${shift_management_txt_password}    
    Goto menu Shift Management
    Verify field on shiftpage
    Capture Page Screenshot    RESULT_SMT_006_09.png
    Sleep    2s