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
      body: FutureBuilder<bool>(
        future: _loadAdminStatus(),
        builder: (context, adminSnapshot) {
          if (adminSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.white),
            );
          }

          final isAdmin = adminSnapshot.data ?? false;
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

                        final reviewDocs = snapshot.data!.docs
                          ..sort((a, b) {
                            final aReview = Review.fromFirestore(a.data());
                            final bReview = Review.fromFirestore(b.data());
                            return bReview.createdAt.compareTo(
                              aReview.createdAt,
                            );
                          });

                        return ListView.builder(
                          itemCount: reviewDocs.length,
                          itemBuilder: (context, index) {
                            final doc = reviewDocs[index];
                            final review = Review.fromFirestore(doc.data());
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 14),
                              child: ReviewCard(
                                review: review,
                                reviewId: doc.id,
                                isAdmin: isAdmin,
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

  const ReviewCard({
    super.key,
    required this.review,
    this.reviewId,
    this.isAdmin = false,
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
                  Text(
                    review.author,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
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
                ],
              ),
            ),
            if (isAdmin && reviewId != null)
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
