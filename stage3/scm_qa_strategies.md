# 5. SCM and QA Strategies - CardioBot

## Table of Contents
- [5.1 Source Code Management (SCM) Strategy](#51-source-code-management-scm-strategy)
- [5.2 Quality Assurance (QA) Strategy](#52-quality-assurance-qa-strategy)
- [5.3 Deployment Pipeline](#53-deployment-pipeline)
- [5.4 Monitoring and Maintenance](#54-monitoring-and-maintenance)

## 5.1 Source Code Management (SCM) Strategy

### 5.1.1 Version Control System

**Tool:** Git with GitHub/GitLab

**Repository Structure (Domain-Driven Design):**
```
cardiobot/
├── .github/workflows/          # CI/CD workflows
├── docs/                       # Project documentation
├── django/                     # Django backend application
│   ├── domain/                 # DDD Domain layer
│   │   ├── conversation/       # Conversation bounded context
│   │   ├── emergency/          # Emergency detection bounded context
│   │   ├── appointment/        # Appointment management bounded context
│   │   └── user/              # User management bounded context
│   ├── infrastructure/         # DDD Infrastructure layer
│   ├── application/           # DDD Application layer
│   └── interfaces/            # DDD Interface layer (API)
├── frontend/                   # React frontend (if separate)
├── docker/                     # Docker configurations
├── scripts/                    # Deployment and utility scripts
├── tests/                      # Test suites organized by domain
│   ├── unit/                  # Domain unit tests
│   ├── integration/           # Cross-domain integration tests
│   └── e2e/                   # End-to-end tests
└── README.md
```

### 5.1.2 Branching Strategy

**GitFlow Model Adapted for Medical Software:**

#### Main Branches
- **`main`** - Production-ready code, always deployable
- **`develop`** - Integration branch for features, pre-production testing
- **`staging`** - Pre-production environment for final validation

#### Supporting Branches
- **`feature/*`** - New features and enhancements
- **`bugfix/*`** - Non-critical bug fixes
- **`hotfix/*`** - Critical production fixes
- **`release/*`** - Release preparation and versioning

#### Branch Naming Convention (DDD Context-Aware)
```
feature/CARD-123-emergency-detection-improvement
feature/CARD-124-conversation-domain-refactor
feature/CARD-125-appointment-bounded-context
bugfix/CARD-456-sms-notification-fix
bugfix/CARD-457-emergency-domain-validation
hotfix/CARD-789-critical-security-patch
release/v1.2.0-medical-compliance-update
domain/CARD-800-user-context-separation
```

### 5.1.3 Commit Standards

#### Commit Message Format
```
<type>(<scope>): <subject>

<body>

<footer>
```

**Types (DDD-Enhanced):**
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code formatting
- `refactor`: Code restructuring
- `test`: Adding tests
- `chore`: Maintenance tasks
- `security`: Security improvements
- `medical`: Medical compliance updates
- `domain`: Domain model changes
- `context`: Bounded context modifications
- `aggregate`: Aggregate root updates

**Examples:**
```
feat(emergency): add SAMU auto-notification for cardiac alerts

- Implement automatic SAMU (15) notification system
- Add emergency severity classification
- Include patient location in alert payload
- Ensure GDPR compliance for emergency data

Closes #CARD-123

domain(conversation): refactor message aggregate for better encapsulation

- Extract message validation logic into domain service
- Implement conversation aggregate root pattern
- Add domain events for message processing
- Ensure bounded context isolation

Closes #CARD-124

context(appointment): establish appointment bounded context

- Define appointment aggregate boundaries
- Implement repository pattern for appointment persistence
- Add domain services for appointment scheduling
- Establish anti-corruption layer with external booking systems

Closes #CARD-125
```

### 5.1.4 Code Review Process

#### Pull Request Requirements
1. **Mandatory Reviews:** Minimum 2 reviewers for medical-critical code
2. **Automated Checks:** All CI/CD checks must pass
3. **Documentation:** Update relevant documentation
4. **Testing:** Include appropriate tests
5. **Security Review:** Security team approval for sensitive changes

#### Review Checklist (DDD-Enhanced)
- [ ] Code follows project coding standards
- [ ] Medical compliance requirements met
- [ ] Security best practices implemented
- [ ] Performance impact assessed
- [ ] Error handling implemented
- [ ] Tests cover new functionality
- [ ] Documentation updated
- [ ] GDPR compliance verified
- [ ] Domain model integrity maintained
- [ ] Bounded context boundaries respected
- [ ] Aggregate invariants preserved
- [ ] Domain events properly implemented
- [ ] Anti-corruption layers in place
- [ ] Repository patterns correctly applied

### 5.1.5 Protected Branch Rules

**Main Branch Protection:**
- Require pull request reviews (2 reviewers)
- Require status checks to pass
- Require branches to be up to date
- Restrict pushes to administrators only
- Require signed commits for security

**Develop Branch Protection:**
- Require pull request reviews (1 reviewer)
- Require status checks to pass
- Allow force pushes by administrators

## 5.2 Quality Assurance (QA) Strategy

### 5.2.1 Testing Pyramid

#### Unit Tests (70%)
**Tools:** pytest, Django TestCase, Jest (frontend)

**Coverage Areas (DDD-Focused):**
- Domain model validation and business logic
- Aggregate root behavior and invariants
- Domain services and business rules
- API endpoint functionality
- Emergency detection algorithms (domain logic)
- Authentication and authorization
- Data encryption/decryption
- Repository pattern implementations
- Domain event handling

**Example Test Structure (DDD-Organized):**
```python
# tests/unit/domain/emergency/test_emergency_aggregate.py
class TestEmergencyAggregate(TestCase):
    def test_cardiac_emergency_detection_domain_logic(self):
        """Test emergency aggregate business rules"""
        emergency = EmergencyAggregate.create_from_message(
            "J'ai une douleur thoracique intense"
        )
        self.assertTrue(emergency.is_critical())
        self.assertEqual(emergency.severity, EmergencySeverity.CRITICAL)
        
    def test_emergency_aggregate_invariants(self):
        """Test aggregate invariants are maintained"""
        emergency = EmergencyAggregate.create_cardiac_emergency()
        emergency.escalate_to_samu()
        
        # Verify domain events
        events = emergency.get_domain_events()
        self.assertIn(SAMUNotificationRequested, [type(e) for e in events])
        
# tests/unit/domain/conversation/test_conversation_aggregate.py
class TestConversationAggregate(TestCase):
    def test_message_addition_business_rules(self):
        """Test conversation aggregate message handling"""
        conversation = ConversationAggregate.create("Test conversation")
        message = Message.create_user_message("Hello")
        
        conversation.add_message(message)
        
        self.assertEqual(len(conversation.messages), 1)
        self.assertTrue(conversation.is_active())
```

#### Integration Tests (20%)
**Tools:** Django TestCase, pytest-django, Postman/Newman

**Coverage Areas (DDD Cross-Context):**
- API endpoint integration across bounded contexts
- Repository and infrastructure layer integration
- External API integrations (WatsonX, Twilio) via anti-corruption layers
- Authentication flows across domains
- Emergency alert workflows spanning multiple contexts
- Domain event propagation between bounded contexts
- Cross-context data consistency

**Example Integration Test:**
```python
class TestConversationAPI(APITestCase):
    def test_emergency_conversation_flow(self):
        """Test complete emergency conversation workflow"""
        # Create conversation
        response = self.client.post('/api/conversations', {
            'title': 'Emergency Test'
        })
        conversation_id = response.data['conversation']['id']
        
        # Send emergency message
        response = self.client.post(
            f'/api/conversations/{conversation_id}/messages',
            {'content': 'J\'ai mal au coeur, je ne me sens pas bien'}
        )
        
        # Verify emergency detection
        self.assertTrue(response.data['bot_response']['is_emergency'])
        self.assertIn('SAMU', response.data['bot_response']['content'])
```

#### End-to-End Tests (10%)
**Tools:** Selenium, Cypress, Playwright

**Coverage Areas:**
- Complete user journeys
- Emergency scenarios
- Appointment booking flows
- Authentication processes
- Cross-browser compatibility

### 5.2.2 Testing Tools and Frameworks

#### Backend Testing
- **pytest** - Primary testing framework
- **factory_boy** - Test data generation
- **freezegun** - Time-based testing
- **responses** - HTTP request mocking
- **coverage.py** - Code coverage analysis

#### Frontend Testing
- **Jest** - Unit testing framework
- **React Testing Library** - Component testing
- **Cypress** - E2E testing
- **Storybook** - Component documentation and testing

#### API Testing
- **Postman/Newman** - API testing and automation
- **pytest-django** - Django-specific testing
- **requests-mock** - HTTP mocking

#### Performance Testing
- **Locust** - Load testing
- **Django Debug Toolbar** - Performance profiling
- **pytest-benchmark** - Performance regression testing

### 5.2.3 Test Data Management

#### Test Database Strategy
- **Separate test database** for isolation
- **Factory pattern** for test data creation
- **Fixtures** for consistent test scenarios
- **Data anonymization** for production-like testing

#### Medical Test Data
```python
# tests/factories.py
class PatientFactory(factory.django.DjangoModelFactory):
    class Meta:
        model = CustomUser
    
    username = factory.Sequence(lambda n: f"patient_{n}")
    email = factory.LazyAttribute(lambda obj: f"{obj.username}@test.com")
    medical_id = factory.Sequence(lambda n: f"MED{n:06d}")
    is_patient = True
    phone_number = "+33123456789"

class EmergencyMessageFactory(factory.django.DjangoModelFactory):
    class Meta:
        model = Message
    
    content = factory.Iterator([
        "J'ai des douleurs thoraciques",
        "Je ne peux plus respirer",
        "J'ai un malaise cardiaque"
    ])
    message_type = Message.TYPE_USER
```

### 5.2.4 Quality Gates

#### Code Quality Metrics
- **Code Coverage:** Minimum 85% for medical-critical modules
- **Complexity:** Maximum cyclomatic complexity of 10
- **Duplication:** Maximum 3% code duplication
- **Security:** Zero high-severity security vulnerabilities

#### Performance Benchmarks
- **API Response Time:** < 200ms for standard endpoints
- **Emergency Response:** < 50ms for critical alerts
- **Database Queries:** < 100ms average query time
- **Memory Usage:** < 512MB per container

#### Medical Compliance Checks
- **GDPR Compliance:** Data handling verification
- **Medical Accuracy:** Clinical validation of responses
- **Emergency Protocols:** SAMU notification testing
- **Audit Trail:** Complete action logging verification

## 5.3 Deployment Pipeline

### 5.3.1 CI/CD Workflow

#### Continuous Integration (GitHub Actions)
```yaml
# .github/workflows/ci.yml
name: CardioBot CI/CD

on:
  push:
    branches: [main, develop]
  pull_request:
    branches: [main, develop]

jobs:
  test:
    runs-on: ubuntu-latest
    services:
      postgres:
        image: postgres:13
        env:
          POSTGRES_PASSWORD: postgres
        options: >-
          --health-cmd pg_isready
          --health-interval 10s
          --health-timeout 5s
          --health-retries 5
      redis:
        image: redis:alpine
        options: >-
          --health-cmd "redis-cli ping"
          --health-interval 10s
          --health-timeout 5s
          --health-retries 5

    steps:
    - uses: actions/checkout@v3
    
    - name: Set up Python
      uses: actions/setup-python@v4
      with:
        python-version: '3.9'
    
    - name: Install dependencies
      run: |
        pip install -r requirements.txt
        pip install -r requirements-test.txt
    
    - name: Run linting
      run: |
        flake8 django/
        black --check django/
        isort --check-only django/
    
    - name: Run security checks
      run: |
        bandit -r django/
        safety check
    
    - name: Run tests
      run: |
        cd django
        python manage.py test --settings=django_files.settings_test
        coverage run --source='.' manage.py test
        coverage report --fail-under=85
    
    - name: Medical compliance check
      run: |
        python scripts/medical_compliance_check.py
    
    - name: Build Docker image
      run: |
        docker build -t cardiobot:${{ github.sha }} .
```

### 5.3.2 Environment Strategy

#### Development Environment
- **Local development** with Docker Compose
- **Hot reloading** for rapid development
- **Mock external services** for offline development
- **Test data seeding** for consistent development

#### Staging Environment
- **Production-like configuration**
- **Real external service integration**
- **Performance testing**
- **User acceptance testing**
- **Security penetration testing**

#### Production Environment
- **High availability setup**
- **Load balancing**
- **Database replication**
- **Monitoring and alerting**
- **Backup and disaster recovery**

### 5.3.3 Deployment Process

#### Staging Deployment
1. **Automated deployment** on develop branch merge
2. **Database migration** execution
3. **Health checks** verification
4. **Smoke tests** execution
5. **Notification** to QA team

#### Production Deployment
1. **Manual approval** required
2. **Blue-green deployment** strategy
3. **Database backup** before migration
4. **Rollback plan** preparation
5. **Post-deployment verification**

#### Emergency Hotfix Process
1. **Immediate hotfix branch** creation
2. **Expedited review** process
3. **Direct production deployment**
4. **Post-deployment monitoring**
5. **Incident documentation**

## 5.4 Monitoring and Maintenance

### 5.4.1 Code Quality Monitoring

#### Static Analysis Tools
- **SonarQube** - Code quality and security analysis
- **CodeClimate** - Maintainability and test coverage
- **Snyk** - Dependency vulnerability scanning
- **ESLint/Pylint** - Code style and error detection

#### Metrics Tracking
- **Code coverage trends**
- **Technical debt accumulation**
- **Security vulnerability count**
- **Performance regression detection**

### 5.4.2 Medical Compliance Monitoring

#### Automated Compliance Checks
- **GDPR data handling verification**
- **Medical response accuracy validation**
- **Emergency protocol compliance**
- **Audit trail completeness**

#### Regular Audits
- **Monthly security audits**
- **Quarterly medical compliance reviews**
- **Annual penetration testing**
- **Continuous vulnerability assessments**

### 5.4.3 Documentation Maintenance

#### Living Documentation
- **API documentation** auto-generation
- **Code documentation** with medical context
- **Deployment guides** with emergency procedures
- **User manuals** for medical staff

#### Knowledge Management
- **Decision records** for medical compliance choices
- **Incident post-mortems** with lessons learned
- **Best practices** documentation
- **Training materials** for new team members

This comprehensive SCM and QA strategy, enhanced with Domain-Driven Design principles, ensures the CardioBot medical assistant maintains the highest standards of code quality, security, and medical compliance while enabling rapid and safe development cycles. The DDD approach provides clear bounded contexts for medical domains, ensuring better code organization, maintainability, and domain expert collaboration. 