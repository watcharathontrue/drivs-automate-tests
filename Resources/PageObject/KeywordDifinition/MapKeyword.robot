*** Settings ***
Resource    Common.robot  
Resource    ../Locator/Locator.robot
Resource    ../TestData/TestData.robot

*** Keywords ***   
Open Web Work forz
    [Arguments]    ${URL}    ${BROWSER}
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed   0.2
    

Input UserName
    [Arguments]    ${Username}   
    Wait Until Element Is Visible    id=username    ${general_timeout}  
    Input Text  id=username  ${Username} 
Input. Password
    [Arguments]    ${Password}       
    Input Password   id=password     ${Password}

Click button Login
    Click Element    ${btn_login}    
    

Verify Logo Work forz   
    Wait Until Element Is Enabled   //body/div[@id='root']/div[1]/div[2]/div[1]/div[1]/h2[1]/div[1]
    Page Should Contain Image    /4pl-web-platform03d752da82f51f6d659ab82e02016e05.svg

Sign out
    Click Element    //div[contains(text(),'pp')]
    Wait Until Element Is Enabled   //p[contains(text(),'Sign out')]  
    Click Element    //p[contains(text(),'Sign out')]

# Get DateTime
#     ${currentDate}=   Get Current Date
#     ${Random}     Convert Date     ${currentDate}         result_format=%d%m%y-%H%M%S
#     Set Global Variable    ${Random}
   
Open page Map
    Wait Until Element Is Visible     ${task_management_map_link_map}    ${general_timeout}    
    Wait Until Keyword Succeeds         3x      2s          Click Element    ${task_management_map_link_map} 
    Wait Until Keyword Succeeds         3x      2s          Wait Until Element Is Enabled     ${task_management_map_page_map}    ${general_timeout} 

Input Team 

    Wait Until Keyword Succeeds         3x      2s          Click Element    ${task_management_map_textbox_scratch_team}    
    Wait Until Keyword Succeeds         3x      2s          Input Text       ${task_management_map_textbox_scratch_teamv2}    ${Scratch_Team}
    Wait Until Element Is Enabled    //span[@class='site-tree-search-value']
    Wait Until Keyword Succeeds         3x      2s          Click Element     ${task_management_map_txt_scratch_team} 
   
Search Technician name   
    [Arguments]     ${Search_type[0]}    ${txt_nam_task}     ${total_task}    ${nam_chktask}    ${Path_img}   
    Wait Until Keyword Succeeds         3x      2s          Click Element   ${task_management_map_dropdown_search}        
    Wait Until Element Is Enabled    ${task_management_map_dropdown_search_technician}    
    Wait Until Keyword Succeeds         3x      2s          Click Element   ${task_management_map_dropdown_search_technician}
    Wait Until Element Is Visible    ${task_management_map_textbox_scratch_map}    
    Wait Until Keyword Succeeds         3x      2s          Input Text    ${task_management_map_textbox_scratch_map}     ${Search_type[0]} 
    Wait Until Page Contains Element    ${task_management_map_icon_pin_map}
    
    ### เช็คว่าเจอ Task หรือไม่
    Wait Until Element Is Visible    ${txt_nam_task}
    ${total_task}=        Get Text      ${txt_nam_task}  
    Run Keyword If    ${total_task} >= ${nam_chktask}   Capture Page Screenshot    ${Path_img}/${Capture_SMT_003_01}
    ...    ELSE    Fail
        
Search Technician name No Capture 
    [Arguments]     ${Search_type[0]}    
    Wait Until Keyword Succeeds         3x      2s          Click Element   ${task_management_map_dropdown_search}        
    Wait Until Element Is Enabled    ${task_management_map_dropdown_search_technician}    
    Wait Until Keyword Succeeds         3x      2s          Click Element   ${task_management_map_dropdown_search_technician}
    Wait Until Element Is Visible    ${task_management_map_textbox_scratch_map}    
    Wait Until Keyword Succeeds         3x      2s          Input Text    ${task_management_map_textbox_scratch_map}     ${Search_type[0]} 
    Wait Until Page Contains Element    ${task_management_map_icon_pin_map}  

