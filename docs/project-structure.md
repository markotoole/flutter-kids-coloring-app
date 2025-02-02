# Project Structure

## Directory Layout
```
coloring_app/
├── lib/
│   ├── main.dart           # Main application code
│   └── drawing_canvas.dart # Drawing canvas implementation
├── ios/                    # iOS project files (needs setup)
└── pubspec.yaml           # Project configuration
```

## Code Organization

### Main App (`main.dart`)
- Implements Material Design 3
- Contains color picker UI
- Manages brush size dialog
- Handles clear canvas functionality

### Drawing Canvas (`drawing_canvas.dart`)
- Custom painter implementation
- Handles touch/mouse input
- Manages drawing paths
- Implements brush properties

## Feature Implementation

### Color Picker
- 8 color palette
- Material Design 3 theme integration

### Drawing Canvas
- Custom painter for drawing
- Path management
- Brush size control

### Platform-Specific Code
- Web implementation complete
- iOS implementation pending