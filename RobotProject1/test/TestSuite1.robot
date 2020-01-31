*** Settings ***
Library           SeleniumLibrary      

Default Tags      regression 

*** Test Cases ***
    
Go to OrangeHRM site
    [Documentation]                      This is a sample login test
    Open Browser                         ${URL}                                        chrome
    Wait Until Element is Visible        id=frmLogin
    LoginKW
    Wait Until Element is not Visible    id=frmLogin

User should see Dashboard page
    Element should be Visible            class=menu
    Page should contain          	     Quick Launch
    Page should contain          	     Employee Distribution by Subunit
    Page should contain          	     Pending Leave Requests

User can click Admin in menu tabs
    Element should be Visible            class=menu
    Execute Javascript                   document.getElementById("menu_admin_viewAdminModule").click();
    Wait Until Page Contains             System Users
    Element should not be Visible        id=dashboard__employeeDistribution
    

Logout from OrangeHRM site
    Click Element                        id=welcome
    Wait Until Element is Visible        link=Logout
    Click Element                        link=Logout
    Close Browser
    Log                                  Test Completed      
    
*** Variables ***
${URL}                           https://opensource-demo.orangehrmlive.com/  
@{CREDENTIALS}                   Admin             admin123
&{LOGINDATA}                     username=Admin    password=admin123         

*** Keywords ***
LoginKW
    Input Text                   id=txtUsername                                @{CREDENTIALS}[0]
    Input Password               id=txtPassword                                &{LOGINDATA}[password]
    Click Button                 id=btnLogin