Get Request No and Service No
    Wait Until Element Is Visible      ${task_management_map_icon_task_detail}   
    Wait Until Keyword Succeeds         3x      2s          Click Element    ${task_management_map_icon_task_detail}
    Wait Until Keyword Succeeds         3x      5s     Wait Until Element Is Enabled      ${task_management_map_txt_request_no}    
     
    ### Get Request No
    Set Selenium Speed   0.2 
    Wait Until Keyword Succeeds         3x      5s     Wait Until Element Is Enabled      ${task_management_map_txt_request_no}
    ${Request}    Wait Until Keyword Succeeds         3x      5s        Get Text       ${task_management_map_txt_request_no}
    log to console     ${Request} 
    ${Request_list}=      Wait Until Keyword Succeeds         3x      5s     Split String  ${Request}    Customer order no.\n
    ${Request_NO}=     Wait Until Keyword Succeeds         3x      5s   Get From List   ${Request_list}  1
    Wait Until Keyword Succeeds         3x      2s     Append To List  ${Search_type}    ${Request_NO}
    Set Selenium Speed   0.0
    Wait Until Keyword Succeeds         3x      2s          Click Element    ${task_management_map_icon_cross}    
    Wait Until Element Is Visible    ${task_management_map_txt_task_detail} 

    ### Get Service No
    ${Service}  Get Text     //body/div[@id='root']/div[1]/div[2]/div[2]/div[2]/div[1]/div[2]/div[1]/div[1]/div[3]/div[1]/p[1]
    ${Service_No} =  Get Substring  ${Service}  1  17 
    Append To List  ${Search_type}    ${Service_No}
    Log      ${Search_type}  

    Click Element    ${link_monitor_list}
    Click Element    ${task_management_map_link_map}
    Wait Until Element Is Enabled     ${task_management_map_page_map}

# Get Request No and Service No
#     Wait Until Element Is Visible      ${task_management_map_icon_task_detail}   
#     Click Element    ${task_management_map_icon_task_detail}
#     Wait Until Keyword Succeeds         3x      2s     Wait Until Element Is Enabled      ${task_management_map_txt_request_no}    
     
#     ### Get Request No
#     Wait Until Keyword Succeeds         3x      2s     Wait Until Element Is Enabled      ${task_management_map_txt_request_no}
#     ${Request_list}=      Convert To String  ${Requestno_dev}
#     ${Request_NO}=   Get Substring   ${Requestno_dev}  1
#     Append To List  ${Search_type}    ${Request_NO}
      

#     Click Element    ${task_management_map_icon_cross}    
#     Wait Until Element Is Visible    ${task_management_map_txt_task_detail} 

#     ### Get Service No
#     ${Service}  Get Text     //body/div[@id='root']/div[1]/div[2]/div[2]/div[2]/div[1]/div[2]/div[1]/div[1]/div[3]/div[1]/p[1]
#     ${Service_No} =  Get Substring  ${Service}  1  17 
#     Append To List  ${Search_type}    ${Service_No}
#     Log      ${Search_type}  

#     Click Element    ${link_monitor_list}
#     Click Element    ${task_management_map_link_map}
#     Wait Until Element Is Enabled     ${task_management_map_page_map}


# Input Technician name    
#     [Arguments]     ${Search_type[0]}     ${txt_nam_task}     ${total_task}    ${nam_chktask}    ${Path_img}    ${Random}
#     Wait Until Element Is Visible    ${task_management_map_textbox_scratch_map} 
#     Input Text    ${task_management_map_textbox_scratch_map}     ${Search_type[0]} 
#     Wait Until Page Contains Element    ${task_management_map_icon_pin_map}
    
#     ### เช็คว่าเจอ Task หรือไม่
#     Wait Until Element Is Visible    ${txt_nam_task}
#     ${total_task}=        Get Text      ${txt_nam_task}  
#     Run Keyword If    ${total_task} >= ${nam_chktask}   Capture Page Screenshot    ${Path_img}/Capture-Technicianname.${Random}.png
#     ...    ELSE    Fail
    
--------UAT---------#   
Input Request No
    [Arguments]     ${Search_type[1]}      ${txt_nam_task}     ${total_task}    ${nam_chktask}    ${Path_img} 
    Click Element     ${task_management_map_dropdown_search}    
    Wait Until Element Is Enabled    ${task_management_map_dropdown_search_requestno}
    Click Element     ${task_management_map_dropdown_search_requestno}
    Wait Until Element Is Visible    ${task_management_map_textbox_scratch_map}
    Input Text    ${task_management_map_textbox_scratch_map}     ${Search_type[1]}
    Wait Until Page Contains Element    ${task_management_map_icon_pin_map}
    
    ### เช็คว่าเจอ Task หรือไม่
    Wait Until Element Is Visible    ${txt_nam_task} 
    ${total_task}=        Get Text      ${txt_nam_task}  
    Run Keyword If    ${total_task} >= ${nam_chktask}    Capture Page Screenshot    ${Path_img}/${Capture_SMT_003_03}
    ...    ELSE    Fail

