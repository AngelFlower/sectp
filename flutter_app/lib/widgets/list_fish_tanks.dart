import 'package:flutter/material.dart';
import 'package:flutter_app/models/fish_tank.dart';
import 'package:flutter_app/pages/fishTank/show.dart';
import 'package:flutter_app/services/http_service.dart';
import 'package:flutter_app/utils/animations.dart';
import 'package:themed/themed.dart';

class ListFishTanks extends StatefulWidget {
  const ListFishTanks({Key? key}) : super(key: key);

  @override
  State<ListFishTanks> createState() => _ListFishTanksState();
}

class _ListFishTanksState extends State<ListFishTanks> {
  Future<List<FishTank>>? futureFishTanks;

  Future<List<FishTank>> getFishTanks() async {
    final response = await HttpService().get(url: 'fishtanks/user', auth: true);
    List fishTanks = response['data'];
    return fishTanks.map((fishTank) => FishTank.fromJson(fishTank)).toList();
  }

  @override
  void initState() {
    super.initState();
    futureFishTanks = getFishTanks();
  }

  Future<void> _pullRefresh() async {
    List<FishTank> freshFutureFishTanks = await getFishTanks();
    setState(() {
      futureFishTanks = Future.value(freshFutureFishTanks);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<FishTank>>(
      future: futureFishTanks,
      builder: (context, snapshot) {
        return RefreshIndicator(
            child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: _listFishTanks(snapshot)),
            onRefresh: _pullRefresh);
      },
    );
  }

  Widget _listFishTanks(AsyncSnapshot snapshot) {
    if (snapshot.hasData) {
      List<Widget> _list = snapshot.data!.map<Widget>((item) {
        return Column(
          children: [
            fishTankCard(item, context),
            const SizedBox(height: 10),
          ],
        );
      }).toList();
      _list.insert(
        0,
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 6, bottom: 6),
              child: Text(
                "Lastest",
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
          ],
        ),
      );
      return Column(
        children: _list,
      );
    } else if (snapshot.hasError) {
      return Text('${snapshot.error}');
    }
    // By default, show a loading spinner.
    return const Center(child: CircularProgressIndicator());
  }

  Widget fishTankCard(FishTank item, BuildContext context) {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(Animations().createRoute(
              page: FishTankShow(
            fishTank: item,
          )));
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Stack(
            children: [
              ChangeColors(
                brightness: -0.1,
                child: Image.network(
                  item.image,
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.low,
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
                        style: Theme.of(context).textTheme.subtitle2,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
