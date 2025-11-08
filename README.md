# flappy_dash

Flappy bird but in Flutter! A fun game built with Flutter and the Flame game engine.

## 🎮 Play Online

You can play the game at: [https://kamilsztandur.github.io/flappy_dash/](https://kamilsztandur.github.io/flappy_dash/)

## 🚀 Deployment

This project is automatically deployed to GitHub Pages using GitHub Actions. Every push to the `main` branch triggers a new deployment.

## 🛠️ Development

### Prerequisites

- Flutter SDK 3.35.7 or higher
- Dart SDK 3.9.2 or higher

### Getting Started

## 📁 Project Structure

- `lib/` - Main application code
  - `features/` - Feature modules
    - `game/` - Game logic and components
    - `home/` - Home screen
    - `leaderboard/` - Leaderboard functionality
    - `overlays/` - Game overlays (menu, game over)
  - `resources/` - Generated assets and resources
  - `l10n/` - Internationalization files
  - `design_system/` - UI components and design system
  - `common/` - Shared utilities
- `assets/` - Game assets (images, audio, etc.)
- `.github/workflows/` - GitHub Actions workflows

## 🌐 Technologies

- **Flutter** - UI framework
- **Flame** - Game engine
- **Bloc/Cubit** - State management
- **Hive** - Local storage
