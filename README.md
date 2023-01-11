# Inventory.ai
A Flutter Project - Cloud Inventory management app

A complete cloud web and Mobile app for Managing Inventory for custom order & schedules.

```diff
- If you like this project, please consider giving it a star (*) and follow me at GitHub & YouTube.
```
[<img src="https://github.com/AmitXShukla/AmitXShukla.github.io/blob/master/assets/icons/youtube.svg" width=40 height=50>](https://youtube.com/@amit.shukla)
[<img src="https://github.com/AmitXShukla/AmitXShukla.github.io/blob/master/assets/icons/github.svg" width=40 height=50>](https://github.com/AmitXShukla)
[<img src="https://github.com/AmitXShukla/AmitXShukla.github.io/blob/master/assets/icons/medium.svg" width=40 height=50>](https://medium.com/@Amit_Shukla)
[<img src="https://github.com/AmitXShukla/AmitXShukla.github.io/blob/master/assets/icons/twitter_1.svg" width=40 height=50>](https://twitter.com/ashuklax)

## Getting Started

This project is a community version and is absolutely free for private use.<br/>
<a href="https://www.youtube.com/playlist?list=PLp0TENYyY8lHcc8mZiYG83sbsCea2xd3r">click here for Demo & Video tutorials</a>

## Technologies
```sbtshell)
Frontend: Flutter
Backend: Firebase
```

## Related Apps
<ul>
<li><a href="https://github.com/AmitXShukla/Healthcare-Management-App-Flutter_Firebase">Healthcare Management app using Flutter</a></li>
<li><a href="https://getcovidvaccine.web.app/">Vaccine Distribution App</a></li>
<li><a href="https://www.youtube.com/watch?v=MkV413X2Kmw&list=PLp0TENYyY8lHL-G7jGbhpJBhVb2UdTOhQ&index=1&t=698s">Pandemic Contact Tracing, Visitor Management, Mobile Assets/Employee Attendance App</a></li>
<li><a href="https://github.com/AmitXShukla/ERP-Apps-CRM-Cloud-Angular_Firebase">CRM Cloud App</a></li>
</ul>


## Features
<ul>
  <li>Store millions of records with lightening fast data retrieval</li>
	<li>Live | real time inventory monitoring</li>
	<li>Match Exception processes</li>
	<li>Inventory sync</li>
	<li>Advance AI Predictive ML Analytics</li>
	<li>Real time Analytics</li>
	<li>Multi user, multi role, multi-device (web, mobile & desktop)</li>
	<li>Camera, hand held, AI counting, picture recognition, QR Code reader</li>
	<li>Paperless documentation, receipt, invoice & payments</li>
	<li>Working with Flutter UI, Material 3 design</li>
	<li>Social Authentication & Role based access, secured app</li>
	<li>complete customizable UI + CRUD</li>
	<li>Live Charts</li>
	<li><h4>AI Features</h4></li>
	<li>Phone/Handheld QR Code | Bar Code scan</li>
	<li>Phone auth, real time notifications, live alerts, SMS, EMAIL, WhatsAPP API (Pro)</li>
	<li>2 -way authentication</li>
	<li>Live Approval workflow</li>
	<li>Payment API</li>
	<li>Live customer support chat | call | channel communications</li>
	<li>Doc sign</li>
	<li>Product Image recognition</li>
	<li>Vehicle license plate reader</li>
	<li>Employee Scan | time punching</li>
</ul>
<i>send email to info@elishcosulting.com for Pro version enquiries.</i>

## Product Images

## How to Install

<ul>
    <li>Install Flutter environment</li>
    <li>Download This GitHub repository</li>
    <li>install Flutter packages *pub get) and Flutter web -> Flutter create .</li>
    <li>Setup firebase account/project</li>
    <li>Copy Firebase Project Config settings and replace variable firebaseConfig at src/web/index.html</li>
    <li>enable Firebase social authentications</li>
    <li>update Firebase Rules</li>

```sbtshell
    rules_version = '2';
    service cloud.firestore {
    match /databases/{database}/documents {
    match /{document=**} {
      allow read, write: if false;
    }
    match /roles/{document} {
    // fix this, anyone who is logged in, can read these document & passwords
    //  allow read: if isSignedIn();
  	allow read, write: if false;
    }
    
    match /users/{document} {
    allow create: if true;
    allow read : if isSignedIn() && (isDocOwner() || isAdmin());
    allow update: if isSignedIn() && isDocOwner() && onlyContentChanged();
    allow update, delete: if isAdmin();
    }
    
    match /person/{document=**} {
    allow create: if true;
    allow read, update : if isSignedIn() && (isDocOwner() || isAdmin());
    allow delete : if isSignedIn() && isAdmin();
    }
    
    match /person/{document}/Vaccine/{doc=**} {
    allow create: if true;
    // allow read, update : if isSignedIn() && (isDocOwner() || isAdmin());
    // fix this later
    allow read, update : if true;
    allow delete : if isSignedIn() && isAdmin();
    }
    
    match /person/{document}/OPD/{doc} {
    allow create: if true;
    // allow read, update : if isSignedIn() && (isDocOwner() || isAdmin());
    // fix this later
    allow read, update : if true;
    allow delete : if isSignedIn() && isAdmin();
    }
    
    match /person/{document}/Lab/{doc} {
    allow create: if true;
    // allow read, update : if isSignedIn() && (isDocOwner() || isAdmin());
    // fix this later
    allow read, update : if true;allow read, update : if isSignedIn() && (isDocOwner() || isAdmin());
    allow delete : if isSignedIn() && isAdmin();
    }
    
    match /person/{document}/Rx/{doc} {
    allow create: if true;
    // allow read, update : if isSignedIn() && (isDocOwner() || isAdmin());
    // fix this later
    allow read, update : if true;
    allow delete : if isSignedIn() && isAdmin();
    }
    
    match /person/{document}/Messages/{doc} {
    allow create: if true;
    // allow read, update : if isSignedIn() && (isDocOwner() || isAdmin());
    // fix this later
    allow read, update : if true;
    allow delete : if isSignedIn() && isAdmin();
    }
    
    match /appointments/{document} {
    allow create: if true;
    allow read, update : if isSignedIn() && (isDocOwner() || isAdmin());
    allow delete : if isSignedIn() && isAdmin();
    }
    
    match /records/{document} {
    allow create: if true;
    allow read, update : if isSignedIn() && (isDocOwner() || isAdmin());
    }
    
    match /vaccine/{document} {
    allow create: if true;
    allow read, update : if isSignedIn() && (isDocOwner() || isAdmin());
    }
    
    match /purchase/{document} {
    allow create: if true;
    allow read, update : if isSignedIn() && (isDocOwner() || isAdmin());
    allow delete : if isSignedIn() && isAdmin();
    }
    
		match /msr/{document} {
    allow create: if true;
    allow read, update : if isSignedIn() && (isDocOwner() || isAdmin());
    allow delete : if isSignedIn() && isAdmin();
    }
    
    match /vendor/{document} {
    allow create: if true;
    allow read, update : if isSignedIn() && (isDocOwner() || isAdmin());
    allow delete : if isSignedIn() && isAdmin();
    }
    
    match /warehouse/{document} {
    allow create: if true;
    allow read: if isSignedIn()
    allow update : if isSignedIn() && (isDocOwner() || isAdmin());
    allow delete : if isSignedIn() && isAdmin();
    }
    match /item/{document} {
    allow create: if true;
    allow read: if isSignedIn()
    allow update : if isSignedIn() && (isDocOwner() || isAdmin());
    allow delete : if isSignedIn() && isAdmin();
    }
    
    // helper functions
    function isSignedIn() {
    return request.auth.uid != null;
    }
    
    function onlyContentChanged() {
    return request.resource.data.role == resource.data.role;
    // make sure user is not signing in with any role or changin his role during update
    }
    function isDocOwner() {
    return request.auth.uid == resource.data.author;
    }
    // function isDocCreater() {
    // return request.auth.uid == request.resource.data.author;
    // }
    function isAdmin() {
    return get(/databases/$(database)/documents/users/$(request.auth.uid)).data.role == "admin";
    }
    // function isEmployee() {
    // return get(/databases/$(database)/documents/settings/$(request.auth.uid)).data.role == "employee";
    // }
    }
    }
```
</ul>

![Pic 4](./images/env_variable.png)
![Pic 4](./images/social_auth.png)
![Pic 4](./images/rules.png)

## Flutter material theme
https://github.com/flutter/samples/tree/main/material_3_demo