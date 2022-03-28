import 'dart:io';
import 'dart:convert';

import 'package:cool_alert/cool_alert.dart';
import 'package:cool_stepper/cool_stepper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/fish_tank.dart';
import 'package:flutter_app/services/http_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class FishTankCreate extends StatefulWidget {
  const FishTankCreate(
      {Key? key, required this.title, required this.edit, this.fishTank})
      : super(key: key);

  final String title;
  final bool edit;
  final FishTank? fishTank;

  @override
  _FishTankCreateState createState() => _FishTankCreateState();
}

class _FishTankCreateState extends State<FishTankCreate> {
  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  String? selectedRole = 'Writer';
  final TextEditingController _nameCtrl = TextEditingController();
  final TextEditingController _capacityCtrl = TextEditingController();
  final TextEditingController _minTemperatureCtrl = TextEditingController();
  final TextEditingController _maxTemperatureCtrl = TextEditingController();
  static var httpClient = new HttpClient();

  Future<File> _downloadFile(String url, String filename) async {
    var httpClient = new HttpClient();
    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      var bytes = await consolidateHttpClientResponseBytes(response);
      final dir =
          await getTemporaryDirectory(); //(await getApplicationDocumentsDirectory()).path;
      File file = new File('${dir.path}/$filename');
      await file.writeAsBytes(bytes);
      print('downloaded file path = ${file.path}');
      return file;
    } catch (error) {
      print('pdf downloading error = $error');
      return File('');
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.edit) {
      _nameCtrl.text = widget.fishTank!.name;
      _capacityCtrl.text = widget.fishTank!.capacity.toString();
      _minTemperatureCtrl.text = widget.fishTank!.minTemperature.toString();
      _maxTemperatureCtrl.text = widget.fishTank!.maxTemperature.toString();
    }
  }

  File? _image;

  final _picker = ImagePicker();
  Future<void> _openGalleryPicker() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  Future<void> _openCameraPicker() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              "Choose option",
              style: TextStyle(color: Colors.blue),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  const Divider(
                    height: 1,
                    color: Colors.blue,
                  ),
                  ListTile(
                    onTap: () async {
                      await _openGalleryPicker();
                      Navigator.of(context).pop();
                    },
                    title: const Text("Gallery"),
                    leading: const Icon(
                      Icons.account_box,
                      color: Colors.blue,
                    ),
                  ),
                  const Divider(
                    height: 1,
                    color: Colors.blue,
                  ),
                  ListTile(
                    onTap: () async {
                      await _openCameraPicker();
                      Navigator.of(context).pop();
                    },
                    title: const Text("Camera"),
                    leading: const Icon(
                      Icons.camera,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget _childImage() {
    if (widget.edit && _image == null) {
      return Image.network(widget.fishTank!.image);
    } else if (_image == null) {
      return SizedBox(
        height: 100,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.image, color: Colors.grey.shade800, size: 30),
              Text(
                'Select an image',
                style: TextStyle(
                  color: Colors.grey.shade800,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Image.file(
      _image!,
      fit: BoxFit.cover,
    );
  }

  @override
  Widget build(BuildContext context) {
    final steps = [
      CoolStep(
        title: 'Basic Information',
        subtitle: 'Please fill some of the basic information to get started',
        content: Form(
          key: _formKey,
          child: Column(
            children: [
              Material(
                child: InkWell(
                  onTap: () {
                    _showChoiceDialog(context);
                  },
                  child: Ink(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.shade600,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: _childImage()),
                ),
              ),
              _buildTextField(
                labelText: 'Name',
                suffix: const Icon(Icons.edit),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Name is required';
                  }
                  return null;
                },
                controller: _nameCtrl,
              ),
              _buildTextField(
                labelText: 'Capacity',
                suffix: const Text('L'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Capacity is required';
                  }
                  return null;
                },
                controller: _capacityCtrl,
              ),
            ],
          ),
        ),
        validation: () {
          if (!_formKey.currentState!.validate()) {
            return 'Fill form correctly';
          }
          return null;
        },
      ),
      CoolStep(
        title: 'Temperatures',
        subtitle: 'Type the temperatures of the fish tank',
        content: Form(
          key: _formKey2,
          child: Column(
            children: [
              _buildTextField(
                labelText: 'Min temperature',
                suffix: const Text('°C'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Min temperature is required';
                  }
                  return null;
                },
                controller: _minTemperatureCtrl,
              ),
              _buildTextField(
                labelText: 'Max temperature',
                suffix: const Text('°C'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Max temperature is required';
                  }
                  return null;
                },
                controller: _maxTemperatureCtrl,
              ),
            ],
          ),
        ),
        validation: () {
          if (!_formKey2.currentState!.validate()) {
            return 'Fill form correctly';
          }
          return null;
        },
      ),
    ];

    final stepper = CoolStepper(
      showErrorSnackbar: false,
      onCompleted: () async {
        Map<String, dynamic> data = {
          'name': _nameCtrl.text.toString(),
          'capacity': double.parse(_capacityCtrl.text.toString()),
          'min_temperature': double.parse(_minTemperatureCtrl.text.toString()),
          'max_temperature': double.parse(_maxTemperatureCtrl.text.toString())
          //'image': _image,
        };
        if (_image != null) {
          List<int> imageBytes = _image!.readAsBytesSync();
          String base64Image = base64Encode(imageBytes);
          data.addAll({'image': base64Image});
        }
        HttpService().post(url: 'fishtanks', auth: true, data: data);

        await CoolAlert.show(
          title: 'Success!',
          context: context,
          type: CoolAlertType.success,
          text: "Fish tank was created successful!",
        );
        Navigator.of(context).pop();
      },
      steps: steps,
      config: const CoolStepperConfig(
        backText: 'PREV',
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: stepper,
      ),
    );
  }

  Widget _buildTextField({
    String? labelText,
    FormFieldValidator<String>? validator,
    TextEditingController? controller,
    TextInputType keyboardType = TextInputType.text,
    Widget suffix = const SizedBox(),
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: TextFormField(
        keyboardType: keyboardType,
        decoration: InputDecoration(labelText: labelText, suffix: suffix),
        validator: validator,
        controller: controller,
      ),
    );
  }
}
