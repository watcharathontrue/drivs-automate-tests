*** Settings ***
Resource            ../Locator/Locator.robot
Resource            ../TestData/MsgData.robot
Resource            ../TestData/TestData.robot
Resource            ./Common.robot

*** Keywords ***
# Team management/Add member , Remove member
# SMT_011_Verify Drivs Web Member
Select Menu Team Management
    [Arguments]    ${Gantt}
    Wait Until Page Contains          ${Gantt}
    Wait Until Element Is Visible     ${team_management_menu_team_management}         
    Click Element                     ${team_management_menu_team_management}
    Wait Until Element Is Visible     ${team_management_txt_Team_management}          

Search Team
    [Arguments]    ${team_management_team_name}
    Wait Until Element Is Visible    ${team_management_search_box} 
    Wait Until Keyword Succeeds    3x    2s    Click Element                    ${team_management_search_box}
    Wait Until Keyword Succeeds    3x    2s    Input Text                       ${team_management_locator_search_box}    ${team_management_team_name}
    Wait Until Element Is Visible    ${team_management_locator_s_driv_team} 
    Wait Until Keyword Succeeds    3x    2s    Click Element                    ${team_management_locator_s_driv_team}

Add member to team
    [Arguments]    ${team_management_technician_name}
    Wait Until Element Is Visible    ${team_management_btn_add_member}
    Wait Until Keyword Succeeds    3x    2s    Click Button                     ${team_management_btn_add_member}
    Wait Until Element Is Visible    ${team_management_search_technician}
    Wait Until Keyword Succeeds    3x    2s     Click Element                    ${team_management_search_technician}
    Wait Until Keyword Succeeds    3x    2s    Input Text                       ${team_management_search_technician}    ${team_management_technician_name}
    Wait Until Element Is Enabled    ${team_management_addmember_checkbox}
    Wait Until Keyword Succeeds    3x    2s     Click Element                    ${team_management_addmember_checkbox}
    Wait Until Element Is Enabled    ${team_management_btn_addmember}
    Wait Until Keyword Succeeds    3x    2s    Click Element                    //div[@class='css-1772sct']
    Wait Until Element Is Enabled    ${team_management_btn_add}
    Wait Until Keyword Succeeds    3x    2s    Click Element                    ${team_management_btn_add}  
    Wait Until Page Contains         ${team_management_toast_add_member2}

Remove member from team 
    [Arguments]    ${team_management_technician_name}    ${team_management_toast_remove_member2}
    Wait Until Element Is Enabled    ${team_management_search_technicianinteam}
    Click Element                    ${team_management_search_technicianinteam}
    Input Text                       ${team_management_search_technicianinteam}    ${team_management_technician_name}
    Wait Until Keyword Succeeds      10x    2s    Wait Until Element Is Enabled     ${team_management_icon_technician}           
    Wait Until Keyword Succeeds      10x    2s    Wait Until Page Contains          ${team_management_technician_name}
    Wait Until Element Is Enabled    ${team_management_kebab}
    Click Element                    ${team_management_kebab}                    
    Wait Until Element Is Enabled    ${team_management_list_removemember}
    Click Element                    ${team_management_list_removemember}
    Wait Until Element Is Visible    ${team_management_btn_remove}
    Click Element                    ${team_management_btn_remove}
    Wait Until Page Contains         ${team_management_toast_remove_member2}

Verify toast add member   
    [Arguments]    ${team_management_toast_add_member}
    Wait Until Element Is Visible    ${team_management_locator_toast}    30s
    Wait Until Element Contains    ${team_management_locator_toast}            ${team_management_toast_add_member}
    ${toast_text_add_team}=    Get Text    ${team_management_locator_toast}
    Should Be Equal    ${toast_text_add_team}    ${team_management_toast_add_member}
    Wait Until Element Does Not Contain    ${team_management_locator_toast}            ${team_management_toast_add_member}    #keyword นี้รอให้ toast แสดงให้จบค่อยไป step ต่อ

