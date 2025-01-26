import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PlaygroundDetailsScreen extends StatelessWidget {
  final String playgroundId;

  const PlaygroundDetailsScreen({Key? key, required this.playgroundId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              // title: Text('Rinjani Mountain'),
              background: Image.asset(
                'assets/images/g1.jpg',
                height: MediaQuery.of(context).size.height * 0.45,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 201, 17, 17),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0), // Adjust as needed
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'CLC Basketball Court',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      SizedBox(height: 8),
                      Text(
                        'The mighty Rinjani mountain of Gunung Rinjani is a popular destination for hikers and trekkers. A climb to the top is one of the most exhilarating experiences you can have in Indonesia. At 3,726 meters, Gunung Rinjani is the second highest mountain in Indonesia.',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Available Courts',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      SizedBox(height: 8),
                      _buildCourtsList(context),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () => context.push('/booking/$playgroundId'),
          child: Text('Book Now'),
        ),
      ),
    );
  }

  Widget _buildCourtsList(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            title: Text('Court ${index + 1}'),
            subtitle: Text('Football Court'),
            trailing: Text(
              'Available',
              style: TextStyle(color: Colors.green),
            ),
          ),
        );
      },
    );
  }
}
