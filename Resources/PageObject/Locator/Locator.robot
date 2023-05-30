*** Variables ***
# Format Locator variable
# Feature(Epic)/Function/Sub function
# Ex. Task management/Gantt/Cretate Task

# Login locator
${btn_iconProfile}        xpath=//*[@id="root"]/div/div[2]/div[1]/div/div/div[3]/div[2]/div
${btn_logout}             xpath=//*[contains(text(),"Sign out")]
${btn_Login}              xpath=//*[@id="root"]/div/div[1]/form/button
${txt_username}           id=username 
${txt_passwords}          id=password
${lbl_user_invalid}       xpath=//div[contains(text(),'username or password invalid.')]
${lbl_Task_Management}    xpath=//div[contains(text(),'Task management')]
${lbl_Username_error}     xpath=//div[@data-testid="username-error-message"]//p[contains(text(),'Username field is required.')]
${lbl_Password_error}     xpath=//div[@data-testid="login-error-message"]//p[contains(text(),'Password field is required.')]

# Gantt locator
${link_gantt}                         xpath=//div[contains(text(),'Gantt')]                                                                                                        
${txt_search_team}                    xpath=//*[@id="team-filter"]
${txt_input_teamname}                 xpath=//*[@data-testid="sidebar-search-input"] 
${Dropdown_search_1st_box}            xpath=//div[@class="css-l63bkh ant-select ant-select-enabled"]
${item_dropdown_Technician_name}      xpath=//li[contains(text(),'Technician name')]
${txt_Search_keyword}                 xpath=//Input[@type="text" and @placeholder="Search"]
${btn_Select_appointment_date}        xpath=//span[@class="ant-calendar-picker-input ant-input"]
${layout_gantt_line}                  xpath=//div[@class="rct-horizontal-lines"]//div[@data-testid="groupRow"]
${btn_Select_year_left}               xpath=//div[@class="ant-calendar-range-part ant-calendar-range-left"]//a[@class="ant-calendar-year-select" and @title="Choose a year"]
${btn_select_month_left}              xpath=//div[@class="ant-calendar-range-part ant-calendar-range-left"]//a[@class="ant-calendar-month-select" and @title="Choose a month"]
${btn_Select_year_right}              xpath=//div[@class="ant-calendar-range-part ant-calendar-range-right"]//a[@class="ant-calendar-year-select" and @title="Choose a year"]
${btn_select_month_right}             xpath=//div[@class="ant-calendar-range-part ant-calendar-range-right"]//a[@class="ant-calendar-month-select" and @title="Choose a month"]
${list_of_search_team}                xpath=//div[@class="List"]//span[contains(text(),'
${close_Round_Brackets}               ')]                                                                                                                                          
${lbl_select_year_left_table}         xpath=//div[@class="ant-calendar-range-part ant-calendar-range-left"]//td[@role="gridcell" and @title="
${close_Brackets}                     "]
${lbl_select_mouth_left_table}        xpath=//div[@class="ant-calendar-range-part ant-calendar-range-left"]//td[@role="gridcell" and @title="
${lbl_select_date_left_table}         xpath=//div[@class="ant-calendar-range-part ant-calendar-range-left"]//td[@role="gridcell" and @title="
${lbl_select_year_right_table}        xpath=//div[@class="ant-calendar-range-part ant-calendar-range-right"]//td[@role="gridcell" and @title="
${lbl_select_mouth_right_table}       xpath=//div[@class="ant-calendar-range-part ant-calendar-range-right"]//td[@role="gridcell" and @title="
${lbl_select_date_right_table}        xpath=//div[@class="ant-calendar-range-part ant-calendar-range-right"]//td[@role="gridcell" and @title="
${lbl_gantt_table_name_technicain}    xpath=//div[@class="rct-sidebar-row rct-sidebar-row-even"]//p[contains(text(),'
${gantt_box_element}                  xpath=//div[@class="rct-horizontal-lines"]//div[@data-testid="groupRow"]//div[@class="rct-item "]//div[contains(text(),'


