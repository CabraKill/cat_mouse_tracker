import 'package:cat_mouse_tracker/presentation/pages/home/widgets/user_profile_floating_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late StateMachineController _controller;
  SMINumber? _vertical;
  SMINumber? _horizontal;

  void _onInit(Artboard art) {
    var ctrl = StateMachineController.fromArtboard(art, 'State Machine 1')
        as StateMachineController;
    art.addController(ctrl);
    setState(() {
      _controller = ctrl;
      _vertical = _controller.findInput<double>('vertical') as SMINumber;
      _horizontal = _controller.findInput<double>('horizontal') as SMINumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MouseRegion(
        onHover: _onHover,
        child: Stack(
          children: [
            RiveAnimation.asset(
              "assets/rive/cat.riv",
              alignment: Alignment.bottomCenter,
              fit: BoxFit.cover,
              onInit: _onInit,
            ),
          ],
        ),
      ),
      floatingActionButton: const UserProfileFloatingButton(),
    );
  }

  void _onHover(PointerHoverEvent event) {
    final dx = _getXInputFromMouse(event);
    final dy = _getYInputFromMouse(event);

    _vertical?.change(dy);
    _horizontal?.change(dx);
  }

  double _getXInputFromMouse(PointerHoverEvent event) {
    final screenWidth = MediaQuery.of(context).size.width;
    var dxLocation = event.localPosition.dx;
    final dx = (dxLocation / screenWidth) * 100;
    return dx;
  }

  double _getYInputFromMouse(PointerHoverEvent event) {
    final screenHeight = MediaQuery.of(context).size.height;
    var dyLocation = event.localPosition.dy;
    final dyFactor = (dyLocation / screenHeight);
    var offset = -0.55;
    var dyNotNormalized = (dyFactor + offset) / (1 + offset);
    var dy = dyNotNormalized < 0 ? 0.0 : dyNotNormalized * 100;
    return dy;
  }
}


