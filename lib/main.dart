import 'dart:math';
import 'package:events/screens/event_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const EventApp(),
  );
}

class EventApp extends StatefulWidget {
  const EventApp({super.key});

  @override
  State<EventApp> createState() => _EventAppState();
}

class _EventAppState extends State<EventApp> {
  late ValueNotifier search = ValueNotifier<String>('');
  Color color = Colors.red;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    debugPrint("Render EventApp Builder");
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: color,
          title: const Text('Events'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    color = Colors
                        .primaries[Random().nextInt(Colors.primaries.length)];
                  });
                },
                icon: const Icon(
                  Icons.color_lens,
                  key: Key('icon'),
                ))
          ],
        ),
        body: ValueListenableBuilder(
            valueListenable: search,
            builder: (context, search, child) {
              return EventList(search: search);
            }),
        bottomSheet: Container(
          color: color.withOpacity(0.1),
          child: AnimatedBuilder(
              animation: controller,
              builder: (context, child) => Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextField(
                      key: const Key('search'),
                      onChanged: (value) {
                        setState(() {
                          search.value = value;
                        });
                      },
                      controller: controller,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                search.value = controller.text;
                              });
                            },
                            icon: const Icon(Icons.filter_list_outlined)),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                    ),
                  )),
        ),
      ),
    );
  }
}
