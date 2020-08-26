import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).canvasColor,
      child: Center(
        child: SpinKitCircle(
          color: Theme.of(context).accentColor,
          size: 50.0,
        ),
      ),
    );
  }
}
