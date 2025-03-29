import 'package:equatable/equatable.dart';

sealed class RecipeViewEvent extends Equatable {}

final class GetFirstPages extends RecipeViewEvent {
  @override
  List<Object?> get props => [];
}

final class GetNextPages extends RecipeViewEvent {
  final int page;
  GetNextPages({required this.page});
  @override
  List<Object?> get props => [];
}
