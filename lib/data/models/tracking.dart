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

  TrackingModel({
    required this.isValid,
    this.number,
    this.couriers,
    this.status,
    this.dateShipment,
    this.dateReceived,
    this.recipient,
    this.lastPosition,
    this.lastUpdated,
    this.histories,
  });

  static DateTime? toDateTime(String string) {
    return string.isEmpty ? null : DateTime.parse(string);
  }

  factory TrackingModel.fromMap(Map<String, dynamic> data) {
    return TrackingModel(
      isValid: data['found'],
      number:data['detail']['code'],
      couriers:data['kurir'][0],
      status:data['status'],
      dateShipment:toDateTime(data['date_shipment']),
      dateReceived:toDateTime(data['date_received']),
      recipient:data['receiver'] ?? data['consignee']['name'],
      lastPosition:data['current_position'],
      lastUpdated:toDateTime(data['history'][0]['time']),
      histories:List<TrackingHistory>.from(
        (data['history'] as List<Map<String, dynamic>>).map(
          (value) => TrackingHistory.fromMap(value),
        ),
      ),
    );
  }

  factory TrackingModel.initial() {
    return TrackingModel(
        isValid: false,);
  }

  TrackingModel copyWith({
    bool? isValid,
    String? number,
    String? couriers,
    String? status,
    DateTime? dateShipment,
    DateTime? dateReceived,
    String? recipient,
    String? lastPosition,
    DateTime? lastUpdated,
    List<TrackingHistory>? histories,
  }) {
    return TrackingModel(
      isValid: isValid ?? this.isValid,
      number: number ?? this.number,
      couriers: couriers ?? this.couriers,
      status: status ?? this.status,
      dateShipment: dateShipment ?? this.dateShipment,
      dateReceived: dateReceived ?? this.dateReceived,
      recipient: recipient ?? this.recipient,
      lastPosition: lastPosition ?? this.lastPosition,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      histories: histories ?? this.histories,
    );
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
