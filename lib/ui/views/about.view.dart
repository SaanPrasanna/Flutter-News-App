import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../shared/app_colors.dart';
import '../shared/text_styles.dart';
import '../shared/ui_helper.dart';

class SettingsView extends StatefulWidget {
  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          UIHelper.verticalSpaceLarge(),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              'About Developer',
              style: headerStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
          ),
          UIHelper.verticalSpaceSmall(),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/android.png"),
                fit: BoxFit.cover,
              ),
            ),
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            height: MediaQuery.of(context).size.height * 0.5,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.65,
                  // padding: EdgeInsets.all(5),
                  margin: EdgeInsets.only(right: 20),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    elevation: 5.0,
                    color: Color(0xFF455A64),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Image(
                            image: AssetImage("assets/github.png"),
                            width: 130,
                          ),
                          UIHelper.verticalSpaceMedium(),
                          Text(
                            "Find me on GITHUB",
                            style: sourceHeaderStyle,
                          ),
                          UIHelper.verticalSpaceSmall(),
                          MaterialButton(
                            padding: EdgeInsets.all(20),
                            color: Colors.white12,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Align(
                              child: Text(
                                "Sandun Prasanna",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                            onPressed: () =>
                                _launchURL("https://github.com/SaanPrasanna"),
                          ),
                          UIHelper.verticalSpaceMedium(),
                          Text(
                            "All rights reserved C3",
                            style: subHeaderStyle,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.65,
                  // padding: EdgeInsets.all(5),
                  margin: EdgeInsets.only(right: 20),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    elevation: 5.0,
                    color: Color(0xFF455A64),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "News API v1",
                            style: headerStyle,
                          ),
                          UIHelper.verticalSpaceSmall(),
                          Flexible(
                            child: RichText(
                              overflow: TextOverflow.ellipsis,
                              strutStyle: StrutStyle(fontSize: 12.0),
                              text: TextSpan(
                                style: subHeaderStyle,
                                text:
                                    "News API is a simple HTTP REST API for searching and retrieving live articles from all over the web.",
                              ),
                              maxLines: 5,
                            ),
                          ),
                          UIHelper.verticalSpaceMedium(),
                          Text(
                            "Endpoints",
                            style: sourceHeaderStyle,
                          ),
                          UIHelper.verticalSpaceSmall(),
                          Text(
                            "Using News API is simple. There are only 2 endpoints",
                            style: subHeaderStyle,
                          ),
                          UIHelper.verticalSpaceSmall(),
                          Text(
                            "https://newsapi.org/v1/articles",
                            style: TextStyle(color: Colors.orange),
                          ),
                          Text(
                            "https://newsapi.org/v1/sources",
                            style: TextStyle(color: Colors.orange),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
