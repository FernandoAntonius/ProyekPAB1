import 'package:flutter/foundation.dart';
import 'package:gamepedia/models/review.dart';

class ReviewProvider extends ChangeNotifier {
  final List<Review> _reviews = [];

  List<Review> get reviews => List.unmodifiable(_reviews);

  void addReview(Review review) {
    _reviews.insert(0, review);
    notifyListeners();
  }

  void removeReviewAt(int index) {
    if (index >= 0 && index < _reviews.length) {
      _reviews.removeAt(index);
      notifyListeners();
    }
  }

  void clear() {
    _reviews.clear();
    notifyListeners();
  }
}
