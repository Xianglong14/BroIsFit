import 'dart:math';

import 'package:flutter/material.dart';
import '../../../../../app.dart';

class HighlightedImage extends StatefulWidget {
  @override
  _HighlightedImageState createState() => _HighlightedImageState();
}

class _HighlightedImageState extends State<HighlightedImage>
    with SingleTickerProviderStateMixin {
  List<String> _muscleGroups = [
    "Shoulder",
    "Chest",
    "Abdominal",
    "Side Abs",
    "Bicep",
    "Form Arm",
    "Quadricep",
    "Tibialis Ant",
  ];

  Map<int, Widget> _activeMusclePoints = {};
  Map<int, Widget> _activeMuscleLines = {};

  Widget TriggerMuscles(int index) {
    switch (index) {
      case 0:
        return MusclePoint(right: 180, top: 110);
      case 1:
        return MusclePoint(right: 150, top: 130);
      case 4:
        return MusclePoint(right: 190, top: 170);
      default:
        return SizedBox.shrink();
    }
  }

  Widget TriggerMusclesLine(int index) {
    switch (index) {
      case 0:
        return MuscleLine(
          angle: 50,
          right: 160,
          top: 20,
          width: 120,
          height: 120,
        );
      case 1:
        return RightAngle(
          angle1: 270,
          angle2: 200,
          width: 50,
          height: 40,
          right: 123,
          top: 20,
          length1: 100,
          length2: 115,
        );
      case 4:
        return MuscleLine(
          angle: 135,
          right: 190,
          top: 160,
          width: 85,
          height: 100,
        );
      default:
        return SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 8.0, top: 8.0, left: 32.0),
              child: Text(
                "Target Muscle",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.0),
              child: Text(
                "Select target muscle group",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 300,
              child: TabBar(
                tabs: [
                  Tab(text: 'Front side'),
                  Tab(text: 'Rear side'),
                ],
                labelStyle:
                    TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                indicatorColor: AppColor.color4,
                labelColor: AppColor.color4,
                unselectedLabelColor: Colors.white70,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: TabBarView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Container(
                      child: Stack(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: _muscleGroups.length,
                            itemBuilder: (context, index) {
                              bool isSelected =
                                  _activeMusclePoints.containsKey(index);
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 5),
                                  GestureDetector(
                                    child: Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: isSelected
                                                ? Colors.transparent
                                                : AppColor.color4),
                                        borderRadius: BorderRadius.circular(20),
                                        color: isSelected
                                            ? AppColor.color4
                                            : Colors.transparent,
                                      ),
                                      width: 150,
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 15,
                                            width: 15,
                                            decoration: BoxDecoration(
                                              color: isSelected
                                                  ? AppColor.color2
                                                  : AppColor.color4,
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          Text(
                                            _muscleGroups[index],
                                            style: TextStyle(
                                                color: isSelected
                                                    ? AppColor.color2
                                                    : Colors.white,
                                                fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        if (isSelected) {
                                          _activeMusclePoints.remove(index);
                                          _activeMuscleLines.remove(index);
                                        } else {
                                          _activeMusclePoints[index] =
                                              TriggerMuscles(index);
                                          _activeMuscleLines[index] =
                                              TriggerMusclesLine(index);
                                        }
                                      });
                                    },
                                  ),
                                  SizedBox(height: 10)
                                ],
                              );
                            },
                          ),
                          Positioned(
                            right: 0,
                            child: Image.asset(
                              "assets/images/robot-f.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          // ..._activeMuscleLines.values,
                          ..._activeMusclePoints.values,
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Center(
                      child: Text(
                        'Rear side content',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MuscleLine extends StatelessWidget {
  final int angle;
  final double right;
  final double top;
  final double width;
  final double height;
  const MuscleLine(
      {super.key,
      required this.angle,
      required this.right,
      required this.top,
      required this.width,
      required this.height});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: right,
      top: top,
      child: CustomPaint(
          size: Size(width, height),
          painter: RotatedLinePainter(
            index: angle,
            color: Colors.grey,
            dotRadius: 2.0,
            spacing: 4.0,
          )),
    );
  }
}

class RightAngle extends StatelessWidget {
  final double angle1;
  final double angle2;
  final double width;
  final double height;
  final double right;
  final double top;
  final double length1;
  final double length2;

  const RightAngle({
    Key? key,
    required this.angle1,
    required this.angle2,
    required this.width,
    required this.height,
    required this.right,
    required this.top,
    required this.length1,
    required this.length2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: right,
      top: top,
      child: CustomPaint(
        size: Size(width, height),
        painter: RightAnglePainter(
          angle1: angle1,
          angle2: angle2,
          length1: length1,
          length2: length2,
        ),
      ),
    );
  }
}

class RightAnglePainter extends CustomPainter {
  final double angle1; // Angle for line 1 in degrees
  final double angle2; // Angle for line 2 in degrees
  final double length1; // Length for line 1
  final double length2; // Length for line 2
  final double dotRadius = 2; // Radius of the dots
  final double gapLength = 5; // Length of gap between dots

  RightAnglePainter(
      {required this.angle1,
      required this.angle2,
      required this.length1,
      required this.length2});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2;

    // Fixed start points for both lines
    Offset start = Offset(size.width / 3, size.height / 2);

    // Calculate endpoints of line 1 based on angle1 and length1
    Offset end1 = calculateEndPoint(start, angle1, length1);

    // Calculate endpoints of line 2 based on angle2 and length2
    Offset end2 = calculateEndPoint(start, angle2, length2);

    // Draw first line as dotted
    drawDottedLine(canvas, paint, start, end1);

    // Draw second line as dotted
    drawDottedLine(canvas, paint, start, end2);
  }

  void drawDottedLine(Canvas canvas, Paint paint, Offset start, Offset end) {
    final double distance = (end - start).distance;
    final int segments = (distance / (dotRadius * 2 + gapLength)).ceil();

    final double dx = (end.dx - start.dx) / segments;
    final double dy = (end.dy - start.dy) / segments;

    for (int i = 0; i < segments; i++) {
      final Offset dotCenter = Offset(start.dx + i * dx, start.dy + i * dy);

      canvas.drawCircle(dotCenter, dotRadius, paint);
    }
  }

  Offset calculateEndPoint(Offset start, double angle, double length) {
    double radians = angle * (pi / 180);
    double dx = length * cos(radians);
    double dy = length * sin(radians);
    return Offset(
        start.dx + dx,
        start.dy -
            dy); // Subtract dy because y-axis is inverted in Flutter canvas
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class MusclePoint extends StatelessWidget {
  final int right;
  final int top;
  const MusclePoint({super.key, required this.right, required this.top});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: right.toDouble(),
      top: top.toDouble(),
      child: Container(
        height: 15,
        width: 15,
        decoration: BoxDecoration(
          color: AppColor.color1,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

class RotatedLinePainter extends CustomPainter {
  final int index;
  final Color color;
  final double dotRadius;
  final double spacing;

  RotatedLinePainter({
    required this.index,
    required this.color,
    this.dotRadius = 2.0,
    this.spacing = 4.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    canvas.save(); // Save the current canvas state
    canvas.translate(size.width / 2,
        size.height / 2); // Move the origin to the center of the canvas
    canvas
        .rotate(index * 3.1415927 / 180); // Rotate the canvas by index degrees

    double startX = -size.width / 2;
    while (startX < size.width / 2) {
      canvas.drawCircle(Offset(startX, 0), dotRadius, paint);
      startX += dotRadius * 2 + spacing;
    }

    canvas.restore(); // Restore the canvas to its original state
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}



// _selectedMuscleIndices.contains(0)
                        //     ? Positioned(
                        //         right: 190,
                        //         top: 130,
                        //         child: Container(
                        //           height: 15,
                        //           width: 15,
                        //           decoration: BoxDecoration(
                        //             color: AppColor.color4,
                        //             shape: BoxShape.circle,
                        //           ),
                        //         ),
                        //       )
                        //     : SizedBox.shrink(),
                        // _selectedMuscleIndices.contains(0)
                        //     ? Positioned(
                        //         right: 180,
                        //         top: 20,
                        //         child: CustomPaint(
                        //           size: Size(130, 140),
                        //           painter: RotatedLinePainter(),
                        //         ),
                        //       )
                        //     : SizedBox(),
                        // Positioned(
                        //   right: 195,
                        //   top: 190,
                        //   child: Container(
                        //     height: 15,
                        //     width: 15,
                        //     decoration: BoxDecoration(
                        //       color: AppColor.color4,
                        //       shape: BoxShape.circle,
                        //     ),
                        //   ),
                        // )