class TrackingModel {
  bool isValid;
  String? number;
  String? couriers;
  String? status;
  DateTime? dateShipment;
  DateTime? dateReceived;
  String? recipient;
  String? lastPosition;
  DateTime? lastUpdated;
  List<TrackingHistory>? histories;

  TrackingModel(
    this.isValid,
    this.number,
    this.couriers,
    this.status,
    this.dateShipment,
    this.dateReceived,
    this.recipient,
    this.lastPosition,
    this.lastUpdated,
    this.histories,
  );

  static DateTime? toDateTime(String string) {
    return string.isEmpty ? null : DateTime.parse(string);
  }

  factory TrackingModel.fromMap(Map<String, dynamic> data) {
    return TrackingModel(
      data['found'],
      data['detail']['code'],
      data['kurir'][0],
      data['status'],
      toDateTime(data['date_shipment']),
      toDateTime(data['date_received']),
      data['receiver'] ?? data['consignee']['name'],
      data['current_position'],
      toDateTime(data['history'][0]['time']),
      List<TrackingHistory>.from(
        (data['history'] as List<Map<String, dynamic>>).map(
          (value) => TrackingHistory.fromMap(value),
        ),
      ),
    );
  }

  factory TrackingModel.initial() {
    return TrackingModel(
        false, null, null, null, null, null, null, null, null, null);
  }
}

class TrackingHistory {
  final DateTime time;
  final String position;
  final String desc;

  TrackingHistory(this.time, this.position, this.desc);

  factory TrackingHistory.fromMap(Map<String, dynamic> data) {
    return TrackingHistory(
      DateTime.parse(data['time']),
      data['position'],
      data['desc'],
    );
  }
}
