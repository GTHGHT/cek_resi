part of 'tracking_bloc.dart';

enum TrackingStatus { initial, success, failure }

class TrackingState {
  final TrackingStatus status;
  final List<TrackingModel> data;

  TrackingState({
    this.status = TrackingStatus.initial,
    this.data = const [],
  });
}
