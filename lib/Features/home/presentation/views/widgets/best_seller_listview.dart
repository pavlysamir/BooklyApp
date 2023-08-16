import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/Features/home/presentation/managers/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'best_seller_listview_item.dart';

class BestSellerListView extends StatefulWidget {
  const BestSellerListView({Key? key, required this.books}) : super(key: key);
  final List<BookEntity> books;

  @override
  State<StatefulWidget> createState() => _BestSellerListViewState();
}

class _BestSellerListViewState extends State<BestSellerListView> {
  late final ScrollController _scrollController;
  var nextPage = 1;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    var currentPosition = _scrollController.position.extentAfter;
    var maxScrollLength = _scrollController.position.maxScrollExtent;
    if (currentPosition <= 0.7 * maxScrollLength) {
      // Trigger the "FeachFeatureBooks" request here
      BlocProvider.of<NewestBooksCubit>(context)
          .fetchNewestdBooks(pageNum: nextPage++);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      controller: _scrollController,
      itemCount: widget.books.length,
      itemBuilder: (context, index) {
        return BestsellerListViewItem(
          author: widget.books[index].authorName ?? 'UnKnown',
          image: widget.books[index].image ?? '',
          price: widget.books[index].price ?? 0,
          rating: widget.books[index].rating,
          title: widget.books[index].title,
          bookEntity: widget.books[index],
        );
      },
    );
  }
}
