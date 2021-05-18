import 'package:flutter/material.dart';
import 'package:wcif_application/values/values.dart';
import 'package:wcif_application/widgets/shared/custom_appbar.dart';

class UserAnswersScreen extends StatefulWidget {
  @override
  _UserAnswersScreenState createState() => _UserAnswersScreenState();
}

class _UserAnswersScreenState extends State<UserAnswersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Sizes.HEIGHT_56),
        child: CustomAppBar(
          hasTrailing: false,
          hasTitle: true,
          title: "أجاباتي",
        ),
      ),
      body: Text("fff"),
    );
  }
}