Verify toast remove member
    [Arguments]    ${team_management_toast_remove_member}
    Wait Until Element Is Visible    ${team_management_locator_toast}     30s
    Wait Until Element Contains    ${team_management_locator_toast}    ${team_management_toast_remove_member}
    ${toast_text_remove_team}=    Get Text    ${team_management_locator_toast}
    Should Be Equal    ${toast_text_remove_team}    ${team_management_toast_remove_member}
    Wait Until Element Does Not Contain    ${team_management_locator_toast}            ${team_management_toast_remove_member}    #keyword นี้รอให้ toast แสดงให้จบค่อยไป step ต่อ

Click Add member button
    Wait Until Element Is Visible    ${team_management_btn_add_member}
    Click Button                     ${team_management_btn_add_member}
    Wait Until Element Is Visible    ${team_management_search_technician}
    Page Should Contain              Add Member

Validate Title name
    ${titlename}                     Get Title
    Should Be Equal                  4PL Web Platform       ${titlename}    
    
Verify 2ndHeader popup
    [Arguments]    ${select_user_team_member_popup}
    Wait Until Element Is Enabled    ${team_management_header_popup}
    ${element_visible}    Run Keyword And Return Status    Element Should Be Visible    ${team_management_header_popup}
    Run Keyword If    '${element_visible}'=='True'    Log    Element is visible    ELSE    Fail    Element is not visible
    Page Should Contain    ${select_user_team_member_popup}

Verify Cancel button
    Wait Until Element Is Enabled        ${team_management_btn_cancel}
    Click Button                         ${team_management_btn_cancel}
    Wait Until Element Is Not Visible    ${team_management_locator_popup}

Verify Clear button
    [Arguments]    ${team_management_technician_name}
    Wait Until Element Is Enabled        ${team_management_search_technicianInTeam}
    Click Element                        ${team_management_search_technicianInTeam}
    Input Text                           ${team_management_search_technicianInTeam}    ${team_management_technician_name}
    ${search_input}=    Get WebElement   ${team_management_locator_input_roletest001}
    Click Element                        ${team_management_btn_clear}
    ${text_after_clear}=    Get Element Attribute    ${search_input}    value
    Wait Until Element Is Enabled        ${team_management_search_technicianInTeam}            

# Team management/Create Team, Edit, Create sub, Delete

Create New Team
    [Arguments]    ${team_topic}
    Click Element        ${team_management_btn_create_team}
    Wait Until Page Contains    ${team_topic}

Verify Work forz Home page
    Wait Until Element Is Enabled   ${team_management_txt_TaskManagement}
    Element Should Contain    ${team_management_txt_TaskManagement}    Task management

#คำสั่งคลิกมาที่ Tab Team Management
Go to Tab Team Management 
    Wait Until Element Is Visible    ${team_management_tab_TeamManagement}    
    Wait Until Keyword Succeeds    5x    2s    Click Element    ${team_management_tab_TeamManagement}

# Team management/Create Team
# SMT_008_TeamManagement
Input Team Information
    ${currentDate_Create}=   Get Current Date
    ${dateTime_Create}     Convert Date     ${currentDate_Create}         result_format=%d%m%y%H%M%S
    Input Text                          id=name                 ${team_management_team_name_create_team}${dateTime_Create}
    Input Text                          id=code                 ${team_management_team_code_create_Team}${dateTime_Create}
    Click Element                       id=teamTypeId
    Click Element                       ${team_management_team_type_company}  

Input Config depot code
    Click Element                       id=code   
    Input Text                          ${team_management_depocode_locator}     ${team_management_depotcode}

Input Area
    Scroll Element Into View            id=area
    Wait Until Keyword Succeeds    5x    2s    Click Element                       id=area
    Wait Until Page Contains            ${team_management_country}
    Wait Until Keyword Succeeds    5x    2s    Input Text                          id=area                  ${team_management_search_area_name}
    Wait Until Page Contains            ${team_management_area_name}
    Wait Until Keyword Succeeds    5x    2s    Click Element                       ${team_management_areaid}
    Wait Until Keyword Succeeds    5x    2s    Click Element                       id=code  
    Wait Until Keyword Succeeds    5x    2s    Click Element                       ${team_management_select_multiple_locator} 
    Scroll Element Into View            ${team_management_task_type_install_ftth_locator}
    Wait Until Keyword Succeeds    5x    2s    Click Element                       ${team_management_click_install_ftth_locator}
    Wait Until Keyword Succeeds    5x    2s    Click Element                       id=code
 