# #--------DEV---------#
# Input Request No
#     [Arguments]     ${Search_type[1]}      ${txt_nam_task}     ${total_task}    ${nam_chktask}    ${Path_img} 
#     Click Element     ${task_management_map_dropdown_search}    
#     Wait Until Element Is Enabled    ${task_management_map_dropdown_search_requestno}
#     Click Element     ${task_management_map_dropdown_search_requestno}
#     Wait Until Element Is Visible    ${task_management_map_textbox_scratch_map}
#     Input Text    ${task_management_map_textbox_scratch_map}     ${Requestno_dev}
#     Wait Until Page Contains Element    ${task_management_map_icon_pin_map}
    
#     ### เช็คว่าเจอ Task หรือไม่
#     Wait Until Element Is Visible    ${txt_nam_task} 
#     ${total_task}=        Get Text      ${txt_nam_task}  
#     Run Keyword If    ${total_task} >= ${nam_chktask}    Capture Page Screenshot    ${Path_img}/${Capture_SMT_003_03}
#     ...    ELSE    Fail
    
    

Input Service No
    [Arguments]    ${Search_type[2]}      ${txt_nam_task}     ${total_task}    ${nam_chktask}    ${Path_img}    

    Click Element     ${task_management_map_dropdown_search}    
    Wait Until Element Is Enabled    ${task_management_map_dropdown_search_serviceno}
    Click Element     ${task_management_map_dropdown_search_serviceno}
    Wait Until Element Is Visible    ${task_management_map_textbox_scratch_map} 
    Input Text    ${task_management_map_textbox_scratch_map}     ${Search_type[2]} 
    Wait Until Page Contains Element    ${task_management_map_icon_pin_map}
    
    ### เช็คว่าเจอ Task หรือไม่ แล้ว 
    Wait Until Element Is Visible    ${txt_nam_task}
    ${total_task}=        Get Text      ${txt_nam_task}  
    Run Keyword If    ${total_task} >= ${nam_chktask}    Capture Page Screenshot    ${Path_img}/${Capture_SMT_003_03}
    ...    ELSE    Fail

Search Request no and Service no
     Wait Until Keyword Succeeds         3x      2s     Run Keyword    Get Request No and Service No
    ${range}=     get length    ${Search_type} 
    FOR    ${Num}    IN RANGE    2       ${range}+1
    log     ${Num}
    Run Keyword If    ${Num}==2   Input Request No      ${Search_type[1]}      ${txt_nam_task}     ${total_task}    ${nam_chktask}    ${Path_img}    
    ...    ELSE IF    ${Num}==3   Input Service No    ${Search_type[2]}    ${txt_nam_task}     ${total_task}    ${nam_chktask}     ${Path_img}   
    ...    ELSE    Fail
    END

    
Select Pin Map
   Wait Until Page Contains Element    ${task_management_map_icon_pin_map}

   Execute JavaScript    document.querySelector('.css-194dqc1').click();  

Verify Click Reassign
    [Arguments]    ${chktext_Reassign}    ${Path_img}    
    Wait Until Page Contains Element      ${task_management_map_icon_kabab_reassign}    
    Wait Until Keyword Succeeds         3x      2s     Click Element    ${task_management_map_icon_kabab_reassign}
    Wait Until Page Contains Element    ${task_management_map_link_reassign}    
    Should Be Equal As Strings    Reassign    ${chktext_Reassign}
    Capture Page Screenshot    RESULT_SMT_003_04.png
    

Click Reassign
    Wait Until Keyword Succeeds         3x      2s     Click Element    ${task_management_map_link_reassign}
    Wait Until Element Is Visible     ${task_management_map_pange_reassign}
    Wait Until Keyword Succeeds         3x      2s     Click Element       //button[normalize-space()='Cancel']
    

