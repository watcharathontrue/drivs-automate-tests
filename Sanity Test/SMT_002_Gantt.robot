*** Settings ***
Resource    ../Resources/PageObject/Locator/Locator.robot
Resource    ../Resources/PageObject/KeywordDifinition/GanttKeyword.robot
Resource    ../Resources/PageObject/KeywordDifinition/loginKeyword.robot
Suite Setup    Common.Suite Setup UAT
Suite Teardown    Common.Suite Teardown
Test Setup    Common.Test Setup UAT
Test Teardown     Common.Test Teardown
Force Tags    SMT

*** Test Cases ***
SMT_002_01 Verify Gantt Search
    [Tags]    SMT_002        SMT_002_01
    Set Selenium Speed   0.2
    Run Keyword And Ignore Error    Login DRIVS web    ${username_gantt}    ${password_gantt}
    Select team                         ${Teamname_gantt_search} 
    Search Technician                   ${Technician_test_gantt}
    Select First Appointment date       ${Select_first_date.day}     ${Select_first_date.mouth}     ${Select_first_date.year}
    Select Second Appointment date      ${Select_second_date.day}    ${Select_second_date.mouth}    ${Select_second_date.year}
    Verify name technician in gantt     ${Technician_test_gantt}
    Verify gantt chart in gantt table
    Capture Page Screenshot    RESULT_SMT_002_01.png

SMT_002_02 Verify Gantt task details when mouse over on task
    [Tags]     SMT_002        SMT_002_02    ignore
    Run Keyword And Ignore Error    Login DRIVS web                     ${username_gantt}         ${password_gantt}
    Select team                         ${Teamname_gantt_search} 
    Search Technician                   ${Technician_test_gantt}
    Select First Appointment date       ${Select_first_date.day}     ${Select_first_date.mouth}     ${Select_first_date.year}
    Select Second Appointment date      ${Select_second_date.day}    ${Select_second_date.mouth}    ${Select_second_date.year}
    Verify name technician in gantt     ${Technician_test_gantt}
    Verify task details when mouse over on task    ${Input_gantt_time_on_table}
    Capture Page Screenshot    RESULT_SMT_002_02.png
    Sleep    4s