import 'package:dartz/dartz.dart' hide Task;
import 'package:equatable/equatable.dart';

import '../error/failure.dart';

abstract class UseCase<Type , params> {
  
  Future<Either<Failure, Type>> call(params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}