import 'package:flutter/material.dart';
import 'package:flutter_app/pages/fishTank/create.dart';
import 'package:flutter_app/utils/animations.dart';
import 'package:flutter_app/widgets/list_fish_tanks.dart';

class FishTankIndex extends StatelessWidget {
  const FishTankIndex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Fish Tanks",
          style: Theme.of(context).textTheme.headline1,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: CircleAvatar(
              backgroundColor: Colors.white54,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                      Animations().createRoute(page: const FishTankCreate()));
                },
                icon: const Icon(Icons.add),
                color: Colors.grey.shade900,
              ),
            ),
          ),
        ],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: SafeArea(
            minimum: const EdgeInsets.only(left: 8, right: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 7),
                      Text(
                        "Lastest",
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
                ),
                listFishTanks(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
