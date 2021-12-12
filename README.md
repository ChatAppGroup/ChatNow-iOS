CHATNOW Design Project - README
===

# CHATNOW

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [User Stories & Video Walkthroughs](#user-stories--video-walkthroughs)
3. [Schema](#Schema)

## Overview
### Description
An instant messaging service to send text messages, images, and video recordings over the 'Internet'

### App Evaluation
- **Category:** Social Networking
- **Mobile:** This application would be developed for mobile devices particulary running iOS.
- **Story:** The app lets the user to text/send images to another user of this app.
- **Market:** Anyone can register and use the app 
- **Habit:** The usage of this app depends on the user and his necessity to text to other people.
- **Scope:** This app is initially developed with intention of enabling people to connect instantly. Based on the performance, the app can be integrated with large applications that require chat as an additional feature.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* User sees app icon.
* New users must register to login and access the app.
* Registered users must be able to login.
* User must be able to edit his profile elements like profile picture, user_name, status.
* User should be able to logout.
* User should be able to send messages to another user

**Optional Nice-to-have Stories**

* Uploading images - user should be able to send images to another user
* Users must be able to send videos to each other
* User should be given the option of deleting the conversations
* Adding crash analytics


### 2. Screen Archetypes

* Login 
    * User can Login.
* Register
   * User can create a new account.
* Profile Screen
   * Allows user to upload identifying information.
* Chats Screen
   * Upon successful Login/Reopening of the application,the app shows the different users the current user has messaged.
   * Allows user to compose a new message to selected user.
* Contacts Screen
    * Displays users of the chat application.
    * Allows the current user to initiate a new chat with the selected user.

* Message Screen
   * Shows messages between the current user and the selected user.

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Chats
* Profile


**Flow Navigation** (Screen to Screen)


* Register Screen
 => Login 
* Login Screen
 => Chats
* Chats Screen
 => Contacts
* Contacts Screen
 => Message
* Message Screen
 => Chats
 
## Wireframes!

<img src="https://i.imgur.com/6cn5tpG.jpg" width=600>


### [BONUS] Digital Wireframes & Mockups

<img src="https://imgur.com/oCJuP4C.gif" width=600>

### [BONUS] Interactive Prototype

<img src="https://imgur.com/Meoz9Yj.gif" width=250><br>

## User Stories & Video Walkthroughs


### Sprint 1 User Stories
The following **required** functionality is completed:

- [x] User can Login 
- [x] User can Register
- [x] User can view Profile Screen
- [x] User can view Messages Screen

The following **bonus** functionality is completed:
- [x] User Login or Registration is persistent

### Sprint 1 Video Walkthrough
Here's a walkthrough of implemented user stories:

<img src='https://imgur.com/3uR45vS.gif' title='Video Walkthrough' width='' alt='Video Walkthrough 1' />

### Sprint 2 User Stories
The following **required** functionality is completed:

- [x] User can Access Local Messages
- [x] User can Acess Profile Information
- [x] User can Access Specialized Sign Up Screen


### Sprint 2 Video Walkthrough
Here's a walkthrough of implemented user stories:

<img src='https://imgur.com/06m7o6j.gif' title='Video Walkthrough' width='' alt='Video Walkthrough 2' />


### Sprint 3 User Stories
The following **required** functionality is completed:

- [x] User can Access Contacts
- [x] User can Access Conversations
- [x] User can Logout

### Sprint 3 Video Walkthrough
Here's a walkthrough of implemented user stories:

<img src='https://imgur.com/OQ2yBPK.gif' title='Video Walkthrough' width='' alt='Video Walkthrough 3' />


### Sprint 4 User Stories
The following **required** functionality is completed:

- [ ] User can ...

The following **bonus** functionality is completed:
- [ ] User can ...

### Sprint 4 Video Walkthrough
Here's a walkthrough of implemented user stories:

<img src='' title='Video Walkthrough' width='' alt='Video Walkthrough 4' />


## Schema 

### Models
| Property	| Type | Description |
|-----------|------|----------------|
| Conversation ID | String | Unique ID for the text |
| Sender ID	| String | The person’s ID who sends the message |
| Message | String | The message being sent |
| Sent date | String | The date/time of message |
| Message Kind | String | The type of the message |
| isRead | Bool | Flag showing the status of message |
| Receiver ID |	String |The person’s ID who receives the message |

### Networking
#### List of network requests by screen

   - Login Screen
      - (Read/GET) Query Login details 
         ```swift
          guard let email = emailField.text, let password = passwordField.text,
            !email.isEmpty, !password.isEmpty, password.count >= 6 else {
                alertUserLoginError()
            }

        Auth.auth().signIn(withEmail: email, password: password) {
            [weak self] authResult, error in
             guard let strongSelf = self else { return }
        }

        ```
   - Register Screen
      - (Create/POST) Create a new user
          ```swift
         Auth.auth().createUser(withEmail: email, password: password) { 
             authResult, error in
             //TODO: Upon creating user
         }

         ```
   - Profile Screen
      - (Read/GET) Query User Information
          ```swift
         handle = Auth.auth().addStateDidChangeListener { 
                auth, user in     
                if Auth.auth().currentUser != nil {
                  // User is signed in.
                  // ...
                } else {
                    
                }
    
          ```
         
                  

      - (Update/PUT) Update user profile image
       ```swift
          let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                                          
       ```                                                
   - Chats Screen
      - (Read/GET) Query sender for each conversation ID
      ```swift
         let userInfo = Auth.auth().currentUser?.providerData[indexPath.row]

      ```
      - (Read/GET) Query conversations for Reciever IDs
      ```swift
         let userInfo = Auth.auth().currentUser?.providerData[indexPath.row]

      ```
   - Contacts Screen
      - (Read/GET) Query all users other than logged in user (sender ID)
      ```swift
         let receiverID = Auth.auth().currentUser?.providerData[indexPath.row]

      ```
      - (Create/POST) Create a new conversation
      ```swift
          let createConversation = Auth.auth().currentUser?.createProfileChangeRequest()

      ```
      - (Read/GET) Query conversations with contacts
      ```swift
         let conversationID = Auth.auth().currentUser?.providerData[indexPath.row]

      ```
   - Message Screen
      - (Read/GET) Query all messages in a conversation
      ```swift
        let messageID = Auth.auth().currentUser?.providerData[indexPath.row]
        
      ```
      - (Create/POST) Create a new message
      ```swift
         let createMessageID = Auth.auth().currentUser?.createProfileChangeRequest()

      ```
      - (Read/GET) Query message isRead status
      ```swift
         let isRead = Auth.auth().currentUser?.providerData[indexPath.row]

      ```
     


