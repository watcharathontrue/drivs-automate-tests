*** Settings ***
Resource   ../Locator/Locator.robot
Resource   ./Common.robot
Resource    ../TestData/MsgData.robot
Resource    ../TestData/TestData.robot

*** Keywords ***
Click Gantt
    [Arguments]    ${gantt_page}
    Go to    ${gantt_page}
Select team
    [Arguments]      ${var_search_team_name}
    Set Selenium Speed   0.3
    Wait Until Keyword Succeeds           ${var_keyword_succeed_loop}      ${var_keyword_succeed_time}     Wait Until Element Is Visible         ${txt_search_team}       
    Wait Until Keyword Succeeds           ${var_keyword_succeed_loop}      ${var_keyword_succeed_time}      Click Element        ${txt_search_team}
    Wait Until Keyword Succeeds           ${var_keyword_succeed_loop}      ${var_keyword_succeed_time}     Wait Until Element Is Visible         ${txt_input_teamname}       
    Wait Until Keyword Succeeds           ${var_keyword_succeed_loop}      ${var_keyword_succeed_time}    Input Text                            ${txt_input_teamname}            ${var_search_team_name}
    Wait Until Keyword Succeeds           ${var_keyword_succeed_loop}      ${var_keyword_succeed_time}      Wait Until Element Is Visible         ${list_of_search_team}${var_search_team_name}${close_Round_Brackets}     #คือ Custom locator ห้ามใช้เว้นวรรค
    Wait Until Keyword Succeeds           ${var_keyword_succeed_loop}      ${var_keyword_succeed_time}     Click Element         ${list_of_search_team}${var_search_team_name}${close_Round_Brackets}      #คือ Custom locator ห้ามใช้เว้นวรรค
    Set Selenium Speed   0.0

Search Technician
    [Arguments]    ${var_search_technician_name}
    Set Selenium Speed   0.3
    Wait Until Keyword Succeeds           ${var_keyword_succeed_loop}      ${var_keyword_succeed_time}    Wait Until Element Is Visible       ${Dropdown_search_1st_box}    
    Wait Until Keyword Succeeds         ${var_keyword_succeed_loop}           ${var_keyword_succeed_time}    Click Element                    ${Dropdown_search_1st_box}
    Wait Until Keyword Succeeds           ${var_keyword_succeed_loop}      ${var_keyword_succeed_time}    Wait Until Element Is Visible       ${item_dropdown_Technician_name}      
    Wait Until Keyword Succeeds         ${var_keyword_succeed_loop}           ${var_keyword_succeed_time}    Click Element                    ${item_dropdown_Technician_name} 
    Input Text                          ${txt_Search_keyword}                 ${var_search_technician_name}
    
