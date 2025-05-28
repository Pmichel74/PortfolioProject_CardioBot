# 📱 Mockups - CardioBot

---

## 📋 Overview

This document presents the complete set of mockups and wireframes for the CardioBot application, organized by functional sections.

---

## 1. 🌐 Public Interfaces

### 1.1 🏠 Home Page

```
+--------------------------------------------------+
|                   CardioBot                       |
|                                                  |
|     [About] [Services] [Contact] [Login]         |
|                                                  |
|     +------------------+  +------------------+    |
|     |   For Patients   |  |   For Doctors   |    |
|     +------------------+  +------------------+    |
|                                                  |
|     Book appointments online                     |
|     [       Get Started Now        ]             |
+--------------------------------------------------+
```

### 1.2 🔐 Login Page

```
+--------------------------------------------------+
|                   CardioBot                       |
|                                                  |
|        +--------------------------------+        |
|        |      Login with               |        |
|        |      FranceConnect+           |        |
|        +--------------------------------+        |
|                                                  |
|        +--------------------------------+        |
|        |      Email                    |        |
|        +--------------------------------+        |
|                                                  |
|        +--------------------------------+        |
|        |      Password                 |        |
|        +--------------------------------+        |
|                                                  |
|        [          Login                ]         |
|                                                  |
+--------------------------------------------------+
```

---

## 2. 👤 Patient Interface

### 2.1 📊 Patient Dashboard

```
+--------------------------------------------------+
| CardioBot           Menu ☰             Profile ▾ |
+--------------------------------------------------+
|                                                  |
| Next Appointment                                 |
| +--------------------------------------------+  |
| | Dr. Martin - Cardiologist                  |  |
| | June 15, 2025 - 2:30 PM                   |  |
| +--------------------------------------------+  |
|                                                  |
| Messages (3)                                     |
| +--------------------------------------------+  |
| | - Results available                        |  |
| | - Appointment reminder                     |  |
| +--------------------------------------------+  |
|                                                  |
| Virtual Assistant                               |
| +--------------------------------------------+  |
| | How can I help you today?                  |  |
| +--------------------------------------------+  |
+--------------------------------------------------+
```

### 2.2 📅 Appointment Booking

```
+--------------------------------------------------+
| ← Back                      New Appointment      |
+--------------------------------------------------+
|                                                  |
| Select a practitioner:                          |
| [ Dr. Martin, Cardiologist ▾ ]                  |
|                                                  |
| Select a date:                                  |
| [ Interactive calendar ]                         |
|                                                  |
| Available times:                                |
| ┌──────┐ ┌──────┐ ┌──────┐ ┌──────┐            |
| │ 9:00 │ │10:30 │ │ 2:00 │ │ 4:30 │            |
| └──────┘ └──────┘ └──────┘ └──────┘            |
|                                                  |
| [ Confirm appointment ]                          |
+--------------------------------------------------+
```

---

## 3. 👨‍⚕️ Practitioner Interface

### 3.1 📅 Daily Schedule

```
+--------------------------------------------------+
| Schedule - May 27, 2025                          |
+--------------------------------------------------+
| 09:00 - Mr. Dupont                              |
|        Follow-up consultation                    |
| ------------------------------------------------|
| 10:30 - Mrs. Bernard                            |
|        First consultation                        |
| ------------------------------------------------|
| 02:00 PM - Mr. Martin                           |
|        Exam results                             |
+--------------------------------------------------+
|        [ + New Appointment ]                     |
+--------------------------------------------------+
```

### 3.2 📋 Patient File

```
+--------------------------------------------------+
| File - Jean Dupont                               |
+--------------------------------------------------+
| Info   History   Documents   Prescriptions       |
|                                                  |
| Last visit: 04/15/2025                          |
| Blood pressure: 12/8                            |
| Current treatment:                               |
| - Cardipril 5mg                                 |
| - Aspirin 75mg                                  |
|                                                  |
| [ Add note ]        [ Modify treatment ]         |
+--------------------------------------------------+
```

---

## 4. 🤖 Virtual Assistant

### 4.1 💬 Chat Interface

```
+--------------------------------------------------+
|                    CardioBot                      |
+--------------------------------------------------+
|                                                  |
|  🤖 Hello, what can I do for you?               |
|                                                  |
|  👤 I need an urgent appointment                |
|                                                  |
|  🤖 I can help you. Would you like:             |
|     1. Urgent cardiology appointment            |
|     2. General emergency appointment            |
|                                                  |
| +--------------------------------------------+  |
| | Type your message...              [Send]   |  |
| +--------------------------------------------+  |
+--------------------------------------------------+
```

---

## 5. ⚙️ Administrative Interface

### 5.1 👥 User Management

```
+--------------------------------------------------+
| User Management                                  |
+--------------------------------------------------+
| Search: [ _________________ ]                     |
|                                                  |
| Recent users:                                   |
| ┌────────────────────────────────┐              |
| │ Jean D.  │ Patient    │ ✏️ ❌  │              |
| │ Dr Martin│ Practitioner│ ✏️ ❌  │              |
| │ Marie B. │ Secretary  │ ✏️ ❌  │              |
| └────────────────────────────────┘              |
|                                                  |
| [ + New user ]                                   |
+--------------------------------------------------+
```

### 5.2 📊 Administrative Dashboard

```
+--------------------------------------------------+
| Administrative Dashboard                         |
+--------------------------------------------------+
| Today's Statistics                               |
| ┌─────────────┐ ┌─────────────┐ ┌─────────────┐ |
| │ Appts: 45   │ │ Active: 12  │ │ Waiting: 3  │ |
| └─────────────┘ └─────────────┘ └─────────────┘ |
|                                                  |
| Recent activity                                 |
| - New practitioner added                        |
| - System update completed                       |
| - Daily backup completed                        |
+--------------------------------------------------+
```

---

## 📝 Technical Notes

### 🔧 Implementation Specifications

1. **📱 Responsive Design**
   - Mobile breakpoint: 320px - 768px
   - Tablet breakpoint: 768px - 1024px
   - Desktop breakpoint: > 1024px

2. **🧩 Reusable Components**
   - Standardized headers
   - Action buttons
   - Information cards
   - Form fields

3. **🧭 Navigation**
   - Hamburger menu on mobile
   - Sidebar on desktop
   - Breadcrumbs for deep navigation

---

### ♿ Accessibility

1. **📋 WCAG 2.1 Standards**
   - Minimum contrast 4.5:1
   - Keyboard navigation
   - Explicit labels
   - Alternative texts

2. **🎯 Adaptations**
   - Dark mode
   - Adjustable text size
   - Screen reader support

---

### ⚡ Performance

1. **🎯 Objectives**
   - Loading time < 3s
   - First Paint < 1s
   - Time to Interactive < 5s

2. **🚀 Optimizations**
   - Lazy loading of images
   - Appropriate caching
   - Asset minification

---

*📄 Document generated on 05/27/2025*  
*📋 Version 2.0*
