import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:gamepedia/l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cached_network_image/cached_network_image.dart';

class AddGameScreen extends StatefulWidget {
  const AddGameScreen({super.key});

  @override
  State<AddGameScreen> createState() => _AddGameScreen();
}

Widget buildAddGame(
  String label, {
  required TextEditingController controller,
  int maxLines = 1,
  bool readOnly = false,
  VoidCallback? onTap,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16),
    child: TextFormField(
      controller: controller,
      maxLines: maxLines,
      readOnly: readOnly,
      onTap: onTap,
      style: const TextStyle(
        color: Colors.white,
        fontFamily: 'Quicksand',
        fontSize: 14,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        labelText: label,
        labelStyle: TextStyle(
          fontFamily: 'Quicksand',
          fontSize: 14,
          color: Colors.white.withOpacity(0.6),
        ),
        filled: true,
        fillColor: const Color(0xFF0F122A),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: const BorderSide(color: Colors.white, width: 3),
        ),
      ),
    ),
  );
}

Widget buildDropDown({
  required String? value,
  required List<String> items,
  required String label,
  required ValueChanged<String?> onChanged,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16),
    child: DropdownButtonFormField<String>(
      value: value,
      dropdownColor: const Color(0xFF1A1C3A),
      style: const TextStyle(
        color: Colors.white,
        fontFamily: 'Quicksand',
        fontSize: 14,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        labelText: label,
        labelStyle: TextStyle(
          fontFamily: 'Quicksand',
          fontSize: 14,
          color: Colors.white.withOpacity(0.6),
        ),
        filled: true,
        fillColor: Colors.black,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: const BorderSide(color: Colors.white),
        ),
      ),
      hint: Text(
        'Select $label',
        style: TextStyle(color: Colors.white.withOpacity(0.4)),
      ),
      items: items.map((item) {
        return DropdownMenuItem(
          value: item,
          child: Text(item, style: const TextStyle(color: Colors.white)),
        );
      }).toList(),
      onChanged: onChanged,
    ),
  );
}

