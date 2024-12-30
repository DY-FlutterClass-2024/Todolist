import 'package:flutter/material.dart';
import 'package:flutter_application_1/today_goal_list.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:timer_builder/timer_builder.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  List<Map<String, dynamic>> goals = [];

  void addGoal(Map<String, dynamic> newGoal) {
    setState(() {
      goals.add(newGoal);
    });
  }

  void deleteGoal(Map<String, dynamic> goaltoDelete) {
    setState(() {
      goals.remove(goaltoDelete);
    });
  }

  void successGoal(Map<String, dynamic> goalToSuccess) {
    final int goalIndex = goals.indexOf(goalToSuccess);
    setState(() {
      goals[goalIndex]['isDone'] = !goals[goalIndex]['isDone'];
    });
  }

  @override
  Widget build(BuildContext context) {
    final goalLength = goals.length;
    final int goalSucces = goals.fold(0, (total, goal) {
      if (goal['isDone'] == true) {
        return total + 1;
      }
      return total;
    });

    final percent = goalLength > 0 ? goalSucces / goalLength : 0.0;

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
                            DateFormat('MM / d').format(now),
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
                child: CircularPercentIndicator(
                  animation: true,
                  lineWidth: 18,
                  radius: 70.0,
                  percent: percent,
                  center: Text(
                    (percent * 100).toStringAsFixed(1),
                    style: const TextStyle(
                        fontSize: 28, fontFamily: 'PretendardSemiBold'),
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: const Color(0xffFF6B00),
                  backgroundColor: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 58),
          Expanded(
            child: TodayGoalList(
              goals: goals,
              addGoal: addGoal,
              deleteGoal: deleteGoal,
              successGoal: successGoal,
            ),
          ),
        ],
      ),
    );
  }
}
