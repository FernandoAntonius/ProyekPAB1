import 'package:flutter/material.dart';
import 'package:gamepedia/l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gamepedia/models/game.dart';
import 'package:intl/intl.dart';

class EditGameScreen extends StatefulWidget {
  final Game game;
  const EditGameScreen({super.key, required this.game});

  @override
  State<EditGameScreen> createState() => _EditGameScreen();
}

Widget builEditGame(
  String label, {
  TextEditingController? controller,
  int maxLines = 1,
  bool readOnly = false,
  VoidCallback? onTap,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16),
    child: TextFormField(
      controller: controller,
      readOnly: readOnly,
      onTap: onTap,
      maxLines: maxLines,
      style: TextStyle(
        color: Colors.white,
        fontFamily: 'Quicksand',
        fontSize: 14,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
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
          borderSide: BorderSide(color: Colors.white, width: 3),
        ),
      ),
    ),
  );
}

Widget buildSystemReq(String label, {TextEditingController? controller}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: Row(
      children: [
        SizedBox(
          width: 100,
          child: Text(
            label,
            style: TextStyle(
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
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
                borderSide: const BorderSide(color: Colors.white, width: 0.3),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

class _EditGameScreen extends State<EditGameScreen> {
  bool _isAdmin = false;
  bool _adminLoading = true;
  bool _isLoading = false;
  List<String> selectedDevices = [];
  List<String> selectedGenres = [];
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

  @override
  void initState() {
    super.initState();
    _loadAdminStatus();
    _prefillFields();
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
      initialDate:
          DateTime.tryParse(_releaseDateController.text) ?? DateTime.now(),
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
    await showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setStateDialog) {
            return AlertDialog(
              backgroundColor: const Color(0xFF0E1126),
              title: Text(title, style: const TextStyle(color: Colors.white)),
              content: SizedBox(
                width: double.maxFinite,
                child: ListView(
                  shrinkWrap: true,
                  children: options.map((opt) {
                    final checked = tempSelected.contains(opt);
                    return CheckboxListTile(
                      value: checked,
                      title: Text(
                        opt,
                        style: const TextStyle(color: Colors.white),
                      ),
                      onChanged: (v) {
                        setStateDialog(() {
                          if (v == true) {
                            tempSelected.add(opt);
                          } else {
                            tempSelected.remove(opt);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
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
                  child: const Text(
                    'OK',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _prefillFields() {
    final g = widget.game;
    _titleController.text = g.title;
    _studioController.text = g.developer;
    _thumbnailController.text = g.imageAssets;
    _releaseDateController.text = g.releaseDate.toIso8601String().split('T')[0];
    _priceController.text = g.price.toString();
    _screenshotsController.text = g.screenShots.join('\n');
    _descriptionController.text = g.description;
    selectedDevices = List<String>.from(g.device);
    selectedGenres = List<String>.from(g.genre);
    _deviceController.text = selectedDevices.join(', ');
    _genreController.text = selectedGenres.join(', ');
    final sys = g.systemRequirements;
    if (sys.containsKey('minimum')) {
      _minOsController.text = sys['minimum']?['os'] ?? '';
      _minProcessorController.text = sys['minimum']?['processor'] ?? '';
      _minMemoryController.text = sys['minimum']?['memory'] ?? '';
      _minGraphicsController.text = sys['minimum']?['graphics'] ?? '';
      _minStorageController.text = sys['minimum']?['storage'] ?? '';
    }
    if (sys.containsKey('recommended')) {
      _recOsController.text = sys['recommended']?['os'] ?? '';
      _recProcessorController.text = sys['recommended']?['processor'] ?? '';
      _recMemoryController.text = sys['recommended']?['memory'] ?? '';
      _recGraphicsController.text = sys['recommended']?['graphics'] ?? '';
      _recStorageController.text = sys['recommended']?['storage'] ?? '';
    }
  }

  Future<void> _updateGameData() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final query = await FirebaseFirestore.instance
          .collection('games')
          .where('title', isEqualTo: widget.game.title)
          .get();
      if (query.docs.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Game document not found')),
        );
        return;
      }
      final docRef = query.docs.first.reference;
      List<String> screenshotList =
          _screenshotsController.text.trim().isNotEmpty
          ? _screenshotsController.text
                .split(RegExp(r'[\n,]'))
                .map((s) => s.trim())
                .where((s) => s.isNotEmpty)
                .toList()
          : [];
      await docRef.update({
        'title': _titleController.text.trim(),
        'studio': _studioController.text.trim(),
        'imageAssets': _thumbnailController.text.trim().isNotEmpty
            ? _thumbnailController.text.trim()
            : 'images/gamepedia.png',
        'releaseDate': _releaseDateController.text.trim(),
        'price': double.tryParse(_priceController.text.trim()) ?? 0.0,
        'device': selectedDevices,
        'genre': selectedGenres,
        'description': _descriptionController.text.trim(),
        'screenshots': screenshotList,
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
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Game updated')));
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Failed: $e')));
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
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
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Admin access required'),
        ),
        body: const Center(
          child: Text(
            'Only admin users can edit games.',
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
        title: const Text(
          'Edit Game',
          style: TextStyle(
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
            builEditGame(
              AppLocalizations.of(context)!.titleField,
              controller: _titleController,
            ),
            builEditGame(
              AppLocalizations.of(context)!.studioField,
              controller: _studioController,
            ),
            builEditGame(
              AppLocalizations.of(context)!.thumbnailUrl,
              controller: _thumbnailController,
            ),
            builEditGame(
              AppLocalizations.of(context)!.releaseDateField,
              controller: _releaseDateController,
              readOnly: true,
              onTap: _selectDate,
            ),
            builEditGame(
              AppLocalizations.of(context)!.priceExample,
              controller: _priceController,
            ),
            builEditGame(
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
            builEditGame(
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
            builEditGame(
              AppLocalizations.of(context)!.descriptionField,
              controller: _descriptionController,
              maxLines: 10,
            ),
            builEditGame(
              AppLocalizations.of(context)!.screenshotImageUrlField,
              controller: _screenshotsController,
              maxLines: 8,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(7),
                border: Border.all(
                  color: Colors.white.withOpacity(0.3),
                  width: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.systemRequirements,
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.minimum,
                        style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  buildSystemReq(
                    AppLocalizations.of(context)!.osField,
                    controller: _minOsController,
                  ),
                  buildSystemReq(
                    AppLocalizations.of(context)!.processorField,
                    controller: _minProcessorController,
                  ),
                  buildSystemReq(
                    AppLocalizations.of(context)!.memoryField,
                    controller: _minMemoryController,
                  ),
                  buildSystemReq(
                    AppLocalizations.of(context)!.graphicsField,
                    controller: _minGraphicsController,
                  ),
                  buildSystemReq(
                    AppLocalizations.of(context)!.storageField,
                    controller: _minStorageController,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.recommended,
                        style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  buildSystemReq(
                    AppLocalizations.of(context)!.osField,
                    controller: _recOsController,
                  ),
                  buildSystemReq(
                    AppLocalizations.of(context)!.processorField,
                    controller: _recProcessorController,
                  ),
                  buildSystemReq(
                    AppLocalizations.of(context)!.memoryField,
                    controller: _recMemoryController,
                  ),
                  buildSystemReq(
                    AppLocalizations.of(context)!.graphicsField,
                    controller: _recGraphicsController,
                  ),
                  buildSystemReq(
                    AppLocalizations.of(context)!.storageField,
                    controller: _recStorageController,
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF2C30FF), Color(0xFFC540F5)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: SizedBox(
                    height: 35,
                    child: ElevatedButton(
                      onPressed: _isLoading ? null : _updateGameData,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        padding: EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 6,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                      child: Text(
                        'Edit Game',
                        style: TextStyle(
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