// Widget helper untuk System Requirements
Widget buildSystemReq(String label, TextEditingController controller) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: Row(
      children: [
        SizedBox(
          width: 100,
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white70,
              fontFamily: 'Quicksand',
              fontSize: 14,
            ),
          ),
        ),
        Expanded(
          child: TextFormField(
            controller: controller,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'Quicksand',
              fontSize: 14,
            ),
            decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 4,
                vertical: 4,
              ),
              filled: true,
              fillColor: const Color(0xFF0F122A),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
                borderSide: const BorderSide(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

class _AddGameScreen extends State<AddGameScreen> {
  List<String> selectedDevices = [];
  List<String> selectedGenres = [];
  bool _isAdmin = false;
  bool _adminLoading = true;

  final List<String> _devices = [
    'Windows',
    'MacOS',
    'Android',
    'iOS',
    'Xbox',
    'Nintendo Switch',
    'PlayStation',
    'Linux',
  ];
  final List<String> _genres = [
    'Adventure',
    'Role-playing',
    'Shooter',
    'Platformer',
    'Puzzle',
    'Strategy',
  ];

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _studioController = TextEditingController();
  final TextEditingController _thumbnailController = TextEditingController();
  final TextEditingController _releaseDateController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _screenshotsController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _deviceController = TextEditingController();
  final TextEditingController _genreController = TextEditingController();
  final TextEditingController _minOsController = TextEditingController();
  final TextEditingController _minProcessorController = TextEditingController();
  final TextEditingController _minMemoryController = TextEditingController();
  final TextEditingController _minGraphicsController = TextEditingController();
  final TextEditingController _minStorageController = TextEditingController();
  final TextEditingController _recOsController = TextEditingController();
  final TextEditingController _recProcessorController = TextEditingController();
  final TextEditingController _recMemoryController = TextEditingController();
  final TextEditingController _recGraphicsController = TextEditingController();
  final TextEditingController _recStorageController = TextEditingController();

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadAdminStatus();
  }

  Future<void> _loadAdminStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final isAdmin = prefs.getBool('isAdmin') ?? false;
    setState(() {
      _isAdmin = isAdmin;
      _adminLoading = false;
    });
  }

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setState(() {
        _releaseDateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  Future<void> _showMultiSelectDialog({
    required String title,
    required List<String> options,
    required List<String> selectedList,
    required TextEditingController controller,
  }) async {
    final tempSelected = List<String>.from(selectedList);
    await showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: Text(title, style: const TextStyle(color: Colors.white)),
          content: StatefulBuilder(
            builder: (context, setState) {
              return SizedBox(
                width: double.maxFinite,
                child: ListView(
                  shrinkWrap: true,
                  children: options.map((option) {
                    final isSelected = tempSelected.contains(option);
                    return CheckboxListTile(
                      value: isSelected,
                      activeColor: Colors.blue,
                      checkColor: Colors.white,
                      tileColor: Colors.transparent,
                      title: Text(
                        option,
                        style: const TextStyle(color: Colors.white),
                      ),
                      onChanged: (val) {
                        setState(() {
                          if (val == true) {
                            tempSelected.add(option);
                          } else {
                            tempSelected.remove(option);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.white),
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  selectedList
                    ..clear()
                    ..addAll(tempSelected);
                  controller.text = selectedList.join(', ');
                });
                Navigator.of(context).pop();
              },
              child: const Text('OK', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  Future<void> _uploadGameData() async {
    if (_titleController.text.trim().isEmpty ||
        selectedDevices.isEmpty ||
        selectedGenres.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.titleDeviceGenreRequired),
        ),
      );
      return;
    }
    setState(() {
      _isLoading = true;
    });
    try {
      List<String> screenshotList =
          _screenshotsController.text.trim().isNotEmpty
          ? _screenshotsController.text
                .split(RegExp(r'[\n,]'))
                .map((s) => s.trim())
                .where((s) => s.isNotEmpty)
                .toList()
          : [];
      await FirebaseFirestore.instance.collection('games').add({
        'title': _titleController.text.trim(),
        'studio': _studioController.text.trim(),
        'rating': 0.0,
        'releaseDate': _releaseDateController.text.trim(),
        'price': double.tryParse(_priceController.text.trim()) ?? 0.0,
        'device': selectedDevices,
        'genre': selectedGenres,
        'description': _descriptionController.text.trim(),
        'screenshots': screenshotList,
        'imageAssets': _thumbnailController.text.trim().isNotEmpty
            ? _thumbnailController.text.trim()
            : 'images/gamepedia.png',
        'createdAt': FieldValue.serverTimestamp(),
        'systemRequirements': {
          'minimum': {
            'os': _minOsController.text.trim(),
            'processor': _minProcessorController.text.trim(),
            'memory': _minMemoryController.text.trim(),
            'graphics': _minGraphicsController.text.trim(),
            'storage': _minStorageController.text.trim(),
          },
          'recommended': {
            'os': _recOsController.text.trim(),
            'processor': _recProcessorController.text.trim(),
            'memory': _recMemoryController.text.trim(),
            'graphics': _recGraphicsController.text.trim(),
            'storage': _recStorageController.text.trim(),
          },
        },
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context)!.gameAdded)),
      );
      _clearForm();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context)!.failed(e))),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _clearForm() {
    _titleController.clear();
    _studioController.clear();
    _thumbnailController.clear();
    _releaseDateController.clear();
    _priceController.clear();
    _screenshotsController.clear();
    _descriptionController.clear();
    _minOsController.clear();
    _minProcessorController.clear();
    _minMemoryController.clear();
    _minGraphicsController.clear();
    _minStorageController.clear();
    _recOsController.clear();
    _recProcessorController.clear();
    _recMemoryController.clear();
    _recGraphicsController.clear();
    _recStorageController.clear();
    _deviceController.clear();
    _genreController.clear();
    setState(() {
      selectedDevices = [];
      selectedGenres = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_adminLoading) {
      return Scaffold(
        backgroundColor: const Color.fromARGB(255, 6, 2, 26),
        body: const Center(
          child: CircularProgressIndicator(color: Colors.white),
        ),
      );
    }

    if (!_isAdmin) {
      return Scaffold(
        backgroundColor: const Color.fromARGB(255, 6, 2, 26),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 6, 2, 26),
          title: const Text('Admin access required'),
        ),
        body: const Center(
          child: Text(
            'Only admin users can add games.',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 6, 2, 26),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 6, 2, 26),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
          color: const Color(0xFF6A5AF9),
        ),
        title: Text(
          AppLocalizations.of(context)!.addGameTitle,
          style: const TextStyle(
            color: Color(0xFF6A5AF9),
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Quicksand',
          ),
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset('images/console.png', height: 30),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // thumbnail preview
            if (_thumbnailController.text.trim().isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  imageUrl: _thumbnailController.text.trim(),
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    height: 200,
                    color: Colors.black12,
                    child: const Center(child: CircularProgressIndicator()),
                  ),
                  errorWidget: (context, url, error) => Image.asset(
                    'images/gamepedia.png',
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            const SizedBox(height: 12),
            buildAddGame(
              AppLocalizations.of(context)!.titleField,
              controller: _titleController,
            ),
            buildAddGame(
              AppLocalizations.of(context)!.studioField,
              controller: _studioController,
            ),
            buildAddGame(
              AppLocalizations.of(context)!.thumbnailUrl,
              controller: _thumbnailController,
            ),
            buildAddGame(
              AppLocalizations.of(context)!.releaseDateField,
              controller: _releaseDateController,
              readOnly: true,
              onTap: _selectDate,
            ),
            buildAddGame(
              AppLocalizations.of(context)!.priceExample,
              controller: _priceController,
            ),
            buildAddGame(
              AppLocalizations.of(context)!.deviceField,
              controller: _deviceController,
              readOnly: true,
              onTap: () => _showMultiSelectDialog(
                title: AppLocalizations.of(context)!.deviceField,
                options: _devices,
                selectedList: selectedDevices,
                controller: _deviceController,
              ),
            ),
            buildAddGame(
              AppLocalizations.of(context)!.genreField,
              controller: _genreController,
              readOnly: true,
              onTap: () => _showMultiSelectDialog(
                title: AppLocalizations.of(context)!.genreField,
                options: _genres,
                selectedList: selectedGenres,
                controller: _genreController,
              ),
            ),
            buildAddGame(
              AppLocalizations.of(context)!.descriptionField,
              controller: _descriptionController,
              maxLines: 5,
            ),
            buildAddGame(
              AppLocalizations.of(context)!.screenshotImageUrlField,
              controller: _screenshotsController,
              maxLines: 2,
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF0F122A),
                borderRadius: BorderRadius.circular(7),
                border: Border.all(color: Colors.white.withOpacity(0.3)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.systemRequirements,
                    style: const TextStyle(
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    AppLocalizations.of(context)!.minimum,
                    style: const TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  buildSystemReq(
                    AppLocalizations.of(context)!.osField,
                    _minOsController,
                  ),
                  buildSystemReq(
                    AppLocalizations.of(context)!.processorField,
                    _minProcessorController,
                  ),
                  buildSystemReq(
                    AppLocalizations.of(context)!.memoryField,
                    _minMemoryController,
                  ),
                  buildSystemReq(
                    AppLocalizations.of(context)!.graphicsField,
                    _minGraphicsController,
                  ),
                  buildSystemReq(
                    AppLocalizations.of(context)!.storageField,
                    _minStorageController,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    AppLocalizations.of(context)!.recommended,
                    style: const TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  buildSystemReq(
                    AppLocalizations.of(context)!.osField,
                    _recOsController,
                  ),
                  buildSystemReq(
                    AppLocalizations.of(context)!.processorField,
                    _recProcessorController,
                  ),
                  buildSystemReq(
                    AppLocalizations.of(context)!.memoryField,
                    _recMemoryController,
                  ),
                  buildSystemReq(
                    AppLocalizations.of(context)!.graphicsField,
                    _recGraphicsController,
                  ),
                  buildSystemReq(
                    AppLocalizations.of(context)!.storageField,
                    _recStorageController,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF2C30FF), Color(0xFFC540F5)],
                    ),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: SizedBox(
                    height: 35,
                    child: ElevatedButton(
                      onPressed: _isLoading ? null : _uploadGameData,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                      ),
                      child: _isLoading
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : Text(
                              AppLocalizations.of(context)!.addButton,
                              style: const TextStyle(
                                fontFamily: 'Quicksand',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
