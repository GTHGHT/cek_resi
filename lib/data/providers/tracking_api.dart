import 'dart:convert';
import 'dart:io';

class TrackingApi{
  final HttpClient _client = HttpClient();

  Future<dynamic> fetchTracking(String expedition, String resi) async {
    final uri = Uri(
      scheme: 'https',
      host: 'pluginongkoskirim.com',
      path: '/cek-tarif-ongkir/front/resi-amp',
      query: 'kurir=$expedition&resi=$resi',
    );
    final request = await _client.postUrl(uri)
      ..headers.contentType = ContentType.json;
    final response = await request.close();

    if (response.statusCode >= 300) {
      throw HttpException("Making Post Request Failed!", uri: uri);
    }

    String raw = '';
    await response
        .transform(Utf8Decoder(allowMalformed: true))
        .forEach((element) => raw += element);
    return jsonDecode(raw);
  }
}