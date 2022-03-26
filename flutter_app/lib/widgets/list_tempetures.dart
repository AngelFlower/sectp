import 'package:flutter/material.dart';
import 'package:flutter_app/models/temperature.dart';
import 'package:flutter_app/services/http_service.dart';

/*
 Future<List<Temperature>> getPosts() async {
    final response = await http.get(
        Uri.parse('http://127.0.0.1:8000/api/v1/temperatures/'),
        headers: requestHeaders);

    List temperatures = json.decode(response.body)['data'];
    return temperatures
        .map((tempeture) => Temperature.fromJson(tempeture))
        .toList();
  }

Widget listTemperatures(BuildContext context) {
  return FutureBuilder<List<Temperature>>(
    future: HttpService().getPosts(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        //print(snapshot.data);
        return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              var item = snapshot.data![index];

              return ListTile(
                title: Text(item.temperature.toString()),
                subtitle: Text(item.dateTime.toString()),
              );
            });
      } else if (snapshot.hasError) {
        return Text('${snapshot.error}');
      }

      // By default, show a loading spinner.
      return const CircularProgressIndicator();
    },
  );
}
*/