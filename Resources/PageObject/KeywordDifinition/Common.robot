*** Settings ***
Library             SeleniumLibrary    run_on_failure=None    timeout=30    screenshot_root_directory=..
Library             Collections
Library             Dialogs
Library             String
Library             DateTime
Resource            ../Locator/Locator.robot
Resource            ../TestData/MsgData.robot
Resource            ../TestData/TestData.robot

*** Variables ***
${browser}         Chrome
${url_drivs_uat}          https://uat1.true-e-logistics.com/4pl-web-platform/task-management/gantt
${url_drivs_prod}         https://wfm.true-e-logistics.com/4pl-web-platform/
${HEADLESSMODE}    ${HEADLESSMODE}

*** Keywords ***
Suite Setup UAT
    Common.Open browser to Drivs site UAT
    Common.Set Maxize of browser

Suite Setup PROD
    Common.Open browser to Drivs site PROD
    Common.Set Maxize of browser

Test Setup UAT
    Common.Go to Drivs site main page UAT

Test Setup PROD
    Common.Go to Drivs site main page PROD

Test Teardown
    Common.Capture screen if test fail
    #Common.Clear tab browsers

Suite Teardown
    Common.Close All browser

Open browser to Drivs site UAT
    ${HEADLESSMODE} =    Get Variable Value    ${HEADLESSMODE}
    ${opt}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Run Keyword If    '${HEADLESSMODE}' == 'True'    Call Method    ${opt}    add_argument    --headless
    Open Browser    ${url_drivs_uat}    ${browser}

Open browser to Drivs site PROD
    ${HEADLESSMODE} =    Get Variable Value    ${HEADLESSMODE}
    ${opt}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Run Keyword If    '${HEADLESSMODE}' == 'True'    Call Method    ${opt}    add_argument    --headless
    Open Browser    ${url_drivs_prod}    ${browser}

Go to Drivs site main page UAT
    Go To    ${url_drivs_uat}

Go to Drivs site main page PROD
    Go To    ${url_drivs_prod}
    
Set Maxize of browser
    Maximize Browser Window

Clear tab browsers
    @{window_handle} =    Get Window Handles
    ${total_window} =    Get Length    ${window_handle}
    FOR    ${browser_index}    IN RANGE    ${total_window}    0    -1
        @{total_window_handle} =    Get Window Handles
        ${total_window_count}    Get Length    @{total_window_handle}
        Delete All Cookies
        Run Keyword If    ${total_window_count} > 1    SeleniumLibrary.Close Browser
    END
    
Close All browser
    Close All Browsers

Capture screen if test fail
    Run Keyword If Test Failed    Capture Page Screenshot  

Clear cached
    Execute JavaScript                  window.location.reload(true);