Select First Appointment date
    [Arguments]    ${var_input_date}    ${var_input_mouth}    ${var_input_year}
    Set Selenium Speed   0.3
    Wait Until Keyword Succeeds         ${var_keyword_succeed_loop}           ${var_keyword_succeed_time}    Wait Until Element Is Visible       ${btn_Select_appointment_date}        
    Wait Until Keyword Succeeds         ${var_keyword_succeed_loop}      ${var_keyword_succeed_time}    Click Element                     ${btn_Select_appointment_date}
    Wait Until Keyword Succeeds         ${var_keyword_succeed_loop}           ${var_keyword_succeed_time}    Wait Until Element Is Visible       ${btn_Select_year_left}    
    Wait Until Keyword Succeeds         ${var_keyword_succeed_loop}      ${var_keyword_succeed_time}    Click Element                     ${btn_Select_year_left}   
    Wait Until Keyword Succeeds         ${var_keyword_succeed_loop}           ${var_keyword_succeed_time}    Wait Until Element Is Visible       ${lbl_select_year_left_table}${var_input_year}${close_Brackets}         #คือ Custom locator ห้ามใช้เว้นวรรค
    Wait Until Keyword Succeeds         ${var_keyword_succeed_loop}      ${var_keyword_succeed_time}    Click Element                     ${lbl_select_year_left_table}${var_input_year}${close_Brackets}     #คือ Custom locator ห้ามใช้เว้นวรรค
    Wait Until Keyword Succeeds         ${var_keyword_succeed_loop}           ${var_keyword_succeed_time}    Wait Until Element Is Visible       ${btn_select_month_left}    
    Wait Until Keyword Succeeds         ${var_keyword_succeed_loop}      ${var_keyword_succeed_time}     Click Element                     ${btn_select_month_left}  
    Wait Until Keyword Succeeds         ${var_keyword_succeed_loop}           ${var_keyword_succeed_time}    Wait Until Element Is Visible       ${lbl_select_mouth_left_table}${var_input_mouth}${close_Brackets}      #คือ Custom locator ห้ามใช้เว้นวรรค
    Wait Until Keyword Succeeds         ${var_keyword_succeed_loop}      ${var_keyword_succeed_time}    Click Element                     ${lbl_select_mouth_left_table}${var_input_mouth}${close_Brackets}     #คือ Custom locator ห้ามใช้เว้นวรรค
    Run Keyword If    "${var_input_mouth}"=="Jan"    Select date from month first  ${var_input_date}    ${var_input_mouth}    ${var_input_year}    January  
    ...    ELSE IF    "${var_input_mouth}"=="Feb"    Select date from month first  ${var_input_date}    ${var_input_mouth}    ${var_input_year}    February
    ...    ELSE IF    "${var_input_mouth}"=="Mar"    Select date from month first  ${var_input_date}    ${var_input_mouth}    ${var_input_year}    March
    ...    ELSE IF    "${var_input_mouth}"=="Apr"    Select date from month first  ${var_input_date}    ${var_input_mouth}    ${var_input_year}    April
    ...    ELSE IF    "${var_input_mouth}"=="May"    Select date from month first  ${var_input_date}    ${var_input_mouth}    ${var_input_year}    May
    ...    ELSE IF    "${var_input_mouth}"=="Jun"    Select date from month first  ${var_input_date}    ${var_input_mouth}    ${var_input_year}    June
    ...    ELSE IF    "${var_input_mouth}"=="Jul"    Select date from month first  ${var_input_date}    ${var_input_mouth}    ${var_input_year}    July
    ...    ELSE IF    "${var_input_mouth}"=="Aug"    Select date from month first  ${var_input_date}    ${var_input_mouth}    ${var_input_year}    August
    ...    ELSE IF    "${var_input_mouth}"=="Sep"    Select date from month first  ${var_input_date}    ${var_input_mouth}    ${var_input_year}    September
    ...    ELSE IF    "${var_input_mouth}"=="Oct"    Select date from month first  ${var_input_date}    ${var_input_mouth}    ${var_input_year}    October
    ...    ELSE IF    "${var_input_mouth}"=="Nov"    Select date from month first  ${var_input_date}    ${var_input_mouth}    ${var_input_year}    November
    ...    ELSE IF    "${var_input_mouth}"=="Dec"    Select date from month first  ${var_input_date}    ${var_input_mouth}    ${var_input_year}    December
    ...    ELSE    Log To Console    Input Error

Select date from month first
    [Arguments]    ${var_calculate_date}    ${var_calculate_mouth}    ${var_calculate_year}    ${var_name_mount}
    ${result}=   Replace String       ${var_calculate_mouth}${SPACE}${var_calculate_date},${SPACE}${var_calculate_year}   ${var_calculate_mouth}    ${var_name_mount}
    log    ${result}
    Wait Until Keyword Succeeds       ${var_keyword_succeed_loop}      ${var_keyword_succeed_time}    Wait Until Element Is Visible     ${lbl_select_date_left_table}${result}${close_Brackets}    #คือ Custom locator ห้ามใช้เว้นวรรค
    Wait Until Keyword Succeeds       ${var_keyword_succeed_loop}      ${var_keyword_succeed_time}    Click Element         ${lbl_select_date_left_table}${result}${close_Brackets}    #คือ Custom locator ห้ามใช้เว้นวรรค

