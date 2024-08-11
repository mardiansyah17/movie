part of 'network_bloc.dart';

sealed class NetworkEvent extends Equatable {
  const NetworkEvent();

  @override
  List<Object> get props => [];
}

final class CheckNetwork extends NetworkEvent {}
