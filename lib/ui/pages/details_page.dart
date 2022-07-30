import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: DefaultTextStyle(
          style: Theme.of(context).textTheme.bodyLarge!,
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Kode"),
                  Text("JP7503213238"),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Kurir"),
                  Text("J&T Express"),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Status"),
                  Text("Terkirim"),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Waktu Dikirim"),
                  Text("2022-07-21 01:27:00"),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Waktu Diterima"),
                  Text("-"),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Penerima"),
                  Text("-"),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Posisi Sekarang"),
                  Text("Samarinda"),
                ],
              ),
              Divider(),
              Text("Detail Sejarah Paket", style: Theme.of(context).textTheme.titleLarge,),
              SizedBox(height: 16,),
              HistoryTile(
                title: "Surabaya Mulyorejo",
                subtitle: "Paket keluar dari Surabaya [Surabaya Mulyorejo]",
                trailing: "2022-07-21\n00:03:00",
              ),
              HistoryTile(
                title: "SiCepat Ekspres Surabaya Mulyorejo",
                subtitle:
                    "Paket telah di input (manifested) di Surabaya [SiCepat Ekspres Surabaya Mulyorejo]",
                trailing: "2022-07-20\n18:27:00",
              ),
              HistoryTile(
                title: "Surabaya Mulyorejo",
                subtitle: "Paket keluar dari Surabaya [Surabaya Mulyorejo]",
                trailing: "2022-07-21\n00:03:00",
              ),HistoryTile(
                title: "Surabaya Mulyorejo",
                subtitle: "Paket keluar dari Surabaya [Surabaya Mulyorejo]",
                trailing: "2022-07-21\n00:03:00",
              ),
              HistoryTile(
                title: "SiCepat Ekspres Surabaya Mulyorejo",
                subtitle:
                "Paket telah di input (manifested) di Surabaya [SiCepat Ekspres Surabaya Mulyorejo]",
                trailing: "2022-07-20\n18:27:00",
              ),
              HistoryTile(
                title: "SiCepat Ekspres Surabaya Mulyorejo",
                subtitle:
                "Paket telah di input (manifested) di Surabaya [SiCepat Ekspres Surabaya Mulyorejo]",
                trailing: "2022-07-20\n18:27:00",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HistoryTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String trailing;

  HistoryTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ListTile(
      minLeadingWidth: 24,
      leading: SizedBox(
        height: double.infinity,
        child: CustomPaint(
          painter: TimelinePainter(
            Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      horizontalTitleGap: 0,
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Text(trailing, textAlign: TextAlign.end),
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width*.1,
          height: 68+(subtitle.length/33)*12,
          child: CustomPaint(
            painter: TimelinePainter(
              Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width*.6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodyMedium,
                  softWrap: true,
                  overflow: TextOverflow.clip,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width*.2,
          child: Text(
            trailing,
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}

class TimelinePainter extends CustomPainter {
  Color color;

  TimelinePainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 3);
    final painter = Paint()..color = color;
    canvas.drawCircle(center, 6, painter);
    canvas.drawLine(Offset(size.width / 2, 0),
        Offset(size.width / 2, size.height), painter..strokeWidth = 2);
    canvas.drawCircle(
        center,
        7,
        Paint()
          ..color = Colors.white
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
