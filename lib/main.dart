import 'package:flutter/material.dart';
import 'drawing_canvas.dart';

void main() {
  runApp(const ColoringApp());
}

class ColoringApp extends StatelessWidget {
  const ColoringApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kids Coloring App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const ColoringPage(),
    );
  }
}

class ColoringPage extends StatefulWidget {
  const ColoringPage({super.key});

  @override
  State<ColoringPage> createState() => _ColoringPageState();
}

class _ColoringPageState extends State<ColoringPage> {
  Color _selectedColor = Colors.black;
  double _brushSize = 5.0;
  final List<Color> _colors = [
    Colors.black,
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
    Colors.brown,
  ];

  void _selectColor(Color color) {
    setState(() {
      _selectedColor = color;
    });
  }

  void _updateBrushSize(double size) {
    setState(() {
      _brushSize = size;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kids Coloring App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.brush),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Brush Size'),
                  content: Slider(
                    value: _brushSize,
                    min: 1,
                    max: 20,
                    onChanged: _updateBrushSize,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              // TODO: Implement clear canvas
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: DrawingCanvas(
              selectedColor: _selectedColor,
              brushSize: _brushSize,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: _colors
                    .map(
                      (color) => GestureDetector(
                        onTap: () => _selectColor(color),
                        child: Container(
                          margin: const EdgeInsets.all(4),
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: color,
                            border: Border.all(
                              color: _selectedColor == color
                                  ? Colors.grey[300]!
                                  : Colors.grey[600]!,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}