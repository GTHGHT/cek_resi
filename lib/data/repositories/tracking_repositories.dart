import 'package:cek_resi/data/models/tracking.dart';
import 'package:cek_resi/data/providers/tracking_api.dart';

class TrackingRepository{
  TrackingApi trackingApi = TrackingApi();

  Future<TrackingModel> getTracking(String expedition, String resi) async{
    final data = await trackingApi.fetchTracking(expedition, resi);
    return TrackingModel.fromMap(data);
  }
}