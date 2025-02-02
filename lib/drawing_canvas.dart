import 'package:flutter/material.dart';

class DrawingCanvas extends StatefulWidget {
  final Color selectedColor;
  final double brushSize;

  const DrawingCanvas({
    super.key,
    required this.selectedColor,
    required this.brushSize,
  });

  @override
  State<DrawingCanvas> createState() => _DrawingCanvasState();
}

class _DrawingCanvasState extends State<DrawingCanvas> {
  final List<DrawingPoint?> _points = [];

  void _onPanStart(DragStartDetails details) {
    final point = DrawingPoint(
      point: details.localPosition,
      color: widget.selectedColor,
      width: widget.brushSize,
    );
    setState(() {
      _points.add(point);
    });
  }

  void _onPanUpdate(DragUpdateDetails details) {
    final point = DrawingPoint(
      point: details.localPosition,
      color: widget.selectedColor,
      width: widget.brushSize,
    );
    setState(() {
      _points.add(point);
    });
  }

  void _onPanEnd(DragEndDetails details) {
    setState(() {
      _points.add(null);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: _onPanStart,
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      child: CustomPaint(
        painter: _DrawingPainter(_points),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.transparent,
        ),
      ),
    );
  }
}

class _DrawingPainter extends CustomPainter {
  final List<DrawingPoint?> points;

  _DrawingPainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(
          points[i]!.point,
          points[i + 1]!.point,
          Paint()
            ..color = points[i]!.color
            ..strokeWidth = points[i]!.width
            ..strokeCap = StrokeCap.round,
        );
      }
    }
  }

  @override
  bool shouldRepaint(_DrawingPainter oldDelegate) => true;
}

class DrawingPoint {
  final Offset point;
  final Color color;
  final double width;

  DrawingPoint({
    required this.point,
    required this.color,
    required this.width,
  });
}