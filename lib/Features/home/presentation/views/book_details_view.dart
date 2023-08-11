import 'package:bookly_app/Features/home/presentation/managers/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BookDetailsListViewBlocbuilder(),
    );
  }
}

class BookDetailsListViewBlocbuilder extends StatelessWidget {
  const BookDetailsListViewBlocbuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        return const BookDetailsViewBody();
      },
    );
  }
}
