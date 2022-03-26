import 'package:flutter/material.dart';
import 'package:flutter_app/models/fish_tank.dart';
import 'package:flutter_app/services/http_service.dart';

Future<List<FishTank>> getFishTanks() async {
  final response = await HttpService().get(url: 'fishtanks/user', auth: true);
  List fishTanks = response['data'];
  return fishTanks.map((fishTank) => FishTank.fromJson(fishTank)).toList();
}

Widget listFishTanks(BuildContext context) {
  return FutureBuilder<List<FishTank>>(
    future: getFishTanks(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                  //shrinkWrap: true,
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    var item = snapshot.data![index];
                    if (index == 0) {
                      return Column(
                        children: [
                          const Text("Fish Tanks"),
                          fishTankCard(item, context),
                        ],
                      );
                    }
                    return fishTankCard(item, context);
                  }),
            ),
          ],
        );
      } else if (snapshot.hasError) {
        return Text('${snapshot.error}');
      }

      // By default, show a loading spinner.
      return const Center(child: CircularProgressIndicator());
    },
  );
}

Card fishTankCard(FishTank item, BuildContext context) {
  return Card(
    margin: const EdgeInsets.all(8),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  item.image,
                  // 'https://still-hamlet-67194.herokuapp.com/${item.image}',

                  //height: 100,
                ),
                const SizedBox(
                  height: 6.0,
                ),
                Text(
                  item.name,
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(
                  item.capacity,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Theme.of(context).primaryColor,
          ),
        ],
      ),
    ),
  );
}
