import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:outfit4ride/outfit.dart';
import 'package:outfit4ride/data_manager.dart';
import 'package:outfit4ride/closet_manager.dart';
import 'package:outfit4ride/outfit_category.dart';

class OutfitScreen extends StatefulWidget {
  final Function(Outfit) onCreate;
  final Function(Outfit) onUpdate;
  final Outfit? originalItem;
  final bool isUpdating;

  const OutfitScreen({
    super.key,
    required this.onCreate,
    required this.onUpdate,
    this.originalItem,
  }) : isUpdating = (originalItem != null);

  @override
  State<StatefulWidget> createState() => OutfitScreenState();
}

class OutfitScreenState extends State<OutfitScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _brandController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  String _name = '';
  String _brand = '';
  int _category = 1;
  String _image = '';
  int _minTemp = 10;
  int _maxTemp = 20;
  bool _isWaterproof = false;
  bool _isWindshield = false;
  File? _imagePath;

  @override
  void initState() {
    super.initState();
    final originalItem = widget.originalItem;
    if (originalItem != null) {
      _image = originalItem.image;
      _nameController.text = originalItem.name;
      _name = originalItem.name;
      _brandController.text = originalItem.brand;
      _brand = originalItem.brand;
      _categoryController.text = originalItem.category.toString();
      _category = originalItem.category;
      _minTemp = originalItem.minTemp;
      _maxTemp = originalItem.maxTemp;
      _isWaterproof = originalItem.isWaterproof;
      _isWindshield = originalItem.isWindshield;
      _imagePath = originalItem.imagePath;
    }
    _nameController.addListener(() {
      setState(() {
        _name = _nameController.text;
      });
    });

    _brandController.addListener(() {
      setState(() {
        _brand = _brandController.text;
      });
    });

  }

  @override
  void dispose() {
    _nameController.dispose();
    _brandController.dispose();
    _categoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              if (_nameController.text.isEmpty || _brandController.text.isEmpty) {
                ();
              } else {
                final outfitItem = Outfit(
                  id: widget.originalItem?.id ?? ClosetManager().lastId(),
                  name: _nameController.text,
                  image: _image,
                  brand: _brandController.text,
                  category: _category,
                  minTemp: _minTemp,
                  maxTemp: _maxTemp,
                  isWaterproof: _isWaterproof,
                  isWindshield: _isWindshield,
                  imagePath: _imagePath,
                );
                if (widget.isUpdating) {
                  widget.onUpdate(outfitItem);
                } else {
                  widget.onCreate(outfitItem);
                }
              }
            },
          )
        ],
        elevation: 0.0,
        title: _getTitle(),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            buildImageField(),
            const SizedBox(height: 30.0),
            buildNameField(),
            const SizedBox(height: 30.0),
            buildBrandField(),
            const SizedBox(height: 30.0),
            buildCategoryField(),
            const SizedBox(height: 30.0),
            buildTemperatureField(),
            const SizedBox(height: 30.0),
            buildWaterproofField(),
            const SizedBox(height: 30.0),
            buildWindshieldField(),
            const SizedBox(height: 30.0),
          ],
        ),
      ),
    );
  }

  Text _getTitle() {
    if (widget.isUpdating) {
      return Text('Edit outfit');
    } else {
      return Text('Add new outfit');
    }
  }

  Future<void> chooseImage(String source) async {
    final picker = ImagePicker();
    XFile? image;

    if (source == "Camera") {
      image = await picker.pickImage(source: ImageSource.camera);
    } else {
      image = await picker.pickImage(source: ImageSource.gallery);
    }

    if (image != null) {
      setState(() {
        _imagePath = File(image!.path);
      });
    }
  }

  void showImageSourceActionSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.camera),
            title: const Text('Camera'),
            onTap: () {
              Navigator.pop(context);
              chooseImage("Camera");
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo_library),
            title: const Text('Gallery'),
            onTap: () {
              Navigator.pop(context);
              chooseImage("Gallery");
            },
          ),
        ],
      ),
    );
  }

  ImageProvider _getImage() {
    if (_imagePath != null) {
      return FileImage(_imagePath!);
    } else {
      String asset = (_image.isEmpty) ? 'assets/apparel.png' : _image;
      return AssetImage(asset);
    }
  }

  Widget buildImageField() {
    return GestureDetector(
        onTap: () => showImageSourceActionSheet(context),
      child: Image(
        image: _getImage(),
        width: 200,
        height: 200,
      ),
    );
  }

  Widget buildNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Name',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        TextField(
          controller: _nameController,
          decoration: InputDecoration(
            hintText: 'E.g. T-shirt, Pants',
          ),
        ),
      ],
    );
  }

  Widget buildBrandField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Brand',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        TextField(
          controller: _brandController,
          decoration: InputDecoration(
            hintText: 'E.g. Decathlon, Fox',
          ),
        ),
      ],
    );
  }

  Widget buildCategoryField() {
    List<OutfitCategory> menuItems = DataManager.getAllOutfitOutfitCategories();
    OutfitCategory? selectedMenu;
    return DropdownMenu<OutfitCategory>(
      initialSelection: menuItems.firstWhere((category) => category.id == 1),
      controller: _categoryController,
      width: MediaQuery.sizeOf(context).width / 2,
      hintText: "Select category",
      requestFocusOnTap: true,
      enableFilter: true,
      label: Text(
        'Category',
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      onSelected: (OutfitCategory? menu) {
        _category = menu!.id;
      },
      dropdownMenuEntries:
      menuItems.map<DropdownMenuEntry<OutfitCategory>>((OutfitCategory menu) {
        return DropdownMenuEntry<OutfitCategory>(
            value: menu,
            label: menu.name,
        );
      }).toList(),
    );
  }

  Widget buildTemperatureField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Temperature range',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        RangeSlider(
          values: RangeValues(_minTemp.toDouble(), _maxTemp.toDouble()),
          min: 0,
          max: 30,
          divisions: 50,
          labels: RangeLabels(
            _minTemp.toString(),
            _maxTemp.toString(),
          ),
          onChanged: (value) {
            setState(() {
              _minTemp = value.start.toInt();
              _maxTemp = value.end.toInt();
            });
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Row(
                children: [
                  Text(
                    _minTemp.toString(),
                    style: Theme.of(context).textTheme.titleMedium
                  ),
                  Image(
                    width: 24,
                    height: 24,
                    image: AssetImage('assets/thermometer-minus.png')
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: Row(
                children: [
                  Text(
                    _maxTemp.toString(),
                    style: Theme.of(context).textTheme.titleMedium),
                  Image(
                    width: 24,
                    height: 24,
                    image: AssetImage('assets/thermometer-plus.png')
                  ),
                ],
              ),
            ),
          ],
        ),
    ]);
  }

  Widget buildWaterproofField() {
    return SwitchListTile(
      contentPadding: EdgeInsets.all(0),
      title: Text(
        'Waterproof',
        style: Theme.of(context).textTheme.headlineSmall,),
      value: _isWaterproof,
      onChanged: (bool value) {
        setState(() {
          _isWaterproof = value;
        });
      },
      secondary: const Image(
          width: 24,
          height: 24,
          image: AssetImage('assets/weather-pouring.png')
      ),
    );
  }

  Widget buildWindshieldField() {
    return SwitchListTile(
      contentPadding: EdgeInsets.all(0),
        title: Text(
          'Windshield',
          style: Theme.of(context).textTheme.headlineSmall,),
        value: _isWindshield,
        onChanged: (bool value) {
          setState(() {
            _isWindshield = value;
          });
        },
        secondary: const Image(
          width: 24,
          height: 24,
          image: AssetImage('assets/weather-windy.png')
        ),
    );
  }
}