Select Second Appointment date
    [Arguments]    ${var_input_date}    ${var_input_mouth}    ${var_input_year}
    Set Selenium Speed   0.3
    Wait Until Keyword Succeeds           ${var_keyword_succeed_loop}      ${var_keyword_succeed_time}    Wait Until Element Is Visible       ${btn_Select_appointment_date}
    Wait Until Keyword Succeeds           ${var_keyword_succeed_loop}      ${var_keyword_succeed_time}    Wait Until Element Is Visible       ${btn_Select_year_right}     
    Wait Until Keyword Succeeds         ${var_keyword_succeed_loop}      ${var_keyword_succeed_time}    Click Element       ${btn_Select_year_right}
    Wait Until Keyword Succeeds           ${var_keyword_succeed_loop}      ${var_keyword_succeed_time}    Wait Until Element Is Visible       ${lbl_select_year_right_table}${var_input_year}${close_Brackets}      #คือ Custom locator ห้ามใช้เว้นวรรค
    Wait Until Keyword Succeeds         ${var_keyword_succeed_loop}      ${var_keyword_succeed_time}    Click Element       ${lbl_select_year_right_table}${var_input_year}${close_Brackets}    #คือ Custom locator ห้ามใช้เว้นวรรค
    Wait Until Keyword Succeeds           ${var_keyword_succeed_loop}      ${var_keyword_succeed_time}    Wait Until Element Is Visible       ${btn_select_month_right}
    Wait Until Keyword Succeeds         ${var_keyword_succeed_loop}      ${var_keyword_succeed_time}    Click Element                     ${btn_select_month_right}
    Wait Until Keyword Succeeds           ${var_keyword_succeed_loop}      ${var_keyword_succeed_time}    Wait Until Element Is Visible       ${lbl_select_mouth_right_table}${var_input_mouth}${close_Brackets}    #คือ Custom locator ห้ามใช้เว้นวรรค
    Wait Until Keyword Succeeds         ${var_keyword_succeed_loop}      ${var_keyword_succeed_time}    Click Element                     ${lbl_select_mouth_right_table}${var_input_mouth}${close_Brackets}    #คือ Custom locator ห้ามใช้เว้นวรรค
    Run Keyword If    "${var_input_mouth}"=="Jan"    Select date from month second   ${var_input_date}    ${var_input_mouth}    ${var_input_year}    January  
    ...    ELSE IF    "${var_input_mouth}"=="Feb"    Select date from month second   ${var_input_date}    ${var_input_mouth}    ${var_input_year}    February
    ...    ELSE IF    "${var_input_mouth}"=="Mar"    Select date from month second   ${var_input_date}    ${var_input_mouth}    ${var_input_year}    March
    ...    ELSE IF    "${var_input_mouth}"=="Apr"    Select date from month second   ${var_input_date}    ${var_input_mouth}    ${var_input_year}    April
    ...    ELSE IF    "${var_input_mouth}"=="May"    Select date from month second   ${var_input_date}    ${var_input_mouth}    ${var_input_year}    May
    ...    ELSE IF    "${var_input_mouth}"=="Jun"    Select date from month second   ${var_input_date}    ${var_input_mouth}    ${var_input_year}    June
    ...    ELSE IF    "${var_input_mouth}"=="Jul"    Select date from month second   ${var_input_date}    ${var_input_mouth}    ${var_input_year}    July
    ...    ELSE IF    "${var_input_mouth}"=="Aug"    Select date from month second   ${var_input_date}    ${var_input_mouth}    ${var_input_year}    August
    ...    ELSE IF    "${var_input_mouth}"=="Sep"    Select date from month second   ${var_input_date}    ${var_input_mouth}    ${var_input_year}    September
    ...    ELSE IF    "${var_input_mouth}"=="Oct"    Select date from month second   ${var_input_date}    ${var_input_mouth}    ${var_input_year}    October
    ...    ELSE IF    "${var_input_mouth}"=="Nov"    Select date from month second   ${var_input_date}    ${var_input_mouth}    ${var_input_year}    November
    ...    ELSE IF    "${var_input_mouth}"=="Dec"    Select date from month second   ${var_input_date}    ${var_input_mouth}    ${var_input_year}    December
    ...    ELSE    Log To Console    Input Error

