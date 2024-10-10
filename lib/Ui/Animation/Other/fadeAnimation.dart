part of '../animation.dart';

// ~~~~~~~~~~~~~~~~~~~~~~~{{ Why this class }}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/// Animation Show the item as disappearing
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

class FadeAnimationX extends StatelessWidget {
  final int delay;
  final Widget child;
  final bool isDisable;
  final bool isFromEnd;

  const FadeAnimationX({
    required this.child,
    required this.delay,
    this.isDisable = false,
    this.isFromEnd = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final tween = simple_animation.MovieTween()
      ..tween('opacity', Tween(begin: 0.0, end: 1.0),
          duration: const Duration(milliseconds: 500))
      ..tween('translateY', Tween(begin: isFromEnd ? 30.0 : -30.0, end: 0.0),
          duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
    if (isDisable) {
      return child;
    } else {
      return simple_animation.CustomAnimationBuilder(
        delay: Duration(milliseconds: delay),
        duration: tween.duration,
        tween: tween,
        child: child,
        builder: (context, simple_animation.Movie animation, child) => Opacity(
          opacity: animation.get("opacity"),
          child: Transform.translate(
              offset: Offset(0, animation.get("translateY")), child: child),
        ),
      );
    }
  }
}

/// This is an addition to using animation easily
/// like: SizedBox().fadeAnimation100
extension FadeAnimationExtension on Widget {
  FadeAnimationX get fadeAnimation100 {
    return FadeAnimationX(delay: 100, child: this);
  }

  FadeAnimationX get fadeAnimation200 {
    return FadeAnimationX(delay: 200, child: this);
  }

  FadeAnimationX get fadeAnimation250 {
    return FadeAnimationX(delay: 250, child: this);
  }

  FadeAnimationX get fadeAnimation300 {
    return FadeAnimationX(delay: 300, child: this);
  }

  FadeAnimationX get fadeAnimation350 {
    return FadeAnimationX(delay: 350, child: this);
  }

  FadeAnimationX get fadeAnimation400 {
    return FadeAnimationX(delay: 400, child: this);
  }

  FadeAnimationX get fadeAnimation450 {
    return FadeAnimationX(delay: 450, child: this);
  }

  FadeAnimationX get fadeAnimation500 {
    return FadeAnimationX(delay: 500, child: this);
  }

  FadeAnimationX get fadeAnimation600 {
    return FadeAnimationX(delay: 600, child: this);
  }

  FadeAnimationX get fadeAnimation700 {
    return FadeAnimationX(delay: 700, child: this);
  }

  FadeAnimationX get fadeAnimation800 {
    return FadeAnimationX(delay: 800, child: this);
  }

  FadeAnimationX get fadeAnimation900 {
    return FadeAnimationX(delay: 900, child: this);
  }

  FadeAnimationX get fadeAnimation1000 {
    return FadeAnimationX(delay: 1000, child: this);
  }

  /// To customize values
  FadeAnimationX fadeAnimationX(
    int delay, {
    bool isDisable = false,
    bool isFromEnd = false,
  }) {
    return FadeAnimationX(
      delay: delay,
      isDisable: isDisable,
      isFromEnd: isFromEnd,
      child: this,
    );
  }
}
