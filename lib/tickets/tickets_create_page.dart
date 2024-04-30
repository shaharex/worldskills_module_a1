import 'package:flutter/material.dart';

class TicketsCreatePage extends StatefulWidget {
  const TicketsCreatePage({super.key});

  @override
  State<TicketsCreatePage> createState() => _TicketsCreatePageState();
}

class _TicketsCreatePageState extends State<TicketsCreatePage> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextEditingController controllerName = TextEditingController();
    TextEditingController controllerType = TextEditingController();
    String? selectedCeremony;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ticket Create'),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            children: [
              DropdownButtonFormField(
                onChanged: (String? newValue) {
                  setState(() {
                    selectedCeremony = newValue;
                    print('this is a $selectedCeremony');
                    print(selectedCeremony);
                  });
                },
                hint: Text('Select ceremony'),
                value: selectedCeremony,
                items: ['Opening Ceremony', 'Closing Ceremony']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem(value: value, child: Text(value));
                }).toList(),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  isDense: true,
                  contentPadding: EdgeInsets.all(10),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: controllerName,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Input your name',
                  isDense: true,
                  contentPadding: EdgeInsets.all(10),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 315,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    alignment: Alignment.centerLeft,
                    backgroundColor: const Color.fromARGB(238, 232, 245, 255),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: const BorderSide(
                          color: Colors.black,
                          width: 0.5,
                          style: BorderStyle.solid),
                    ),
                  ),
                  child: const Text(
                    'Choose one picture',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.center,
                height: 200,
                width: 315,
                color: const Color.fromARGB(255, 230, 230, 230),
                child: const Text(
                  'Preview Picture',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              SizedBox(
                width: 300,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, [
                      controllerName.text,
                      selectedCeremony,
                    ]);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 253, 250, 219),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: const BorderSide(
                        color: Colors.black,
                        width: 0.5,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                  child: const Text(
                    'Create',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
