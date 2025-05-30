
# Project Conversation History

A **Ruby on Rails** application that allows teams to track **project progress, comments, status changes**, and display all interactions in a unified, real-time **conversation timeline**. Managers and developers can collaborate efficiently, while admins oversee everything.

## 🚀 Features

- ✅ **Role-Based Access Control**
  - Admin can manage all projects.
  - Managers can create projects and assign them to developers.
  - Developers can only view and comment on assigned projects.

- ✅ **Project Status Management**
  - Status options: `Pending`, `In Progress`, `Completed`
  - Only **Managers** and **Admins** can change status.

- ✅ **Commenting System**
  - Users can leave comments on assigned projects.
  - Comments cannot be edited or deleted by users.
  - Only **Admins** can delete inappropriate comments.

- ✅ **Unified Conversation Timeline (Activity Feed)**
  - Comments and status changes are merged into a single chronological activity feed per project.
  - Tracks **who** did **what** and **when** for full transparency.

- ✅ **Email Notifications**
  - Users receive email alerts for new comments or project status changes.

- ✅ **Real-Time Updates with ActionCable**
  - The conversation feed auto-updates with new comments and status changes without refreshing the page.

---

## 🧠 What is an Activity?

The app uses an `Activity` model to track:

- 💬 **Comments**  
  Example: _Developer 1 commented: "Please fix the bug"_

- 🔄 **Status Changes**  
  Example: _Manager 1 changed status from "Pending" to "In Progress"_

This allows the conversation feed to serve as a complete **audit trail** and team communication log — all in one place.

---

## 🛠️ Technologies Used

- **Backend**: Ruby on Rails
- **Database**: PostgreSQL
- **Frontend**: Bootstrap
- **Authentication**: Devise
- **Authorization**: Role-based logic (admin, manager, developer)
- **Notifications**: ActionMailer
- **Activity Tracking**: Custom `Activity` model for timeline history

---

## 📜 Installation & Setup

### 1. Clone the Repository

```sh
git clone https://github.com/YOUR_USERNAME/project-conversation-history.git
cd project-conversation-history
````

### 2. Install Dependencies

```sh
bundle install
```

### 3. Set Up Database

```sh
rails db:create db:migrate db:seed
```

### 4. Start the Server

```sh
rails s
```

Visit: [http://localhost:3000](http://localhost:3000)

---

## 🔑 User Roles & Permissions

| Role          | Can Create Project | Assign Projects          | Can Comment | Change Status | Delete Comments |
| ------------- | ------------------ | ------------------------ | ----------- | ------------- | --------------- |
| **Admin**     | ✅                  | ✅ (Assign to anyone)     | ✅           | ✅             | ✅               |
| **Manager**   | ✅                  | ✅ (Assign to developers) | ✅           | ✅             | ❌               |
| **Developer** | ❌                  | ❌                        | ✅           | ❌             | ❌               |

---

## 🧩 Real-Time Activity Timeline

All updates appear instantly in a live feed using **ActionCable**:

* 💬 New comments
* 🔄 Status changes
* ⏱ Timestamped and attributed to the user who performed the action

This ensures every team member sees the most up-to-date context of a project.

---

## 📧 Email Notifications

* Automatically triggered when:

  * A new comment is posted
  * A project’s status is changed

To configure:

* Set SMTP in `config/environments/development.rb` (for local testing)
* Use SendGrid or other SMTP provider in `config/environments/production.rb`

---

## ✅ Seeded Sample Data

Running `rails db:seed` will create:

* 👤 6 users (1 admin, 2 managers, 3 developers)
* 📁 3 sample projects
* 💬 5 comments
* 📜 Activities tracking every comment & initial project status

---

## 📄 License

This project is open-source and available under the **MIT License**.

---