Add Adrea
    Wait Until Keyword Succeeds    5x    2s    Click Element                       ${team_management_btn_addarea}    
    
Click Create
    Wait Until Keyword Succeeds    5x    2s    Click Element                       ${team_management_btn_create_new_team}
    Wait Until Element Is Enabled       ${team_management_tostLocator_CreateSuccess}
    Wait Until Keyword Succeeds    5x    2s    Element Text Should Be              ${team_management_tostLocator_CreateSuccess}        ${team_management_tostCreateSuccess}

Search Team Then Create Success
    [Arguments]    ${team_management_team_name_create_team}
    ${currentDate_Create_search_Success}=   Get Current Date
    ${date_Create_search_Success}     Convert Date        ${currentDate_Create_search_Success}         result_format=%d%m%y
    Wait Until Page Contains            Add Member
    Input Text                          ${team_management_search_field}           ${team_management_team_name_create_team}${date_Create_search_Success}
    Wait Until Page Contains            ${team_management_team_name_create_team}${date_Create_search_Success}

Search Team Then Create Sub team Success
    ${currentDate_Create_search_Success}=   Get Current Date
    ${date_Create_search_Success}     Convert Date        ${currentDate_Create_search_Success}         result_format=%d%m%y
    Wait Until Page Contains            Add Member
    Input Text                          ${team_management_search_field}           ${team_management_team_name_create_team}${date_Create_search_Success}
    Wait Until Page Contains            ${team_management_team_name_create_team}${date_Create_search_Success}
 
Search Team for Edit
    ${currentDate}=   Get Current Date
    ${date}     Convert Date            ${currentDate}         result_format=%d%m%y
    Wait Until Page Contains            Add Member
    Input Text                          ${team_management_search_field}           ${team_management_team_name_create_team}
    Wait Until Page Contains            ${team_management_team_name_create_team}        ${date} 

Click Edit
    Click Element                       ${team_management_click_team_name}
    Click Element                       ${team_management_kebub_team_list}
    Wait Until Page Contains            Edit team
    Click Element                       ${team_management_btn_edit}
    Wait Until Page Contains            Team Information

Edit Team Information
    ${currentDate_Edit_Name}=   Get Current Date
    ${dateTime_Edit_Name}     Convert Date     ${currentDate_Edit_Name}         result_format=%d%m%y%H%M%S
    Wait Until Page Contains            Team Information
    Clear Element Text                  id=name
    Input Text                          id=name                 ${team_management_team_name_create_team}${dateTime_Edit_Name}

Verify toast edit successful
    [Arguments]
    Wait Until Element Is Visible    ${team_management_tostLocator_EditSuccess}    30s
    Wait Until Element Contains    ${team_management_tostLocator_EditSuccess}        ${team_management_tostEditSuccess}
    ${toast_text_edit}=    Get Text    ${team_management_tostLocator_EditSuccess} 
    Should Be Equal    ${toast_text_edit}    ${team_management_tostEditSuccess}
    Sleep    2s

Save Edit Member
    Click Element                       ${team_management_btn_save_edit_team}
    Wait Until Element Is Enabled       ${team_management_tostLocator_EditSuccess}
    Element Text Should Be              ${team_management_tostLocator_EditSuccess}        ${team_management_tostEditSuccess}


Search Team Then Edit Success
    ${currentDate_Edit_Name_Success}=   Get Current Date
    ${date_Edit_Name_Success}     Convert Date     ${currentDate_Edit_Name_Success}         result_format=%d%m%y
    Wait Until Keyword Succeeds         3x      2s      Clear Element Text                      ${team_management_search_field}
    Wait Until Keyword Succeeds         3x      2s      Input Text                              ${team_management_search_field}         ${team_management_team_name_create_team}
    Wait Until Page Contains                ${team_management_team_name_create_team}${date_Edit_Name_Success}
    #Sleep                                   1
    #Execute JavaScript                      window.location.reload(true);