Select date from month second
    [Arguments]    ${var_calculate_date}    ${var_calculate_mouth}    ${var_calculate_year}    ${var_name_mount}
    ${result}=   Replace String        ${var_calculate_mouth}${SPACE}${var_calculate_date},${SPACE}${var_calculate_year}   ${var_calculate_mouth}    ${var_name_mount}
    log    ${result}
    Wait Until Keyword Succeeds           ${var_keyword_succeed_loop}      ${var_keyword_succeed_time}        Wait Until Element Is Visible      ${lbl_select_date_right_table}${result}${close_Brackets}     #คือ Custom locator ห้ามใช้เว้นวรรค
    Wait Until Keyword Succeeds        ${var_keyword_succeed_loop}      ${var_keyword_succeed_time}    Click Element       ${lbl_select_date_right_table}${result}${close_Brackets}    #คือ Custom locator ห้ามใช้เว้นวรรค

Verify name technician in gantt
    [Arguments]    ${Var_check_technician_name}
    Wait Until Keyword Succeeds           ${var_keyword_succeed_loop}      ${var_keyword_succeed_time}    Wait Until Element Is Visible      ${lbl_gantt_table_name_technicain}${Var_check_technician_name}${close_Round_Brackets}   #คือ Custom locator ห้ามใช้เว้นวรรค

Verify gantt chart in gantt table
    Wait Until Keyword Succeeds           ${var_keyword_succeed_loop}      ${var_keyword_succeed_time}    Wait Until Element Is Visible      ${layout_gantt_line}  
    Capture Page Screenshot    RESULT_SMT_002_01.png

Verify task details when mouse over on task
    [Arguments]    ${Var_gantt_time}
    Wait Until Element Is Visible    ${gantt_box_element}${Var_gantt_time}${close_Round_Brackets}    #คือ Custom locator ห้ามใช้เว้นวรรค
    Mouse Over                       ${gantt_box_element}${Var_gantt_time}${close_Round_Brackets}    #คือ Custom locator ห้ามใช้เว้นวรรค
    Capture Page Screenshot    RESULT_SMT_002_02.png

#for Create Manual task Keyword

Click remove calendar on 

Get time
    ${currentDate}=   Get Current Date
    ${dateTime}     Convert Date     ${currentDate}         result_format=%H
    ${time}=    Evaluate    ${dateTime}+1
    Log To Console    ${time}
    Set Global Variable    ${time}

Goto task management
    Wait Until Page Contains            All Technician    5s 
    Wait Until Element Is Enabled       ${task_management_gantt_btn_createtask}    10s

Create Manual task
    Wait Until Element Is Enabled       ${task_management_gantt_btn_createtask}    10s
    Wait Until Keyword Succeeds         4x      3s      Click Element       ${task_management_gantt_btn_createtask}
    Element Should Be Disabled          ${task_management_gantt_btn_create}    
    Input Text                          ${task_management_gantt_txt_topic}    ${task_management_gantt_topic}

Select Tasktype    
    Wait Until Element Is Visible       ${task_management_gantt_select_task}
    Wait Until Keyword Succeeds         4x      3s      Click Element                       ${task_management_gantt_select_task}     
    Scroll Element Into View            ${task_management_gantt_scroll_tark}
    Wait Until Keyword Succeeds         4x      3s      Click Element                       ${task_management_gantt_pick_task}

Select Areacode 
    Wait Until Keyword Succeeds    3x    2s    Click Element    ${task_management_gantt_select_areaname}
    Wait Until Keyword Succeeds    3x    2s    Scroll Element Into View            ${task_management_gantt_scroll_area}
    Wait Until Keyword Succeeds    3x    2s    Click Element                       ${task_management_gantt_pick_area}

Select Time
    Run Keyword    Get time
    Wait Until Keyword Succeeds    3x    2s    Click Element                       ${task_management_gantt_select_time}
    Wait Until Keyword Succeeds    3x    2s    Click Element                       ${task_management_gantt_pick_time1}    
    Wait Until Keyword Succeeds    3x    2s    Click Element                       xpath=//li[normalize-space()='${time}']     

