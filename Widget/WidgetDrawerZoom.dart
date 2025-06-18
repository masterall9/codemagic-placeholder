
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  Body({Key? key, required this.widgets}) : super(key: key);

  Widget widgets;
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> with SingleTickerProviderStateMixin {
  late AnimationController controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 100),
    value: -1.0,
  );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  bool get isPanelVisible {
    final AnimationStatus status = controller.status;
    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TwoPanels(
        controller: controller,
        widgets: widget.widgets,
      ),
    );
  }
}

class TwoPanels extends StatefulWidget {
  final AnimationController controller;
  final Widget widgets;

  const TwoPanels({Key? key, required this.controller, required this.widgets})
      : super(key: key);

  @override
  _TwoPanelsState createState() => _TwoPanelsState();
}

class _TwoPanelsState extends State<TwoPanels> with TickerProviderStateMixin {
  static const _headerHeight = 32.0;
  late TabController tabController = TabController(length: 3, vsync: this);
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..addListener(() {
      print("SlideValue: ${_controller.value} - ${_controller.status}");
    });
  // ignore: unused_field
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(1.5, 0.0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticIn,
  ));

  Animation<RelativeRect> getPanelAnimation(BoxConstraints constraints) {
    final _height = constraints.biggest.height;
    final _backPanelHeight = _height - _headerHeight;
    const _frontPanelHeight = -_headerHeight;

    return RelativeRectTween(
      begin: RelativeRect.fromLTRB(
        0.0,
        _backPanelHeight,
        0.0,
        _frontPanelHeight,
      ),
      end: const RelativeRect.fromLTRB(0.0, 100, 0.0, 0.0),
    ).animate(
      CurvedAnimation(parent: widget.controller, curve: Curves.linear),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: bothPanels,
    );
  }

  Widget bothPanels(BuildContext context, BoxConstraints constraints) {
    // ignore: unused_local_variable
    final ThemeData theme = Theme.of(context);
    return widget.widgets;
  }
}




// ZoomDrawerAmeenHamedFlutterCrafters(
//       controller: z,
//       borderRadius: 50,
//       // showShadow: true,
//       openCurve: Curves.fastOutSlowIn,
//       slideWidth: MediaQuery.of(context).size.width * 0.80,
//       duration: const Duration(milliseconds: 500),
//       // angle: 0.0,
//       menuBackgroundColor: Colors.white,
//       mainScreen: const WudgetPost,
//       // moveMenuScreen: false,
//       menuScreen: Scaffold(
//         backgroundColor: Colors.black,
//         body: Center(
//           child: Column(
//             children: [],
//           ),
//         ),
//       ),
//     );