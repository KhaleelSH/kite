import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AnimatedKiteLogo extends StatefulWidget {
  const AnimatedKiteLogo({super.key});

  @override
  State<AnimatedKiteLogo> createState() => _AnimatedKiteLogoState();
}

class _AnimatedKiteLogoState extends State<AnimatedKiteLogo> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 400))..repeat(reverse: true);
    _animation = Tween<double>(
      begin: 0,
      end: 32,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut, reverseCurve: Curves.bounceOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, -_animation.value),
          child: Hero(
            tag: 'kite-logo',
            child: SvgPicture.asset(
              'assets/svg/kite_${Theme.of(context).brightness.name}.svg',
              width: 80,
              height: 80,
            ),
          ),
        );
      },
    );
  }
}
