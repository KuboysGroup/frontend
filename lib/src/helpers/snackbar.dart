import 'package:flutter/material.dart';

class KSnackBar {
  static void showCustomSnackbar(BuildContext context, String message) {
    final overlay = Overlay.of(context);
    bool isMobile = MediaQuery.of(context).size.width < 600;
    double screenWidth = MediaQuery.of(context).size.width;
    double snackbarWidth = isMobile ? screenWidth : screenWidth * 0.3;
    late OverlayEntry overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (context) => AnimatedSnackbar(
        message: message,
        width: snackbarWidth,
        onDismiss: () => overlayEntry.remove(),
      ),
    );

    overlay.insert(overlayEntry);
  }
}

class AnimatedSnackbar extends StatefulWidget {
  final String message;
  final double width;
  final VoidCallback onDismiss;

  // ignore: use_super_parameters
  const AnimatedSnackbar({
    Key? key,
    required this.message,
    required this.width,
    required this.onDismiss,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AnimatedSnackbarState createState() => _AnimatedSnackbarState();
}

class _AnimatedSnackbarState extends State<AnimatedSnackbar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _positionAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _positionAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward().then((value) {
      Future.delayed(const Duration(seconds: 2), () {
        _controller.reverse().then((value) => widget.onDismiss());
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0.0,
      right: 0.0,
      child: SlideTransition(
        position: _positionAnimation,
        child: Material(
          elevation: 10.0,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: widget.width,
            height: 50,
            color: Colors.black87,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.message,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
