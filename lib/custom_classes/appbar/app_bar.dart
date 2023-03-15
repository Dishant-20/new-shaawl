import 'package:flutter/material.dart';
import 'package:shaawl/classes/headers/utils/utils.dart';

class AppBarScreen extends StatelessWidget with PreferredSizeWidget {
  final String appBarTitle;
  final String strBackButtonHide;
  @override
  final Size preferredSize;

  AppBarScreen(
      {Key? key, required this.appBarTitle, required this.strBackButtonHide})
      : preferredSize = const Size.fromHeight(56.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return (strBackButtonHide == 'yes')
        ? AppBar(
            title: textWithRegularStyle(
              appBarTitle,
              18.0,
              Colors.white,
              '',
            ),
            automaticallyImplyLeading: false,
          )
        : AppBar(
            title: Text(
              appBarTitle,
            ),
            leading: IconButton(
              icon: const Icon(
                Icons.chevron_left,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            automaticallyImplyLeading: true,
          );
  }
}
