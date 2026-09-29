import 'package:flutter/material.dart';
import '../constants/app_assets.dart';

class CustomScaffoldWithBg extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final bool resizeToAvoidBottomInset;
  final bool extendBodyBehindAppBar;
  final bool extendBody;
  
  const CustomScaffoldWithBg({
    Key? key,
    required this.body,
    this.appBar,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.resizeToAvoidBottomInset = true,
    this.extendBodyBehindAppBar = false,
    this.extendBody = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.appBg),
          fit: BoxFit.cover, // Ensures the background image covers the whole screen
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent, // Makes the scaffold transparent so the image shows through
        appBar: appBar,
        body: body,
        floatingActionButton: floatingActionButton,
        bottomNavigationBar: bottomNavigationBar,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        extendBodyBehindAppBar: extendBodyBehindAppBar,
        extendBody: extendBody,
      ),
    );
  }
}
