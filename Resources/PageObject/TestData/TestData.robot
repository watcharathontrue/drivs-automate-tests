# Format TestData parameter (สำหรับวางข้อมูลที่ใช้ใน script ของ feature นั้นๆ เช่น Role, Account, Order Id)
# Feature(Epic)/Function/Sub function
# Ex. Task management/Gantt/Cretate Task

*** Variables ***


# SMT_011_Verify Drivs Web Member
${team_management_username}                           010E6945
${team_management_password}                           0894887155
${team_management_team_name}                          E2E_TEAM_SET3
${user_team_management_technician_name}               junetestrole

# User Management/Create new user
# SMT_005_Verify Drivs Web 
${username_create_new_user_edit}                           010E6945
${user_password_create_new_user_edit}                      0894887155
${user_management_txt_create_new_user_search}              Testautomate
${user_management_txt_create_new_user_edit}                robotframework


# Map Data
# SMT 003 Map
${Scratch_Team}    NitiTeam
${IF_scratch_type}    1   # 1 = Technician name, 2 = Request No., 3 = Service No.
@{Search_type}     niti0011   
${total_task}
${nam_chktask}     1
${Path_img}        ./Capture_Screenshot
${chktext_Reassign}     Reassign 
${Request_NO}    ${EMPTY}
@{Request_list}
${general_timeout}     10
${Input_start_date}     31    #วันที่เริ่มนัดหมาย
${Input_start_month}    Mar
${Input_start_year}     2023
${Input_end_date}     31    #วันที่สิ้นสุดนัดหมาย
${Input_end_month}    Mar
${Input_end_year}     2023
${Capture_SMT_003_01}    SMT_003_01VerifyMapAbleSearch.png
${Capture_SMT_003_02}    SMT_003_02VerifyMapDisplayPinTask.png
${Capture_SMT_003_03}    SMT_003_03VerifyMapAbleSearchRequestnoAndServiceno.png
${Capture_SMT_003_04}    SMT_003_04VerifyMapDisplayReassignButton.png

# Gantt/Create Manual task
# SMT 009 Create Manual task
${user_testcase1}                             010E6945
${password_testcase1}                         0894887155
${user_testcase2}                             342334ab4
${password_testcase2}                         1234234233
${user_testcase3}                             010J0169
${password_testcase3}                         0223344555
${user_testcase4}                             01084481
${password_testcase4}                         0968210376
${task_management_gantt_topic}                                สร้าง Manual Task
${task_management_gantt_staff_search}                         rung staff
${task_management_gantt_team_name_create_manual_task}         Rung Team

# Team management/Create Team
# SMT_008_TeamManagement
${team_management_team_name_create_team}              TestTeamCode
${team_management_team_code_create_team}              TestTeamName
${team_management_depotcode}                          A12342
${team_management_country}                            ประเทศไทย
${team_management_search_area_name}                   กัลปพฤกษ์แกรนด์พาร์ค
${team_management_area_name}                          กัลปพฤกษ์แกรนด์พาร์ค อ.เอ  

# Shift Management
# SMT_006_Shift Management
${shift_management_txt_username}      010E6945
${shift_management_txt_password}      0894887155
${shift_management_txt_create_value}        PTest Shift Afternoon
${shift_management_txt_edit_value}          PTest Edit Shift  
${shift_management_txt_search_value}        testQA

#Monitor List
#SMT_004_Monitor_List
${monitor_list_txt_username}      010E6945
${monitor_lsit_txt_password}      0894887155
@{search_monitor_list}     DAOTEST1679019414   AccNoHSI34981735    20230317151259945988
@{monitor_list_search_team}    NitiTeam    True
@{monitor_list_status_fillters}    New    Scheduled    Accepted    Set off    Enter site    completed    Returned    Cancelled    Failed

# Team management
# SMT_007_Team shift
# SMT_010_Approval
${team_management_team_shift_username}     010E6945
${team_management_team_shift_password}     0894887155
${team_management_team_shift_team_benz}    benzteamss
${team_management_team_shift_team_technician_name}    apibesttechnician

# SMT_002_Gantt
${var_keyword_succeed_loop}    5x      
${var_keyword_succeed_time}    3s 
${Technician_test_gantt}       Ganaporn Chongmanchit
${username_gantt}              0000000001                
${password_gantt}              0650920001
${teamname_gantt_search}       TRUE Team
# เดือนให้ใช้เฉพาะ Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec
&{Select_first_date}           day=16  mouth=Mar  year=2023
&{Select_second_date}          day=16  mouth=Mar  year=2023
${Input_gantt_time_on_table}    11:00
# SMT_001_login
&{User01_login}              username=test001      password=9999999001
&{User02_login}              username=0000000001    password=0650920001
${general_timeout}        10