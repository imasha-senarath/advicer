import 'package:dartz/dartz.dart';

import '../../domain/entities/advice_entity.dart';
import '../../domain/failures/failures.dart';
import '../../domain/repositories/advice_repo.dart';
import '../datasources/advice_remote_datasource.dart';

class AdviceRepoImpl implements AdviceRepo {
  final AdviceRemoteDatasource adviceRemoteDatasource = AdviceRemoteDatasourceImpl();
  @override
  Future<Either<Failure, AdviceEntity>> getAdviceFromDatasource() async {

    final result = await adviceRemoteDatasource.getRandomAdviceFromApi();
    return right(result);

    /*try {

    } on ServerException catch (_) {
      return left(ServerFailure());
    } catch (e) {
      return left(GeneralFailure());
    }*/
  }
}