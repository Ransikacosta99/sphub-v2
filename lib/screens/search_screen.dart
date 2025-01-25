import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;

  final List<Map<String, String>> sportCategories = [
    {'name': 'Football', 'icon': 'assets/sports_icons/football.svg'},
    {'name': 'Cricket', 'icon': 'assets/sports_icons/cricket.svg'},
    {'name': 'Basketball', 'icon': 'assets/sports_icons/basketball.svg'},
    {'name': 'Tennis', 'icon': 'assets/sports_icons/tennis.svg'},
  ];

  final List<Map<String, String>> searchResults = [
    {
      'name': 'City Central Ground',
      'location': 'Downtown',
      'image': 'assets/images/playground1.jpg',
      'sport': 'Football'
    },
    {
      'name': 'Riverside Sports Complex',
      'location': 'Riverside Area',
      'image': 'assets/images/playground2.jpg',
      'sport': 'Cricket'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search for playgrounds...',
            border: InputBorder.none,
          ),
          onChanged: (value) {
            setState(() {
              _isSearching = value.isNotEmpty;
            });
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Perform search
              setState(() {
                _isSearching = true;
              });
            },
          ),
        ],
      ),
      body: _isSearching ? _buildSearchResults() : _buildCategories(),
    );
  }

  Widget _buildCategories() {
    return GridView.builder(
      padding: EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: sportCategories.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              child: SvgPicture.asset(
                sportCategories[index]['icon']!,
                width: 50,
                height: 50,
              ),
            ),
            SizedBox(height: 8),
            Text(
              sportCategories[index]['name']!,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        );
      },
    );
  }

  Widget _buildSearchResults() {
    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        final playground = searchResults[index];
        return ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              playground['image']!,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(playground['name']!),
          subtitle: Text(
            '${playground['location']} • ${playground['sport']}',
          ),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () => context.push('/playground/${index + 1}'),
        );
      },
    );
  }
}
