import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gamepedia/data/review_provider.dart';
import 'package:gamepedia/models/review.dart';

class AllReviewScreen extends StatelessWidget {
  const AllReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset('images/console.png', height: 30),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Expanded(
                child: Consumer<ReviewProvider>(
                  builder: (context, repo, _) {
                    final reviews = repo.reviews;
                    if (reviews.isEmpty) {
                      return Center(
                        child: Text(
                          'No reviews yet',
                          style: TextStyle(color: Colors.grey.shade400),
                        ),
                      );
                    }
                    return ListView.builder(
                      itemCount: reviews.length,
                      itemBuilder: (context, index) {
                        final r = reviews[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 14),
                          child: ReviewCard(review: r),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),

      // Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class ReviewCard extends StatelessWidget {
  final Review review;

  const ReviewCard({super.key, required this.review});

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

                  const SizedBox(height: 6),

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
          ],
        ),
      ),
    );
  }
}
