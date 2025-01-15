![App Logo](https://static.coingecko.com/s/coingecko-logo-8903d34ce19ca4be1c81f0db30e924154750d208683fad7ae6f2ce06c76d0a56.png) <!-- Replace with your app logo URL -->

[![License](https://img.shields.io/github/license/username/repository)](LICENSE)
[![Version](https://img.shields.io/badge/version-1.0.0-blue)]()
[![Platform](https://img.shields.io/badge/platform-iOS%20%7C%20Android-brightgreen)]()

The mobile app is a cryptocurrency management platform designed to provide users with real-time information on digital assets while enhancing their experience through intuitive features and a modern UI. Built with Flutter for cross-platform compatibility, the app caters to both Android, iOS and Web users.
There are still features to be built in, but for now we display all coins on the home page.

---

## 🚀 Features

- 🪙 **Feature 1**: See all coins pulled from Coin Gecko via a list view.
- ⭐ **Feature 2**: Ability to favourite a coin.
- ⌨️ **Feature 3**: Ability to search coins by name.
- 🧭  **Feature 4**: Ability to navigate further to find out more about the coin.

---

## 🛠️ Technologies and Libraries used

- 📡 **Dio**: Http requests made easier.
- ✨ **Shimmer**: For providing feedback to the user something is loading.
- 📈 **Mrx Charts**: For displaying coin history on the coin detail page.
- 🔒 **Flutter DotEnv**: Used for keeping secrets safe within the app.
- 🖼️ **Cached Network Image**: Used for showing a loading indicator when images are being loaded over the network.
- 🏗️ **Stacked Framework**: MVVM architecture.
- 🐝 **Hive**: For local database

---

## 🖼️ Screenshots

### Home Screen
<img src="https://github.com/user-attachments/assets/4d41ae00-49fc-49d7-975d-6a5cdc0e89d3" alt="Home Screen" width="300"/>



### Coin Detail Screen
<img src="https://github.com/user-attachments/assets/9da8a436-ad9f-47a2-9404-bbc3e6989f3c" alt="Coin Detail Screen" width="300"/>

---

## 🛠️ Enhancements and Fixes

- 🖌️ **1**: Introduce Theming.
- 🎨 **2**: Move hardcoded values in the UI to pull from Theme.
- 📊 **3**: Provide real data into the chart shown on Coin Detail view.
- 🔑⏳ **4**: API key provided by Coin Gecko doesn't allow for retrieving further coin information, need to wait to hear from them or find a new provider.

---


## 📦 Installation

### Prerequisites
- Stacked CLI: `1.13.0` - https://stacked.filledstacks.com/docs/tooling/stacked-cli/
- Flutter: `>=3.0.3 <4.0.0`
- Dart: `3.5.3`

### Steps
1. Clone the repository:
   ```bash
   git clone https://github.com/Scott-Atkinson/coin_gecko
   run flutter clean
   run flutter pub get
