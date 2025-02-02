# Development Setup Guide

## Prerequisites

1. Flutter SDK installed in `/Volumes/NVME/development/flutter`
2. Dart SDK version 3.8.0
3. Chrome browser for web development
4. Xcode for iOS development (pending setup)

## Environment Setup

### Web Platform
1. Ensure Chrome is installed
2. Run the app using:
   ```bash
   flutter run -d chrome
   ```
3. Hot reload available for quick iterations

### iOS Platform Setup (Pending)
1. Install Xcode
2. Configure CocoaPods
3. Set up iOS simulator
4. Configure platform-specific files

## Project Location
```
/Volumes/NVME/development/coloring_app
```

## Build Commands

### Web
```bash
flutter build web
```

### iOS (After Setup)
```bash
flutter build ios
```