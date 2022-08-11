import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cek_resi/data/models/tracking.dart';
import 'package:cek_resi/data/repositories/tracking_repositories.dart';
import 'package:meta/meta.dart';

part 'tracking_event.dart';
part 'tracking_state.dart';

class TrackingBloc extends Bloc<TrackingEvent, TrackingState> {
  final List<TrackingModel> _listTracking=[];

  TrackingBloc() : super(TrackingState()) {
    on<AddTracking>((event, emit) async{
      TrackingModel result = await TrackingRepository().getTracking(event.resi, event.courier);
      _listTracking.add(result);
      emit(TrackingState(status: TrackingStatus.success, data: _listTracking));
    });
  }
}
