import 'package:flutter/material.dart';
import 'package:newsapi/ui/shared/text_styles.dart';
import 'package:newsapi/ui/widgets/commons.dart';

import '../../core/enums/viewstate.dart';
import '../../core/models/news.dart';
import '../../core/viewmodels/search_model.dart';
import '../shared/app_colors.dart';
import '../shared/ui_helper.dart';
import '../widgets/headline_list_item.dart';
import 'base_view.dart';

class SearchView extends StatefulWidget {
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<SearchModel>(
      builder: (context, model, child) => Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UIHelper.verticalSpaceLarge(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextField(
                textInputAction: TextInputAction.go,
                onSubmitted: (value) async {
                  FocusScope.of(context).requestFocus(FocusNode());
                  //Getting data to news model
                  if (_controller.text != "") {
                    await model.getSearchNews(_controller.text);
                    print(model.news.totalResults);
                    // _controller.clear();
                  }
                },
                controller: _controller,
                decoration: new InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  filled: true,
                  hintStyle: new TextStyle(color: Colors.grey[800]),
                  hintText: "Type Keyword Here",
                  fillColor: Colors.white70,
                  suffixIcon: IconButton(
                    color: Colors.grey,
                    highlightColor: Colors.grey,
                    onPressed: () {
                      _controller.clear();
                    },
                    icon: Icon(Icons.cancel),
                  ),
                ),
              ),
            ),
            UIHelper.verticalSpaceSmall(),
            model.state == ViewState.Busy
                ? Commons.showLoading("Loading Results....")
                : Container(),
            /*
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: MaterialButton(
                padding: EdgeInsets.all(20),
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Align(
                  child: model.state == ViewState.Busy
                      ? SizedBox(
                          width: 25,
                          height: 25,
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : Text('Search News',
                          style: TextStyle(color: Colors.white)),
                ),
                onPressed: () async {
                  //FocusNode, closing the keyboard
                  FocusScope.of(context).requestFocus(FocusNode());
                  //Getting data to news model
                  if (_controller.text != "") {
                    await model.getSearchNews(_controller.text);
                    print(model.news.totalResults);
                  }
                },
              ),
            ),
            */
            model.news == null
                ? Container()
                : Expanded(
                    child: getNewsUi(model.news),
                  ),
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
