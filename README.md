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
[This section will be completed in Unit 9]
### Models
[Add table of models]
### Networking
- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]