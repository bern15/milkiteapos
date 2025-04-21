# 🧋 MilkiTea POS App (Flutter + Cupertino)

A sleek and minimal Point of Sale (POS) application built using **Flutter** with **Cupertino (iOS-style) widgets**, tailored for milk tea, coffee, and bread shops. Designed with simplicity, usability, and Apple-inspired aesthetics in mind.

---

## 📱 Features

- 🍹 **Product Selection**: Displays 30 items (10 Milk Teas, 10 Coffees, 10 Breads) with images and prices.
- ➕➖ **Item Quantity Controls**: Users can increment or decrement item quantities before adding to cart.
- 🛒 **Cart Functionality**:
  - View selected items with quantity and price.
  - Remove all items with a single tap.
- 🧾 **Receipt Page**:
  - View a detailed receipt of your purchase.
  - Includes developer credits.
- 🧭 **Bottom Navigation (CupertinoTabScaffold)**:
  - Home (Menu)
  - Cart
  - (Optional) About Developers

---

## 📸 UI Preview

<img src="assets/images/milktea1.png" width="200">
<img src="assets/images/coffee1.png" width="200">
<img src="assets/images/bread1.png" width="200">

---

## 🛠 Tech Stack

- **Flutter** (Cupertino)
- **Dart**
- **State Management**: Stateful Widgets with shared state via a parent (`MainPage`)
- **Image Assets**: Stored in `assets/images/`

---

## 🔄 App Flow

```plaintext
LoginPage (Optional) ➝ MainPage
   ├── HomePage: Add items to cart
   ├── CartPage: View items, remove items, proceed to ReceiptPage
   └── ReceiptPage: Show summary & developer credits
