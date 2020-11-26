import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Commons {
  static Widget _showLoader() {
    return Center(
      child: SpinKitFadingCube(
        itemBuilder: (context, index) {
          return DecoratedBox(
            decoration: BoxDecoration(
              color: index.isEven ? Colors.blue : Colors.grey,
            ),
          );
        },
      ),
    );
  }

  static Widget showLoading(String msg) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(18),
          child: Text(msg,style: TextStyle(color: Colors.white)),
        ),
        _showLoader(),
      ],
    );
  }
}
