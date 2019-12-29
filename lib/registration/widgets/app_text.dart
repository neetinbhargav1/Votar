import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 15.0),
      child: Text(
        'This App is for AEC If you are the student of Assam Engineering College, for registration contact-  \n'
            '-Neetin Bhargav '
            '\n\ B.E. Final Year '
            '\n EMAIL-neetinbhargav@gmail.com '
            '\n CONTACT-8486820911'
            '\n\n-Subhrajit Dutta'
            '\n B.E. Final Year'
            '\n EMAIL-duttasubhrajit97@gmail.com'
            '\n\n-Deepjyoti Deka'
            '\n B.E. Final Year '
            ' \n EMAIL-deepjyotideka1285@gmail.com '
            ,
        style: Theme.of(context).textTheme.body2,textScaleFactor: 1.4,
      ),


    );
  }
}