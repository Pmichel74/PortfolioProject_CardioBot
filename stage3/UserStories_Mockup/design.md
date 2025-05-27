# 🎨 Guide de Design - CardioBot

---

## 📋 Vue d'ensemble

Ce document définit les standards de design pour CardioBot, assurant une expérience utilisateur cohérente et professionnelle à travers l'application. Il sert de référence pour tous les développements UI/UX.

---

## 1. 🎨 Charte Graphique

### 🌈 Palette de Couleurs Principale

| Usage | Couleur | Code HEX | Description |
|-------|----------|-----------|------------|
| Primaire | Bleu Médical | `#2B6CB0` | Couleur dominante de l'interface |
| Secondaire | Gris Neutre | `#4A5568` | Texte et éléments secondaires |
| Accent | Vert Validation | `#48BB78` | Actions positives et succès |
| Alerte | Rouge Urgence | `#E53E3E` | Erreurs et alertes importantes |

### 🎭 Palette de Couleurs Secondaire

| Usage | Couleur | Code HEX | Description |
|-------|----------|-----------|------------|
| Background | Gris Clair | `#F7FAFC` | Fond d'écran général |
| Surface | Blanc | `#FFFFFF` | Cartes et conteneurs |
| Bordures | Gris Border | `#E2E8F0` | Séparation des éléments |
| Disabled | Gris Désactivé | `#A0AEC0` | Éléments non disponibles |

---

## 2. ✍️ Typographie

### 📝 Standards Typographiques

| Élément | Police | Taille | Poids |
|---------|---------|--------|--------|
| Titres H1 | Roboto | 32px | 700 |
| Titres H2 | Roboto | 24px | 600 |
| Titres H3 | Roboto | 20px | 600 |
| Corps de texte | Open Sans | 16px | 400 |
| Interface | Inter | 14px | 400/500 |

### 🔢 Hiérarchie des Textes

| Usage | Style | Exemple |
|-------|-------|---------|
| Titre principal | 32px, Roboto Bold | Tableau de bord |
| Sous-titre | 24px, Roboto SemiBold | Mes rendez-vous |
| En-tête section | 20px, Roboto SemiBold | Informations patient |
| Texte courant | 16px, Open Sans Regular | Contenu standard |
| Labels | 14px, Inter Medium | Étiquettes formulaires |

---

## 3. 🧩 Composants UI

### 🔘 Boutons

| Type | Usage | Style |
|------|--------|-------|
| Primaire | Actions principales | Fond bleu (#2B6CB0), texte blanc |
| Secondaire | Actions alternatives | Bordure bleue, texte bleu |
| Tertiaire | Actions mineures | Texte bleu uniquement |
| Danger | Actions destructives | Fond rouge (#E53E3E), texte blanc |

### 📦 Cartes et Conteneurs

| Composant | Style | Usage |
|-----------|-------|-------|
| Carte standard | Ombre légère, coins arrondis 8px | Informations groupées |
| Conteneur principal | Padding 24px, max-width 1200px | Layout général |
| Panel | Bordure fine, fond blanc | Sections distinctes |

---

## 7. ♿ Accessibilité

### 📋 Standards RGAA

| Critère | Niveau | Validation |
|---------|---------|------------|
| Contraste | AA (4.5:1) | Obligatoire |
| Focus | Visible | Obligatoire |
| Alt text | Présent | Obligatoire |
| Navigation | Clavier | Obligatoire |

### 🎯 Adaptations Spécifiques

| Élément | Adaptation | Validation |
|---------|------------|------------|
| Texte | Redimensionnable | ✓ |
| Contraste | Conforme WCAG | ✓ |
| Navigation | Skip links | ✓ |
| Forms | Labels explicites | ✓ |

---


