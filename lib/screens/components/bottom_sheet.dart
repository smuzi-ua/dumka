import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class DumkaBottomSheet {
  static void show(BuildContext context, Widget widget) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: CustomPaint(
              painter: _SheetShape(),
              child: Column(
                children: [
                  FloatingActionButton(
                    onPressed: () => Navigator.of(context).pop(),
                    backgroundColor: Colors.deepPurpleAccent.shade400,
                    child: const Icon(
                      MdiIcons.close,
                      color: Colors.white,
                      size: 26.0,
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  widget,
                  const SizedBox(
                    height: 18,
                  ),
                ],
              ),
            ),
          );
        });
  }
}

class _SheetShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Colors.white;
    canvas.drawPath(
      Path.combine(
        PathOperation.difference,
        Path()
          ..addRRect(RRect.fromRectAndCorners(
              Rect.fromPoints(
                  const Offset(0, 28), Offset(size.width, size.height)),
              topLeft: const Radius.circular(26),
              topRight: const Radius.circular(26))),
        Path()
          ..addOval(
              Rect.fromCircle(center: Offset(size.width / 2, 28), radius: 36))
          ..close(),
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
