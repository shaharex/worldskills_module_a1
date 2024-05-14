import 'package:flutter/material.dart';
import 'package:flutter_application_2/tickets/tickets_details_page.dart';

import 'tickets_create_page.dart';

class TicketsPage extends StatefulWidget {
  const TicketsPage({super.key});

  @override
  State<TicketsPage> createState() => _TicketsPageState();
}

class _TicketsPageState extends State<TicketsPage> {
  final List<String> namesClosing = [
    'Jack',
    'Rose',
  ];

  final List<String> namesOpening = [
    'Jack',
    'Rose',
  ];

  List<String> ceremonyTypes = ['Opening', 'Closing'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                child: ElevatedButton(
                  onPressed: () async {
                    final newItem = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TicketsCreatePage()),
                    );
                    if (newItem is List) {
                      String name = newItem[0];

                      String type = newItem[1];

                      // Check the type and add the name to the corresponding list
                      if (type == 'Opening Ceremony') {
                        setState(() {
                          namesOpening.add(name);
                        });
                      } else if (type == 'Closing Ceremony') {
                        setState(() {
                          namesClosing.add(name);
                        });
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 253, 250, 219),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: const BorderSide(
                          color: Colors.black,
                          width: 0.5,
                          style: BorderStyle.solid),
                    ),
                  ),
                  child: const Text(
                    'Create a new ticket',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                children: [
                  // Opening Ceremony
                  Text(
                    '${ceremonyTypes[0]} Ceremony Tickets',
                    style: const TextStyle(fontSize: 20),
                  ),

                  // list of opening ceremony participants
                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: namesOpening.length,
                    itemBuilder: (context, int index) {
                      return Dismissible(
                        key: Key(namesOpening[index]),
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TicketDetailsPage(
                                        ceremonyType: ceremonyTypes[index],
                                        name: namesOpening[index],
                                        picture: 'no data',
                                      )),
                            );
                          },
                          title: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              namesOpening[index],
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                          tileColor: const Color.fromARGB(255, 230, 230, 230),
                          contentPadding: const EdgeInsets.only(
                              left: 3, top: 1, bottom: 1, right: 3),
                          subtitle: const Align(
                            alignment: Alignment.bottomRight,
                            child: Text('A6 Row7 Column9'),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, int index) {
                      return const SizedBox(
                        height: 5,
                      );
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  // closing ceremony
                  Text(
                    '${ceremonyTypes[1]} Ceremony Tickets',
                    style: const TextStyle(fontSize: 20),
                  ),

                  // list of closing ceremony participants
                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: namesClosing.length,
                    itemBuilder: (context, int index) {
                      return Dismissible(
                        onDismissed: (direction) {
                          namesClosing.remove(namesClosing[index]);
                        },
                        key: Key(namesClosing[index]),
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TicketDetailsPage(
                                        ceremonyType: ceremonyTypes[index],
                                        name: namesClosing[index],
                                        picture: 'no data',
                                      )),
                            );
                          },
                          title: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              namesClosing[index],
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                          tileColor: const Color.fromARGB(255, 230, 230, 230),
                          contentPadding: const EdgeInsets.only(
                              left: 3, top: 1, bottom: 1, right: 3),
                          subtitle: const Align(
                            alignment: Alignment.bottomRight,
                            child: Text('A6 Row7 Column9'),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, int index) {
                      return const SizedBox(
                        height: 5,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
