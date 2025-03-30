import 'package:flutter/material.dart';

/// A card widget that displays post information including title, location, 
/// description, image, and engagement metrics.
class PostCard extends StatelessWidget {
  /// The title of the post
  final String title;
  
  /// The location where the post was created
  final String location;
  
  /// The main content/description of the post
  final String description;
  
  /// The asset path or URL for the post's image
  final String imageAsset;
  
  /// Number of likes formatted as a string
  final String likes;
  
  /// Number of comments formatted as a string
  final String comments;
  
  /// Relative time since post creation (e.g. "2h ago")
  final String timeAgo;
  
  /// Whether the current user has liked this post
  final bool isLiked;
  
  /// Callback function when like button is pressed
  final VoidCallback onLikePressed;
  
  /// Whether the like action is in progress
  final bool isLiking;
  
  /// Whether to show a progress indicator (e.g. for fundraisers)
  final bool showProgress;
  
  /// Progress value between 0.0 and 1.0
  final double progress;
  
  /// Optional callback for donation button
  final VoidCallback? onDonate;

  PostCard({
    super.key,
    required this.title,
    required this.location,
    required this.description,
    required this.imageAsset,
    required this.likes,
    required this.comments,
    required this.timeAgo,
    required this.onLikePressed,
    this.isLiked = false,
    this.isLiking = false,
    this.showProgress = false,
    this.progress = 0.0,
    this.onDonate,
  }) : assert(
          !showProgress || (progress >= 0.0 && progress <= 1.0),
          'Progress must be between 0.0 and 1.0',
        ),
        assert(
          title.isNotEmpty,
          'Title cannot be empty',
        ),
        assert(
          imageAsset.isNotEmpty,
          'Image asset cannot be empty',
        );

  @override
  Widget build(BuildContext context) {
    // TODO: Implement build method
    throw UnimplementedError();
  }
}