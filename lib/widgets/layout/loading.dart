import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wcif_application/values/values.dart';


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
          loading.load == true ?
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.black.withOpacity(0.2),
            alignment: Alignment.center,
            child: Container(
              width: 200,
              height: 256,
              color: AppColors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    StringConst.PLEAS_WAIT,
                    style: TextStyle(
                      color: AppColors.greenblue,
                      fontSize:Sizes.TEXT_SIZE_30 ,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Image.asset(
                    ImagePath.SYNC,
                    fit:BoxFit.fill,
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