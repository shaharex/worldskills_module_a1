import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/events/events_details_page.dart';
import 'events.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({Key? key}) : super(key: key);

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  late Future<List<Events>> eventsFuture;
  String selectedFilter = 'All';

  @override
  void initState() {
    super.initState();
    eventsFuture = getEvents();
  }

  Future<List<Events>> getEvents() async {
    final assetBundle = DefaultAssetBundle.of(context);
    final data =
        await assetBundle.loadString("events_resources/json/events_data.json");

    final List<dynamic> body = jsonDecode(data);
    return body.map<Events>((dynamic item) => Events.fromJson(item)).toList();
  }

  List<Events> getFilteredEvents(List<Events> events) {
    if (selectedFilter == 'All') {
      return events;
    } else if (selectedFilter == 'Unread') {
      return events.where((event) => !event.eventReadStatus).toList();
    } else if (selectedFilter == 'Read') {
      return events.where((event) => event.eventReadStatus).toList();
    }
    return events;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    selectedFilter = 'All';
                  });
                },
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                      return selectedFilter == 'All'
                          ? Colors.black
                          : const Color.fromARGB(255, 150, 150, 150);
                    },
                  ),
                ),
                child: const Text('All'),
              ),
              const Text(
                '/',
                style: TextStyle(fontSize: 20),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    selectedFilter = 'Unread';
                  });
                },
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                      return selectedFilter == 'Unread'
                          ? Colors.black
                          : const Color.fromARGB(255, 150, 150, 150);
                    },
                  ),
                ),
                child: const Text('Unread'),
              ),
              const Text(
                '/',
                style: TextStyle(fontSize: 20),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    selectedFilter = 'Read';
                  });
                },
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                      return selectedFilter == 'Read'
                          ? Colors.black
                          : const Color.fromARGB(255, 150, 150, 150);
                    },
                  ),
                ),
                child: const Text('Read'),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          FutureBuilder<List<Events>>(
            future: eventsFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData) {
                final events = snapshot.data!;
                return buildEventsList(getFilteredEvents(events));
              } else {
                return const Text('No data');
              }
            },
          ),
        ],
      ),
    );
  }

  Widget buildEventsList(List<Events> events) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: events.length,
      itemBuilder: (BuildContext context, int index) {
        final event = events[index];
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => EventsDetails(
                  title: event.eventTitle,
                  description: event.eventText,
                  images: event.eventPictures,
                ),
              ),
            );
          },
          child: SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 110,
                  width: 150,
                  child: ClipRRect(
                    child: Image.asset(
                      'events_resources/images/${event.eventPictures[0]}',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 170,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 226, 226, 226),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Text(
                          event.eventTitle,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                      const SizedBox(height: 3),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 226, 226, 226),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Text(
                          event.eventText,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                      SizedBox(
                        child: Text(
                          event.eventReadStatus ? 'Read' : 'Unread',
                          style: const TextStyle(fontSize: 18),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) =>
          const SizedBox(height: 10),
    );
  }
}
