part of 'home_nike_shoe_bloc.dart';

abstract class HomeNikeShoeEvent extends Equatable {
  const HomeNikeShoeEvent();

  @override
  List<Object> get props => [];
}

class OnHomeGetNikeShoes extends HomeNikeShoeEvent {}
