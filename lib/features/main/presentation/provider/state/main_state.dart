import 'package:equatable/equatable.dart';

class MainState extends Equatable {
  final int navBarIndex;
  final double scale;
  const MainState({this.navBarIndex = 0, this.scale = 1.0});

  MainState copyWith({int? navBarIndex, double? scale}) => MainState(
      navBarIndex: navBarIndex ?? this.navBarIndex, scale: scale ?? this.scale);
  @override
  List<Object> get props => [navBarIndex, scale];
}
