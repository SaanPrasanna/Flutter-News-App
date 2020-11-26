import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:newsapi/ui/shared/text_styles.dart';
import 'package:newsapi/ui/shared/ui_helper.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/enums/viewstate.dart';
import '../../core/models/source.dart';
import '../../core/viewmodels/source_model.dart';
import '../shared/app_colors.dart';
import '../widgets/commons.dart';
import 'base_view.dart';

class SourceView extends StatefulWidget {
  @override
  _SourceViewState createState() => _SourceViewState();
}

class _SourceViewState extends State<SourceView> {
  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<SourceModel>(
      onModelReady: (model) => model.getNewsSource(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: backgroundColor,
        body: model.state == ViewState.Busy
            ? Commons.showLoading("Loading Resources")
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UIHelper.verticalSpaceLarge(),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        'News Resources',
                        style: headerStyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text('All Resources', style: subHeaderStyle),
                    ),
                    UIHelper.verticalSpaceSmall(),
                    Expanded(
                      child: getSourceUI(model.newsSource),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Widget getSourceUI(NewsSource newsSource) =>
      new StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        itemCount: newsSource.sources.length,
        itemBuilder: (BuildContext context, int index) => new Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 5.0,
          color: Colors.white24,
          child: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(
                      child: RichText(
                        overflow: TextOverflow.ellipsis,
                        strutStyle: StrutStyle(fontSize: 12.0),
                        text: TextSpan(
                            style: sourceHeaderStyle,
                            text: newsSource.sources[index].name),
                      ),
                    ),
                  ],
                ),
                UIHelper.verticalSpaceSmall(),
                Flexible(
                  child: RichText(
                    overflow: TextOverflow.ellipsis,
                    strutStyle: StrutStyle(fontSize: 12.0),
                    text: TextSpan(
                        style: sourceBodyStyle,
                        text: newsSource.sources[index].description),
                    maxLines: 6,
                  ),
                ),
                UIHelper.verticalSpaceSmall(),
                MaterialButton(
                  padding: EdgeInsets.all(5),
                  color: Colors.white12,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Align(
                    child: Text(
                      "Visit",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  onPressed: () => _launchURL(newsSource.sources[index].url),
                )
              ],
            ),
          ),
        ),
        staggeredTileBuilder: (int index) =>
            new StaggeredTile.count(2, index.isEven ? 2.3 : 2.3),
        mainAxisSpacing: 5.0,
        crossAxisSpacing: 5.0,
      );
}
