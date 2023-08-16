import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/Features/home/presentation/managers/featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_book_item.dart';

class FeaturedListView extends StatefulWidget {
  const FeaturedListView({Key? key, required this.books}) : super(key: key);
  final List<BookEntity> books;

  @override
  State<StatefulWidget> createState() => _FeaturedListViewState();
}

class _FeaturedListViewState extends State<FeaturedListView> {
  late final ScrollController _scrollController;
  var nextPage = 1;
  var isLoading = false;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() async {
    var currentPosition = _scrollController.position.extentAfter;
    var maxScrollLength = _scrollController.position.maxScrollExtent;
    if (currentPosition <= 0.7 * maxScrollLength) {
      // Trigger the "FeachFeatureBooks" request here
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<FeaturedBooksCubit>(context)
            .fetchFeaturedBooks(pageNum: nextPage++);
        isLoading = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        controller: _scrollController,
        itemCount: widget.books.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: CustomBookImage(
              image: widget.books[index].image ?? '',
            ),
          );
        },
      ),
    );
  }
}
