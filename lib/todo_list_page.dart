import 'package:flutter/material.dart';
import 'package:flutter_application_1/today_goal_list.dart';
import 'package:intl/intl.dart';
import 'package:timer_builder/timer_builder.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    ),
                  ],
                ),
                margin: const EdgeInsets.fromLTRB(25, 80, 0, 0),
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
                              fontFamily: 'PretendardMedium',
                              fontSize: 36,
                            ),
                          ),
                          Text(
                            DateFormat('h : mm').format(now),
                            style: const TextStyle(
                                fontSize: 16, fontFamily: 'PretendardRegular'),
                          ),
                          Text(
                            DateFormat('EEEE').format(now),
                            style: const TextStyle(
                                fontSize: 16, fontFamily: 'PretendardRegular'),
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
                    ),
                  ],
                ),
                margin: const EdgeInsets.fromLTRB(0, 80, 25, 0),
              ),
            ],
          ),
          const SizedBox(height: 58),
          const Expanded(child: TodayGoalList()),
        ],
      ),
    );
  }
}

void main() => runApp(const MaterialApp(home: TodoListPage()));