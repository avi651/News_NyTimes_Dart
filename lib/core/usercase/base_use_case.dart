import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:ny_news/core/error/failure.dart';

abstract class BaseUseCase<T, P> {
  Future<Either<Failure, T>> call(P p);
}

class NoParameter extends Equatable {
  const NoParameter();
  @override
  List<Object?> get props => [];
}
