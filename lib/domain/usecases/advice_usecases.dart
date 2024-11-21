import 'package:advicer/domain/entities/advice_entity.dart';
import 'package:advicer/domain/failures/failures.dart';
import 'package:dartz/dartz.dart';

import '../../data/repositories/advice_repo_impl.dart';

class AdviceUseCases {
  final adviceRepo = AdviceRepoImpl();

  Future<Either<Failure, AdviceEntity>> getAdvice() async {

    return adviceRepo.getAdviceFromDatasource();

    await Future.delayed(const Duration(seconds: 3), () {});
    //return right (const AdviceEntity(advice: 'Advice to test', id: 1));
    return left (CacheFailure());
  }
}
