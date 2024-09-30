import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timer_builder/timer_builder.dart';

class Todolistpage extends StatelessWidget {
  const Todolistpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 160,
                  height: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: const Color(0xffFF8A00),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 10,
                        spreadRadius: 0,
                        offset: const Offset(0, 4),
                      )
                    ],
                  ),
                  margin: const EdgeInsets.fromLTRB(25, 80, 20, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TimerBuilder.periodic(const Duration(seconds: 1),
                          builder: (context) {
                        var now = DateTime.now();
                        return Column(
                          children: [
                            Text(
                              DateFormat('MMM / d').format(now),
                              style: const TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              DateFormat('h : mm').format(now),
                              style: const TextStyle(fontSize: 16),
                            ),
                            Text(
                              DateFormat('EEEE').format(now),
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        );
                      }),
                    ],
                  ),
                ),
                Container(
                  width: 160,
                  height: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: const Color.fromARGB(255, 255, 255, 255),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 10,
                        spreadRadius: 0,
                        offset: const Offset(0, 4),
                      )
                    ],
                  ),
                  margin: const EdgeInsets.fromLTRB(0, 80, 0, 0),
                ),
              ],
            ),
            const SizedBox(
              height: 58,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(25, 0, 0, 0),
              child: const Row(
                children: [
                  Text(
                    '오늘의 목표',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 22,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xffFFD494),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: const Column(),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          width: double.infinity,
          height: 94,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16), topRight: Radius.circular(16)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 10,
                  spreadRadius: 0,
                  offset: const Offset(0, -4),
                )
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 100,
                height: 54,
                child: Row(
                  children: [
                    FilledButton(
                      onPressed: null,
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          padding: const EdgeInsets.fromLTRB(22, 10, 22, 10)),
                      child: const Icon(Icons.add),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

void main() => runApp(const MaterialApp(home: Todolistpage()));
