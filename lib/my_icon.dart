import 'package:flutter/material.dart';

// ignore: public_member_api_docs
class MyIcon extends StatelessWidget {
  // ignore: public_member_api_docs
  final bool isAddIconVisible;
  // ignore: public_member_api_docs
  final Color backgroundColor;

  // ignore: public_member_api_docs
  const MyIcon({required this.isAddIconVisible, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: AnimatedOpacity(
        opacity: isAddIconVisible ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 200),
        child: GestureDetector(
          onTap: () {
            showGeneralDialog(
              context: context,
              pageBuilder: (context, animation1, animation2) {
                return Center(
                  child: Material(
                    color: Colors.transparent,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular (6),
                      ),
                      child: const Text(
                        "Don't touch me!",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                );
              },
              barrierDismissible: true,
              barrierLabel: "",
              transitionDuration: const Duration(milliseconds: 300),
            );
          },
          child: Icon(
            Icons.android,
            size: 60,
            color: (Color backgroundColor) {
              const threshold = 128;
              final bgDelta = (backgroundColor.red * 0.299) +
                  (backgroundColor.green * 0.587) +
                  (backgroundColor.blue * 0.114);
              {
                return (bgDelta > threshold) ? Colors.black : Colors.white;
              }
            }(backgroundColor),
          ),
        ),
      ),
    );
  }
}
