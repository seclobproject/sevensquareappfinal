import 'package:flutter/material.dart';


class loader extends StatefulWidget {
  @override
  _loaderState createState() => _loaderState();
}

class _loaderState extends State<loader> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Loading Button'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Toggle loading state
            setState(() {
              isLoading = !isLoading;
              if (isLoading) {
                _animationController.repeat(); // Start the rotation animation
              } else {
                _animationController.reset(); // Stop the rotation animation
              }
            });

            // Simulate some asynchronous task
            Future.delayed(Duration(seconds: 2), () {
              // Toggle loading state again after the task is done
              setState(() {
                isLoading = !isLoading;
                _animationController.reset(); // Stop the rotation animation
              });
            });
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Your button label
              Text(
                'Click Me',
                style: TextStyle(fontSize: 16),
              ),
              // Loading indicator (rotating circular progress)
              isLoading
                  ? Positioned(
                right: 8.0,
                child: Transform.rotate(
                  angle: _animationController.value * 2.0 * 3.141592653589793,
                  child: Icon(
                    Icons.refresh,
                    color: Colors.white,
                  ),
                ),
              )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
