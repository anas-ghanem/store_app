# 🛒 Lumen Store - E-Commerce App

A dynamic and elegant E-Commerce Store application built with Flutter. "Lumen Store" demonstrates practical experience in building modern shopping interfaces, handling theme switching (Dark/Light mode), and managing complex data flows by communicating with external RESTful APIs to fetch, display, and update products.

## 📸 App Preview

| Dark Mode (Home) | Light Mode (Home) | Edit Product |
| :---: | :---: | :---: |
| <img src="https://github.com/user-attachments/assets/86977bf7-c2f0-4167-8e18-658a8d15fdd6" width="230" /> | <img src="https://github.com/user-attachments/assets/71869ee1-8394-4564-866b-4bdd976ca401" width="230" /> | <img src="https://github.com/user-attachments/assets/01a7a333-ee0e-424c-86d1-d7d19ef0fd7f" width="230" /> |

## ✨ Key Features
- **API Integration:** Connects to an external RESTful API (e.g., FakeStore API) to dynamically fetch and list store products.
- **Product Management:** Users can interact with the product data, simulating viewing details and updating product information (Title, Price, Category, Description).
- **Theme Switching:** Seamlessly toggle between Dark Mode and Light Mode for a personalized user experience.
- **Generic API Helper:** Features a reusable, generic HTTP helper class designed to efficiently handle multiple request types (GET, POST, PUT) across the application.
- **Custom UI Components:** Utilizes clean, reusable UI widgets like custom product cards, category filters, and stylized text fields.

## 🛠️ Tech Stack & Architecture
- **Framework:** Flutter / Dart
- **Network:** `http` package (with a custom generic API wrapper)
- **Architecture:** Feature-based modular structure / MVVM approach

## 📂 Folder Structure
The codebase is organized for scalability and separation of concerns:
```text
lib/
 ┣ core/           # App themes, colors, and ThemeProvider
 ┣ models/         # Data models and Generic API helper classes
 ┣ screens/        # UI Views (Home, Update Page)
 ┣ services/       # Network calls (Get Categories, Add/Update Products)
 ┗ widgets/        # Reusable components (CustomCard, CustomTextField)
```

## 🚀 How to Run
1. Clone the repository:
   ```bash
   git clone [https://github.com/your-username/store_app.git](https://github.com/your-username/store_app.git)
   ```
2. Navigate to the project directory and get dependencies:
   ```bash
   cd store_app
   flutter pub get
   ```
3. Run the app:
   ```bash
   flutter run
   ```
