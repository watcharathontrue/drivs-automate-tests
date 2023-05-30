*** Settings ***
Resource            ../Resources/PageObject/KeywordDifinition/MapKeyword.robot
Resource            ../Resources/PageObject/Locator/Locator.robot
Resource            ../Resources/PageObject/KeywordDifinition/Common.robot
Resource            ../Resources/PageObject/TestData/TestData.robot
Resource            ../Resources/PageObject/KeywordDifinition/LoginKeyword.robot
Suite Setup    Common.Suite Setup UAT
Suite Teardown    Common.Suite Teardown
Test Setup    Common.Test Setup UAT
Test Teardown     Common.Test Teardown
Force Tags    SMT

***Test Cases *** 
SMT_003_01 Verify Map Able Search 
    [Tags]     SMT_003     SMT_003_01
    [Documentation]    ตรวจสอบการค้นหา ทีม ชื่อช่าง วันที่นัดหมาย
    Set Selenium Speed   0.2
    Run Keyword And Ignore Error    Login DRIVS web                   ${shift_management_txt_username}    ${shift_management_txt_password}
    Open page Map
    Input Team
    Select Appointment Start Date      ${Input_start_date}       ${Input_start_month}          ${Input_start_year} 
    Select Appointment End Date     ${Input_end_date}        ${Input_end_month}        ${Input_end_year}
    Search Technician name        ${Search_type[0]}    ${txt_nam_task}     ${total_task}    ${nam_chktask}    ${Path_img}
    Capture Page Screenshot    RESULT_SMT_003_01.png

SMT_003_02 Verify Map Display Pin Task
    [Tags]     SMT_003     SMT_003_02
    [Documentation]    ตรวจสอบหมุดบน Map
    Set Selenium Speed   0.2
    Run Keyword And Ignore Error    Login DRIVS web                   ${shift_management_txt_username}    ${shift_management_txt_password}
    Open page Map
    Input Team
    Select Appointment Start Date      ${Input_start_date}       ${Input_start_month}          ${Input_start_year} 
    Select Appointment End Date     ${Input_end_date}        ${Input_end_month}        ${Input_end_year}
    Search Technician name No Capture       ${Search_type[0]}  
    Select Pin Map
    Capture Page Screenshot    RESULT_SMT_003_02.png

SMT_003_03 Verify Map Able Search Request no. And Service no.
    [Tags]     SMT_003     SMT_003_03
    [Documentation]    ตรวจสอบการค้นหาด้วย Request no และ Service no
    Set Selenium Speed   0.2
    Run Keyword And Ignore Error    Login DRIVS web                   ${shift_management_txt_username}    ${shift_management_txt_password}
    Open page Map
    Input Team
    Select Appointment Start Date      ${Input_start_date}       ${Input_start_month}          ${Input_start_year} 
    Select Appointment End Date     ${Input_end_date}        ${Input_end_month}        ${Input_end_year}
    Search Technician name No Capture       ${Search_type[0]}  
    Select Pin Map
    Search Request no and Service no
    Capture Page Screenshot    RESULT_SMT_003_03.png
    
SMT_003_04 Verify Map Display Reassign Button
    [Tags]     SMT_003     SMT_003_04
    [Documentation]    ตรวจสอบปุ่ม Reassign
    Set Selenium Speed   0.2
    Run Keyword And Ignore Error    Login DRIVS web                   ${shift_management_txt_username}    ${shift_management_txt_password}
    Open page Map
    Input Team
    Select Appointment Start Date      ${Input_start_date}       ${Input_start_month}          ${Input_start_year} 
    Select Appointment End Date     ${Input_end_date}        ${Input_end_month}        ${Input_end_year}
    Search Technician name No Capture       ${Search_type[0]} 
    Select Pin Map
    Verify Click Reassign      ${chktext_Reassign}    ${Path_img}   
    Click Reassign
    Sleep    4s