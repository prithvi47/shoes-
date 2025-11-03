👟 Flutter Shoe Store: Velocity E-Commerce App

💡 Project Overview

Velocity E-Commerce is a fast, animated, and fully-featured mobile application template for a modern shoe store. Built entirely with Flutter and Dart, this project showcases a slick, responsive user interface with dynamic animations, a comprehensive shopping cart system, and a multi-step checkout flow.
It is designed to provide developers with a robust foundation for building high-quality, production-ready retail applications.

✨ Core Features

* Animated UI/UX: Utilizes the animate_do package for smooth, eye-catching transitions and visual effects on the main listing page.
* Product Catalog: Products are categorized (e.g., "All," "Football," "Oxford") with a clean, scrollable horizontal filter (main.dart).
* Product Detail View (Shoes.dart): Dedicated page for each product, allowing the user to select their size before proceeding.
* Shopping Cart Management (CartPage.dart): Users can view, update the quantity of items, calculate the total price, and remove items from their cart.
* Multi-Step Checkout Flow:
    * Buy Page (BuyPage.dart): Dedicated checkout form for confirming order summary, selecting a payment method, and inputting mock card details.
    * Purchase Summary (PurchaseSummaryPage.dart): Final screen to confirm the transaction.


💻 Technical Stack & Structure

File	Functionality	Description
main.dart	App Entry & Home Screen	Sets up the main category-filtered product listings and navigates to detail pages.
Shoes.dart	Product Detail Page	Handles size selection and initiates the 'Buy' process.
ProductSummaryPage.dart	Add to Cart Confirmation	Intermediate screen to confirm the product details before adding to the cart state.
CartPage.dart	Cart Management	Displays current cart items, calculates total, and manages item quantity/removal.
BuyPage.dart	Checkout & Payment	The final step: handles payment method selection and displays the grand total.
pubspec.yaml	Dependencies	Declares project dependencies, notably the animate_do package.
⚙️ Getting Started

This project requires the Flutter SDK to be installed and configured on your machine.

1. Clone the Repository
git clone 

2. Install Dependencies

Navigate to the project root directory and run the following command to fetch the required packages (including animate_do):

flutter pub get

3. Setup Assets

Ensure that the assets mentioned in pubspec.yaml are correctly placed:
YAML

# pubspec.yaml
# ...
flutter:
  uses-material-design: true
  assets:
   - assets/images/
The app expects image files (one.jpg, two.jpg, etc.) to be present inside the assets/images/ folder.

4. Run the App

Launch the application on an emulator or a connected physical device:


flutter run
The application will start on the HomePage, where you can begin browsing and adding products to your cart.






