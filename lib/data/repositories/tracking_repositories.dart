import 'package:cek_resi/data/models/tracking.dart';
import 'package:cek_resi/data/providers/tracking_api.dart';

class TrackingRepository{
  TrackingApi trackingApi = TrackingApi();

  Future<TrackingModel> getTracking(String resi, String expedition) async{
    final data = await trackingApi.fetchTracking(expedition, resi);
    return TrackingModel.fromMap(data);
  }
}