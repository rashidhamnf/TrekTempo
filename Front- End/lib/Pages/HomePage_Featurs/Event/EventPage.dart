import 'package:travel_app/Pages/HomePage_Featurs/Event/AddEvent.dart' as AddEventPage ;
import 'package:travel_app/Pages/HomePage_Featurs/Event/EventDetails.dart';
import 'package:travel_app/Pages/HomePage_Featurs/Event/Components/Support.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/Pages/HomePage_Featurs/MainHomePage.dart'; // Import MainHomePage

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _HomeState();
}

class _HomeState extends State<EventPage> {
  List<Event> events = [
    Event(
      image: "assets/images/Events/csf_cover.png",
      title: "COLOMBO SHOPPING FESTIVAL - CSF",
      dateTime: "Dec - 2024 , 05 06 & 07\n10:00 a.m - 10:00 p.m | at BMICH",
      isBookmarked: false,
    ),
    Event(
      image: "assets/images/Events/laksapana.jpeg",
      title: "Lakshapana waterfall abseiling",
      dateTime: "Dec - 2024 , 05 06 & 07\n10:00 a.m - 10:00 p.m | at BMICH",
      isBookmarked: false,
    ),
    Event(
      image: "assets/images/Events/motor.jpeg",
      title: "Colombo Motor Show 2024",
      dateTime: "Dec - 2024 , 05 06 & 07\n10:00 a.m - 10:00 p.m | at BMICH",
      isBookmarked: false,
    ),
   Event(
      image: "assets/images/Events/csf_cover.png",
      title: "COLOMBO SHOPPING FESTIVAL - CSF",
      dateTime: "Dec - 2024 , 05 06 & 07\n10:00 a.m - 10:00 p.m | at BMICH",
      isBookmarked: false,
    ),
    Event(
      image: "assets/images/Events/laksapana.jpeg",
      title: "Lakshapana waterfall abseiling",
      dateTime: "Dec - 2024 , 05 06 & 07\n10:00 a.m - 10:00 p.m | at BMICH",
      isBookmarked: false,
    ), // ... (other events)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context); // Navigate back when tapped
                    },
                    child: Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 198, 177, 177),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(Icons.arrow_back, color: Colors.black),
                    ),
                  ),
                  Text(
                    "Events",
                    style: AppWidget.boldTextFieldStyle(),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddEventPage.AddEvent()),
                      );
                    },
                    color: Color.fromARGB(255, 198, 177, 177), // Set icon color
                    padding: const EdgeInsets.all(3),
                    constraints: BoxConstraints(), // Remove default constraints
                  ),
                ],
              ),
              const SizedBox(height: 18.0),
              showItem(),
            ],
          ),
        ),
      ),
    );
  }

  Widget showItem() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: events.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            eventCard(
              events[index].image,
              events[index].title,
              events[index].dateTime,
              events[index].isBookmarked,
              () {
                // Handle event tap (navigate to details or perform other actions)
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Details()),
                );
              },
              () {
                // Toggle bookmark state for the clicked event
                setState(() {
                  events[index].isBookmarked = !events[index].isBookmarked;
                });
              },
            ),
            const SizedBox(height: 30.0),
          ],
        );
      },
    );
  }

  Widget eventCard(
    String image,
    String title,
    String dateTime,
    bool isBookmarked,
    VoidCallback onTap,
    VoidCallback onBookmarkTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(image, height: 100, width: 300, fit: BoxFit.cover),
              Text(title, style: AppWidget.semiBooldTextFieldStyle()),
              Row(
                children: [
                  Text(dateTime, style: AppWidget.LightTextFeildStyle()),
                  const Spacer(),
                  GestureDetector(
                    onTap: onBookmarkTap,
                    child: Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: isBookmarked
                            ? Color.fromARGB(255, 43, 253, 155)
                            : Color.fromARGB(255, 253, 254, 253),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        isBookmarked ? Icons.bookmark : Icons.bookmark_outline,
                        color: Color.fromARGB(255, 227, 146, 34),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Event model to store event data
class Event {
  final String image;
  final String title;
  final String dateTime;
  bool isBookmarked;

  Event({
    required this.image,
    required this.title,
    required this.dateTime,
    this.isBookmarked = false,
  });
}