Input Sub Team Information
    ${currentDate_Create_Sub_Team}=   Get Current Date
    ${dateTime_Create_Sub_Team}     Convert Date     ${currentDate_Create_Sub_Team}         result_format=%d%m%y%H%M%S
    Wait Until Keyword Succeeds         3x      2s      Input Text                          id=name                 ${team_management_team_name_create_team}${dateTime_Create_Sub_Team}
    Wait Until Keyword Succeeds         3x      2s      Input Text                          id=code                 ${team_management_team_code_create_Team}${dateTime_Create_Sub_Team}
    Wait Until Keyword Succeeds         3x      2s      Click Element                       id=teamTypeId
    Wait Until Keyword Succeeds         3x      2s      Click Element    ${team_management_team_type_subteam} 
    Wait Until Keyword Succeeds         3x      2s      Click Element    id=teamParent
    Wait Until Keyword Succeeds         3x      2s      Click Element    ${team_management_team_parent_subt}

Search Team for Delete
    ${currentDate}=   Get Current Date
    ${date}     Convert Date        ${currentDate}                  result_format=%d%m%y
    Wait Until Keyword Succeeds         3x      2s      Input Text                      ${team_management_search_field}                 ${team_management_team_name_create_team}${date}
    Wait Until Page Contains        ${team_management_team_name_create_team}        ${date} 

Delete Subteam
    [Arguments]    ${subteam_name_create_team}
    ${currentDate_subt}=   Get Current Date
    ${date_subt}     Convert Date       ${currentDate_subt}                  result_format=%d%m%y
    Wait Until Page Contains            ${team_management_team_name_create_team}${date_subt}
    Wait Until Keyword Succeeds         3x      2s      Clear Element Text                  ${team_management_search_field}
    Wait Until Keyword Succeeds         3x      2s      Input Text                          ${team_management_search_field}    ${subteam_name_create_team}
    Wait Until Keyword Succeeds         3x      2s      Wait Until Element Is Visible       ${team_management_subc_team}
    Wait Until Keyword Succeeds         3x      2s      Click Element                       ${team_management_subc_team}
    Wait Until Keyword Succeeds         3x      2s      Click Element       ${team_management_kebub_subc_team}
    Wait Until Page Contains            Delete team
    Wait Until Keyword Succeeds         3x      2s      Click Element                       ${team_management_kebub_delete}
    Wait Until Page Contains            Delete Team
    #Click Element                      ${team_management_btn_cancel}
    Wait Until Keyword Succeeds         3x      2s      Click Element                       ${team_management_btn_delete}
    Wait Until Page Contains            Delete team success
    Wait Until Element Is Enabled       ${team_management_tostLocator_DeleteSuccess}
    Element Text Should Be              ${team_management_tostLocator_DeleteSuccess}        ${team_management_tostDeleteSuccess}
  
Delete Company Team
    [Arguments]    ${company_team_name_create_team}
    ${currentDate_comp}=   Get Current Date
    ${date_comp}     Convert Date       ${currentDate_comp}                  result_format=%d%m%y
    Wait Until Page Contains            ${team_management_team_name_create_team}${date_comp}
    Wait Until Keyword Succeeds         3x      2s      Clear Element Text                  ${team_management_search_field}
    Wait Until Keyword Succeeds         3x      2s      Input Text    ${team_management_search_field}    ${company_team_name_create_team}
    Wait Until Page Contains            ${team_management_team_name_create_team}        ${date_comp} 
    Wait Until Keyword Succeeds         3x      2s      Click Element                       ${team_management_comp_team}
    Wait Until Keyword Succeeds         3x      2s      Click Element       ${team_management_kebub_comp_team}
    Wait Until Keyword Succeeds         3x      2s      Click Element                       ${team_management_kebub_delete}
    Wait Until Page Contains            Delete Team
    #Click Element                      ${team_management_btn_cancel}
    Wait Until Keyword Succeeds         3x      2s      Click Element                       ${team_management_btn_delete}
    Wait Until Page Contains            Delete team success
    Wait Until Element Is Enabled       ${team_management_tostLocator_DeleteSuccess}
    Element Text Should Be              ${team_management_tostLocator_DeleteSuccess}        ${team_management_tostDeleteSuccess}
 
# Team management/Team shift
# SMT_007_TeamShift
Click team shift
    Wait Until Element Is Enabled    ${team_management_btn_tab_teamshift}
    Wait Until Keyword Succeeds         3x      2s      Click Element    ${team_management_btn_tab_teamshift}

