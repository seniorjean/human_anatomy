library human_anatomy;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'human_anatomy.dart';
import 'utils.dart';

class FullPageHumanAnatomy extends StatelessWidget {
  List<String> _finalBodyPartList = [];
  final Map<String, dynamic> mapData;
  final Widget? container;
  final String title;
  final String route;

  FullPageHumanAnatomy({
    Key? key,
    required this.mapData,
    this.container,
    required this.title,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(mapData);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            container ?? Container(),
            TopTitle(
              topMargin: 80.0,
              leftMargin: 50.0,
              title: title,
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 50.0),
              child: HumanAnatomy(
                onChanged: bodyPartList,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                backgroundColor: Colors.white,
                child: Icon(Icons.arrow_forward),
                onPressed: () {
                  mapData['bodyPart'] = _finalBodyPartList.toString();

                  if (_finalBodyPartList.isEmpty) {
                    Utils().showMyDialog(
                        context, "Please Select Affected Body Part");
                  } else {
                    Navigator.pushNamed(context, route, arguments: mapData);
                  }
                },
              ),
            ),
            MyBackButton(),
          ],
        ),
      ),
    );
  }

  void bodyPartList(List<String> value) {
    _finalBodyPartList = value;
  }
}
