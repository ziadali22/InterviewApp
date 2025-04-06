# 📱 InterviewApp – Clean Architecture SwiftUI Demo

InterviewApp is a demo iOS project built using **SwiftUI** and structured with **Clean Architecture** principles, designed to demonstrate how to build scalable and testable applications in iOS using a clear separation of concerns.

---

## 🧠 Architecture

This app follows the Clean Architecture approach by separating responsibilities into three distinct layers:

- **Domain Layer**: Contains business logic and use cases (pure Swift).
- **Data Layer**: Handles data persistence and repository implementations.
- **Presentation Layer**: SwiftUI views and ViewModels, which consume domain use cases.

---

## 🧱 Folder Structure
InterviewApp
<pre lang="bash"><code>
InterviewApp
├── Domain
│   ├── Entities
│   ├── Repositories
│   └── UseCases
├── Data
│   └── Repositories
└── Presentation
    ├── ViewModels
    └── Views
</code></pre>

---

## ✨ Features

- Add, edit, and delete contacts
- Simple form validation
- Contact initials generated automatically
- Search functionality
- View reuse using reusable form view

---

## 📚 Technologies Used

- SwiftUI
- Clean Architecture
- MVVM
- Swift 5.9+

---

## 🔗 Demo

This app is useful for:
- Interview preparation
- Learning Clean Architecture in Swift
- Practicing SwiftUI with real features

---

## 📦 Installation

1. Clone the repo:
   ```bash
   git clone https://github.com/your-username/interview-app.git
2.	Open the .xcodeproj or .xcodeworkspace file.
3.	Run on a simulator or real device.