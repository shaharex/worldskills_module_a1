// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class EventsDetails extends StatelessWidget {
  // ignore: use_super_parameters
  const EventsDetails({
    Key? key,
    required this.title,
    required this.description,
    required this.images,
  }) : super(key: key);

  final String title;
  final String description;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Events Details'),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 50,
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 226, 226, 226),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  textAlign: TextAlign.center,
                  title,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              const Text(
                '2',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 25.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Center(
                              child: Material(
                                color: Colors.transparent,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () => Navigator.pop(context),
                                      child: Container(
                                        color: Colors.black.withOpacity(0.7),
                                      ),
                                    ),
                                    InteractiveViewer(
                                        child: SizedBox(
                                      width: 333,
                                      height: 333,
                                      child: ClipRRect(
                                        child: Image.asset(
                                          'events_resources/images/${images[0]}',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    )),
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    child: SizedBox(
                      width: 110,
                      height: 110,
                      child: ClipRRect(
                        child: Image.asset(
                          'events_resources/images/${images[0]}',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Center(
                              child: Material(
                                color: Colors.transparent,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () => Navigator.pop(context),
                                      child: Container(
                                        color: Colors.black.withOpacity(0.7),
                                      ),
                                    ),
                                    InteractiveViewer(
                                        child: SizedBox(
                                      width: 333,
                                      height: 333,
                                      child: ClipRRect(
                                        child: Image.asset(
                                          'events_resources/images/${images[1]}',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    )),
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    child: SizedBox(
                      width: 110,
                      height: 110,
                      child: ClipRRect(
                        child: Image.asset(
                          'events_resources/images/${images[1]}',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Center(
                              child: Material(
                                color: Colors.transparent,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () => Navigator.pop(context),
                                      child: Container(
                                        color: Colors.black.withOpacity(0.6),
                                      ),
                                    ),
                                    InteractiveViewer(
                                        child: SizedBox(
                                      width: 333,
                                      height: 333,
                                      child: ClipRRect(
                                        child: Image.asset(
                                          'events_resources/images/${images[2]}',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    )),
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    child: SizedBox(
                      width: 110,
                      height: 110,
                      child: ClipRRect(
                        child: Image.asset(
                          'events_resources/images/${images[2]}',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 300,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 3),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 226, 226, 226),
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: Text(
                        description,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
