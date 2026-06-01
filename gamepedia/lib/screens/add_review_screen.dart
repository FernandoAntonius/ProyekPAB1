import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gamepedia/models/review.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gamepedia/l10n/app_localizations.dart';
import 'package:geolocator/geolocator.dart';
import 'package:gamepedia/helper/notification_service.dart';

class AddReviewScreen extends StatefulWidget {
  final String? fixedGameName;

  const AddReviewScreen({super.key, this.fixedGameName});

  @override
  State<AddReviewScreen> createState() => _AddReviewScreenState();
}

class _AddReviewScreenState extends State<AddReviewScreen> {
  int rating = 0;
  bool isLoading = false;
  double? _latitude;
  double? _longitude;
  String? selectedGameName;
  List<String> gameNames = [];
  final TextEditingController reviewController = TextEditingController();
  final TextEditingController authorController = TextEditingController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getLocation();
    });

    selectedGameName = widget.fixedGameName;

    if (widget.fixedGameName == null) {
      _fetchGames();
    }
  }

  Future<void> _fetchGames() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('games')
          .get();
      setState(() {
        gameNames = snapshot.docs.map((doc) => doc['title'] as String).toList();
      });
    } catch (e) {
      if (mounted) {
        final loc = AppLocalizations.of(context)!;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(loc.failedToLoadGames(e.toString()))),
        );
      }
    }
  }

  Future<void> _getLocation() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        return;
      }
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please turn on GPS to get location.')),
        );
        await Geolocator.openLocationSettings();
        return;
      }
      final position = await Geolocator.getCurrentPosition();
      setState(() {
        _latitude = position.latitude;
        _longitude = position.longitude;
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> _uploadReview() async {
    final loc = AppLocalizations.of(context)!;
    if (authorController.text.trim().isEmpty ||
        selectedGameName == null ||
        reviewController.text.trim().isEmpty ||
        rating == 0) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(loc.fillAllFields)));
      return;
    }
    setState(() {
      isLoading = true;
    });
    try {
      final prefs = await SharedPreferences.getInstance();
      final storedUsername = prefs.getString('username')?.trim();
      await FirebaseFirestore.instance.collection('reviews').add({
        'author': authorController.text.trim(),
        'username': storedUsername ?? authorController.text.trim(),
        'gameName': selectedGameName,
        'content': reviewController.text.trim(),
        'rating': rating,
        'latitude': _latitude,
        'longitude': _longitude,
        'createdAt': FieldValue.serverTimestamp(),
      });
      await NotificationService().showReviewAddedNotification(
        selectedGameName ?? '',
        authorController.text.trim(),
      );
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(loc.reviewSubmittedSuccessfully)));
      _clearForm();
      if (mounted) Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(loc.failedToSubmitReview(e.toString()))),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void _clearForm() {
    authorController.clear();
    reviewController.clear();
    setState(() {
      selectedGameName = widget.fixedGameName;
      rating = 0;
    });
  }

  @override
  void dispose() {
    authorController.dispose();
    reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 6, 2, 26),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
          color: const Color(0xFF6A5AF9),
        ),
        title: Text(
          loc.addReviewTitle,
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 25),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF1A1E6B), Color(0xFF211445)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  border: Border.all(color: Colors.deepPurpleAccent, width: 1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      loc.writeYourReview,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextField(
                      controller: authorController,
                      style: const TextStyle(color: Colors.white),
                      onChanged: (value) {
                        if (value.length > 20) {
                          final trimmed = value.substring(0, 20);
                          authorController.text = trimmed;
                          authorController.selection =
                              TextSelection.fromPosition(
                                TextPosition(offset: trimmed.length),
                              );
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Maximum 20 characters allowed for title',
                                ),
                                duration: Duration(milliseconds: 900),
                              ),
                            );
                          }
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Review title, max 20 characters',
                        hintStyle: TextStyle(color: Colors.grey.shade500),
                        filled: true,
                        fillColor: Colors.transparent,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.grey.shade600),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.grey.shade600),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.deepPurpleAccent,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    if (widget.fixedGameName != null) ...[
                      Text(
                        loc.game,
                        style: TextStyle(color: Colors.grey.shade400),
                      ),
                      const SizedBox(height: 6),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 14,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF0E1126),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey.shade600),
                        ),
                        child: Text(
                          widget.fixedGameName!,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ] else ...[
                      DropdownButtonFormField<String>(
                        value: selectedGameName,
                        items: gameNames
                            .map(
                              (gameName) => DropdownMenuItem(
                                value: gameName,
                                child: Text(
                                  gameName,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedGameName = value;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: loc.selectGame,
                          hintStyle: TextStyle(color: Colors.grey.shade500),
                          filled: true,
                          fillColor: Colors.transparent,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey.shade600),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey.shade600),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.deepPurpleAccent,
                            ),
                          ),
                        ),
                        dropdownColor: const Color(0xFF1A1C3A),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                    const SizedBox(height: 20),
                    Text(
                      loc.yourRating,
                      style: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: List.generate(
                        5,
                        (index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              rating = index + 1;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Icon(
                              rating > index ? Icons.star : Icons.star_border,
                              color: Colors.amber,
                              size: 32,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: reviewController,
                      maxLines: 4,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: loc.shareExperience,
                        hintStyle: TextStyle(color: Colors.grey.shade500),
                        filled: true,
                        fillColor: Colors.transparent,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.grey.shade600),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.grey.shade600),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.deepPurpleAccent,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Center(
                      child: Container(
                        width: 130,
                        height: 42,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF4343FF), Color(0xFFE056FD)],
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ElevatedButton(
                          onPressed: isLoading ? null : _uploadReview,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                          ),
                          child: isLoading
                              ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                )
                              : Text(
                                  loc.submit,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
