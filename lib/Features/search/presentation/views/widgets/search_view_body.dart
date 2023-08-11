import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../home/presentation/views/widgets/best_seller_listview_item.dart';
import 'custom_search_textfeild.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(),
          SizedBox(
            height: 20,
          ),
          Text(
            'Search Result',
            style: Styles.textStyle18,
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(child: SearchListView()),
        ],
      ),
    );
  }
}

class SearchListView extends StatelessWidget {
  const SearchListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: 10,
        itemBuilder: (context, index) {
          return const BestsellerListViewItem(
            author: 'ahmed',
            image: '',
            price: 100,
            rating: 5,
            title: '',
          );
        });
  }
}
