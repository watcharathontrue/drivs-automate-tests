*** Settings ***
Resource    ../TestData/MsgData.robot
Resource    ../TestData/TestData.robot
Resource    ../Locator/Locator.robot
Resource    ./Common.robot

*** Keywords ***
Goto menu Shift Management
    Wait Until Page Contains        ${shift_management_msg_gantt} 
    Wait Until Keyword Succeeds    3x    2s    Click Element                   ${shift_management_ele_tabShift}
    Wait Until Page Contains        ${shift_management_msg_shiftType} 

Able to search shift
    [Arguments]    ${shift_management_txt_search}    ${RESULT_SMT_006_01}
    Wait Until Keyword Succeeds    3x    2s    Input Text                      ${shift_management_field_search}             ${shift_management_txt_search}           
    Wait Until Page Contains        ${shift_management_msg_shiftNormal}
    Capture Page Screenshot    ${RESULT_SMT_006_01}
    Wait Until Keyword Succeeds    3x    2s    Clear Element Text              ${shift_management_field_search}     

Able to create shift
    [Arguments]    ${shift_management_txt_create}    ${RESULT_SMT_006_02}
    Wait Until Keyword Succeeds    3x    2s    Click Button                    ${shift_management_btn_createNewShift}
    Wait Until Page Contains        ${shift_management_msg_shiftName}        
    Wait Until Keyword Succeeds    3x    2s    Input Text                      ${shift_management_field_shiftName}          ${shift_management_txt_create}
    Wait Until Keyword Succeeds    3x    2s     Click Element                   ${shift_management_radio_oncall} 
    Wait Until Keyword Succeeds    3x    2s    Click Element                   ${shift_management_ele_startTime}
    Scroll Element Into View        ${shift_management_ele_selectStartTime}
    Wait Until Keyword Succeeds    3x    2s    Click Element                   ${shift_management_ele_selectStartTime}
    Wait Until Keyword Succeeds    3x    2s    Click Element                   ${shift_management_ele_endTime}
    Scroll Element Into View        ${shift_management_ele_selectEndTime} 
    Wait Until Keyword Succeeds    3x    2s    Click Element                   ${shift_management_ele_selectEndTime} 
    Wait Until Keyword Succeeds    3x    2s    Click Element                   ${shift_management_ele_colors}
    Wait Until Keyword Succeeds    3x    2s    Click Button                    ${shift_management_btn_create}
    Wait Until Page Contains        ${shift_management_msg_createSuccess}
    Capture Page Screenshot    ${RESULT_SMT_006_02}  

Able to edit shift
    [Arguments]    ${shift_management_txt_create}    ${shift_management_txt_edit}    ${RESULT_SMT_006_03}
    Wait Until Keyword Succeeds    3x    2s    Input Text                      ${shift_management_field_search}            ${shift_management_txt_create}           
    Wait Until Page Contains        ${shift_management_msg_shiftNormal}
    Wait Until Keyword Succeeds    3x    2s    Click Element                   ${shift_management_kabab}
    Wait Until Keyword Succeeds    3x    2s    Click Element                   ${shift_management_ele_edit}
    Wait Until Keyword Succeeds    3x    2s    Input Text                      ${shift_management_field_shiftName}         ${shift_management_txt_edit}         
    Wait Until Keyword Succeeds    3x    2s    Click Element                   ${shift_management_radio_normal}        
    Wait Until Page Does Not Contain                                            ${shift_management_msg_createSuccess}    
    Wait Until Keyword Succeeds    3x    2s    Click Button                    ${shift_management_btn_save}
    Wait Until Page Contains        ${shift_management_msg_updateSuccess}
    Capture Page Screenshot    ${RESULT_SMT_006_03}

Able to delete shift
    [Arguments]    ${shift_management_txt_edit}    ${RESULT_SMT_006_05}
    Wait Until Keyword Succeeds    3x    2s    Input Text    ${shift_management_field_search}            ${shift_management_txt_edit}
    Wait Until Page Contains        ${shift_management_msg_shiftNormal} 
    Wait Until Keyword Succeeds    3x    2s    Click Element    ${shift_management_kabab}
    Wait Until Keyword Succeeds    3x    2s    Click Element    ${shift_management_btn_delete}       
    Wait Until Keyword Succeeds    3x    2s    Click Button    ${shift_management_btn_confirmDelete}
    Wait Until Page Contains        ${shift_management_msg_deleteSuccess}
    Capture Page Screenshot    ${RESULT_SMT_006_05}

Verify field on shiftpage
    Click Button                      ${shift_management_btn_createNewShift} 
    Wait Until Page Contains          ${shift_management_msg_shiftInfo}
    Click Element                     ${shift_management_ele_startTime}
    ${countlist}=         Get Element Count      ${shift_management_ele_hourTime}
    Scroll Element Into View                     ${shift_management_ele_hourStart}   
    FOR    ${count}       IN RANGE               1    ${countlist}-3
        Scroll Element Into View                 ${shift_management_ele_hourEnd}   
        ${textTime}=    Get Text                 xpath://ul//li[${count}]
    END
    Run Keyword If        ${textTime} == 23      Log To Console  Corrected
    ...    ELSE           Fail