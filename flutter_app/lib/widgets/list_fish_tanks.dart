import 'package:flutter/material.dart';
import 'package:flutter_app/models/fish_tank.dart';
import 'package:flutter_app/services/http_service.dart';
import 'package:themed/themed.dart';

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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            " Fish Tanks",
                            style: Theme.of(context).textTheme.headline1,
                          ),
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
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Stack(
        children: [
          ChangeColors(
            brightness: -0.05,
            child: Image.network(
              item.image,
              height: 200,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
              filterQuality: FilterQuality.medium,
            ),
          ),
          SizedBox(
            height: 200,
            child: Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 6.0,
                  ),
                  Text(
                    item.name,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  Text(
                    '${item.latestTemperature}°C | ${item.status} | ${item.capacity}L',
                    style: Theme.of(context).textTheme.subtitle1,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