Search team page team shift
    [Arguments]    ${team_benz}
    Wait Until Element Is Enabled    ${team_management_list_team}
    Wait Until Keyword Succeeds    3x    2s    Input Text    ${team_management_search_team_teamshift}    ${team_benz}
    Wait Until Element Is Enabled    ${team_management_list_benzteam}
    Sleep    1s
    Scroll Element Into View    ${team_management_list_benzteam}
    Wait Until Element Is Enabled    ${team_management_list_benzteam}
    Wait Until Keyword Succeeds    3x    2s    Click Element       ${team_management_list_benzteam}

Search shift with name
    [Arguments]    ${technician_name}
    Wait Until Element Is Enabled    ${team_management_txt_teamname}
    Input Text    ${team_management_search_technician_teamshift}    ${technician_name}

Assign shift
    [Arguments]    ${team_management_shift_06:00-20:00}
    Wait Until Element Is Visible    ${team_management_btn_slotshift_t+4}
    Click Element    ${team_management_btn_slotshift_t+4}
    Wait Until Element Is Enabled    ${team_management_select_shift}
    Wait Until Keyword Succeeds         4x      3s    Click Element    ${team_management_select_shift}
    Wait Until Element Is Enabled    ${team_management_shift_06:00-20:00}
    Scroll Element Into View    ${team_management_shift_06:00-20:00}
    Wait Until Keyword Succeeds         3x      2s      Click Element    ${team_management_shift_06:00-20:00}
    Wait Until Keyword Succeeds         3x      2s      Click Element    ${team_management_btn_assign_shift}

Verify assign shift
    [Arguments]    ${excpected.msg_toast_assignshift_success}
    Wait Until Element Is Visible    ${team_management_toast_shift}
    Wait Until Element Contains    ${team_management_toast_shift}    ${msg_toast_assignshift_success}    
    ${toast_text}=    Get Text    ${team_management_toast_shift}       
    Should Be Equal    ${toast_text}    ${excpected.msg_toast_assignshift_success}

Delete shift
    # รอ toast เก่าหาย (toast assign shift)
    Wait Until Element Is Visible    ${team_management_toast_shift}    
    Wait Until Element Contains    ${team_management_toast_shift}    ${msg_toast_assignshift_success}
    Wait Until Element Does Not Contain    ${team_management_toast_shift}   ${msg_toast_assignshift_success}
    # remove shift
    Wait Until Element Is Enabled    ${team_management_kebab_shift}
    Wait Until Keyword Succeeds         4x      3s    Click Element    ${team_management_kebab_shift}
    Wait Until Element Is Enabled    ${team_management_btn_kebab_remove_shift}
    Wait Until Keyword Succeeds         4x      3s    Click Element    ${team_management_btn_kebab_remove_shift}
    Wait Until Element Is Visible    ${team_management_txt_remove_shift}
    Wait Until Keyword Succeeds         4x      3s    Click Element    ${team_management_btn_remove_shift}

Verify remove shift
    [Arguments]    ${expected.msg_toast_removeshift_success}
    Wait Until Element Is Visible    ${team_management_toast_shift}
    Wait Until Element Contains    ${team_management_toast_shift}    ${msg_toast_removeshift_success}    
    ${toast_text}=    Get Text    ${team_management_toast_shift}       
    Should Be Equal    ${toast_text}    ${expected.msg_toast_removeshift_success}

# Team management/Approval
# SMT_010_TeamShift
Search Team Approval
    [Arguments]    ${Team_benz}
    Wait Until Element Is Enabled    ${team_management_path_list_team}
    Wait Until Keyword Succeeds         4x      3s    Input Text    ${team_management_path_search_team_approver}    ${Team_benz}
    Wait Until Element Is Enabled    ${team_management_path_team_benzteam}
    Scroll Element Into View    ${team_management_path_team_benzteam}
    Wait Until Element Is Enabled    ${team_management_path_team_benzteam}
    Wait Until Keyword Succeeds         4x      3s    Click Element       ${team_management_path_team_benzteam}

