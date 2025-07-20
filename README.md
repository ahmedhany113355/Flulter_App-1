📱 Smart Life – Flutter Multi-Screen App

Smart Life is a modern, full-featured Flutter application that helps users manage their daily lives through smart account creation, task management, and profile handling—all with persistent local storage and beautiful UI.

This app demonstrates real-world Flutter usage including:

Multi-screen navigation

Data persistence using SharedPreferences

Animations and transitions

Dynamic task lists

Styled user interfaces with responsive layouts



---

🧩 Key Features

🚀 Splash screen with animation

🧑 Account creation form

🔐 Local storage with SharedPreferences

📱 Bottom navigation bar (Home / Tasks / Profile)

📂 Drawer navigation + logout

✅ Task creation, completion, and deletion

🎨 Animated and styled UI

🔁 Real-time data flow between screens



---

📷 App Screenshots

1️⃣ Splash Screen – Welcome


A clean and animated splash screen using AnimatedTextKit, with a "Create Account" button that navigates to the account setup page.


---

2️⃣ Account Creation Screen


A fully designed form with fields for:

First Name

Last Name

Email

Job Title

Address

Gender (Radio Buttons)


Upon clicking Save Account, user data is stored using SharedPreferences, then redirected to the Home screen.


---

3️⃣ Home Tab


Displays a personalized greeting using the full name from SharedPreferences, and shows a network image with a neat layout using Card, Text, and Container widgets.


---

4️⃣ Tasks Tab


Users can:

Add new tasks

View them in a styled list

Mark them as complete (strikethrough)

Delete tasks with a single tap


Tasks are stored temporarily in memory using List<String> and refreshed on UI.


---

5️⃣ Profile Tab


Displays all account information including name, email, job, etc., plus a list of completed tasks only.
Smooth animations (e.g., FadeTransition) are used to make the data appear nicely.


---

6️⃣ Drawer Navigation


Provides quick access to:

Tasks screen

Profile screen

Logout button (clears SharedPreferences and returns to the splash screen)



---

7️⃣ Logout Flow


Upon pressing Logout, all stored data is cleared, and the user is taken back to the splash screen, simulating a full logout.


---
These are the pictures of the application
![image](C:\Users\ahmed\Pictures\Screenshots\7\1.png)
![image](C:\Users\ahmed\Pictures\Screenshots\7\2.png)
![image](C:\Users\ahmed\Pictures\Screenshots\7\3.png)
![image](C:\Users\ahmed\Pictures\Screenshots\7\4.png)
![image](C:\Users\ahmed\Pictures\Screenshots\7\5.png)
![image](C:\Users\ahmed\Pictures\Screenshots\7\6.png)
![image](C:\Users\ahmed\Pictures\Screenshots\7\7.png)