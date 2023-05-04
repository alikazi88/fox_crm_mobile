import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/theme/app_theme.dart';

import '../../../theme/constant.dart';
import '../controllers/splash_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  late SplashController controller;

  @override
  initState() {
    super.initState();

    FxControllerStore.resetStore();
    theme = AppTheme.estateTheme;
    customTheme = AppTheme.customTheme;
    controller = FxControllerStore.putOrFind(SplashController());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme.copyWith(
          colorScheme: theme.colorScheme
              .copyWith(secondary: theme.colorScheme.primaryContainer)),
      debugShowCheckedModeBanner: false,
      home: FxBuilder<SplashController>(
          controller: controller,
          builder: (controller) {
            return Scaffold(
              body: Stack(
                children: [
                     Image(
                    height: MediaQuery.of(context).size.height,
                    fit: BoxFit.cover,
                    image: AssetImage("./assets/illustration/shopping/setup.png"),
                  ),
                  Positioned(
                    top: -130,
                    left: 0,
                    right: 0,
                    child: Image(
                    height: MediaQuery.of(context).size.height,
                    image: AssetImage("./assets/illustration/shopping/logo.png"),
                  ),
                  ),
                 Positioned(
                      top: 370,
                      left: 0,
                      right: 0,
                      child: FxText.displaySmall(
                      'Let\'s ease up handling' '\n\n' 'your contacts',
                      color: customTheme.estateOnPrimary,
                      textAlign: TextAlign.center,
                      letterSpacing: 0.2,
                      fontSize: 30,
                      height: 0.55,
                    ),
                  ),
                   Positioned(
                    top: 420,
                    left: 0,
                    right: 0,
                    child: FxText.displaySmall(
                      'under one roof',
                      color: customTheme.estateOnPrimary,
                      textAlign: TextAlign.center,
                      fontWeight: 800,
                       fontSize: 30,
                    ),
                  ),
                  
                  Positioned(
                    top: 460,
                    child: FxCard(
                      onTap: () {
                        controller.goToLogin();
                      },
                      paddingAll: 24,
                      color: customTheme.estatePrimary,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8)),
                      width: MediaQuery.of(context).size.width - 64,
                      marginAll: 32,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FxText.bodyMedium(
                            'Let\'s Connect',
                            fontWeight: 700,
                            color: customTheme.estateOnPrimary,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