# Team management/Add member , Remove member
# SMT_011_Verify Drivs Web Member
${team_management_txt_task_management}          //*[@id="root"]/div/div[2]/div[1]/div/h2/div/div
${team_management_txt_team_management}          //*[@id="root"]/div/div[2]/div[1]/div/h2/div/div
${team_management_menu_team_management}         //*[@id="root"]/div/div[1]/div/div/div[3]/div[4]
${team_management_search_box}                   //div[@class='css-4jknc7']
${team_management_locator_search_box}           //input[@class='css-a4ckow']
${team_management_locator_s_driv_team}          //*[@id="team-list-container"]/div[1]/div/div/div/div/div[2]/p
${team_management_btn_add_member}               //*[@id="root"]/div/div[2]/div[2]/div[2]/div[2]/div[2]/div/div/div/div[3]/div[1]/div[2]/div/button
${team_management_txt_add_member}               //*[@id="modal-5049"]/div/div[1]/div[1]/h2
${team_management_search_technician}            (//input[@placeholder='Search'])[3]
${team_management_search_display}               //*[@id="modal-206"]/div/div[2]/div/div/div[1]/div/div[3]/div/div/table/tbody/tr/td[3]/span/p
${team_management_addmember_checkbox}           //div[@class='css-w0fefz']
${team_management_btn_addmember}                //div[@class='css-1772sct']
${team_management_btn_add}                      //button[normalize-space()='Add']
${team_management_locator_toast}                //body/div[@id='react-toast']/span[6]
${team_management_search_technicianinteam}      //input[@class='css-1aa2oxq-InputBase']
${team_management_technicianinteam_display}     //span[normalize-space()='roletest001']
${team_management_kebab}                        //tbody//td[@class='table-column actions']//*[name()='svg']
${team_management_list_removemember}            //li[normalize-space()='Remove member']
${team_management_removemember_popup}           //section[@id='modal-195']
${team_management_btn_remove}                   //button[normalize-space()='Remove']
${team_management_header_popup}                 //h2[normalize-space()='Select User to Team Member']
${team_management_locator_popup}                //div[@id='chakra-portal-3']
${team_management_locator_input_roletest001}    //input[@value='roletest001']
${team_management_btn_clear}                    //button[normalize-space()='Clear']
${team_management_btn_cancel}                   //button[normalize-space()='Cancel']
${team_management_icon_technician}              //tbody/tr[1]/td[1]/span[1]/div[1]
${Profile_Button}                               //div[@data-testid="profile-avatar"]
${Sign_out}                                     //div[@data-testid="sign-out-menu"]                                                                   

# User Management/Create new user
# SMT_005_Verify Drivs Web
${user_management_input_searchUser}            //input[@placeholder='Search']
${username_create_new_user_edit}               010E6945
${user_password_create_new_user_edit}          xpath=0894887155
${user_management_btn_login}                   xpath=//button[contains(text(),'Login')]
${user_management_popup_logout}                xpath=//div[contains(text(),'pp')]                                                                            
${user_management_search_gantt}                xpath=//body/div[@id='root']/div[1]/div[1]/div[1]/div[1]/div[3]/div[3]
${user_management_search_userpage}             xpath=//tbody/tr[1]/td[9]//*[name()='svg']
${user_management_kebab_userpage}              xpath=//li[@role='menuitem']
${user_management_btn_edituser}                xpath=//button[@id='edit-user-button']
${user_management_input_editname}              xpath=//input[@id='name']                                                                                        
${user_management_locator_nameedit}            xpath=//p[contains(text(),'robotframework ')]
${user_management_btn_addSkill}                xpath=//button[normalize-space()='Add Skill']
${user_management_btn_installation_staffs}     xpath=//label[@data-testid='installation-for-assurance-staffs']//div[@class='css-w0fefz']//*[name()='svg']
${user_management_click_corporate_Ticket}      xpath=//label[@data-testid='corporate-ticket']
${user_management_btn_Add}                     xpath=//button[normalize-space()='Add']
${user_management_btn_savepageuser}            xpath=//button[normalize-space()='Save']
${user_management_locator_toastadd}            xpath=//body/div[@id='react-toast']/span[6]
${user_management_button_clear}                xpath=//button[normalize-space()='Clear']
${user_management_before_kabab}                xpath=//tbody/tr[1]/td[9]/*[1]
${user_management_view_kabab}                  xpath=//li[contains(text(),'View')]
${user_management_search_staff}                xpath=//span[contains(text(),'Testautomate')]


# Map Locator
# SMT 003 Map
${txt_nam_task}    //p[@class='css-1v0e9rj']
${btn_login}    //button[contains(text(),'Login')]
${link_monitor_list}    //div[contains(text(),'Monitor List')]
${task_management_map_link_map}                         //div[contains(text(),'Map')]
${task_management_map_textbox_scratch_team}             //input[@id='team-filter']
${task_management_map_textbox_scratch_teamv2}           //body/div[@id='root']/div[1]/div[2]/div[2]/div[2]/div[2]/div[1]/div[1]/div[1]/div[1]/div[2]/div[2]/div[1]/div[1]/div[1]/div[1]/div[1]/input[1]
${task_management_map_txt_scratch_team}                 //span[@class='site-tree-search-value']
${task_management_map_dropdown_search}                  //body/div[@id='root']/div[1]/div[2]/div[2]/div[2]/div[2]/div[1]/div[1]/div[1]/div[1]/div[1]/div[2]/div[2]/div[1]/div[1]    
${task_management_map_dropdown_search_technician}       //li[contains(text(),'Technician name')]
${task_management_map_dropdown_search_requestno}        //li[contains(text(),'Request No.')]  
${task_management_map_dropdown_search_serviceno}        //li[contains(text(),'Service No.')]      
${task_management_map_textbox_scratch_map}              //body/div[@id='root']/div[1]/div[2]/div[2]/div[2]/div[2]/div[1]/div[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/input[1]
${task_management_map_icon_task_detail}                 //div[@class='css-x76z8a']//*[name()='svg']
${task_management_map_txt_request_no}                   //div[@class='css-1kogm1t']//div[2]//div[2]//div[2]
${task_management_map_icon_cross}                       //header/div[2]/*[1]
${task_management_map_txt_task_detail}                  //body/div[@id='root']/div[1]/div[2]/div[2]/div[2]/div[1]/div[2]/div[1]
${task_management_map_page_map}                         //body/div[@id='root']/div[1]/div[2]/div[2]/div[2]/div[2]/div[2]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/div[2]/div[2]
${task_management_map_icon_pin_map}                     //*[@id="root"]/div/div[2]/div[2]/div[2]/div[2]/div[2]/div/div/div/div[2]/div/div/div/div[2]/div[2]/div/div[3]/div/div/div/div/div[1]
${task_management_map_icon_kabab_reassign}              //div[@class='actions hover css-aghes1-TaskDetail']//*[name()='svg']
${task_management_map_link_reassign}                    //li[normalize-space()='Reassign']
${task_management_map_pange_reassign}                   //p[contains(text(),'Select appointment date and time to assign')]

# Team management/Create Team, Edit, Create sub, Delete
# SMT_008_TeamManagement
${team_management_btn_create_team}                   xpath=//button[normalize-space()='Create Team']
${team_management_team_type_company}                 xpath=//*[contains(text(),'Company')]
${team_management_team_type_subteam}                 xpath=//*[contains(text(),'Subcontractor Team')]
${team_management_depocode_locator}                  xpath=//input[@placeholder='Enter Depot code']
${team_management_areaid}                            xpath=//p[normalize-space()='57011800B002']
${team_management_select_multiple_locator}           xpath=//*[contains(text(),'Select multiple')]
${team_management_task_type_install_ftth_locator}    xpath=//li[normalize-space()='INSTALL_FTTH']
${team_management_click_install_ftth_locator}        xpath=//*[contains(text(),'INSTALL_FTTH')]
${team_management_btn_addarea}                       xpath=//button[normalize-space()='Add Area']
${team_management_btn_create_new_team}               xpath=//button[normalize-space()='Create']
${team_management_search_field}                      xpath=//input[@class='css-a4ckow']
${team_management_click_team_name}                   xpath=//*[@id="team-list-container"]/div[1]/div/div/div/div/div[2]/p/span
${team_management_kebub_team_list}                   xpath=//div[@class='css-1jishp8']
${team_management_btn_save_edit_team}                xpath=//*[contains(text(),'Save')]
${team_management_btn_edit}                          xpath=//*[contains(text(),'Edit team')]
${team_management_team_parent_subt}                  xpath=//*[contains(text(),'TestTeamName')]
${team_management_subc_team}                         xpath=//*[@id="team-list-container"]/div[1]/div/div/div[2]
${team_management_kebub_subc_team}                   xpath=//div[@class='css-1jw6nbm']//div[@class='css-1jishp8']
${team_management_kebub_delete}                      xpath=//*[contains(text(),'Delete team')]
${team_management_btn_delete}                        xpath=//button[normalize-space()='Delete']
${team_management_btn_cancel}                        xpath=//button[normalize-space()='Cancel']
${team_management_kebub_comp_team}                   xpath=//div[@class='css-udicqw']//div[@class='css-1jishp8']
${team_management_comp_team}                         xpath=//*[@id="team-list-container"]/div[1]/div/div/div
${team_management_tostLocator_CreateSuccess}         xpath=//*[@id="react-toast"]/span[6]/div/div/div/div/div/div[2]/div[1]
${team_management_tostLocator_EditSuccess}           xpath=//*[@id="react-toast"]/span[6]/div/div/div/div/div/div[2]/div[1]
${team_management_tostLocator_DeleteSuccess}         xpath=//*[@id="react-toast"]/span[6]/div/div/div/div/div/div[2]/div[1]

# Log out
${Profile_Button}    //div[@aria-label='pp peckypocky']
${Sign_out}          //p[@class='css-1fhw24d']
# Gantt/Create Manual task
# SMT 009 Create Manual task
${time}
${task_management_gantt_btn_createtask}                xpath=//button[contains(text(),'Create Task')]
${task_management_gantt_btn_create}                    xpath=//button[normalize-space()='Create']
${task_management_gantt_txt_topic}                     xpath=//input[@id='topic']
${task_management_gantt_select_task}                   xpath=//*[contains(text(),'Select task types')]
${task_management_gantt_scroll_tark}                   xpath=//li[normalize-space()='Zone Fix FTTH Order Reason code (60 นาที)']
${task_management_gantt_pick_task}                     xpath=//*[contains(text(),'Zone Fix FTTH Order Reason code (60 นาที)')]
${task_management_gantt_select_areaname}               xpath=//*[contains(text(),'Select area name or code')]
${task_management_gantt_scroll_area}                   xpath=//li[normalize-space()='พระบรมมหาราชวัง (100101020002)']
${task_management_gantt_pick_area}                     xpath=//*[contains(text(),'พระบรมมหาราชวัง (100101020002)')]
#${task_management_gantt_scroll_area}                   xpath=//li[normalize-space()='กัลปพฤกษ์ ซิตี้พลัส (700101000001)']
#${task_management_gantt_pick_area}                     xpath=//*[contains(text(),'กัลปพฤกษ์ ซิตี้พลัส (700101000001)')]
${task_management_gantt_select_time}                   xpath=//*[contains(text(),'SELECT TIME')]
${task_management_gantt_pick_time1}                    xpath=//input[contains(@class,'ant-time-picker-input')]
${task_management_gantt_click_checkbox}                xpath=//div[@class='css-1avuby0']//*[name()='svg']
${task_management_gantt_modal_confirm}                 xpath=//header[@id='modal-5-header']
${task_management_gantt_btn_confirm}                   xpath=//button[normalize-space()='Confirm']
${task_management_gantt_toast_success}                 xpath=//span[@class='Toaster__manager-bottom-right']                         
${task_management_gantt_click_text_search}             xpath=//input[@id='staffSearchText']
${task_management_gantt_click_team_filter}             xpath=//input[@id='team-filter']
${task_management_gantt_click_search}                  xpath=//input[@class='css-1ac7vef']
#${task_management_gantt_pick_team}                     xpath=//p[@class='css-13iidds']
${task_management_gantt_pick_team}                     xpath=//*[contains(text(),'Rung Team')]
${task_management_gantt_click_detail_tab_gantt}        xpath=//div[@class='css-7pf6at']
${task_management_gantt_click_tab_moniotorlist}        xpath=//div[normalize-space()='Monitor List']
${task_management_gantt_scroll_monitor_list}           xpath=//thead/tr[1]/th[44]/span[1]/*[1]
${task_management_gantt_click_kebab}                   xpath=//tbody/tr[@role='row']/td//*[name()='svg']
${task_management_gantt_click_delete}                  xpath=//li[normalize-space()='Delete']
${task_management_gantt_btn_confirm}                   xpath=//button[normalize-space()='Confirm']
${task_management_gantt_click_task_tab_monitorlist}    xpath=//td[35]
${task_management_gantt_click_close_task_detail}       xpath=//header/div[2]/*[1]
${task_management_gantt_profile_button}                xpath=//div[@aria-label='pp peckypocky'] 
${task_management_gantt_sign_out}                      xpath=//p[@class='css-1fhw24d']                                              

# Team management/Create Team
# SMT_008_TeamManagement
${btn_Create_Team}                     //button[normalize-space()='Create Team']
${team_Type_company}                  //*[contains(text(),'Company')]
${DepoCode_Locator}                   //input[@placeholder='Enter Depot code']
${AreaID}                             //p[normalize-space()='57011800B002']
${Select_multiple_Locator}            //*[contains(text(),'Select multiple')]
${Task_type_INSTALL_FTTH_Locator}     //li[normalize-space()='INSTALL_FTTH']
${Click_INSTALL_FTTH_Locator}         //*[contains(text(),'INSTALL_FTTH')]
${btn_Addarea}                        //button[normalize-space()='Add Area']
${btn_Create}                         //button[normalize-space()='Create']
${Search_Field}                       //input[@class='css-a4ckow']
${Click_Team_name}                    //*[@id="team-list-container"]/div[1]/div/div/div/div/div[2]/p/span
${Kebub_Team_list}                    //div[@class='css-1jishp8']
${btn_Save_Edit_Team}                 //*[contains(text(),'Save')]
${btn_Edit}                           //*[contains(text(),'Edit team')]
${team_parent_subT}                   //*[contains(text(),'TestTeamName')]
${Subc_Team}                          //p[@class='css-h9irbs']
${Kebub_subc_team}                    //div[@class='css-1jw6nbm']//div[@class='css-1jishp8']
${Kebub_Delete}                       //*[contains(text(),'Delete team')]
${btn_Delete}                         //button[normalize-space()='Delete']
${btn_Cancel}                         //button[normalize-space()='Cancel']
${Kebub_comp_team}                    //div[@class='css-udicqw']//div[@class='css-1jishp8']
${comp_team}                          //p[@class='css-1mbxbm3']
${element_task_management}      //div[contains(text(),'Task management')]
${Btn_createtask}               //button[contains(text(),'Create Task')]
${element_gantt}                //p[contains(text(),'Gantt')]
${Btn_create}                   //button[normalize-space()='Create']
${select_task}                  //*[contains(text(),'Select task types')]
${scroll_tark}                  //li[normalize-space()='Zone Fix FTTH Order Reason code (60 นาที)']
${pick_task}                    //*[contains(text(),'Zone Fix FTTH Order Reason code (60 นาที)')]
${select_areaname}              //*[contains(text(),'Select area name or code')]
${scroll_area}                  //li[normalize-space()='พระบรมมหาราชวัง (100101020002)']
${pinck_area}                   //*[contains(text(),'พระบรมมหาราชวัง (100101020002)')]
${select_time}                  //*[contains(text(),'SELECT TIME')]
${pick_time1}                   //input[contains(@class,'ant-time-picker-input')]
${pick_time}                    //li[normalize-space()='${time}']
${click_checkbox}               //div[@class='css-1avuby0']//*[name()='svg']
${modal_confirm}                //header[@id='modal-5-header']
${btn_confirm}                  //button[normalize-space()='Confirm']
${toast_success}                //span[@class='Toaster__manager-bottom-right']    
${wait_data}                    //p[@class='css-ov20ov']
${click_text_search}            //input[@id='staffSearchText']
${click_team_filter}            //input[@id='team-filter']
${click_search}                 //input[@class='css-1ac7vef']
${pick_team}                    //p[@class='css-13iidds']
${click_detail_tab_gantt}       //div[@class='css-7pf6at']
${click_tab_moniotorlist}       //div[normalize-space()='Monitor List']
${btn_export}                   //button[normalize-space()='Export']
${click_kebab}                  //tbody/tr[@role='row']/td//*[name()='svg']
${click_delete}                 //li[normalize-space()='Delete']
${btn_confirm}                  //button[normalize-space()='Confirm']
${click_task_tab_monitorlist}   //td[35]
${click_close_task_detail}      //header/div[2]/*[1]

# Shift Management
# SMT_006_Shift Management
${shift_management_field_username}         id=username
${shift_management_field_password}         id=password
${shift_management_btn_login}              //button[contains(text(),'Login')] 
${shift_management_ele_tabShift}           //body/div[@id='root']/div[1]/div[1]/div[1]/div[1]/div[3]/div[5]
${shift_management_field_search}           //input[@placeholder='Search']
${shift_management_btn_createNewShift}     //button[contains(text(),'Create Shift')]
${shift_management_field_shiftName}        //input[@placeholder='Shift name']
${shift_management_ele_startTime}          //div[@class='css-6bq3tl']//input[@placeholder='Select time']
${shift_management_ele_selectStartTime}    //li[normalize-space()='13']
${shift_management_ele_endTime}            //div[@class='css-1ttywp7']//input[@placeholder='Select time']
${shift_management_ele_selectEndTime}      //li[normalize-space()='20']
${shift_management_ele_colors}             //label[@class='css-11r4hjf']//span[@class='css-z7lnx4']
${shift_management_btn_create}             //button[contains(text(),'Create')]
${shift_management_kabab}                  //tbody/tr[1]/td[6]/*[1]
${shift_management_ele_edit}               //li[normalize-space()='Edit Shift']
${shift_management_btn_save}               //button[contains(text(),'Save')]
${shift_management_btn_delete}             //li[contains(text(),'Delete Shift')]
${shift_management_btn_confirmDelete}      //button[contains(text(),'Delete')]
${shift_management_radio_oncall}           //label[@class='css-86ykm7']//div[@type='radio']
${shift_management_radio_normal}           //label[@class='css-jwmyb8']//span[@class='css-z7lnx4']
${shift_management_btn_cancel}             /button[contains(text(),'Cancel')]
${shift_management_btn_clear}              //button[contains(text(),'Clear')]
${shift_management_ele_shiftName}          //div[contains(text(),'Shift name')]
${shift_management_ele_normal}             //body/div[@id='root']/div[1]/div[2]/div[2]/div[1]/div[1]/div[2]/div[2]/div[1]/div[1]/label[1]/input[1]
${shift_management_ele_selectMinute}       //li[contains(text(),'30')]
${shift_management_ele_profile_signout}    //body/div[@id='root']/div[1]/div[2]/div[1]/div[1]/div[1]/div[3]/div[2]
${shift_management_ele_signout}            //p[contains(text(),'Sign out')]
${shift_management_ele_hourTime}           xpath://ul//li
${shift_management_ele_hourStart}          //li[normalize-space()='00']
${shift_management_ele_hourEnd}            //li[normalize-space()='23']
${shift_management_ele_valueStartTime}     //div[@class='css-6bq3tl']//input[@placeholder='Select time']
${shift_management_ele_valueEndTime}       //div[@class='css-1ttywp7']//input[@placeholder='Select time']
${shift_management_ele_nameError}          //p[contains(text(),'This field is required')]
${shift_management_ele_endtimeError}       //p[contains(text(),"Can't use equal start time.")]
${shift_management_ele_starttimeError}     //p[contains(text(),"Can't use equal end time.")]

#Monitor List Main Locator
#SMT_004_Monitor_List
${monitor_list_field_username}             id=username
${monitor_list_field_password}             id=password
${monitor_list_btn_login}                  xpath=//button[contains(text(),'Login')]
${monitor_list_field_search_team}          xpath=//body/div[@id='root']/div[1]/div[2]/div[2]/div[2]/div[2]/div[2]/div[1]/div[1]/div[1]/div[2]/div[2]/div[1]/div[1]/div[1]/div[1]/div[1]/input[1]
${monitor_list_element_clear_data}         xpath=//p[contains(text(),'Clear')]
${monitor_list_element_subcon_team}        xpath=//input[@id='team-filter']
${monitor_list_element_date}               xpath=//body/div[@id='root']/div[1]/div[2]/div[2]/div[2]/div[2]/div[2]/div[1]/div[1]/div[1]/div[3]/div[2]/span[1]/span[1]
${monitor_list_element_previous_mounth}    xpath=//body/div[@id='root']/div[1]/div[2]/div[2]/div[2]/div[2]/div[2]/div[1]/div[1]/div[1]/div[3]/div[2]/span[1]/span[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/a[2]
${monitor_list_element_date_17}            xpath=//body[1]/div[1]/div[1]/div[2]/div[2]/div[2]/div[2]/div[2]/div[1]/div[1]/div[1]/div[3]/div[2]/span[1]/span[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[2]/div[2]/table[1]/tbody[1]/tr[3]/td[6]
${monitor_list_elemnet_kebab}              xpath=//tbody/tr[@role='row']/td//*[name()='svg']
${monitor_list_scroll_right}               xpath=//thead/tr[1]/th[44]/span[1]/*[1]
${monitor_list_input_search}               xpath=//body/div[@id='root']/div[1]/div[2]/div[2]/div[2]/div[2]/div[2]/div[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/input[1]
${monitor_list_select_search}              xpath=//body/div[@id='root']/div[1]/div[2]/div[2]/div[2]/div[2]/div[2]/div[1]/div[1]/div[1]/div[1]/div[2]/div[2]/div[1]/div[1]/span[1]/i[1]/*[1]
${monitor_list_select_team}                xpath=//body/div[@id='root']/div[1]/div[2]/div[2]/div[2]/div[2]/div[2]/div[1]/div[1]/div[1]/div[2]/div[2]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/div[1]/div[1]
${monitor_list_select_request_no}          xpath=//li[contains(text(),'Request No.')]
${monitor_list}                            xpath=//div[contains(text(),'Monitor List')]
${monitor_list_element_reassign}           xpath=//li[contains(text(),'Reassign')]
${monitor_list_txt_appoint_date}           xpath=//p[contains(text(),'Appointment date')]
${monitor_list_element_fillters}           xpath=//body/div[@id='root']/div[1]/div[2]/div[2]/div[2]/div[2]/div[2]/div[1]/div[2]/div[1]/div[2]/button[1]
${monitor_list_status_fillters}            xpath=//body[1]/div[3]/div[2]/div[2]/section[1]/div[1]/div[1]/div[6]/div[1]/div[2]/div[1]/div[1]/div[1]
${monitor_list_txt_fillters}               xpath=//p[contains(text(),'Filters')]
${monitor_list_btn_apply}                  xpath=//button[contains(text(),'Apply')]
${monitor_list_txt_reaasign}               xpath=//p[contains(text(),'Assign technician to task AccNoHSI34981735-2303178')]
${monitor_list_btn_reaasign}               xpath=//li[contains(text(),'Reassign')]
${monitor_list_btn_pop_up_cancel}          xpath=//button[contains(text(),'Cancel')]

# Team Management
# SMT_007_Team Shift
${team_management_btn_tab_teamshift}    xpath=//div[normalize-space()='Team Shift']
${team_management_list_team}    xpath=//div[@class='List']
${team_management_list_benzteam}    xpath=//p[@class='css-1mbxbm3'][normalize-space()='benzteamss']
${team_management_search_team_teamshift}    //input[@class='css-a4ckow']
${team_management_txt_teamname}    xpath=//p[@class='css-yhv14u']
${team_management_search_technician_teamshift}    xpath=//input[@class='css-1aa2oxq-InputBase']
${team_management_btn_slotshift_t+4}    xpath=//tbody/tr[1]/td[7]
${team_management_select_shift}    xpath=//div[contains(text(),'Select Shift')]
${team_management_shift_06:00-20:00}    xpath=//li[normalize-space()='06:00 -  20:00']
${team_management_btn_assign_shift}    xpath=//button[contains(text(),'Assign')]
${team_management_kebab_shift}    //div[@class='css-xg1t0f']//div//div[@class='css-0']//*[name()='svg'] 
${team_management_btn_kebab_remove_shift}    //div[contains(text(),'Remove Shift')]
${team_management_txt_remove_shift}    //p[contains(text(),'Remove Shift')]
${team_management_btn_remove_shift}    //button[contains(text(),'Remove')]
${team_management_toast_shift}    //span[@class='Toaster__manager-bottom-right']

# Team Management
# SMT_010_Approval
${team_management_btn_login}    //button[contains(text(),'Login')]
${team_management_path_btn_login}    id=username
${team_management_path_btn_password}    id=password
${team_management_txt_TaskManagement}    //div[contains(text(),'Task management')]
${team_management_tab_TeamManagement}    //body/div[@id='root']/div[1]/div[1]/div[1]/div[1]/div[3]/div[4]/div[1]/*[1]
${team_management_path_list_team}    //div[@class='List']
${team_management_path_search_team_approver}    //input[@class='css-a4ckow']
${team_management_path_team_benzteam}    //p[@class='css-1mbxbm3'][normalize-space()='benzteamss']
${team_management_btn_add_approver}    //button[normalize-space()='Add Approver']
${team_management_txt_approvelTeam}    //div[normalize-space()='Approval Team']
${team_management_search_user_approver}    (//input[@placeholder='Search'])[3]
${team_management_btn_checkbox_approver}    //div[@class='css-w0fefz']
${team_management_btn_>_approver}    //div[@class='css-1772sct']//*[name()='svg']
${team_management_btn_next_approver}    //button[normalize-space()='Next']
${team_management_checkbox_request_assistance}    //tbody/tr[1]/td[2]/span[1]/label[1]/div[1]/*[1]
${team_management_checkbox_order_return}    //tbody/tr[1]/td[3]/span[1]/label[1]/div[1]/*[1]
${team_management_checkbox_leave_request}    //tbody/tr[1]/td[4]/span[1]/label[1]/div[1]/*[1]
${team_management_btn_add_member_approver}    //button[normalize-space()='Add']
${team_management_toast_approve}    //body/div[@id='react-toast']/span[6]
${team_management_kebab_approval_team}    //tbody//td[@class='table-column actions']//*[name()='svg']
${team_management_btn_kebab_edit_approval_type}    //li[normalize-space()='Edit approval type']
${team_management_txt_edit_approval_type}    //p[contains(text(),'Edit approval type')]
${team_management_checkbox_leave_request_edit}    //div[1]//label[1]//div[1]
${team_management_checkbox_request_assistance_edit}    //div[3]//label[1]//div[1]
${team_management_btn_edit_approval_type}    //button[normalize-space()='Edit']
${team_management_btn_kebab_remove_approver}    //li[normalize-space()='Remove approver']
${team_management_btn_remove_approver}    //button[normalize-space()='Remove']
${team_management_txt_remove_approver}    //h2[normalize-space()='Remove approver']
