import 'package:flutter/material.dart';

class StorySwipeAnimation extends StatefulWidget {
  const StorySwipeAnimation({super.key});

  @override
  State<StorySwipeAnimation> createState() => _StorySwipeAnimationState();
}

class _StorySwipeAnimationState extends State<StorySwipeAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1500));

    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));

    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: DecoratedBox(
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.onSurface.withAlpha(128)),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSurface.withAlpha(255),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 16,
              children: [
                AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Transform(
                      alignment: Alignment.bottomCenter,
                      transform: Matrix4.identity()..rotateZ(-0.5 + _animation.value),
                      child: Icon(Icons.swipe, size: 64, color: Theme.of(context).colorScheme.surface),
                    );
                  },
                ),
                Text(
                  'Swipe left or right to navigate between stories',
                  textAlign: TextAlign.center,
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium?.copyWith(color: Theme.of(context).colorScheme.surface),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
