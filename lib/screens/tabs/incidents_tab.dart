import 'package:flutter/material.dart';
import 'package:vanaraksha/screens/home_screen.dart';

class IncidentsTab extends StatelessWidget {
  final ScrollController scrollController;

  const IncidentsTab({
    super.key,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      itemCount: 10,
      itemBuilder: (context, index) {
        return const IncidentPostCard();
      },
    );
  }
}

class IncidentPostCard extends StatelessWidget {
  const IncidentPostCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: PostCard(
        title: 'Forest Ranger John',
        location: 'Dhakuria',
        description: 'Rescued a beautiful Tiger named "Sundari". Immediate action taken. Area secured.',
        imageAsset: 'lib/assets/images/post.jpeg',
        likes: '123',
        comments: '28',
        timeAgo: '2 HOURS AGO',
      ),
    );
  }
}