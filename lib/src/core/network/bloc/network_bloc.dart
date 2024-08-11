import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/src/core/network/network_info.dart';

part 'network_event.dart';
part 'network_state.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  final NetworkInfo networkInfo;

  NetworkBloc({required this.networkInfo}) : super(NetworkInitial()) {
    on<NetworkEvent>((event, emit) {
      emit(NetworkLoading());
    });

    on<CheckNetwork>((event, emit) async {
      final checkNetwork = await networkInfo.isConnected;

      if (checkNetwork) {
        return emit(NetworkConnected());
      }
      return emit(NetworkDisconnected());
    });
  }
}
