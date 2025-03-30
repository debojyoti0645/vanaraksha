import 'package:flutter/material.dart';
import 'package:vanaraksha/screens/home_screen.dart';

class NearbyTab extends StatelessWidget {
  const NearbyTab({super.key, required ScrollController scrollController});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (context, index) {
        return const NearbyIncidentCard();
      },
    );
  }
}

class NearbyIncidentCard extends StatelessWidget {
  const NearbyIncidentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: PostCard(
        title: 'Forest Guard',
        location: '2 km away',
        description: 'Illegal logging activity reported. Rangers en route.',
        imageAsset: 'lib/assets/images/post.jpeg',
        likes: '56',
        comments: '23',
        timeAgo: '30 MINS AGO',
        showDistance: true,
      ),
    );
  }
}