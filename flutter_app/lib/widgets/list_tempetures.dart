import 'package:flutter/material.dart';
import 'package:flutter_app/models/temperature.dart';
import 'package:flutter_app/services/http_service.dart';

Future<List<Temperature>> getTemperatures(id) async {
  final response =
      await HttpService().get(url: 'temperatures/fishtank/$id', auth: true);

  List temperatures = response['data'];
  return temperatures
      .map((tempeture) => Temperature.fromJson(tempeture))
      .toList();
}

Widget listTemperatures(BuildContext context, id) {
  return FutureBuilder<List<Temperature>>(
    future: getTemperatures(id),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return Column(
            children: snapshot.data!.map((item) {
          return Column(
            children: [
              ListTile(
                title: Text('${item.temperature}°C'),
                subtitle: Text(item.dateTime.toString()),
              ),
              const Divider(
                height: 1,
              ),
            ],
          );
        }).toList());
      } else if (snapshot.hasError) {
        return Text('${snapshot.error}');
      }
      return const CircularProgressIndicator();
    },
  );
}
