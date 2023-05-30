*** Settings ***
Resource    ../Resources/PageObject/KeywordDifinition/Common.robot
Resource    ../Resources/PageObject/KeywordDifinition/GanttKeyword.robot
Resource    ../Resources/PageObject/Locator/Locator.robot
Resource    ../Resources/PageObject/TestData/TestData.robot
Resource    ../Resources/PageObject/KeywordDifinition/loginKeyword.robot
Suite Setup         Common.Suite Setup UAT
Suite Teardown      Common.Suite Teardown
Test Setup          Common.Test Setup UAT
Test Teardown       Common.Test Teardown
Force Tags          SMT



***Test Cases *** 
SMT_009_01 Create manual task on Gantt page
    [Documentation]    ข้อจำกัดไม่สามารถ run ติดต่อกันได้เนื่องจากการจองงานต้องสร้างและลบ ถึงสามารถสร้างซ้ำกันได้
    [Tags]    SMT_009    SMT_009_01
    Set Selenium Speed   0.3
    Run Keyword And Ignore Error    Login DRIVS web                   ${user_testcase1}    ${password_testcase1}
    Goto task management
    Create Manual task
    Select Tasktype
    Select Areacode
    Select Time
    Confirm create Manual task    ${task_management_gantt_staff_search} 
    Validate toast create success    ${task_management_gantt_toast_create_manual_task_success}
    Capture Page Screenshot    RESULT_SMT_009_01.png

SMT_009_02 Check Task Detail on Gantt
    [Tags]    SMT_009    SMT_009_02.png
    Set Selenium Speed   0.2
    Run Keyword And Ignore Error    Login DRIVS web                   ${user_testcase2}    ${password_testcase2}
    Goto task management
    Search Team on gantt    ${task_management_gantt_team_name_create_manual_task}
    View Task Detail on Gantt
    Capture Page Screenshot    RESULT_SMT_009_02.png

SMT_009_03 Check task on Monitor list
    [Tags]    SMT_009    SMT_009_03
    Set Selenium Speed   0.2
    Run Keyword And Ignore Error    Login DRIVS web                   ${user_testcase3}    ${password_testcase3}
    Goto task management
    Select Tab Monitor list
    View Task Detail on Monitor list
    Capture Page Screenshot    RESULT_SMT_009_03.png

SMT_009_04 Delete manual task
    [Tags]    SMT_009    SMT_009_04
    Set Selenium Speed   0.2
    Run Keyword And Ignore Error    Login DRIVS web                   ${user_testcase4}    ${password_testcase4}
    Goto task management
    Select Tab Monitor list
    Delete Manual task
    Validate toast create success    ${task_management_gantt_toast_delete_manual_task_success} 
    Capture Page Screenshot    RESULT_SMT_009_04.png
    Sleep    4s