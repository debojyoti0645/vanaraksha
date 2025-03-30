import 'package:flutter/material.dart';
import 'tabs/incidents_tab.dart';
import 'tabs/fundraisers_tab.dart';
import 'tabs/community_tab.dart';
import 'tabs/nearby_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: theme.appBarTheme.backgroundColor,
          leading: Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: theme.primaryColor, width: 2),
            ),
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Icon(Icons.eco, color: theme.primaryColor),
            ),
          ),
          title: Text('VanaRaksha', style: theme.appBarTheme.titleTextStyle),
          actions: [
            IconButton(
              icon: Icon(Icons.person, color: theme.primaryColor),
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),
          ],
          bottom: TabBar(
            indicatorColor: theme.primaryColor,
            labelColor: theme.primaryColor,
            unselectedLabelColor: theme.tabBarTheme.unselectedLabelColor,
            labelStyle: theme.tabBarTheme.labelStyle,
            unselectedLabelStyle: theme.tabBarTheme.unselectedLabelStyle,
            tabs: const [
              Tab(text: 'Incidents'),
              Tab(text: 'Fundraisers'),
              Tab(text: 'Community'),
              Tab(text: 'Nearby'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            IncidentsTab(scrollController: _scrollController),
            FundraisersTab(scrollController: _scrollController),
            const CommunityTab(),
            NearbyTab(scrollController: _scrollController),
          ],
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: theme.brightness == Brightness.dark 
                      ? Colors.white.withOpacity(0.2)
                      : Colors.black.withOpacity(0.1),
                  width: 1.5,
                ),
              ),
              child: FloatingActionButton(
                heroTag: 'carbon_footprint',
                onPressed: () {
                  Navigator.pushNamed(context, '/carbon-footprint');
                },
                backgroundColor: theme.primaryColor,
                elevation: 4,
                shape: const CircleBorder(),
                child: const Icon(Icons.eco, color: Colors.white),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: theme.brightness == Brightness.dark 
                      ? Colors.white.withOpacity(0.2)
                      : Colors.black.withOpacity(0.1),
                  width: 1.5,
                ),
              ),
              child: FloatingActionButton(
                heroTag: 'create_post',
                onPressed: () {
                  Navigator.pushNamed(context, '/create-post');
                },
                backgroundColor: theme.primaryColor,
                elevation: 4,
                shape: const CircleBorder(),
                child: const Icon(Icons.add, color: Colors.white),
              ),
            ),
          ],
        ),
        ),
      
    );
  }
}

class IncidentPostCard extends StatelessWidget {
  const IncidentPostCard({super.key});

  @override
  Widget build(BuildContext context) {
    return PostCard(
      title: 'Forest Ranger John',
      location: 'Dhakuria',
      description:
          'Rescued a beautiful Tiger named "Sundari". Immediate action taken. Area secured.',
      imageAsset: 'lib/assets/images/post.jpeg',
      likes: '123',
      comments: '28',
      timeAgo: '2 HOURS AGO',
    );
  }
}

class FundraiserCard extends StatelessWidget {
  const FundraiserCard({super.key});

  @override
  Widget build(BuildContext context) {
    return PostCard(
      title: 'Wildlife Conservation Fund',
      location: 'Sundarbans',
      description: 'Help us protect endangered species. Target: ₹1,00,000',
      imageAsset: 'lib/assets/images/fundraiser.jpeg',
      likes: '45',
      comments: '12',
      timeAgo: '1 DAY AGO',
      showProgress: true,
      progress: 0.6,
      onDonate: () {},
    );
  }
}

class NearbyIncidentCard extends StatelessWidget {
  const NearbyIncidentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return PostCard(
      title: 'Forest Guard',
      location: '2 km away',
      description: 'Illegal logging activity reported. Rangers en route.',
      imageAsset: 'lib/assets/images/nearby.jpeg',
      likes: '56',
      comments: '23',
      timeAgo: '30 MINS AGO',
      showDistance: true,
    );
  }
}

class PostCard extends StatelessWidget {
  final String title;
  final String location;
  final String description;
  final String imageAsset;
  final String likes;
  final String comments;
  final String timeAgo;
  final bool showProgress;
  final double? progress;
  final VoidCallback? onDonate;
  final bool showDistance;

  const PostCard({
    super.key,
    required this.title,
    required this.location,
    required this.description,
    required this.imageAsset,
    required this.likes,
    required this.comments,
    required this.timeAgo,
    this.showProgress = false,
    this.progress,
    this.onDonate,
    this.showDistance = false,
  });

  Widget _buildActionButton(IconData icon, String count) {
    return Row(
      children: [
        IconButton(icon: Icon(icon, color: Colors.green), onPressed: () {}),
        Text(
          count,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: const EdgeInsets.all(12),
            leading: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.green, width: 2),
              ),
              child: const CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(Icons.person, color: Colors.white),
              ),
            ),
            title: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Text(
              location,
              style: const TextStyle(color: Colors.grey),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.more_vert, color: Colors.green),
              onPressed: () {},
            ),
          ),
          SizedBox(
            height: 250,
            child: Image.asset(imageAsset, fit: BoxFit.cover),
          ),
          if (showProgress) ...[
            Padding(
              padding: const EdgeInsets.all(12),
              child: LinearProgressIndicator(
                value: progress,
                backgroundColor: Colors.grey[200],
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: onDonate,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text('Donate Now'),
              ),
            ),
          ],
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                _buildActionButton(Icons.favorite_border, likes),
                const SizedBox(width: 16),
                _buildActionButton(Icons.comment_outlined, comments),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.bookmark_border, color: Colors.green),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(description, style: const TextStyle(fontSize: 14)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: Text(
              timeAgo,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
