import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/models/news.dart';
import '../shared/app_colors.dart';
import '../shared/text_styles.dart';
import '../shared/ui_helper.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({Key key, this.articles}) : super(key: key);
  final Articles articles;

  @override
  _DetailsViewState createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
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
      body: widget.articles == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Hero(
                    transitionOnUserGestures: true,
                    tag: widget.articles,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      height: MediaQuery.of(context).size.height * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(widget
                                      .articles.urlToImage !=
                                  ""
                              ? widget.articles.urlToImage
                              : "https://www.signfix.com.au/wp-content/uploads/2017/09/placeholder-600x400.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      margin: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.6,
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Text(
                              widget.articles.title,
                              style: detailsHeaderStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  widget.articles.publishedAt != null
                                      ? DateFormat.yMMMMEEEEd().add_Hm().format(
                                            DateTime.parse(
                                                widget.articles.publishedAt),
                                          )
                                      : "",
                                  style: TextStyle(color: Colors.redAccent),
                                ),
                              ],
                            ),
                            UIHelper.verticalSpaceSmall(),
                            Row(
                              children: [
                                Text(
                                  "Author : ",
                                  style: subHeaderStyle,
                                ),
                                Flexible(
                                  child: RichText(
                                    overflow: TextOverflow.ellipsis,
                                    strutStyle: StrutStyle(fontSize: 12.0),
                                    text: TextSpan(
                                        style: subHeaderStyle,
                                        text: widget.articles.author),
                                  ),
                                ),
                              ],
                            ),
                            UIHelper.verticalSpaceMedium(),
                            Text(
                              widget.articles.description,
                              style: subHeaderStyle,
                            ),
                            UIHelper.verticalSpaceSmall(),
                            Text(widget.articles.content,
                                style: subHeaderStyle),
                            UIHelper.verticalSpaceMedium(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "Source : ",
                                  style: subHeaderStyle,
                                ),
                                Text(
                                  widget.articles.source.name,
                                  style: subHeaderStyle,
                                ),
                              ],
                            ),
                            UIHelper.verticalSpaceSmall(),
                            MaterialButton(
                              padding: EdgeInsets.all(20),
                              color: Colors.white12,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Align(
                                child: Text(
                                  "Read More...",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                              onPressed: () => _launchURL(widget.articles.url),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
