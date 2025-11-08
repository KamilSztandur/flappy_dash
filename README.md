# flappy_dash

Flappy bird but in Flutter! A fun game built with Flutter and the Flame game engine.

## 🎮 Play Online

You can play the game at: [https://YOUR_GITHUB_USERNAME.github.io/flappy_dash/](https://YOUR_GITHUB_USERNAME.github.io/flappy_dash/)

(Replace `YOUR_GITHUB_USERNAME` with your actual GitHub username)

## 🚀 Deployment

This project is automatically deployed to GitHub Pages using GitHub Actions. Every push to the `main` branch triggers a new deployment.

### Setting up GitHub Pages (First Time Setup)

After pushing these changes to GitHub, you need to configure GitHub Pages:

1. Go to your repository on GitHub
2. Click on **Settings** → **Pages**
3. Under **Source**, select **GitHub Actions**
4. The site will automatically deploy on the next push to `main`

## 🛠️ Development

### Prerequisites

- Flutter SDK 3.35.7 or higher
- Dart SDK 3.9.2 or higher

### Getting Started

1. Clone the repository
```bash
git clone https://github.com/YOUR_GITHUB_USERNAME/flappy_dash.git
cd flappy_dash
```

2. Install dependencies
```bash
flutter pub get
```

3. Run the app
```bash
# For web
flutter run -d chrome

# For desktop (macOS)
flutter run -d macos

# For desktop (Linux)
flutter run -d linux
```

### Building

#### Web
```bash
flutter build web --release --base-href "/flappy_dash/"
```

#### macOS
```bash
flutter build macos --release
```

#### Linux
```bash
flutter build linux --release
```

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
- **SQLite** - Database for leaderboard

## 📝 License

This project is open source and available under the MIT License.
