part of 'tips_bloc.dart';

sealed class TipsState extends Equatable {
  const TipsState();

  @override
  List<Object> get props => [];
}

final class TipsInitial extends TipsState {}

final class TipsLoading extends TipsState {}

final class TipsSuccess extends TipsState {
  final List<TipsModel> tips;
  const TipsSuccess(this.tips);

  @override
  List<Object> get props => [tips];
}

final class TipsFailed extends TipsState {
  final String e;
  const TipsFailed(this.e);

  @override
  List<Object> get props => [e];
}
