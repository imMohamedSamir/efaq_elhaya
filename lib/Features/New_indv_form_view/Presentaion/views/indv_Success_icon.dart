import 'package:efaq_elhaya/Core/theming/color_manager.dart';
import 'package:flutter/material.dart';

class IndvSuccessIcon extends StatefulWidget {
  const IndvSuccessIcon({super.key});

  @override
  _IndvSuccessIconState createState() => _IndvSuccessIconState();
}

class _IndvSuccessIconState extends State<IndvSuccessIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();

    // ✅ Animation Controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    // ✅ Bounce Effect (Scaling)
    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.2)
        .chain(CurveTween(curve: Curves.elasticOut))
        .animate(_controller);

    // ✅ Start Animation After a Small Delay
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() => _isVisible = true);
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _isVisible ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 400),
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ColorManager.primary.withValues(alpha: 0.2),
          ),
          child: const Icon(
            Icons.check_circle_outline_rounded,
            color: ColorManager.primary,
            size: 50,
          ),
        ),
      ),
    );
  }
}
