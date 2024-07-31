import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    required this.body,
    this.resize = false,
  });

  final Widget body;
  final bool resize;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: resize,
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).viewPadding.top,
            color: Colors.white,
          ),
          Expanded(
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                ),
                body,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
