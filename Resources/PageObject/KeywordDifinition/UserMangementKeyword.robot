*** Settings ***
Resource   ../Locator/Locator.robot
Resource    ./Common.robot

*** Keywords ***
Able to search user management
    [Arguments]    ${user_management_txt_searchuser} 
    Wait Until Page Contains                   ${user_management_active_main}               
    Input Text                                 ${user_management_input_searchUser}           ${user_management_txt_searchuser}

Able to edit user management
    [Arguments]    ${user_management_txt_searchuser}    ${user_management_txt_create_new_user_edit}    ${RESULT_SMT_005_02}
    Wait Until Page Contains                   ${user_management_active_main}
    Wait Until Keyword Succeeds         3x      2s    Input Text    ${user_management_input_searchUser}           ${user_management_txt_searchuser}
    Wait Until Keyword Succeeds         3x      2s        Click Element    ${user_management_kebab_userpage}
    Wait Until Keyword Succeeds         3x      2s        Wait Until Page Contains                   ${user_management_profile_main}    
    Wait Until Keyword Succeeds         3x      2s        Click Button                               ${user_management_btn_edituser}      
    Wait Until Page Contains                   ${user_management_personal_info_main}
    Wait Until Keyword Succeeds         3x      2s    Input Text    ${user_management_input_editname}    ${user_management_txt_create_new_user_edit}
    Wait Until Keyword Succeeds         3x      2s    Click Element    xpath=//button[contains(text(),'Save')]
    Capture Page Screenshot    ${RESULT_SMT_005_02}
    

Able to Add skill
    [Arguments]    ${user_management_txt_searchuser}    ${RESULT_SMT_005_03}
    Wait Until Page Contains                   ${user_management_active_main}               
    Wait Until Keyword Succeeds         3x      2s    Input Text    ${user_management_input_searchUser}    ${user_management_txt_searchuser}  
    Wait Until Keyword Succeeds         3x      2s        Click Element                              ${user_management_kebab_userpage}
    Wait Until Keyword Succeeds         3x      2s        Wait Until Page Contains                   ${user_management_profile_main}    
    Wait Until Keyword Succeeds         3x      2s        Click Button                               ${user_management_btn_edituser}
    Wait Until Keyword Succeeds         3x      2s    Click Button                               ${user_management_btn_AddSkill}
    Wait Until Keyword Succeeds         3x      2s    Click Element                              ${user_management_btn_installation_staffs}
    Wait Until Page Contains                   ${user_management_wait_skill_list} 
    Wait Until Keyword Succeeds         3x      2s    Click Element                              ${user_management_click_corporate_Ticket}
    Wait Until Keyword Succeeds         3x      2s    Click Button                               ${user_management_btn_Add}
    Wait Until Page Contains                   ${user_management_toast_skillsuccess}                  
    Wait Until Keyword Succeeds         3x      2s    Click Button                               ${user_management_btn_savepageuser} 
    Capture Page Screenshot    ${RESULT_SMT_005_03}

Goto menu user Management 
    Wait Until Page Contains                   ${user_management_gantt_main}     
    Wait Until Keyword Succeeds         3x      2s    Click Element                              ${user_management_search_gantt}          
    Wait Until Page Contains                   ${user_management_active_main}
    Wait Until Keyword Succeeds         3x      2s    Click Element                              ${user_management_search_userpage}

Verify Search user
    [Arguments]    ${arg_user_management_search_staff}    ${RESULT_SMT_005_01}
    ${get_staff_name}=    Get Text    ${user_management_search_staff}
    Should Be Equal    ${get_staff_name}    ${arg_user_management_search_staff}
    Capture Page Screenshot    ${RESULT_SMT_005_01}


Verify toast remove approve
    [Arguments]    ${msg_toast_remove_approve}    ${msg_toast_add_approve_success}    ${msg_toast_edit_approve}
    Wait Until Element Is Visible    ${team_management_toast_approve}    30s
    Wait Until Element Contains    ${team_management_toast_approve}    ${msg_toast_remove_approve}
    ${toast_text}=    Get Text    ${team_management_toast_approve}  
    Should Be Equal    ${msg_toast_remove_approve}    ${toast_text}
    Wait Until Element Does Not Contain    ${team_management_toast_approve}    ${msg_toast_remove_approve}   #keyword นี้รอให้ toast แสดงให้จบค่อยไป step ต่อ
    
