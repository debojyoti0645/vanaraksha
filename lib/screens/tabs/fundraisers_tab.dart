import 'package:flutter/material.dart';
import 'package:vanaraksha/screens/home_screen.dart';

class FundraisersTab extends StatelessWidget {
  const FundraisersTab({super.key, required ScrollController scrollController});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return const FundraiserCard();
      },
    );
  }
}

class FundraiserCard extends StatelessWidget {
  const FundraiserCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: PostCard(
        title: 'Wildlife Conservation Fund',
        location: 'Sundarbans',
        description: 'Help us protect endangered species. Target: ₹1,00,000',
        imageAsset: 'lib/assets/images/post.jpeg',
        likes: '45',
        comments: '12',
        timeAgo: '1 DAY AGO',
        showProgress: true,
        progress: 0.6,
        onDonate: () {},
      ),
    );
  }
}