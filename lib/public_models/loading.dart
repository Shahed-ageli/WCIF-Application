import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoadingModel extends ChangeNotifier {
  bool load = false;

  start() {
    load = true;
    notifyListeners();
  }

  stop() {
    load = false;
    notifyListeners();
  }
}


class LoadingBox extends StatelessWidget {
  final Widget child;
  const LoadingBox({this.child});
  @override
  Widget build(BuildContext context) {
    var loading = Provider.of<LoadingModel>(context, listen: true);
    return Directionality(textDirection: TextDirection.rtl,
      child:Stack(
        children: [
          child,
          loading.load == true
              ? Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.black.withOpacity(0.2),
            alignment: Alignment.center,
            child: Container(
              width: 200,
              height: 256,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "جاري التحميل",
                    style: TextStyle(
                      color: Color(0xff9e9e9e),
                      fontFamily: 'Swissra-Normal',
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none,
                      height: 2.6,
                    ),
                  ),
                  Image.asset(
                    'assets/images/loading.gif',
                  ),
                ],
              ),
            ),
          )
              : Container(),
        ],
      ),

    );
  }
}
