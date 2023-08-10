import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../managers/featured_books_cubit/featured_books_cubit.dart';
import 'featured_listview.dart';

class FeaturedBooksListViewBlocBuilder extends StatelessWidget {
  const FeaturedBooksListViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return FeaturedListView(
            books: state.books,
          );
        } else if (state is FeaturedBooksFailure) {
          return Text(state.messageError);
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
