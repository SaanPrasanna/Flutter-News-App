import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../core/models/news.dart';
import '../shared/text_styles.dart';

class HeadlineListItem extends StatelessWidget {
  final Articles articles;
  final Function onTap;
  const HeadlineListItem({this.articles, this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.white24,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          children: [
            Hero(
              tag: articles,
              child: Container(
                height: 150,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(articles.urlToImage !=
                              ""
                          ? articles.urlToImage
                          : "https://www.signfix.com.au/wp-content/uploads/2017/09/placeholder-600x400.png"),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 3.0,
                          offset: Offset(0.0, 2.0),
                          color: Color.fromARGB(80, 0, 0, 0))
                    ]),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '${articles.title}',
                    maxLines: 2,
                    style: newsHeaderStyle,
                  ),
                  Text(
                    articles.publishedAt != null
                        ? DateFormat.yMMMMEEEEd()
                            .add_Hm()
                            .format(DateTime.parse(articles.publishedAt))
                        : "",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: newsSubHeaderStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
