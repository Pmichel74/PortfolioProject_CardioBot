# 📱 Mockups - CardioBot

---

## 📋 Vue d'ensemble

Ce document présente l'ensemble des mockups et wireframes de l'application CardioBot, organisés par sections fonctionnelles.

---

## 1. 🌐 Interfaces Publiques

### 1.1 🏠 Page d'Accueil

```
+--------------------------------------------------+
|                   CardioBot                       |
|                                                  |
|     [À propos] [Services] [Contact] [Connexion]  |
|                                                  |
|     +------------------+  +------------------+    |
|     |   Pour Patients  |  |  Pour Médecins  |    |
|     +------------------+  +------------------+    |
|                                                  |
|     Prenez rendez-vous en ligne                  |
|     [     Commencer maintenant     ]             |
+--------------------------------------------------+
```

### 1.2 🔐 Page de Connexion

```
+--------------------------------------------------+
|                   CardioBot                       |
|                                                  |
|        +--------------------------------+        |
|        |      Se connecter avec         |        |
|        |      FranceConnect+            |        |
|        +--------------------------------+        |
|                                                  |
|        +--------------------------------+        |
|        |      Email                     |        |
|        +--------------------------------+        |
|                                                  |
|        +--------------------------------+        |
|        |      Mot de passe             |        |
|        +--------------------------------+        |
|                                                  |
|        [          Se connecter         ]         |
|                                                  |
|        Mot de passe oublié ?                     |
+--------------------------------------------------+
```

---

## 2. 👤 Interface Patient

### 2.1 📊 Dashboard Patient

```
+--------------------------------------------------+
| CardioBot           Menu ☰             Profil ▾   |
+--------------------------------------------------+
|                                                  |
| Prochain RDV                                     |
| +--------------------------------------------+  |
| | Dr. Martin - Cardiologue                   |  |
| | 15 Juin 2025 - 14:30                      |  |
| +--------------------------------------------+  |
|                                                  |
| Messages (3)                                     |
| +--------------------------------------------+  |
| | - Résultats disponibles                    |  |
| | - Rappel RDV                              |  |
| +--------------------------------------------+  |
|                                                  |
| Assistant Virtuel                               |
| +--------------------------------------------+  |
| | Comment puis-je vous aider aujourd'hui ?    |  |
| +--------------------------------------------+  |
+--------------------------------------------------+
```

### 2.2 📅 Prise de Rendez-vous

```
+--------------------------------------------------+
| ← Retour                     Nouveau Rendez-vous  |
+--------------------------------------------------+
|                                                  |
| Sélectionnez un praticien :                     |
| [ Dr. Martin, Cardiologue ▾ ]                    |
|                                                  |
| Sélectionnez une date :                         |
| [ Calendrier interactif ]                        |
|                                                  |
| Horaires disponibles :                          |
| ┌──────┐ ┌──────┐ ┌──────┐ ┌──────┐            |
| │ 9:00 │ │10:30 │ │14:00 │ │16:30 │            |
| └──────┘ └──────┘ └──────┘ └──────┘            |
|                                                  |
| [ Confirmer le rendez-vous ]                     |
+--------------------------------------------------+
```

---

## 3. 👨‍⚕️ Interface Praticien

### 3.1 📅 Planning Journalier

```
+--------------------------------------------------+
| Planning - 27 Mai 2025                           |
+--------------------------------------------------+
| 09:00 - M. Dupont                               |
|        Consultation suivi                        |
| ------------------------------------------------|
| 10:30 - Mme Bernard                             |
|        Première consultation                     |
| ------------------------------------------------|
| 14:00 - M. Martin                              |
|        Résultats examens                        |
+--------------------------------------------------+
|        [ + Nouveau RDV ]                         |
+--------------------------------------------------+
```

### 3.2 📋 Dossier Patient

```
+--------------------------------------------------+
| Dossier - Jean Dupont                           |
+--------------------------------------------------+
| Info   Historique   Documents   Ordonnances      |
|                                                  |
| Dernière visite : 15/04/2025                    |
| Tension : 12/8                                   |
| Traitement en cours :                           |
| - Cardipril 5mg                                 |
| - Aspirine 75mg                                 |
|                                                  |
| [ Ajouter une note ]   [ Modifier traitement ]   |
+--------------------------------------------------+
```

---

## 4. 🤖 Assistant Virtuel

### 4.1 💬 Interface Chat

```
+--------------------------------------------------+
|                    CardioBot                      |
+--------------------------------------------------+
|                                                  |
|  🤖 Bonjour, que puis-je faire pour vous ?      |
|                                                  |
|  👤 J'ai besoin d'un rendez-vous urgent         |
|                                                  |
|  🤖 Je peux vous aider. Voulez-vous :           |
|     1. RDV urgent cardiologie                   |
|     2. RDV urgences générales                   |
|                                                  |
| +--------------------------------------------+  |
| | Écrivez votre message...         [Envoyer] |  |
| +--------------------------------------------+  |
+--------------------------------------------------+
```

---

## 5. ⚙️ Interface Administrative

### 5.1 👥 Gestion des Utilisateurs

```
+--------------------------------------------------+
| Gestion Utilisateurs                             |
+--------------------------------------------------+
| Recherche : [ _________________ ]                 |
|                                                  |
| Utilisateurs récents :                          |
| ┌────────────────────────────────┐              |
| │ Jean D.  │ Patient    │ ✏️ ❌  │              |
| │ Dr Martin│ Praticien  │ ✏️ ❌  │              |
| │ Marie B. │ Secrétaire │ ✏️ ❌  │              |
| └────────────────────────────────┘              |
|                                                  |
| [ + Nouvel utilisateur ]                         |
+--------------------------------------------------+
```

### 5.2 📊 Tableau de Bord Administratif

```
+--------------------------------------------------+
| Dashboard Administratif                          |
+--------------------------------------------------+
| Statistiques Aujourd'hui                         |
| ┌─────────────┐ ┌─────────────┐ ┌─────────────┐ |
| │ RDV: 45     │ │ Actifs: 12  │ │ Attente: 3  │ |
| └─────────────┘ └─────────────┘ └─────────────┘ |
|                                                  |
| Activité récente                                |
| - Nouveau praticien ajouté                      |
| - Mise à jour système effectuée                 |
| - Sauvegarde quotidienne complétée              |
+--------------------------------------------------+
```

---

## 📝 Notes Techniques

### 🔧 Spécifications d'Implementation

1. **📱 Responsive Design**
   - Breakpoint mobile : 320px - 768px
   - Breakpoint tablette : 768px - 1024px
   - Breakpoint desktop : > 1024px

2. **🧩 Composants Réutilisables**
   - Headers standardisés
   - Boutons d'action
   - Cards informatives
   - Champs de formulaire

3. **🧭 Navigation**
   - Menu hamburger sur mobile
   - Barre latérale sur desktop
   - Fil d'Ariane pour la navigation profonde

---

### ♿ Accessibilité

1. **📋 Standards WCAG 2.1**
   - Contraste minimum 4.5:1
   - Navigation au clavier
   - Labels explicites
   - Textes alternatifs

2. **🎯 Adaptations**
   - Mode sombre
   - Taille de texte ajustable
   - Support lecteur d'écran

---

### ⚡ Performance

1. **🎯 Objectifs**
   - Temps de chargement < 3s
   - First Paint < 1s
   - Time to Interactive < 5s

2. **🚀 Optimisations**
   - Lazy loading des images
   - Mise en cache appropriée
   - Minification des assets

---

*📄 Document généré le 27/05/2025*  
*📋 Version 2.0*
