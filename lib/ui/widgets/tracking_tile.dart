
import 'package:flutter/material.dart';

import '../../data/models/tracking.dart';

class TrackingTile extends StatelessWidget {
  final TrackingModel trackingModel;
  final VoidCallback onDetails;
  final VoidCallback onDelete;

  TrackingTile({
    Key? key,
    required this.trackingModel,
    required this.onDetails,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: Card(
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.all(16).copyWith(top: 0, bottom: 8),
        child: ExpansionTile(
          title: Text(trackingModel.number ?? "-"),
          subtitle: Text(trackingModel.couriers ?? "-"),
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 16,
              ),
              color: Theme.of(context).colorScheme.primary.withAlpha(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Resi Valid'),
                      Text(trackingModel.isValid ? 'Betul' : 'Salah'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Kurir'),
                      Text(trackingModel.couriers ?? "-"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Status'),
                      Text(trackingModel.status ?? "-"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Penerima'),
                      Text(trackingModel.recipient ?? "-"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Posisi Sekarang'),
                      Text(trackingModel.lastPosition ?? "-"),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: onDetails,
                      child: Text("Lihat Detail"),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: onDelete,
                      child: Text(
                        "Hapus Tracking",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
