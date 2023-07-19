import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> animation;

  @override
  void initState() {
    super.initState();
    initSliderAnimation();
    NavigateToHome();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetsData.logo),
        const SizedBox(
          height: 6,
        ),
        AnimatedBuilder(
          animation: animation,
          builder: (context, _) {
            return SlideTransition(
              position: animation,
              child: const Text(
                'Read Free Books',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            );
          },
        ),
      ],
    );
  }

  void initSliderAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animation = Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero)
        .animate(animationController);
    animationController.forward();
  }

  void NavigateToHome() {
    Future.delayed(const Duration(seconds: 2), () {
      // Get.to(()=>const HomeView() ,
      //     transition: Transition.fade ,
      //duration: kDuration);
      GoRouter.of(context).push(AppRouter.kHomeView);
    });
  }
}
