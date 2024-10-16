import 'package:flutter/material.dart';
import 'dart:math';
import 'package:tinder_clone/component/card_ui.dart'; // Assuming UserCard is defined in card_ui.dart
import 'package:tinder_clone/component/userprofile.dart';

class TinderSwipeCard extends StatefulWidget {
  const TinderSwipeCard({super.key});

  @override
  TinderSwipeCardState createState() => TinderSwipeCardState();
}

class TinderSwipeCardState extends State<TinderSwipeCard>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  Offset _cardPosition = const Offset(0, 0);
  double _cardRotation = 0.0;
  bool _showLikeOverlay = false;
  bool _showNopeOverlay = false;
  final List<int> _swipedCardsStack = []; // Stack to keep track of swiped cards

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (_currentIndex < userProfiles.length) // Use userProfiles here
          Stack(
            children: List.generate(userProfiles.length, (index) {
              if (index == _currentIndex) {
                return _buildDraggableCard(index);
              } else if (index < _currentIndex) {
                return _buildInactiveCard(index);
              }
              return const SizedBox.shrink();
            }),
          )
        else
          const Center(child: Text("No more profiles")),
        if (_showLikeOverlay) _buildLikeOverlay(),
        if (_showNopeOverlay) _buildNopeOverlay(),
      ],
    );
  }

  void swipeLeft() => _swipeLeft();
  void swipeRight() => _swipeRight();

  void _swipeRight() {
    setState(() {
      _showLikeOverlay = true;
      _cardPosition = const Offset(500, 0); // Move the card far right
    });

    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        var likedUser = userProfiles[_currentIndex];

        // Check if the user is already in likedUsers list to avoid duplicate entries
        if (!likedUsers.contains(likedUser)) {
          likedUsers.add(
              likedUser); // Add the liked user only if not already in the list
        }

        _swipedCardsStack
            .add(_currentIndex); // Store the current card index in the stack
        _currentIndex++;
        _resetCardState(); // Reset card position and rotation
      });
    });
  }

  void _swipeLeft() {
    setState(() {
      _showNopeOverlay = true;
      _cardPosition = const Offset(-500, 0); // Move the card far left
    });

    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        _swipedCardsStack
            .add(_currentIndex); // Store the current card index in the stack
        _currentIndex++;
        _resetCardState(); // Reset card position and rotation
      });
    });
  }

  void _resetCardState() {
    _cardPosition = const Offset(0, 0);
    _cardRotation = 0.0;
    _showLikeOverlay = false;
    _showNopeOverlay = false;
  }

  void refreshCard() {
    if (_swipedCardsStack.isNotEmpty) {
      setState(() {
        _currentIndex =
            _swipedCardsStack.removeLast(); // Pop the last swiped card index
      });
    }
  }

  Widget _buildDraggableCard(int index) {
    return GestureDetector(
      onPanUpdate: (details) {
        setState(() {
          _cardPosition += details.delta;
          _cardRotation = (_cardPosition.dx / 200) * pi / 12;
          _showLikeOverlay = _cardPosition.dx > 100;
          _showNopeOverlay = _cardPosition.dx < -100;
        });
      },
      onPanEnd: (details) {
        if (_showLikeOverlay) {
          _swipeRight();
        } else if (_showNopeOverlay) {
          _swipeLeft();
        } else {
          _resetCardState(); // Reset the card to center if not swiped
        }
      },
      child: Transform.translate(
        offset: _cardPosition,
        child: Transform.rotate(
          angle: _cardRotation,
          child: _buildCard(index),
        ),
      ),
    );
  }

  Widget _buildInactiveCard(int index) {
    return Opacity(
      opacity: 0.5,
      child: _buildCard(index),
    );
  }

  Widget _buildCard(int index) {
    var profile = userProfiles[index]; // Use userProfiles here
    return ClipRRect(
      borderRadius: BorderRadius.circular(25.0), // Apply border radius here
      child: UserCard(
        userName: profile.name,
        age: profile.age,
        description: profile.description,
        imageUrls: profile.imageUrls, // Access the list of image URLs
      ),
    );
  }

  Widget _buildLikeOverlay() {
    return Positioned.fill(
      child: Container(
        color: Colors.green,
        child: const Center(
          child: Text(
            "Liked!",
            style: TextStyle(fontSize: 40, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _buildNopeOverlay() {
    return Positioned.fill(
      child: Container(
        color: Colors.red,
        child: const Center(
          child: Text(
            "Nope!",
            style: TextStyle(fontSize: 40, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
