import 'package:flutter/material.dart';
import 'package:vanaraksha/model/post_card.dart';

class CommunityTab extends StatelessWidget {
  const CommunityTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 8,
      itemBuilder: (context, index) {
        return const CommunityPostCard();
      },
    );
  }
}

class CommunityPostCard extends StatelessWidget {
  const CommunityPostCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: PostCard(
        title: 'Wildlife Enthusiast',
        location: 'Kolkata',
        description: 'Spotted a rare bird species in our local sanctuary!',
        imageAsset: 'lib/assets/images/post.jpeg',
        likes: '89',
        comments: '34',
        timeAgo: '5 HOURS AGO', onLikePressed: () {  },
      ),
    );
  }
}