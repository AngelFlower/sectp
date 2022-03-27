import 'package:flutter/material.dart';
import 'package:flutter_app/models/fish_tank.dart';
import 'package:flutter_app/widgets/list_tempetures.dart';

class FishTankShow extends StatelessWidget {
  const FishTankShow({Key? key, required this.fishTank}) : super(key: key);

  final FishTank fishTank;

  @override
  Widget build(BuildContext context) {
    const infoText = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
    );
    return Scaffold(
        appBar: AppBar(
          title: Text(fishTank.name),
        ),
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              fishTank.image,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            const Divider(
              height: 1,
            ),
            const SizedBox(height: 15),
            SafeArea(
              minimum: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Information',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Capacity: ${fishTank.capacity}L', style: infoText),
                      Text(
                        'Status: ${fishTank.status}',
                        style: infoText,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Temperatures',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Min: ${fishTank.minTemperature}°C',
                        style: infoText,
                      ),
                      Text(
                        'Max: ${fishTank.maxTemperature}°C',
                        style: infoText,
                      ),
                      Text(
                        'Last: ${fishTank.latestTemperature}°C',
                        style: infoText,
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Text(
                    'Recent Temperatures',
                    style: Theme.of(context).textTheme.headline6,
                  )
                ],
              ),
            ),
            const SizedBox(height: 15),
            const Divider(
              height: 1,
            ),
            listTemperatures(context, fishTank.id)
          ],
        )));
  }
}