Confirm create Manual task
    [Arguments]    ${teachnician_create_task}
    Wait Until Keyword Succeeds         5x      5s    Click Element                       ${task_management_gantt_click_text_search}
    Wait Until Keyword Succeeds         5x      5s    Input Text                          ${task_management_gantt_click_text_search}    ${teachnician_create_task}   
    Wait Until Page Contains            ${teachnician_create_task}    10s              
    Wait Until Keyword Succeeds         5x      5s    Click Element                       ${task_management_gantt_click_checkbox}
    Wait Until Keyword Succeeds         5x      5s    Click Button                        ${task_management_gantt_btn_create}
    Wait Until Element Is Visible       ${task_management_gantt_modal_confirm}
    Wait Until Keyword Succeeds    3x    2s    Click Button    ${task_management_gantt_btn_confirm}           

Validate toast create success
    [Arguments]    ${var_toast_expect}   
    Wait Until Page Contains         ${var_toast_expect}    120s
    ${var_toast_assign_task}    Get Text    ${task_management_gantt_toast_success}
    Log                              ${var_toast_assign_task}                          
    Element Should Contain           ${task_management_gantt_toast_success}    ${var_toast_expect}    60s

Search Team on gantt
    [Arguments]    ${manual_task_team_name} 
    Wait Until Page Does Not Contain    Loading ...    
    Wait Until Keyword Succeeds    3s    2x    Click Element                       ${task_management_gantt_click_team_filter}
    Wait Until Keyword Succeeds    3s    2x    Click Element                       ${task_management_gantt_click_search}
    Wait Until Keyword Succeeds    3s    2x    Input Text                          ${task_management_gantt_click_search}    ${manual_task_team_name}
    Wait Until Keyword Succeeds    3s    2x    Click Element                       ${task_management_gantt_pick_team}

View Task Detail on Gantt
    Wait Until Keyword Succeeds    3s    2x    Double Click Element                ${task_management_gantt_click_detail_tab_gantt}
    Wait Until Page Contains            Created By
    Wait Until Keyword Succeeds    3s    2x    Click Element                       ${task_management_gantt_click_close_task_detail}

Select Tab Monitor list
    Click Element                       ${task_management_gantt_click_tab_moniotorlist}

View Task Detail on Monitor list 
    Wait Until Keyword Succeeds    3s    2x    Click Element                       ${task_management_gantt_click_team_filter}
    Wait Until Keyword Succeeds    3s    2x    Click Element                       ${task_management_gantt_click_search}
    Wait Until Keyword Succeeds    3s    2x    Input Text                          ${task_management_gantt_click_search}    ${task_management_gantt_team_name_create_manual_task}
    Wait Until Keyword Succeeds    3s    2x    Click Element                       ${task_management_gantt_pick_team}
    Wait Until Page Contains            ACCEPTED
    Double Click Element                ${task_management_gantt_click_task_tab_monitorlist}
    Wait Until Page Contains            Base Information    2s
    Wait Until Keyword Succeeds         4x      3s      Click Element       ${task_management_gantt_click_close_task_detail}   

Delete Manual task   
    Wait Until Page Does Not Contain    Loading ...    
    Wait Until Keyword Succeeds    3s    2x    Click Element                       ${task_management_gantt_click_team_filter}
    Wait Until Keyword Succeeds    3s    2x    Click Element                       ${task_management_gantt_click_search}
    Wait Until Keyword Succeeds    3s    2x    Input Text                          ${task_management_gantt_click_search}    ${task_management_gantt_team_name_create_manual_task}
    Wait Until Keyword Succeeds    3s    2x    Click Element                       ${task_management_gantt_pick_team}
    Wait Until Page Contains            ACCEPTED     
    Scroll Element Into View            ${task_management_gantt_scroll_monitor_list}        
    Wait Until Keyword Succeeds    3s    2x    Click Element                       ${task_management_gantt_click_kebab}
    Wait Until Keyword Succeeds    3s    2x    Click Element                       ${task_management_gantt_click_delete}
    Wait Until Keyword Succeeds    3s    2x    Click Button                        ${task_management_gantt_btn_confirm}
    Wait Until Element Is Visible       ${task_management_gantt_toast_success}    60s

Validate toast Delete success
    [Arguments]    ${var_toast_expect1}   
    Wait Until Page Contains         ${var_toast_expect1}
    ${var_toast_delete_task}    Get Text    ${task_management_gantt_toast_success}
    Log    ${var_toast_delete_task}                         
    Element Should Contain           ${task_management_gantt_toast_success}    ${var_toast_expect1}

