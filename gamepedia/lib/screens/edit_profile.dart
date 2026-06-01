import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter/material.dart';
import 'package:gamepedia/l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreen();
}

class _EditProfileScreen extends State<EditProfileScreen> {
  late TextEditingController _usernameController;
  late TextEditingController _bioController;
  late TextEditingController _locationController;
  String _username = "User123749";
  String _email = "user@gmail.com";
  bool _isLoadingLocation = false;
  DateTime? _selectedBirthDate;
  bool _isAdmin = false;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _bioController = TextEditingController();
    _locationController = TextEditingController();
    _loadProfileData();
  }

  void _loadProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final isAdmin = prefs.getBool('isAdmin') ?? false;
    final String savedEncryptedEmail = prefs.getString('email') ?? '';
    final String savedKey = prefs.getString('key') ?? '';
    final String savedIV = prefs.getString('iv') ?? '';
    final username = prefs.getString('username') ?? '';

    setState(() {
      _isAdmin = isAdmin;
      if (_isAdmin) {
        _email = 'admin@gmail.com';
      }
    });

    final encrypt.Key key = encrypt.Key.fromBase64(savedKey);
    final encrypt.IV iv = encrypt.IV.fromBase64(savedIV);
    final decrypter = encrypt.Encrypter(encrypt.AES(key));
    final decryptedEmail = decrypter.decrypt64(savedEncryptedEmail, iv: iv);
    try {
      if (username.isNotEmpty) {
        final docSnapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(username)
            .get();
        if (docSnapshot.exists) {
          final data = docSnapshot.data() ?? {};
          setState(() {
            _usernameController.text = data['username'] ?? username;
            _bioController.text = data['bio'] ?? '';
            _locationController.text = data['location'] ?? '';
            _username = data['username'] ?? username;
            if (!_isAdmin) {
              _email = data['email'] ?? '';
            }
            if (data['birthDate'] != null &&
                data['birthDate'].toString().isNotEmpty) {
              try {
                _selectedBirthDate = DateTime.parse(data['birthDate']);
              } catch (e) {
                _selectedBirthDate = null;
              }
            }
          });
          return;
        }
      }
    } catch (e) {
      debugPrint('Error loading from Firestore: $e');
    }
    setState(() {
      _usernameController.text = prefs.getString('username') ?? '';
      _bioController.text = prefs.getString('profile_bio') ?? '';
      _locationController.text = prefs.getString('profile_location') ?? '';
      _username = prefs.getString('username') ?? 'User123749';
      if (!_isAdmin) {
        _email = decryptedEmail;
      }
      final birthDateStr = prefs.getString('profile_birthDate');
      if (birthDateStr != null && birthDateStr.isNotEmpty) {
        try {
          _selectedBirthDate = DateTime.parse(birthDateStr);
        } catch (e) {
          _selectedBirthDate = null;
        }
      }
    });
  }

  Future<void> _getLocation() async {
    setState(() {
      _isLoadingLocation = true;
    });
    final loc = AppLocalizations.of(context)!;
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        if (mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(loc.locationPermissionDenied)));
        }
        return;
      }
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        if (mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(loc.enableLocationServices)));
        }
        return;
      }
      final position = await Geolocator.getCurrentPosition();
      setState(() {
        _locationController.text =
            '${position.latitude.toStringAsFixed(4)}, ${position.longitude.toStringAsFixed(4)}';
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(loc.locationUpdatedSuccessfully)),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(loc.failedToRetrieveLocation(e))),
        );
      }
    } finally {
      setState(() {
        _isLoadingLocation = false;
      });
    }
  }

  Future<void> _saveProfile() async {
    final loc = AppLocalizations.of(context)!;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final oldUsername = prefs.getString('username') ?? '';
    final newUsername = _usernameController.text;
    if (newUsername.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(loc.fillAllFields)));
      return;
    }
    await prefs.setString('username', newUsername);
    await prefs.setString('profile_bio', _bioController.text);
    await prefs.setString(
      'profile_birthDate',
      _selectedBirthDate?.toIso8601String() ?? '',
    );
    await prefs.setString('profile_location', _locationController.text);
    try {
      if (oldUsername.isNotEmpty && oldUsername != newUsername) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(oldUsername)
            .delete();
      }
      if (oldUsername.isNotEmpty && oldUsername != newUsername) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(newUsername)
            .set({
              'username': newUsername,
              'email': _email,
              'bio': _bioController.text,
              'birthDate': _selectedBirthDate?.toIso8601String() ?? '',
              'location': _locationController.text,
              'updatedAt': FieldValue.serverTimestamp(),
            }, SetOptions(merge: true));
      } else {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(newUsername)
            .update({
              'bio': _bioController.text,
              'birthDate': _selectedBirthDate?.toIso8601String() ?? '',
              'location': _locationController.text,
              'updatedAt': FieldValue.serverTimestamp(),
            });
      }
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(loc.profileSaved)));
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(loc.errorSavingProfile(e.toString()))),
      );
    }
  }

  Future<void> _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isSignedIn', false);
    await prefs.setBool('isAdmin', false);
    if (!mounted) return;
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _bioController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 6, 2, 26),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 6, 2, 26),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
          color: Color(0xFF6A5AF9),
        ),
        title: Text(
          loc.editProfile,
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
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF1A2847),
                ),
                child: const Icon(
                  Icons.person,
                  size: 60,
                  color: Colors.white54,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                _username,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                _email,
                style: const TextStyle(color: Colors.white70, fontSize: 14),
              ),
              const SizedBox(height: 32),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  hintText: _username,
                  hintStyle: const TextStyle(color: Colors.white54),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.white24),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.white24),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFF6366FF)),
                  ),
                  contentPadding: const EdgeInsets.all(16),
                ),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _bioController,
                decoration: InputDecoration(
                  hintText: loc.biography,
                  hintStyle: const TextStyle(color: Colors.white54),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.white24),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.white24),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFF6366FF)),
                  ),
                  contentPadding: const EdgeInsets.all(16),
                ),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () async {
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: _selectedBirthDate ?? DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                    builder: (context, child) {
                      return Theme(
                        data: Theme.of(context).copyWith(
                          colorScheme: const ColorScheme.dark(
                            primary: Color(0xFF6A5AF9),
                            surface: Color(0xFF1A2847),
                          ),
                        ),
                        child: child!,
                      );
                    },
                  );
                  if (picked != null) {
                    setState(() {
                      _selectedBirthDate = picked;
                    });
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white24),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.calendar_month, color: Colors.white54),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          _selectedBirthDate == null
                              ? loc.birthDate
                              : '${loc.birthDate}: ${_selectedBirthDate!.toLocal().toString().split(' ')[0]}',
                          style: TextStyle(
                            color: _selectedBirthDate == null
                                ? Colors.white54
                                : Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _locationController,
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: loc.location,
                        hintStyle: const TextStyle(color: Colors.white54),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.white24),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.white24),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFF6366FF),
                          ),
                        ),
                        contentPadding: const EdgeInsets.all(16),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 12),
                  SizedBox(
                    height: 56,
                    child: ElevatedButton.icon(
                      onPressed: _isLoadingLocation ? null : _getLocation,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6A5AF9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      icon: _isLoadingLocation
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : const Icon(Icons.location_on, size: 20),
                      label: Text(
                        loc.locateMe,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF6366FF), Color(0xFF8B5CF6)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: _saveProfile,
                      borderRadius: BorderRadius.circular(12),
                      child: Center(
                        child: Text(
                          loc.save,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red, width: 1.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: _logout,
                      borderRadius: BorderRadius.circular(12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.logout, color: Colors.red, size: 20),
                          const SizedBox(width: 8),
                          Text(
                            loc.logout,
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                '© GamePedia 2025',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
