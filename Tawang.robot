*** Settings ***
Library SeleniumLibrary

Library  SeleniumLibrary

*** Variables ***
${URL}  https://www.practo.com/tawang/doctors
${LOGIN_XPATH}  //a[text()='Login / Signup']
${NUMBER_XPATH}  //input[@id="username"]
${PASSWORD_XPATH}  //input[@id="password"]
${LOGIN_BUTTON}  //button[@id='login']
${FIRST_DOCTOR_LINK}  //h2[@data-qa-id='doctor_name'][1]/ancestor::a[1]
${SHARE_YOUR_STORY}  //a[@data-qa-id='doctor-give-feedback']
${RECOMMEND_YES_BUTTON}  //div[contains(@class, 'question-card__answer__recommend-yes')]
${SELECT_CLINIC}  //div[contains(@class, 'Select-control')]
${CLINIC_XPATH}  //div[contains(@class, 'Select-menu')]//div[contains(@class, 'Select-option')][2]
${EXPERIENCE_XPATH}  //textarea[contains(@placeholder, 'Start typing here...')]
${NAME_XPATH}  //input[@placeholder='Your Name']
${NUMBER1_XPATH}  //input[@placeholder='Your Phone Number']
${SUBMIT_XPATH}  //span[contains(@class, 'c-feedback-form__submit-text')]
${FEEDBACK}  I had a great experience consulting with the doctor. The interaction was smooth, and the doctor patiently listened to all my concerns. They provided a clear diagnosis and explained the treatment plan in detail, making sure I understood every step. I felt very comfortable and reassured throughout the consultation. The prescribed medication was effective, and I noticed improvement in my condition quickly. The doctor’s friendly approach and expertise made the entire process stress-free. I would highly recommend this doctor to anyone seeking professional and compassionate medical care. Thank you for the excellent service!
#${YES_XPATH}  (//span[text()="Yes"])[2]
${NUMBER}  7981425655
${PASSWORD}  yadav@5655
${name}  CHARAN
${number}  1234567890

*** Test Cases ***
Sharing the feedback for a consulted doctor
    Open Browser  ${URL}  chrome
    Maximize Browser Window
    Login With The Practo Credentials
    Select The First Doctor
    Give Your Opinion About The Dcotor For The Available Questions
    Submit The Feedback
    #Confirm Whether You Want to Overwrite The Previous FeedBack
    Close Browser

*** Keywords ***
Login With The Practo Credentials
    Click Element  ${LOGIN_XPATH}
    Wait Until Element Is Visible  ${NUMBER_XPATH}  10s
    Input Text  ${NUMBER_XPATH}  ${NUMBER}
    Input Text  ${PASSWORD_XPATH}  ${PASSWORD}
    Click Element  ${LOGIN_BUTTON}

Select The First Doctor
    ${doctor_url}  Get Element Attribute  ${FIRST_DOCTOR_LINK}  href
    Go To  ${doctor_url}

Give Your Opinion About The Dcotor For The Available Questions
    Click Element  ${SHARE_YOUR_STORY}
    Wait Until Element Is visible  ${RECOMMEND_YES_BUTTON}  5s
    Click Element  ${RECOMMEND_YES_BUTTON}
    Click Element  ${SELECT_CLINIC}
    Click Element  ${CLINIC_XPATH}
    Input Text  ${EXPERIENCE_XPATH}  ${FEEDBACK}
    Input Text  ${NAME_XPATH}  ${name}
    Input Text  ${NUMBER1_XPATH}  ${number}

Submit The Feedback
    Click Element  ${SUBMIT_XPATH}
    Sleep  5s

#Confirm Whether You Want to Overwrite The Previous FeedBack
 #   Wait Until Element Is Visible  ${YES_XPATH} 10s
  #  Click Element  ${YES_XPATH}
   # Sleep  10s