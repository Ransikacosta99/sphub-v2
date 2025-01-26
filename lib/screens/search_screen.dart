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

  final List<Map<String, String>> categories = [
    {'name': 'Football', 'icon': 'assets/sports_icons/football.svg'},
    {'name': 'Cricket', 'icon': 'assets/sports_icons/cricket.svg'},
    {'name': 'Basketball', 'icon': 'assets/sports_icons/basketball.svg'},
    {'name': 'Tennis', 'icon': 'assets/sports_icons/tennis.svg'},
  ];

  final List<Map<String, String>> searchResults = [
    {
      'name': 'City Central Ground',
      'location': 'Colombo 07',
      'image': 'assets/images/g1.jpg',
      'sport': 'Football',
      'price': 'Rs. 5000',
    },
    {
      'name': 'Riverside Sports Complex',
      'location': 'Riverston',
      'image': 'assets/images/g2.jpg',
      'sport': 'Cricket',
      'price': 'Rs. 5000',
    },
    {
      'name': 'City Central Ground',
      'location': 'Colombo 07',
      'image': 'assets/images/g1.jpg',
      'sport': 'Football',
      'price': 'Rs. 5000',
    },
    {
      'name': 'Riverside Sports Complex',
      'location': 'Riverston',
      'image': 'assets/images/g2.jpg',
      'sport': 'Cricket',
      'price': 'Rs. 5000',
    },
    {
      'name': 'City Central Ground',
      'location': 'Colombo 07',
      'image': 'assets/images/g1.jpg',
      'sport': 'Football',
      'price': 'Rs. 5000',
    },
    {
      'name': 'Riverside Sports Complex',
      'location': 'Riverston',
      'image': 'assets/images/g2.jpg',
      'sport': 'Cricket',
      'price': 'Rs. 5000',
    },
    {
      'name': 'City Central Ground',
      'location': 'Colombo 07',
      'image': 'assets/images/g1.jpg',
      'sport': 'Football',
      'price': 'Rs. 5000',
    },
    {
      'name': 'Riverside Sports Complex',
      'location': 'Riverston',
      'image': 'assets/images/g2.jpg',
      'sport': 'Cricket',
      'price': 'Rs. 5000',
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
            filled: true, // Important for rounded corners to be visible
            // fillColor: Colors.grey[200], // Optional: Set a background color
            border: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(25.0), // Adjust radius as needed
              borderSide: BorderSide.none, // Removes border lines
            ),
            focusedBorder: OutlineInputBorder(
              // Optional: Style when focused
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              // Optional: Style when enabled
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide.none,
            ),
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
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Container(
              width: 120, // Set the desired width
              height: 120, // Set the desired height
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Center content vertically
                children: [
                  SvgPicture.asset(
                    categories[index]['icon']!,
                    width: 80,
                    height: 80,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    categories[index]['name']!,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
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
        return InkWell(
          child: Padding(
            padding: EdgeInsets.fromLTRB(8, 8, 8, 16),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    playground['image']!,
                    width: 450,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(playground['name']!,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(fontSize: 20)),
                          Text(playground['price']!,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(fontSize: 20)),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 20,
                            color: Colors.blue[500],
                          ),
                          SizedBox(width: 5),
                          Text(playground['location']!,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .copyWith(fontSize: 16)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          onTap: () => context.push('/playground/${index + 1}'),
        );
      },
    );
  }
}
