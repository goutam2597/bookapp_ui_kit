# 📚 Book App

A complete Flutter-based service booking application for **Customers** and **Vendors**, with all the features required for managing and booking services. Built using clean architecture, modular folders, reusable widgets, and state-of-the-art UI for production readiness and scalability.

---

## 🚀 Features

### 👤 Customer Features
- ✅ Sign In / Sign Up / Reset Password
- 🔍 Browse through Categories, Services, and Vendors
- 📄 View Service Details and Vendor Profiles
- 🗓️ Book Services (Multi-step: Staff → Time → Billing → Payment)
- 💖 Wishlist management for favorite services
- 📦 Orders and Appointments overview
- 📊 Profile Dashboard with graphical insights

### 🧑‍💼 Vendor Features
- 🔐 Vendor Authentication & Profile Editing
- 📈 Dashboard with revenue, bookings, and charts
- 👨‍🔧 Manage Staff (Add/Edit, Service Assignment, Time Slots, Holidays)
- 🛠️ Manage Services & Products (Add/Edit/Delete)
- 💸 View Transactions & Request Withdrawals
- 🗂️ Appointments Management
- 💬 Support Tickets and Email Inbox
- 💼 Subscribe to Plans and Enable Plugin Integrations

---

## 📁 Project Structure

> Clean modular architecture organized for maintainability and reusability.
lib/
├── app/ # Global app-level configuration
│ ├── app.dart # Root App Widget with routing and setup
│ ├── app_colors.dart # Centralized color constants
│ ├── app_text_styles.dart # Centralized typography styles
│ ├── app_theme_data.dart # ThemeData setup for light/dark mode
│ ├── assets_path.dart # Asset paths and naming conventions
│ └── theme_controller.dart # Theme mode management
├── common/
│ └── ui/widgets/ # Reusable widgets shared across customer & vendor
│ ├── custom_app_bar.dart
│ ├── custom_button_widget.dart
│ ├── custom_text_field.dart
│ ├── custom_snackbar_widget.dart
│ └── ...
├── customer/features/ # Modules only accessible to customers
│ ├── account/ # Customer profile & settings
│ ├── appointments/ # Appointment listing & details
│ ├── auth/ # Customer login/signup/reset password
│ ├── cart/ # Cart and checkout logic (if available)
│ ├── home/ # Home screen, banners, category listings
│ ├── nav_bar/ # Bottom navigation bar for customers
│ ├── orders/ # Service order history
│ ├── services/ # Service list and details
│ ├── services_booking/ # Multi-step service booking screens
│ ├── vendors/ # Browse vendors and view profiles
│ └── wishlist/ # Favorite services
├── vendor/features/ # Modules only accessible to vendors
│ ├── appointments/ # View & manage appointments
│ ├── auth/ # Vendor login/signup/reset
│ ├── buy_plan/ # Subscription plan listing & purchase
│ ├── change_password/ # Update password screen
│ ├── dashboard/ # Dashboard with earnings, stats, insights
│ ├── edit_profile/ # Vendor profile editing with language toggle
│ ├── email/ # Email inbox (internal messages)
│ ├── nav_app_bar/ # Vendor-specific app bar/navigation
│ ├── plugins/ # Extra plugin features for power users
│ ├── products/ # (Optional) Product management
│ ├── service_inquiry/ # View customer inquiries
│ ├── services/ # Service listing and editing
│ ├── staff/ # Add/edit staff, assign services
│ ├── subscription_log/ # View subscription history
│ ├── support_tickets/ # Raise and respond to support tickets
│ ├── transactions/ # Transaction history
│ └── withdrawal/ 
├─────staff/features/ # Modules only accessible to staff
│ ├── appointments/ # View & manage appointments
│ ├── auth/ # Vendor login/signup/reset
│ ├── change_password/ # Update password screen
│ ├── dashboard/ # Dashboard with earnings, stats, insights
│ ├── edit_profile/ # Vendor profile editing with language toggle
│ ├── nav_app_bar/ # Vendor-specific app bar/navigation
│ ├── plugins/ # Extra plugin features for power users
│ ├── service_inquiry/ # View customer inquiries
│ ├── services/ # Service listing and editing
├── main.dart # App entry point


---

## 🛠️ Getting Started

### ✅ Prerequisites

Before running the app, make sure you have the following installed:

- ✅ [Flutter SDK](https://flutter.dev/docs/get-started/install) (3.x or the latest stable version)
- ✅ Dart SDK (included with Flutter)
- ✅ [Android Studio](https://developer.android.com/studio) or [VS Code](https://code.visualstudio.com/)
- ✅ Android/iOS simulator or real device for testing

