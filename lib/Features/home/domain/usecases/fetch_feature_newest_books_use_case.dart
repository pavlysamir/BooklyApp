import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/use_case_no_param.dart';
import '../repos/home_repo.dart';

class FetchNewestFeatureBooksUseCase extends UseCase {
  final HomeRepo homeRepo;
  FetchNewestFeatureBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failuer, dynamic>> call() async {
    return await homeRepo.fetchNewsBooks();
  }
}
