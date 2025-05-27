# 4. External and Internal APIs Documentation - CardioBot

## Table of Contents
- [4.1 External APIs](#41-external-apis)
- [4.2 Internal API Endpoints](#42-internal-api-endpoints)
- [4.3 API Authentication](#43-api-authentication)
- [4.4 Error Handling](#44-error-handling)

## 4.1 External APIs

### 4.1.1 IBM WatsonX AI API

**Purpose:** Core AI functionality for medical conversation processing and emergency detection

**Why chosen:**
- Specialized in enterprise-grade AI with medical domain expertise
- French language support optimized for medical terminology
- High reliability and GDPR compliance for healthcare data
- Advanced natural language understanding capabilities

**Base URL:** `https://eu-de.ml.cloud.ibm.com/ml/v1-beta/generation/text`

**Authentication:** IBM Cloud IAM token

**Key Endpoints Used:**
- Text generation for conversation responses
- Medical entity extraction
- Urgency analysis for emergency detection

### 4.1.2 Twilio SMS API

**Purpose:** SMS notifications for appointment reminders and emergency alerts

**Why chosen:**
- Reliable SMS delivery with high success rates
- French telecom operator compatibility
- HIPAA compliant for medical communications
- Comprehensive delivery tracking and analytics

**Base URL:** `https://api.twilio.com/2010-04-01/`

**Authentication:** Account SID and Auth Token

**Key Features:**
- SMS sending for appointment confirmations
- Emergency alert notifications to medical staff
- Delivery status tracking

### 4.1.3 FranceConnect+ API

**Purpose:** Secure patient authentication using French government identity system

**Why chosen:**
- Official French government authentication system
- RGPD compliant by design
- High security standards for medical data access
- Seamless integration with French healthcare ecosystem

**Base URL:** `https://fcp.integ01.dev-franceconnect.fr/`

**Authentication:** OAuth 2.0 with PKCE

**Key Features:**
- Secure patient identity verification
- Medical ID integration
- Single sign-on for healthcare services

### 4.1.4 Email Service (SMTP/SendGrid)

**Purpose:** Email notifications and medical document delivery

**Why chosen:**
- Reliable email delivery for medical communications
- Template support for professional medical correspondence
- Delivery tracking and bounce management
- GDPR compliant email handling

**Configuration:**
- SMTP server for basic email functionality
- SendGrid API for advanced features and analytics

## 4.2 Internal API Endpoints

### 4.2.1 Authentication Endpoints

#### Login
- **URL:** `/api/auth/login`
- **Method:** `POST`
- **Input:**
```json
{
  "username": "string",
  "password": "string",
  "two_factor_token": "string (optional)"
}
```
- **Output:**
```json
{
  "success": true,
  "token": "jwt_token_string",
  "user": {
    "id": 123,
    "username": "patient_user",
    "is_patient": true,
    "two_factor_enabled": false
  },
  "expires_at": "2024-12-31T23:59:59Z"
}
```

#### Logout
- **URL:** `/api/auth/logout`
- **Method:** `POST`
- **Input:** None (token in header)
- **Output:**
```json
{
  "success": true,
  "message": "Successfully logged out"
}
```

#### Enable 2FA
- **URL:** `/api/auth/2fa/enable`
- **Method:** `POST`
- **Input:**
```json
{
  "password": "string"
}
```
- **Output:**
```json
{
  "success": true,
  "qr_code": "base64_qr_code_image",
  "secret": "2fa_secret_key",
  "backup_codes": ["code1", "code2", "..."]
}
```

### 4.2.2 Conversation Endpoints

#### Start New Conversation
- **URL:** `/api/conversations`
- **Method:** `POST`
- **Input:**
```json
{
  "title": "string (optional)",
  "initial_message": "string (optional)"
}
```
- **Output:**
```json
{
  "success": true,
  "conversation": {
    "id": 456,
    "title": "Nouvelle conversation",
    "created_at": "2024-01-15T10:30:00Z",
    "is_active": true
  }
}
```

#### Send Message
- **URL:** `/api/conversations/{conversation_id}/messages`
- **Method:** `POST`
- **Input:**
```json
{
  "content": "J'ai des douleurs thoraciques depuis ce matin",
  "message_type": "user"
}
```
- **Output:**
```json
{
  "success": true,
  "user_message": {
    "id": 789,
    "content": "J'ai des douleurs thoraciques depuis ce matin",
    "timestamp": "2024-01-15T10:35:00Z",
    "message_type": "user"
  },
  "bot_response": {
    "id": 790,
    "content": "URGENCE: Douleur thoracique détectée. Appelez immédiatement le SAMU (15)...",
    "timestamp": "2024-01-15T10:35:02Z",
    "message_type": "bot",
    "confidence_score": 0.98,
    "is_emergency": true
  }
}
```

#### Get Conversation History
- **URL:** `/api/conversations/{conversation_id}/messages`
- **Method:** `GET`
- **Input:** Query parameters: `?limit=50&offset=0`
- **Output:**
```json
{
  "success": true,
  "messages": [
    {
      "id": 789,
      "content": "Message content",
      "message_type": "user",
      "timestamp": "2024-01-15T10:35:00Z",
      "confidence_score": null
    }
  ],
  "total_count": 25,
  "has_more": false
}
```

### 4.2.3 Appointment Endpoints

#### Create Appointment Request
- **URL:** `/api/appointments`
- **Method:** `POST`
- **Input:**
```json
{
  "reason": "Consultation de contrôle cardiologique",
  "preferred_date": "2024-02-15",
  "preferred_time_range": "morning",
  "urgency_level": "routine",
  "notes": "Patient avec antécédents d'hypertension"
}
```
- **Output:**
```json
{
  "success": true,
  "appointment": {
    "id": 101,
    "status": "pending",
    "preferred_date": "2024-02-15",
    "urgency_level": "routine",
    "created_at": "2024-01-15T10:40:00Z"
  }
}
```

#### Get User Appointments
- **URL:** `/api/appointments`
- **Method:** `GET`
- **Input:** Query parameters: `?status=pending&limit=10`
- **Output:**
```json
{
  "success": true,
  "appointments": [
    {
      "id": 101,
      "reason": "Consultation de contrôle",
      "preferred_date": "2024-02-15",
      "status": "confirmed",
      "urgency_level": "routine",
      "doctor_name": "Dr. TZVETKOV",
      "created_at": "2024-01-15T10:40:00Z"
    }
  ],
  "total_count": 3
}
```

#### Cancel Appointment
- **URL:** `/api/appointments/{appointment_id}/cancel`
- **Method:** `POST`
- **Input:**
```json
{
  "reason": "Changement de planning personnel"
}
```
- **Output:**
```json
{
  "success": true,
  "message": "Rendez-vous annulé avec succès",
  "appointment": {
    "id": 101,
    "status": "canceled",
    "canceled_at": "2024-01-15T11:00:00Z"
  }
}
```

### 4.2.4 Emergency Alert Endpoints

#### Trigger Emergency Alert
- **URL:** `/api/emergency/alert`
- **Method:** `POST`
- **Input:**
```json
{
  "alert_type": "cardiac_emergency",
  "message": "Patient signale douleur thoracique intense",
  "severity": "critical",
  "patient_location": "Domicile - 3 Place des Arts, Thonon-les-Bains"
}
```
- **Output:**
```json
{
  "success": true,
  "alert": {
    "id": 201,
    "alert_type": "cardiac_emergency",
    "severity": "critical",
    "samu_notified": true,
    "created_at": "2024-01-15T10:45:00Z"
  },
  "actions_taken": [
    "SAMU notification sent",
    "Medical staff alerted",
    "Emergency protocol activated"
  ]
}
```

#### Get Emergency Alerts (Admin)
- **URL:** `/api/emergency/alerts`
- **Method:** `GET`
- **Input:** Query parameters: `?severity=critical&resolved=false`
- **Output:**
```json
{
  "success": true,
  "alerts": [
    {
      "id": 201,
      "user_id": 123,
      "alert_type": "cardiac_emergency",
      "severity": "critical",
      "is_resolved": false,
      "samu_notified": true,
      "created_at": "2024-01-15T10:45:00Z"
    }
  ],
  "total_count": 2
}
```

### 4.2.5 Learning System Endpoints

#### Get Learning Metrics (Admin)
- **URL:** `/api/learning/metrics`
- **Method:** `GET`
- **Input:** Query parameters: `?date_from=2024-01-01&date_to=2024-01-31`
- **Output:**
```json
{
  "success": true,
  "metrics": {
    "average_confidence": 0.96,
    "total_conversations": 1250,
    "successful_responses": 1198,
    "failed_responses": 52,
    "model_accuracy": 0.958,
    "learning_threshold_met": true
  },
  "daily_breakdown": [
    {
      "date": "2024-01-15",
      "conversations": 45,
      "average_confidence": 0.97
    }
  ]
}
```

#### Submit Feedback
- **URL:** `/api/learning/feedback`
- **Method:** `POST`
- **Input:**
```json
{
  "message_id": 790,
  "feedback_score": 5,
  "feedback_comment": "Réponse très appropriée pour l'urgence"
}
```
- **Output:**
```json
{
  "success": true,
  "message": "Feedback enregistré avec succès",
  "learning_data_updated": true
}
```

### 4.2.6 User Management Endpoints

#### Get User Profile
- **URL:** `/api/users/profile`
- **Method:** `GET`
- **Input:** None (token in header)
- **Output:**
```json
{
  "success": true,
  "user": {
    "id": 123,
    "username": "patient_user",
    "email": "patient@example.com",
    "phone_number": "+33123456789",
    "medical_id": "MED123456",
    "is_patient": true,
    "two_factor_enabled": false,
    "created_at": "2024-01-01T00:00:00Z"
  }
}
```

#### Update User Profile
- **URL:** `/api/users/profile`
- **Method:** `PUT`
- **Input:**
```json
{
  "phone_number": "+33987654321",
  "emergency_contact": "Marie Dupont - +33123456789"
}
```
- **Output:**
```json
{
  "success": true,
  "message": "Profil mis à jour avec succès",
  "user": {
    "id": 123,
    "phone_number": "+33987654321",
    "emergency_contact": "Marie Dupont - +33123456789",
    "updated_at": "2024-01-15T11:15:00Z"
  }
}
```

## 4.3 API Authentication

### 4.3.1 JWT Token Authentication

**Header Format:**
```
Authorization: Bearer <jwt_token>
```

**Token Structure:**
- Expiration: 7 days
- Refresh: Automatic on activity
- Revocation: Supported for security

### 4.3.2 API Key Authentication (Admin)

**Header Format:**
```
X-API-Key: <api_key>
```

**Usage:**
- System-to-system communication
- Monitoring and metrics endpoints
- Emergency system integration

## 4.4 Error Handling

### 4.4.1 Standard Error Response Format

```json
{
  "success": false,
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Les données fournies ne sont pas valides",
    "details": {
      "field": "preferred_date",
      "issue": "Date must be in the future"
    }
  },
  "timestamp": "2024-01-15T10:50:00Z"
}
```

### 4.4.2 HTTP Status Codes

| Code | Description | Usage |
|------|-------------|-------|
| 200 | OK | Successful request |
| 201 | Created | Resource created successfully |
| 400 | Bad Request | Invalid input data |
| 401 | Unauthorized | Authentication required |
| 403 | Forbidden | Insufficient permissions |
| 404 | Not Found | Resource not found |
| 409 | Conflict | Resource already exists |
| 422 | Unprocessable Entity | Validation errors |
| 429 | Too Many Requests | Rate limit exceeded |
| 500 | Internal Server Error | Server error |
| 503 | Service Unavailable | Maintenance mode |

### 4.4.3 Emergency-Specific Error Codes

| Code | Description |
|------|-------------|
| `EMERGENCY_DETECTION_FAILED` | AI urgency analysis unavailable |
| `SAMU_NOTIFICATION_FAILED` | Emergency services notification failed |
| `MEDICAL_STAFF_UNAVAILABLE` | No medical staff available for alert |
| `EMERGENCY_PROTOCOL_ERROR` | Emergency response system error |

### 4.4.4 Rate Limiting

**Standard Endpoints:**
- 100 requests per minute per user
- 1000 requests per hour per user

**Emergency Endpoints:**
- No rate limiting for critical alerts
- Priority processing for emergency requests

**Learning Endpoints:**
- 10 requests per minute for feedback submission
- 5 requests per minute for metrics access

This API documentation provides comprehensive coverage of all external integrations and internal endpoints required for the CardioBot medical assistant system, with special attention to emergency handling and medical data security requirements. 