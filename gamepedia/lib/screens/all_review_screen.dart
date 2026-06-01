import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gamepedia/models/review.dart';
import 'package:gamepedia/l10n/app_localizations.dart';

class AllReviewScreen extends StatelessWidget {
  final String? gameTitle;

  const AllReviewScreen({super.key, this.gameTitle});

  Future<bool> _loadAdminStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isAdmin') ?? false;
  }

  Future<Map<String, dynamic>> _loadAdminAndUsername() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'isAdmin': prefs.getBool('isAdmin') ?? false,
      'username': prefs.getString('username') ?? '',
    };
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: const Color(0xFF0E1126),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 6, 2, 26),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
          color: const Color(0xFF6A5AF9),
        ),
        title: Text(
          gameTitle == null ? loc.allReviewsTitle : loc.reviewsFor(gameTitle!),
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
      body: FutureBuilder<Map<String, dynamic>>(
        future: _loadAdminAndUsername(),
        builder: (context, adminSnapshot) {
          if (adminSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.white),
            );
          }
          final isAdmin = adminSnapshot.data?['isAdmin'] ?? false;
          final currentUsername = adminSnapshot.data?['username'] ?? '';
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Expanded(
                    child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                      stream: (gameTitle == null)
                          ? FirebaseFirestore.instance
                                .collection('reviews')
                                .snapshots()
                          : FirebaseFirestore.instance
                                .collection('reviews')
                                .where('gameName', isEqualTo: gameTitle)
                                .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          );
                        }
                        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                          return Center(
                            child: Text(
                              loc.noReviewsYetMsg,
                              style: TextStyle(color: Colors.grey.shade400),
                            ),
                          );
                        }
                        final docs = snapshot.data!.docs;
                        final reviewEntries =
                            docs
                                .map(
                                  (d) => MapEntry(
                                    d.id,
                                    Review.fromFirestore(d.data()),
                                  ),
                                )
                                .toList()
                              ..sort(
                                (a, b) => b.value.createdAt.compareTo(
                                  a.value.createdAt,
                                ),
                              );
                        return ListView.builder(
                          itemCount: reviewEntries.length,
                          itemBuilder: (context, index) {
                            final entry = reviewEntries[index];
                            final review = entry.value;
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 14),
                              child: ReviewCard(
                                review: review,
                                reviewId: entry.key,
                                isAdmin: isAdmin,
                                currentUsername: currentUsername,
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ReviewCard extends StatelessWidget {
  final Review review;
  final String? reviewId;
  final bool isAdmin;
  final String currentUsername;
  const ReviewCard({
    super.key,
    required this.review,
    this.reviewId,
    this.isAdmin = false,
    this.currentUsername = '',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF6D5DF6), Color(0xFF9F7BFF), Color(0xFF1B1F4A)],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(1.5),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFF0F122A),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 18,
              backgroundColor: Colors.white,
              child: Icon(Icons.person, color: Colors.blue),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        review.author,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                      if (review.username.isNotEmpty) ...[
                        const SizedBox(height: 4),
                        Text(
                          '@${review.username}',
                          style: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ],
                  ),
                  if (review.gameName.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text(
                      review.gameName,
                      style: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 11,
                      ),
                    ),
                    const SizedBox(height: 6),
                  ],
                  Row(
                    children: List.generate(
                      5,
                      (i) => Icon(
                        Icons.star,
                        color: i < review.rating
                            ? Colors.amber
                            : Colors.grey.shade700,
                        size: 14,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    review.content,
                    style: TextStyle(color: Colors.grey.shade300, fontSize: 12),
                  ),
                  if (review.latitude != null && review.longitude != null) ...[
                    const SizedBox(height: 6),
                    Text(
                      'Location: ${review.latitude!.toStringAsFixed(4)}, ${review.longitude!.toStringAsFixed(4)}',
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            if ((isAdmin ||
                    (review.username.isNotEmpty &&
                        review.username == currentUsername)) &&
                reviewId != null)
              IconButton(
                onPressed: () async {
                  try {
                    await FirebaseFirestore.instance
                        .collection('reviews')
                        .doc(reviewId)
                        .delete();
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Review deleted successfully'),
                        ),
                      );
                    }
                  } catch (e) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Failed to delete review: $e')),
                      );
                    }
                  }
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.redAccent,
                  size: 20,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
