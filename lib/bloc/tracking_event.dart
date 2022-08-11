part of 'tracking_bloc.dart';

@immutable
abstract class TrackingEvent {}

class LoadTracking extends TrackingEvent{}

class AddTracking extends TrackingEvent{
  final String resi;
  final String courier;

  AddTracking({required this.resi, required this.courier});
}

class DeleteTracking extends TrackingEvent{
  final String resi;
  final String courier;

  DeleteTracking({required this.resi, required this.courier});
}