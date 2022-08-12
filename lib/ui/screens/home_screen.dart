import 'package:cek_resi/bloc/tracking_bloc.dart';
import 'package:cek_resi/data/models/tracking.dart';
import 'package:cek_resi/ui/widgets/custom_search_delegate.dart';
import 'package:cek_resi/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix/flutter_remix.dart';

import '../widgets/tracking_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void _showAddTrackingSheet(BuildContext context) {
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
        return SearchBottomSheet();
      },
    );
  }

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
                      _showAddTrackingSheet(context);
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
            TrackingTile(
              trackingModel: TrackingModel(
                isValid: true,
                number: "JP7503213238",
                couriers: "J&T Express",
                status: 'Sudah Dikirim',
                recipient: 'Gilang Raditya',
                lastPosition: 'Samarinda',
              ),
              onDetails: () {
                Navigator.pushNamed(context, '/details', arguments: 1);
              },
              onDelete: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class SearchBottomSheet extends StatefulWidget {
  const SearchBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchBottomSheet> createState() => _SearchBottomSheetState();
}

class _SearchBottomSheetState extends State<SearchBottomSheet> {
  late TextEditingController _controller;
  String courier = kCourier.values.first;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0).copyWith(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Theme.of(context).colorScheme.primary,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            dense: true,
            contentPadding: EdgeInsets.only(
              left: 16,
            ),
            title: Text(courier),
            trailing: IconButton(
              icon: Icon(FlutterRemix.arrow_right_s_line),
              onPressed: () async {
                FocusManager.instance.primaryFocus?.unfocus();
                final selectedCourier = await showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(kCourier.values.toList()),
                );
                if (selectedCourier != null || selectedCourier != courier) {
                  setState(() {
                    courier = selectedCourier;
                  });
                }
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: _controller,
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
                width: MediaQuery.of(context).size.width * 0.4,
                child: ElevatedButton.icon(
                  icon: Icon(FlutterRemix.add_fill),
                  onPressed: () {
                    context.read<TrackingBloc>().add(
                        AddTracking(resi: _controller.text, courier: courier));
                    Navigator.pop(context);
                  },
                  label: Text("Tambah Resi"),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.01,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: ElevatedButton.icon(
                  icon: Icon(FlutterRemix.arrow_left_s_line),
                  onPressed: () => Navigator.pop(context),
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
  }
}
