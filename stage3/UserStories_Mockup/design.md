# 🎨 Design Guide - CardioBot

---

## 📋 Overview

This document defines the design standards for CardioBot, ensuring a consistent and professional user experience throughout the application. It serves as a reference for all UI/UX developments.

---

## 1. 🎨 Visual Identity

### 🌈 Primary Color Palette

| Usage | Color | HEX Code | Description |
|-------|----------|-----------|------------|
| Primary | Medical Blue | `#2B6CB0` | Dominant interface color |
| Secondary | Neutral Gray | `#4A5568` | Text and secondary elements |
| Accent | Validation Green | `#48BB78` | Positive actions and success |
| Alert | Emergency Red | `#E53E3E` | Errors and important alerts |

### 🎭 Secondary Color Palette

| Usage | Color | HEX Code | Description |
|-------|----------|-----------|------------|
| Background | Light Gray | `#F7FAFC` | General background |
| Surface | White | `#FFFFFF` | Cards and containers |
| Borders | Border Gray | `#E2E8F0` | Element separation |
| Disabled | Disabled Gray | `#A0AEC0` | Unavailable elements |

---

## 2. ✍️ Typography

### 📝 Typographic Standards

| Element | Font | Size | Weight |
|---------|---------|--------|--------|
| H1 Titles | Roboto | 32px | 700 |
| H2 Titles | Roboto | 24px | 600 |
| H3 Titles | Roboto | 20px | 600 |
| Body Text | Open Sans | 16px | 400 |
| Interface | Inter | 14px | 400/500 |

### 🔢 Text Hierarchy

| Usage | Style | Example |
|-------|-------|---------|
| Main title | 32px, Roboto Bold | Dashboard |
| Subtitle | 24px, Roboto SemiBold | My Appointments |
| Section header | 20px, Roboto SemiBold | Patient Information |
| Body text | 16px, Open Sans Regular | Standard content |
| Labels | 14px, Inter Medium | Form labels |

---

## 3. 🧩 UI Components

### 🔘 Buttons

| Type | Usage | Style |
|------|--------|-------|
| Primary | Main actions | Blue background (#2B6CB0), white text |
| Secondary | Alternative actions | Blue border, blue text |
| Tertiary | Minor actions | Blue text only |
| Danger | Destructive actions | Red background (#E53E3E), white text |

### 📦 Cards and Containers

| Component | Style | Usage |
|-----------|-------|-------|
| Standard card | Light shadow, 8px rounded corners | Grouped information |
| Main container | 24px padding, max-width 1200px | General layout |
| Panel | Thin border, white background | Distinct sections |

---

## 7. ♿ Accessibility

### 📋 RGAA Standards

| Criteria | Level | Validation |
|---------|---------|------------|
| Contrast | AA (4.5:1) | Mandatory |
| Focus | Visible | Mandatory |
| Alt text | Present | Mandatory |
| Navigation | Keyboard | Mandatory |

### 🎯 Specific Adaptations

| Element | Adaptation | Validation |
|---------|------------|------------|
| Text | Resizable | ✓ |
| Contrast | WCAG compliant | ✓ |
| Navigation | Skip links | ✓ |
| Forms | Explicit labels | ✓ |

---


