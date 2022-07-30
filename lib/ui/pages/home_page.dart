import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_remix/flutter_remix.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          FlutterRemix.arrow_up_line,
        ),
        onPressed: () {},
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipOval(
                    child: Image.asset(
                      'images/profile.jpg',
                      height: 64,
                      width: 64,
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Selamat Datang',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Yusuf Asrori',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size(48, 48),
                    ),
                    child: Icon(FlutterRemix.add_line, size: 36),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        isDismissible: false,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(16),
                          ),
                        ),
                        builder: (BuildContext ctx) {
                          return Padding(
                            padding: const EdgeInsets.all(16.0).copyWith(
                              bottom: MediaQuery.of(context).viewInsets.bottom,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                DropdownButton<String>(
                                    items: <String>[
                                      'One',
                                      'Two',
                                      'Free',
                                      'Four'
                                    ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (value) {},
                                    value: 'One'),
                                TextField(
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  maxLines: 1,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                      RegExp('[a-zA-Z0-9- .]'),
                                    )
                                  ],
                                  decoration: InputDecoration(
                                    label: Text("Nomor Resi"),
                                  ),
                                  maxLength: 64,
                                  autofocus: true,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                ButtonBar(
                                  alignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      child: ElevatedButton.icon(
                                        icon: Icon(FlutterRemix.add_fill),
                                        onPressed: () {},
                                        label: Text("Tambah Resi"),
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.01,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      child: ElevatedButton.icon(
                                        icon: Icon(
                                            FlutterRemix.arrow_left_s_line),
                                        onPressed: () => Navigator.pop(ctx),
                                        label: Text("Kembali"),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size(48, 48),
                    ),
                    child: Icon(
                      FlutterRemix.logout_circle_line,
                      size: 32,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Card(
              margin: EdgeInsets.all(16),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Terlacak",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          SizedBox(height: 10),
                          Text(
                            "10",
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Update Terakhir",
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ]),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Datang",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          SizedBox(height: 10),
                          Text(
                            "7",
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                        ]),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Proses",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "3",
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "20/10/2022 12:13",
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Detail Paket',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  TextButton(
                    child: Text(
                      'Refresh',
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
            Theme(
              data:
                  Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: Card(
                clipBehavior: Clip.antiAlias,
                margin: EdgeInsets.all(16).copyWith(top: 0, bottom: 8),
                child: ExpansionTile(
                  title: Text("JP7503213238"),
                  subtitle: Text("J&T Express"),
                  children: [
                    Container(
                      padding: EdgeInsets.all(16),
                      color:
                          Theme.of(context).colorScheme.primary.withAlpha(20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Resi Valid'),
                              Text('Betul'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Kurir'),
                              Text('J&T'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Status'),
                              Text('Sudah Dikirim'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Penerima'),
                              Text('Gilang Raditya'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Posisi Sekarang'),
                              Text('Samarinda'),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: OutlinedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, "/details");
                              },
                              child: Text("Lihat Detail"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