Select Appointment Start Date
    [Arguments]    ${var_input_date}    ${var_input_mouth}    ${var_input_year}   
    Set Selenium Speed   0.2 
    Wait Until Element Is Visible     //span[@class="ant-calendar-picker-input ant-input"]        ${general_timeout}
    Wait Until Keyword Succeeds         3x      2s     Click Element                     //span[@class="ant-calendar-picker-input ant-input"]
    Wait Until Element Is Visible     //div[@class="ant-calendar-range-part ant-calendar-range-left"]//a[@class="ant-calendar-year-select" and @title="Choose a year"]
    Wait Until Keyword Succeeds         3x      2s     Click Element                     //div[@class="ant-calendar-range-part ant-calendar-range-left"]//a[@class="ant-calendar-year-select" and @title="Choose a year"]
    Wait Until Element Is Visible     //div[@class="ant-calendar-range-part ant-calendar-range-left"]//td[@role="gridcell" and @title="${var_input_year}"]
    Wait Until Keyword Succeeds         3x      2s     Click Element                     //div[@class="ant-calendar-range-part ant-calendar-range-left"]//td[@role="gridcell" and @title="${var_input_year}"]
    Wait Until Element Is Visible     //div[@class="ant-calendar-range-part ant-calendar-range-left"]//a[@class="ant-calendar-month-select" and @title="Choose a month"]
    Wait Until Keyword Succeeds         3x      2s     Click Element                     //div[@class="ant-calendar-range-part ant-calendar-range-left"]//a[@class="ant-calendar-month-select" and @title="Choose a month"]
    Wait Until Element Is Visible     //div[@class="ant-calendar-range-part ant-calendar-range-left"]//td[@role="gridcell" and @title="${var_input_mouth}"]
    Wait Until Keyword Succeeds         3x      2s     Click Element                     //div[@class="ant-calendar-range-part ant-calendar-range-left"]//td[@role="gridcell" and @title="${var_input_mouth}"]
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
    ...    ELSE    Fail
    Set Selenium Speed   0.0

Select date from month first
    [Arguments]    ${var_calculate_date}    ${var_calculate_mouth}    ${var_calculate_year}    ${var_name_mount}
    ${result}=   Replace String    ${var_calculate_mouth}${SPACE}${var_calculate_date},${SPACE}${var_calculate_year}   ${var_calculate_mouth}    ${var_name_mount}
    log    ${result}
    Wait Until Element Is Visible     //div[@class="ant-calendar-range-part ant-calendar-range-left"]//td[@role="gridcell" and @title="${result}"]
    Click Element                     //div[@class="ant-calendar-range-part ant-calendar-range-left"]//td[@role="gridcell" and @title="${result}"]

Select Appointment End Date
    [Arguments]    ${var_input_date}    ${var_input_mouth}    ${var_input_year}
    Set Selenium Speed   0.2 
    Wait Until Element Is Visible       //span[@class="ant-calendar-picker-input ant-input"]
    Wait Until Element Is Visible     //div[@class="ant-calendar-range-part ant-calendar-range-right"]//a[@class="ant-calendar-year-select" and @title="Choose a year"]
    Wait Until Keyword Succeeds         3x      2s     Click Element                     //div[@class="ant-calendar-range-part ant-calendar-range-right"]//a[@class="ant-calendar-year-select" and @title="Choose a year"]
    Wait Until Element Is Visible     //div[@class="ant-calendar-range-part ant-calendar-range-right"]//td[@role="gridcell" and @title="${var_input_year}"]
    Wait Until Keyword Succeeds         3x      2s     Click Element                     //div[@class="ant-calendar-range-part ant-calendar-range-right"]//td[@role="gridcell" and @title="${var_input_year}"]
    Wait Until Element Is Visible     //div[@class="ant-calendar-range-part ant-calendar-range-right"]//a[@class="ant-calendar-month-select" and @title="Choose a month"]
    Wait Until Keyword Succeeds         3x      2s     Click Element                     //div[@class="ant-calendar-range-part ant-calendar-range-right"]//a[@class="ant-calendar-month-select" and @title="Choose a month"]
    Wait Until Element Is Visible     //div[@class="ant-calendar-range-part ant-calendar-range-right"]//td[@role="gridcell" and @title="${var_input_mouth}"]
    Wait Until Keyword Succeeds         3x      2s     Click Element                     //div[@class="ant-calendar-range-part ant-calendar-range-right"]//td[@role="gridcell" and @title="${var_input_mouth}"]
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
    ...    ELSE    Fail
    Set Selenium Speed   0.0
   

Select date from month second
    [Arguments]    ${var_calculate_date}    ${var_calculate_mouth}    ${var_calculate_year}    ${var_name_mount}
    ${result}=   Replace String    ${var_calculate_mouth}${SPACE}${var_calculate_date},${SPACE}${var_calculate_year}   ${var_calculate_mouth}    ${var_name_mount}
    log    ${result}
    Wait Until Element Is Visible     //div[@class="ant-calendar-range-part ant-calendar-range-right"]//td[@role="gridcell" and @title="${result}"]
    Wait Until Keyword Succeeds         3x      2s     Click Element                     //div[@class="ant-calendar-range-part ant-calendar-range-right"]//td[@role="gridcell" and @title="${result}"]


Clear cache Browser  
    Execute JavaScript  window.location.reload(true);
    Execute JavaScript  localStorage.clear();
    Execute JavaScript  sessionStorage.clear();   


    


