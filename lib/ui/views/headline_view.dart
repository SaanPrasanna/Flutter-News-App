import 'package:flutter/material.dart';
import 'package:newsapi/ui/widgets/commons.dart';

import '../../core/enums/viewstate.dart';
import '../../core/models/news.dart';
import '../../core/viewmodels/headline_model.dart';
import '../shared/app_colors.dart';
import '../shared/text_styles.dart';
import '../shared/ui_helper.dart';
import '../widgets/headline_list_item.dart';
import 'base_view.dart';

class HeadlineView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HeadlineModel>(
      onModelReady: (model) => model.getHeadlineNews(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: backgroundColor,
        body: model.state == ViewState.Busy
            ? Commons.showLoading("Loading Headlines")
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UIHelper.verticalSpaceLarge(),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      'News Headlines',
                      style: headerStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text('Today Headlines', style: subHeaderStyle),
                  ),
                  UIHelper.verticalSpaceSmall(),
                  Expanded(child: getNewsUi(model.news)),
                ],
              ),
      ),
    );
  }

  Widget getNewsUi(News news) => ListView.builder(
        itemCount: news.articles.length,
        itemBuilder: (context, index) => HeadlineListItem(
          articles: news.articles[index],
          onTap: () {
            Navigator.pushNamed(context, 'details',
                arguments: news.articles[index]);
          },
        ),
      );
}
