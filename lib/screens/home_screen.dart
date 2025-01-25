import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  final categories = [
    {'name': 'Cricket', 'icon': 'assets/sports_icons/cricket.svg'},
    {'name': 'Football', 'icon': 'assets/sports_icons/football.svg'},
    {'name': 'Tennis', 'icon': 'assets/sports_icons/tennis.svg'},
    {'name': 'Basketball', 'icon': 'assets/sports_icons/basketball.svg'},
  ];

  final destinations = [
    {
      'name': 'CLC Playground',
      'location': 'Colombo',
      'price': '\$48',
      'image': 'assets/images/g1.jpg',
      'rating': '4.5',
    },
    {
      'name': 'CCC Stadium',
      'location': 'Havelock Town',
      'price': '\$65',
      'image': 'assets/images/g2.jpg',
      'rating': '5.0',
    },
    {
      'name': 'Moors ground',
      'location': 'Colombo 02',
      'price': '\$48',
      'image': 'assets/images/g3.jpg',
      'rating': '4.7',
    },
    {
      'name': 'Pearl ground',
      'location': 'Galle',
      'price': '\$34',
      'image': 'assets/images/g4.jpg',
      'rating': '3.3',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: SizedBox(
      //     width: 56, // Standard AppBar leading width
      //     height: 56, // Standard AppBar leading height
      //     child: Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Material(
      //         // Use Material for background and shape
      //         color: Colors.grey[200],
      //         borderRadius: BorderRadius.circular(10),
      //         child: Center(
      //           // Center the icon within the Material
      //           child: SvgPicture.asset(
      //             'assets/icons/menu.svg',
      //             height: 24, // Adjust SVG size as needed
      //             width: 24,
      //           ),
      //         ),
      //       ),
      //     ),
      //   ),
      //   actions: [
      //     Padding(
      //       padding: const EdgeInsets.all(8),
      //       child: CircleAvatar(
      //         backgroundImage: AssetImage('assets/images/avatar.png'),
      //       ),
      //     ),
      //   ],
      //   titleTextStyle: TextStyle(
      //     fontFamily: 'Urbanist',
      //     fontSize: 20,
      //     fontWeight: FontWeight.bold,
      //   ),
      // ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: SizedBox(
                                width: 45,
                                height: 45,
                                child: Material(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  borderRadius: BorderRadius.circular(10),
                                  child: InkWell(
                                    onTap: () {
                                      print('Icon tapped!');
                                    },
                                    child: Center(
                                      child: SvgPicture.asset(
                                        'assets/icons/menu.svg',
                                        height: 24,
                                        width: 24,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Text('Current Location',
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    size: 18,
                                    color: Colors.blue[500],
                                  ),
                                  SizedBox(width: 8),
                                  Text('Maradana road, Colombo',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 0.0),
                            child: InkWell(
                              onTap: () {
                                context.push('/profile');
                              },
                              child: CircleAvatar(
                                radius: 20,
                                backgroundImage:
                                    AssetImage('assets/images/avatar.png'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text('Categories',
                          style: Theme.of(context).textTheme.headlineSmall),
                    ),
                    SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: SizedBox(
                        height: 90,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          separatorBuilder: (_, __) => SizedBox(width: 16),
                          itemBuilder: (_, i) => Column(
                            children: [
                              Container(
                                width: 80, // Set the desired width
                                height: 80, // Set the desired height
                                decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  borderRadius: BorderRadius.circular(10),
                                  // boxShadow: [
                                  //   BoxShadow(
                                  //     color: Colors.grey.withOpacity(
                                  //         0.3), // Shadow color with opacity
                                  //     spreadRadius:
                                  //         2, // How much the shadow should spread
                                  //     blurRadius:
                                  //         5, // How blurry the shadow should be
                                  //     offset: const Offset(
                                  //         0, 3), // Offset in x and y directions
                                  //   ),
                                  // ],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment
                                      .center, // Center content vertically
                                  children: [
                                    SvgPicture.asset(
                                      categories[i]['icon']!,
                                      width: 40,
                                      height: 40,
                                      fit: BoxFit.contain,
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      categories[i]['name']!,
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text('For You',
                          style: Theme.of(context).textTheme.headlineSmall),
                    ),
                    SizedBox(height: 16),
                    SizedBox(
                      height: 220, // Adjust height as needed
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: destinations.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 16),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16), // Add horizontal padding
                        itemBuilder: (context, index) {
                          final destination = destinations[index];
                          return Container(
                            width: 250, // Adjust width as needed
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.asset(
                                    destination['image']!,
                                    height:
                                        160, // Adjust image height as needed
                                    width: double.infinity,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            destination['name']!,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium!
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.bold),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.location_on,
                                                size: 14,
                                                color: Colors.blue[500],
                                              ),
                                              const SizedBox(width: 4),
                                              Text(
                                                destination['location']!,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall!
                                                    .copyWith(
                                                      color: Colors.blue[
                                                          500], // Set the desired color here
                                                    ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            destination['price']!,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.bold),
                                          ),
                                          Text(
                                            "",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                      child: Text('Top this week',
                          style: Theme.of(context).textTheme.headlineSmall),
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: destinations.length,
                        separatorBuilder: (_, __) => SizedBox(height: 16),
                        itemBuilder: (_, i) => GestureDetector(
                          onTap: () => context.push('/playground/${i + 1}'),
                          child: Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset(
                                        destinations[i]['image']!,
                                        width: 120,
                                        height: 120,
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          destinations[i]['name']!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(
                                                  fontWeight: FontWeight.bold),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(height: 4),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.location_on,
                                              size: 14,
                                              color: Colors.blue[500],
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              destinations[i]['location']!,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall!
                                                  .copyWith(
                                                    color: Colors.blue[500],
                                                  ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 6),
                                        Text(
                                          "A Beautiful destination to visit with your team an have an amazing time. Enjoy exclusive offers...",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                  fontSize: 12,
                                                  color: Colors.grey[500]),
                                        ),
                                        SizedBox(height: 12),
                                        Text(
                                          destinations[i]['price']!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                  fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // Set default selected index
        onTap: (index) {
          switch (index) {
            case 0:
              // Home - do nothing as we're already on home screen
              break;
            case 1:
              context.push('/search');
              break;
            case 2:
              // Favorites - you might want to add a favorites screen later
              break;
            case 3:
              context.push('/profile');
              break;
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
