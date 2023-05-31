import 'package:flutter/material.dart';

import 'best_seller_listview_item.dart';

class BestSellerListView extends StatelessWidget{
  const BestSellerListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context ,index){
          return const BestsellerListViewItem();
        }
    );
  }
}