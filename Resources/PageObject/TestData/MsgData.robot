*** Variables ***
# Format MsgData variable (สำหรับวางข้อมูลที่เป็น Wording เป็น Expected result เพื่อ Verify)
# Feature(Epic)/Function/Sub function
# Ex. Task management/Gantt/Cretate Task


# SMT_011_Verify Drivs Web Member
${expected_team_management_toast_add_member}                   Add members success\nYou have already added 1 member to ‘E2E_TEAM_SET3’ team
${expected_team_management_toast_remove_member}                 Remove member success\n‘junetestrole ’ have been removed from E2E_TEAM_SET3 team
${expected_team_management_toast_remove_member2}                ‘junetestrole ’ have been removed from E2E_TEAM_SET3 team
${team_management_toast_add_member2}                  Add members success

# Team management/Create Team, Edit, Create sub, Delete
# SMT_008_TeamManagement
${team_management_tostCreateSuccess}                    Create Team Success
${team_management_tostEditSuccess}                      Update Team Success
${team_management_tostDeleteSuccess}                    Delete team success

# SMT_005_Verify Drivs Web User Management
${user_management_toast_skillsuccess}                 Add skill success
${user_management_toast_add_success}                  Update Success You're already update
${user_management_gantt_main}                         Gantt
${user_management_active_main}                        Active
${user_management_view_main}                          View
${user_management_profile_main}                       Profile
${user_management_personal_info_main}                 Personal Info
${user_management_wait_second_10}                     10s
${user_management_wait_second_15}                     15s
${user_management_wait_skill_list}                    SKILL LIST
${expected_user_management_search_staff}              Testautomate




# Team Management
# SMT_007_Team Shift
${msg_toast_assignshift_success}    Assign shift to technician success\nYou have already added shift to 'apibesttechnician '
${msg_toast_removeshift_success}    Remove technician's shift success\nYou have already removed shift

# Team management
# SMT_010_Approval
${expected_toast_add_approve_success}    Add approver success\nYou've already added 1 approver to benzteamss' team
${expected_edit_approve}    Edit approval type success\n‘apibesttechnician apibesttechnician’ ’s approval type have been edited 
${expected_toast_remove_approve}    Remove approver success\n'apibesttechnician apibesttechnician' have been removed from benzteamss team


# Shift Management
# SMT_006_Shift Management
${shift_management_msg_gantt}                     Gantt
${shift_management_msg_shiftType}                 Shift type 
${shift_management_msg_shiftNormal}               Normal
${shift_management_msg_shiftName}                 SHIFT NAME
${shift_management_msg_createSuccess}             Create shift Success
${shift_management_msg_updateSuccess}             Update Success
${shift_management_msg_deleteShift}               Delete Shift
${shift_management_msg_deleteSuccess}             Delete shift success 
${shift_management_msg_search}                    Search
${shift_management_msg_shiftInfo}                 Shift information
${shift_management_msg_expecte.nameError}         This field is required
${shift_management_msg_expecte.starttimeError}    Can't use equal end time.
${shift_management_msg_expecte.endtimeError}      Can't use equal start time.
${shift_management_msg_expecte.starttime}         00:30

# Monitor List
# SMT_004_Monitor List
# ${excpected_assign_techician}    Assign technician to task
${excpected_assign_techician}    Assign technician to task AccNoHSI34981735-230317895333

${task_management_gantt_toast_create_manual_task_success}     Assign task
${task_management_gantt_toast_delete_manual_task_success}     Delete task success 

#SMT_001_login
${msg_Username_error}    Username field is required.
${msg_Password_error}    Password field is required.
${user_invalid}           username or password invalid.
${Task_Management}        Task management
#SMT_002_gantt
${Gantt}                            Gantt