Add_approver
    [Arguments]    ${technician_name} 
    Wait Until Element Is Enabled     ${team_management_txt_approvelTeam}
    Click Element    ${team_management_txt_approvelTeam}
    Wait Until Element Is Enabled    ${team_management_btn_add_approver}
    Click Element    ${team_management_btn_add_approver}
    Input Text    ${team_management_search_user_approver}    ${technician_name} 
    Wait Until Element Is Enabled    ${team_management_btn_checkbox_approver}
    Click Element    ${team_management_btn_checkbox_approver}
    Wait Until Element Is Enabled    ${team_management_btn_>_approver}
    Click Element    ${team_management_btn_>_approver}
    Click Element    ${team_management_btn_next_approver}
    Wait Until Element Is Enabled    ${team_management_checkbox_request_assistance}
    Click Element    ${team_management_checkbox_request_assistance}
    Wait Until Element Is Enabled    ${team_management_checkbox_order_return}
    Click Element    ${team_management_checkbox_order_return}
    Wait Until Element Is Enabled    ${team_management_checkbox_leave_request}
    Click Element    ${team_management_checkbox_leave_request}
    Wait Until Element Is Enabled    ${team_management_btn_add_member_approver}
    Click Element     ${team_management_btn_add_member_approver}
    
Verify toast add approver success
    [Arguments]    ${msg_toast_add_approve_success}   
    #Wait Until Element Does Not Contain    ${team_management_toast_approve}   ${msg_toast_add_approve_success}
    Wait Until Element Is Visible    ${team_management_toast_approve}
    Wait Until Element Contains    ${team_management_toast_approve}    ${msg_toast_add_approve_success}    
    ${toast_text}=    Get Text    ${team_management_toast_approve}       
    Should Be Equal    ${toast_text}    ${msg_toast_add_approve_success}
    Wait Until Element Does Not Contain    ${team_management_toast_approve}    ${msg_toast_add_approve_success}  #keyword นี้รอให้ toast แสดงให้จบค่อยไป step ต่อ

Edit_approve_request
    [Arguments]    ${msg_toast_add_approve_success}
    Wait Until Element Is Enabled    ${team_management_kebab_approval_team}
    Click Element    ${team_management_kebab_approval_team}
    Wait Until Element Is Enabled    ${team_management_btn_kebab_edit_approval_type}
    Click Element    ${team_management_btn_kebab_edit_approval_type}
    Wait Until Element Is Visible     ${team_management_txt_edit_approval_type}
    Click Element    ${team_management_checkbox_leave_request_edit}
    Click Element    ${team_management_checkbox_request_assistance_edit}
    Click Element    ${team_management_btn_edit_approval_type}

Verify toast edit approve
    [Arguments]    ${msg_toast_edit_approve}    ${msg_toast_add_approve_success}
    Wait Until Element Is Visible    ${team_management_toast_approve}    
    Wait Until Element Does Not Contain    ${team_management_toast_approve}   ${msg_toast_add_approve_success}
    Wait Until Element Is Visible    ${team_management_toast_approve}
    Wait Until Element Contains    ${team_management_toast_approve}    ${msg_toast_edit_approve}
    ${toast_text}=    Get Text    ${team_management_toast_approve}
    Should Be Equal   ${toast_text}   ${msg_toast_edit_approve}
    Wait Until Element Does Not Contain    ${team_management_toast_approve}   ${msg_toast_edit_approve}  #keyword นี้รอให้ toast แสดงให้จบค่อยไป step ต่อ

Remove_approver
    [Arguments]    ${msg_toast_add_approve_success}
    Click Element    ${team_management_kebab_approval_team}
    Wait Until Element Is Enabled    ${team_management_btn_kebab_remove_approver}
    Click Element    ${team_management_btn_kebab_remove_approver}
    Wait Until Element Is Visible    ${team_management_txt_remove_approver}
    Click Element    ${team_management_btn_remove_approver}

Verify toast remove approve
    [Arguments]    ${msg_toast_remove_approve}    ${msg_toast_add_approve_success}    ${msg_toast_edit_approve}
    Wait Until Element Is Visible    ${team_management_toast_approve}    30s
    Wait Until Element Contains    ${team_management_toast_approve}    ${msg_toast_remove_approve}
    ${toast_text}=    Get Text    ${team_management_toast_approve}  
    Should Be Equal    ${msg_toast_remove_approve}    ${toast_text}
    Wait Until Element Does Not Contain    ${team_management_toast_approve}    ${msg_toast_remove_approve}   #keyword นี้รอให้ toast แสดงให้จบค่อยไป step ต่อ
