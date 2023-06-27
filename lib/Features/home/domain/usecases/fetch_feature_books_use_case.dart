import 'package:bookly_app/Features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/use_case_no_param.dart';

class FetchFeatureBooksUseCase extends UseCase {
  final HomeRepo homeRepo;
  FetchFeatureBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failuer, dynamic>> call() async {
    return await homeRepo.fetchFeatureBooks();
  }
}
