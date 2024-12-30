import 'package:flutter/material.dart';
import 'package:flutter_application_1/add_goal_dialog.dart';
import 'package:flutter_application_1/learnmore_page.dart';
import 'package:flutter_application_1/todo_list_page.dart';

class TodayGoalList extends StatefulWidget {
  const TodayGoalList({
    super.key,
    required this.goals,
    required this.addGoal,
    required this.deleteGoal,
    required this.successGoal,
  });

  final List<Map<String, dynamic>> goals;
  final void Function(Map<String, dynamic> newGoal) addGoal;
  final void Function(Map<String, dynamic> goalToDelete) deleteGoal;
  final void Function(Map<String, dynamic> goalToSuccess) successGoal;

  @override
  State<TodayGoalList> createState() => _TodayGoalListState();
}

class _TodayGoalListState extends State<TodayGoalList> {
  Widget buildGoalContainer(Map<String, dynamic> goal) {
    return GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) => TodoListLearnmorePage(
                    goal: goal,
                    onDelete: () => widget.deleteGoal(goal),
                    onSuccess: () => widget.successGoal(goal),
                  ));
        },
        child: Container(
          height: 165,
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 25),
          padding: const EdgeInsets.fromLTRB(25, 20, 25, 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5,
                spreadRadius: 0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                goal['title'] ?? '제목 없음',
                style: const TextStyle(
                  fontFamily: 'PretendardBold',
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                goal['detail'] ?? '',
                style: const TextStyle(
                  fontFamily: 'PretendardRegular',
                  fontSize: 12,
                  color: Color(0xff5a5a5a),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                '기한',
                style: TextStyle(
                  fontFamily: 'PretendardRegular',
                  fontSize: 14,
                ),
              ),
              Text(
                '${goal['startDate'] ?? '----. --. --.'}'
                '  ~  '
                '${goal['endDate'] ?? '----. --. --.'}',
                style: const TextStyle(
                    fontFamily: 'PretendardMedium', fontSize: 18),
              ),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(40, 0, 0, 0),
          child: const Row(
            children: [
              Text(
                '오늘의 목표',
                style: TextStyle(
                  fontFamily: 'PretendardBold',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 13),
        Expanded(
          child: Stack(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xffFFD494),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(41),
                    topRight: Radius.circular(41),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  width: double.infinity,
                  height: 94,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 10,
                        spreadRadius: 0,
                        offset: Offset(0, 4),
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        right: 25,
                        top: 25,
                        bottom: 25,
                        child: SizedBox(
                          width: 70,
                          height: 44,
                          child: FilledButton(
                            onPressed: () async {
                              final result = await showDialog(
                                context: context,
                                builder: (context) => const AddGoalDialog(),
                              );

                              if (result != null) {
                                widget.addGoal(result);
                              }
                            },
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(
                                const Color(0xffFF8A00),
                              ),
                              shape: WidgetStateProperty.all(
                                const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(16),
                                  ),
                                ),
                              ),
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                bottom: 94,
                child: Container(
                  margin: const EdgeInsets.fromLTRB(25, 25, 25, 0),
                  child: ListView.builder(
                    itemCount: widget.goals.length,
                    itemBuilder: (context, index) {
                      final Map<String, dynamic> goal = widget.goals[index];
                      return buildGoalContainer(goal);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
