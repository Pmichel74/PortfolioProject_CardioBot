# 2. Components, Classes, and Database Design - CardioBot

## Table of Contents
- [2.1 Back-end Components and Classes](#21-back-end-components-and-classes)
- [2.2 Database Design](#22-database-design)
- [2.3 Front-end Components](#23-front-end-components)

## 2.1 Back-end Components and Classes

### 2.1.1 Core Domain Classes

#### Conversation Management

**Conversation Model**
- Attributes: user_id, title, is_active, created_at, updated_at
- Methods: get_latest_messages(), mark_as_inactive(), get_duration()

**Message Model**
- Attributes: conversation_id, content, message_type, timestamp, confidence_score
- Methods: is_urgent(), extract_medical_keywords(), mark_action_completed()

#### Appointment Management

**AppointmentRequest Model**
- Attributes: user_id, doctor_id, reason, preferred_date, status, urgency_level
- Methods: calculate_urgency(), send_confirmation_sms()

#### AI and Learning System

**WatsonXService Class**
- Methods: authenticate(), generate_response(), analyze_urgency(), extract_medical_entities()

**LearningData Model**
- Attributes: conversation_id, user_input, bot_response, confidence_score, is_validated
- Methods: validate_response(), add_to_training_set()

**AutoLearningMetrics Model**
- Attributes: date, total_conversations, average_confidence, model_accuracy
- Methods: calculate_daily_metrics(), should_trigger_retraining()

#### User Management

**CustomUser Model**
- Attributes: phone_number, medical_id, is_patient, is_medical_staff, two_factor_enabled
- Methods: generate_2fa_secret(), verify_2fa_token(), send_sms_notification()

**Token Model**
- Attributes: key, user_id, created, expires, is_valid
- Methods: is_expired(), refresh_token()

### 2.1.2 Service Layer Classes

**ConversationService**
- process_user_message(), detect_emergency_keywords(), generate_ai_response()

**AppointmentService**
- search_available_slots(), book_appointment(), send_appointment_reminders()

**NotificationService**
- send_sms(), send_email(), send_emergency_alert()

## 2.2 Database Design

### 2.2.1 Entity Relationship Diagram

```
**Core Tables Relationships:**

- **USERS** (1:N) → **CONVERSATIONS** (1:N) → **MESSAGES**
- **USERS** (1:N) → **APPOINTMENT_REQUESTS**
- **CONVERSATIONS** (1:N) → **LEARNING_DATA**
- **USERS** (1:N) → **TOKENS**
- **USERS** (1:N) → **EMERGENCY_ALERTS**
```

### 2.2.2 Database Schema (PostgreSQL)

#### Main Tables Structure

**users**
- id, username, email, phone_number, medical_id, is_patient, is_medical_staff, two_factor_enabled

**conversations**
- id, user_id (FK), title, is_active, created_at, updated_at

**messages**
- id, conversation_id (FK), content, message_type, timestamp, confidence_score

**appointment_requests**
- id, user_id (FK), doctor_id (FK), reason, preferred_date, status, urgency_level

**learning_data**
- id, conversation_id (FK), user_input, bot_response, confidence_score, is_validated

**emergency_alerts**
- id, user_id (FK), alert_type, message, severity, is_resolved, samu_notified

#### Key Constraints
- Foreign key relationships with CASCADE/SET NULL as appropriate
- Check constraints for status fields and confidence scores
- Unique constraints on usernames, emails, and medical IDs

## 2.3 Front-end Components

### 2.3.1 Main UI Components

#### Chat Interface Components

**ChatInterface**
- Props: conversationId, userId, isEmergency
- State: messages, isTyping, emergencyMode, connectionStatus
- Methods: sendMessage(), handleEmergencyDetection(), establishWebSocketConnection()

**MessageBubble**
- Props: message, isOwn, showTimestamp
- Renders individual messages with appropriate styling for user/bot/emergency types

**EmergencyAlert**
- Props: alertType, severity, message, onAction
- Displays prominent emergency notifications with action buttons (Call SAMU, Emergency Contact)

#### Appointment Management Components

**AppointmentBooking**
- Props: userId, conversationId, urgencyLevel
- State: selectedDate, selectedTime, reason, isLoading
- Methods: searchAvailableSlots(), bookAppointment(), validateBookingData()

**AppointmentCalendar**
- Props: availableSlots, selectedDate, onDateSelect, onTimeSelect
- Interactive calendar showing available/unavailable slots

#### Dashboard Components

**PatientDashboard**
- Props: userId
- State: upcomingAppointments, recentConversations, notifications
- Methods: loadDashboardData(), exportMedicalData()

**AdminDashboard**
- Props: userId, userRole
- State: systemMetrics, learningProgress, emergencyAlerts
- Methods: loadSystemMetrics(), handleEmergencyAlerts()

### 2.3.2 Component Interaction Flow

**Chat Flow:**
User Input → ChatInterface → MessageProcessing → AI Response → UI Update

**Emergency Flow:**
Emergency Detection → SAMU Alert → Real-time Updates → Message Display

**Appointment Flow:**
User Request → Intent Detection → AppointmentBooking → Booking Confirmation → SMS/Email

### 2.3.3 State Management Structure

**AppState includes:**
- auth: user, token, isAuthenticated, twoFactorRequired
- chat: activeConversation, messages, emergencyMode, aiConfidence
- appointments: upcoming, availableSlots, bookingInProgress
- notifications: alerts, unreadCount, emergencyAlerts
- system: connectionStatus, learningMetrics, systemHealth
- ui: theme, language, accessibility, mobileView

### 2.3.4 Component Hierarchy

```
App
├── AuthenticationWrapper (LoginForm, TwoFactorAuth)
├── MainLayout
│   ├── Header (UserMenu, NotificationBell, EmergencyButton)
│   ├── Sidebar (NavigationMenu, QuickActions)
│   └── MainContent
│       ├── ChatInterface (MessageList, MessageInput, EmergencyAlert)
│       ├── AppointmentBooking (AppointmentCalendar, BookingForm)
│       ├── PatientDashboard (AppointmentList, ConversationHistory)
│       └── AdminDashboard (SystemMetrics, EmergencyManagement)
└── Footer (ContactInfo, LegalLinks)
```

This simplified design document provides the essential structure for the CardioBot system, focusing on core components, database relationships, and front-end architecture without excessive code details. 
