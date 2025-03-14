import 'package:bikex/components/order%20tracking/track_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart'; // For LatLng coordinates

class TrackOrderPage extends StatelessWidget {
  
  const TrackOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Coordinates for the map center (example: San Francisco)
    final LatLng mapCenter = LatLng(37.7749, -122.4194);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Track Order'),
        backgroundColor: Colors.transparent,
        elevation: 0, // Remove app bar shadow
      ),
      body: Stack(
        children: [
          // Map
          FlutterMap(
            options: MapOptions(
              initialCenter: mapCenter,
              minZoom: 1, // Center of the map
              maxZoom: 13.0, // Zoom level
            ),
            children: [
              TileLayer(
                urlTemplate:
                    'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                subdomains: ['a', 'b', 'c'], // Subdomains for the tile server
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: mapCenter, // Marker position
                    child: Icon(
                      Icons.location_pin,
                      color: Colors.red,
                      size: 40,
                    ),
                  ),
                ],
              ),
            ],
          ),

          // Draggable Bottom Sheet
          DraggableScrollableSheet(
            initialChildSize:
                0.15, // Initial size of the bottom sheet (30% of the screen)
            minChildSize:
                0.15, // Minimum size of the bottom sheet (20% of the screen)
            maxChildSize:
                0.6, // Maximum size of the bottom sheet (70% of the screen)
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    controller: scrollController, // Enables smooth scrolling
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Drag Indicator
                          Center(
                            child: Container(
                              width: 50,
                              height: 5,
                              decoration: BoxDecoration(
                                color: Colors.grey[400],
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),

                          // Restaurant Info
                          Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Uttora Coffee House",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Ordered At: 06 Sept, 10:00pm",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10),

                          // Order Details
                          Text(
                            "2x Burger\n4x Sandwich",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 15),

                          // Estimated Delivery Time
                          Center(
                            child: Column(
                              children: [
                                Text(
                                  "20 min",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                Text(
                                  "ESTIMATED DELIVERY TIME",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 15),

                          // Order Tracking Stepper
                          OrderTrackingStepper(),
                          SizedBox(height: 60),

                          // Courier Info
                          Divider(),
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.grey[300],
                                radius: 24,
                                child:
                                    Icon(Icons.person, color: Colors.grey[700]),
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Robert F.",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Courier",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey),
                                  ),
                                ],
                              ),
                              Spacer(),
                              IconButton(
                                icon: Icon(Icons.phone, color: Colors.orange),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: Icon(Icons.message, color: Colors.orange),
                                onPressed: () {},
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ));
            },
          ),
        ],
      ),
    );
  }

  Widget buildStep(String title, bool isActive) {
    return Row(
      children: [
        Icon(
          isActive ? Icons.radio_button_checked : Icons.radio_button_unchecked,
          color: isActive ? Colors.orange : Colors.grey,
          size: 18,
        ),
        SizedBox(width: 8),
        Text(
          title,
          style: TextStyle(
              color: isActive ? Colors.orange : Colors.grey, fontSize: 14),
        ),
      ],
    );
  }
}
