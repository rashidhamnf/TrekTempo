//the card widget of the places in the district

import 'package:flutter/material.dart';
import 'place/showing_place_details.dart';

class PlacesCard extends StatelessWidget {
  final String city;
  final List<String> imagePaths;
  final String title;
  final String location;
  final String direction;
  final String description;
  final int likes;

  const PlacesCard({
    super.key,
    required this.city,
    required this.imagePaths,
    required this.title,
    required this.location,
    required this.direction,
    required this.description,
    required this.likes,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlaceDetailsPage(
              city: city,
              imagePaths: imagePaths,
              title: title,
              location: location,
              direction: direction,
              description: description,
              likes: likes,
            ),
          ),
        );
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.network(
                imagePaths[0],
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: 16.0, left: 16.0, bottom: 16.0, top: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Row for Title, Location, and Like Icon
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Title (remains fully visible)
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  color: Colors.red,
                                  size: 12,
                                ),
                                const SizedBox(width: 4),
                                // Location with ellipsis if too long
                                Expanded(
                                  child: Text(
                                    location,
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 12,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // Like Icon and Count
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 24,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '$likes', // Display number of likes
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Description with two lines only and ellipsis if too long
                  Text(
                    description,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 12,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
