part of 'storefood_cubit.dart';

sealed class StorefoodState extends Equatable {
  const StorefoodState();

  @override
  List<Object> get props => [];
}

final class StorefoodInitial extends StorefoodState {}

final class StorefoodLoading extends StorefoodState {}

final class StorefoodLoaded extends StorefoodState {
  final bool isStorefood;

  const StorefoodLoaded({required this.isStorefood});

  @override
  List<Object> get props => [isStorefood];
}

final class StorefoodError extends StorefoodState {
  final String message;

  const StorefoodError({required this.message});

  @override
  List<Object> get props => [message];
}
