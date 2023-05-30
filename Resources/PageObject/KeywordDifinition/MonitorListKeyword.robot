*** Settings ***
Resource    ../Locator/Locator.robot
Resource    ../TestData/TestData.robot
Resource    ../TestData/MsgData.robot
Resource    ./Common.robot

*** Keywords ***
#Monitor List Main Keyword
#SMT_004_Monitor_List

Click clear calendar button
    Wait Until Keyword Succeeds    3x    2s    Click Element    //*[@id="root"]/div/div[2]/div[2]/div[2]/div[2]/div[2]/div/div[1]/div[1]/div[3]/div[2]/span/span/i[2]/svg

Go to Monitor List Page
    Wait Until Element Is Enabled    ${monitor_list}
    Click Element       ${monitor_list}
 
Verify display re-assing button
    [Arguments]    ${reassign_expect}    ${RESULT_SMT_004_02}
    Wait Until Keyword Succeeds    3x    2s    Scroll Element Into View    ${monitor_list_scroll_right}
    Wait Until Element Is Enabled    ${monitor_list_elemnet_kebab}
    Wait Until Keyword Succeeds    3x    2s    Click Element    ${monitor_list_elemnet_kebab}
    Wait Until Element Is Enabled    ${monitor_list_btn_reaasign}
    Wait Until Keyword Succeeds    3x    2s    Click Element    ${monitor_list_btn_reaasign}
    ${reassign_actual}=    Wait Until Keyword Succeeds    3x    2s     Get Text    ${monitor_list_txt_reaasign}
    Should Be Equal    ${reassign_expect}    ${reassign_actual}
    Capture Page Screenshot    ${RESULT_SMT_004_02}
    Wait Until Keyword Succeeds    3x    2s    Click Element    ${monitor_list_btn_pop_up_cancel}

Verify Able status correct
    [Arguments]    ${RESULT_SMT_004_02}
    Wait Until Element Is Visible    ${monitor_list_element_fillters}
    Wait Until Keyword Succeeds    3x    2s    Click Element    ${monitor_list_element_fillters}
    Wait Until Element Is Visible    ${monitor_list_status_fillters}
    Wait Until Keyword Succeeds    3x    2s    Click Element    ${monitor_list_status_fillters}
    Wait Until Element Is Visible    ${monitor_list_txt_fillters} 
    Press Keys  None  New+ENTER
    Wait Until Keyword Succeeds    3x    2s    Click Element    ${monitor_list_txt_fillters}
    Wait Until Element Is Enabled    ${monitor_list_btn_apply}
    Wait Until Keyword Succeeds    3x    2s    Click Button    ${monitor_list_btn_apply}
    Capture Page Screenshot    ${RESULT_SMT_004_02}

Search service no
    [Arguments]    @{search_monitor_list}
    Wait Until Element Is Visible    ${monitor_list_input_search}
    Wait Until Keyword Succeeds    3x    2s    Input Text       ${monitor_list_input_search}    @{search_monitor_list}


Search team
    Wait Until Element Is Visible    ${monitor_list_element_subcon_team}
    Wait Until Keyword Succeeds    3x    2s    Click Element    ${monitor_list_element_subcon_team}
    Wait Until Keyword Succeeds    3x    2s    Input Text       ${monitor_list_field_search_team}    ${monitor_list_search_team}[0]
    Wait Until Element Is Visible    ${monitor_list_select_team}   
    Wait Until Keyword Succeeds    3x    2s    Click Element    ${monitor_list_select_team}    

Select date
    Wait Until Element Is Visible    ${monitor_list_element_date}
    Wait Until Keyword Succeeds    3x    2s    Click Element    ${monitor_list_element_date}
    Wait Until Element Is Visible    ${monitor_list_element_previous_mounth}
    Wait Until Keyword Succeeds    3x    2s    Click Element    ${monitor_list_element_previous_mounth}
    Wait Until Element Is Visible    ${monitor_list_element_date_17}
    Wait Until Keyword Succeeds    3x    2s    Click Element    ${monitor_list_element_date_17}
    Wait Until Keyword Succeeds    3x    2s    Click Element    ${monitor_list_element_date_17}
    Wait Until Keyword Succeeds    6x    2s    Wait Until Element Is Visible    ${monitor_list_txt_appoint_date}


Clear data 
    Wait Until Element Is Visible    $${monitor_list_element_clear_data}
    Wait Until Keyword Succeeds    3x    2s    Click Element    ${monitor_list_element_clear_data}

Search request no
    [Arguments]    ${Search_MonitorList}    ${RESULT_SMT_004_03}
    Wait Until Element Is Visible    ${monitor_list_input_search}
    Input Text       ${monitor_list_input_search}    ${Search_MonitorList}
    Wait Until Keyword Succeeds    3x    2s    Click Element    ${monitor_list_select_search}
    Wait Until Element Is Visible    ${monitor_list_select_request_no}
    Wait Until Keyword Succeeds    3x    2s    Click Element    ${monitor_list_select_request_no}
    Wait Until Element Is Visible    ${monitor_list_element_subcon_team}
    Wait Until Keyword Succeeds    3x    2s    Click Element    ${monitor_list_element_subcon_team}
    Input Text       ${monitor_list_field_search_team}    ${monitor_list_search_team}[0]
    Wait Until Element Is Visible    ${monitor_list_select_team}    
    Wait Until Keyword Succeeds    3x    2s    Click Element    ${monitor_list_select_team}
    Wait Until Element Is Visible    ${monitor_list_element_date}
    Wait Until Keyword Succeeds    3x    2s    Click Element    ${monitor_list_element_date}
    Wait Until Element Is Visible    ${monitor_list_element_previous_mounth}
    Wait Until Keyword Succeeds    3x    2s    Click Element    ${monitor_list_element_previous_mounth}
    Wait Until Element Is Visible    ${monitor_list_element_date_17}
    Wait Until Keyword Succeeds    3x    2s    Click Element    ${monitor_list_element_date_17}
    Wait Until Keyword Succeeds    3x    2s    Click Element    ${monitor_list_element_date_17}
    Wait Until Keyword Succeeds    6x    5s    Wait Until Element Is Visible    ${monitor_list_txt_appoint_date}    
    Capture Page Screenshot    ${RESULT_SMT_004_03}









    

    

        

