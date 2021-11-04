CHATNOW Design Project - README
===

# CHATNOW

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

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
   - Profile Screen
      - (Read/GET) Query logged in Sender ID
      -          ```swift
         let query = PFQuery(className:"Post")
         query.whereKey("author", equalTo: currentUser)
         query.order(byDescending: "createdAt")
         query.findObjectsInBackground { (posts: [PFObject]?, error: Error?) in
            if let error = error { 
               print(error.localizedDescription)
            } else if let posts = posts {
               print("Successfully retrieved \(posts.count) posts.")
           // TODO: Do something with posts...
            }
         }
         FALSE FALSE FALSE
         ```
      - (Update/PUT) Update user profile image
   - Chats Screen
      - (Read/GET) Query sender for each conversation ID
      - (Read/GET) Query conversations for Reciever IDs
   - Contacts Screen
      - (Read/GET) Query all users other than logged in user (sender ID)
      - (Create/POST) Create a new conversation
      - (Read/GET) Query conversations with contacts
   - Message Screen
      - (Read/GET) Query all messages in a conversation
      - (Create/POST) Create a new message
      - (Read/GET) Query message isRead status
     

#### List of network requests by screen
   - Home Feed Screen
      - (Read/GET) Query all posts where user is author
         ```swift
         let query = PFQuery(className:"Post")
         query.whereKey("author", equalTo: currentUser)
         query.order(byDescending: "createdAt")
         query.findObjectsInBackground { (posts: [PFObject]?, error: Error?) in
            if let error = error { 
               print(error.localizedDescription)
            } else if let posts = posts {
               print("Successfully retrieved \(posts.count) posts.")
           // TODO: Do something with posts...
            }
         }
         ```
      - (Create/POST) Create a new like on a post
      - (Delete) Delete existing like
      - (Create/POST) Create a new comment on a post
      - (Delete) Delete existing comment
   - Create Post Screen
      - (Create/POST) Create a new post object
   - Profile Screen
      - (Read/GET) Query logged in user object
      - (Update/PUT) Update user profile image
