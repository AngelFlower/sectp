import 'package:flutter/material.dart';
import 'package:flutter_app/models/fish_tank.dart';
import 'package:flutter_app/pages/fishTank/create.dart';
import 'package:flutter_app/services/http_service.dart';
import 'package:flutter_app/utils/animations.dart';
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
          actions: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () => Navigator.push(
                  context,
                  Animations().createRoute(
                      page: FishTankCreate(
                          title: 'Edit fishtank',
                          edit: true,
                          fishTank: fishTank))),
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Are you sure?'),
                      content: const Text(
                          'This action cannot be undone. Are you sure you want to delete this fish tank?'),
                      actions: [
                        TextButton(
                          child: const Text('Cancel'),
                          onPressed: () => Navigator.pop(context),
                        ),
                        TextButton(
                          child: const Text('Delete'),
                          onPressed: () async {
                            await HttpService().delete(
                                url: 'fishtanks/${fishTank.id}',
                                auth: true,
                                data: {});
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  }),
            ),
          ],
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
