import 'package:flutter/material.dart';

class TodoListLearnmorePage extends StatefulWidget {
  final Map<String, dynamic> goal;
  final VoidCallback onDelete;
  final VoidCallback onSuccess;

  const TodoListLearnmorePage({
    super.key,
    required this.goal,
    required this.onDelete,
    required this.onSuccess,
  });

  @override
  _TodoListLearnmorePageState createState() => _TodoListLearnmorePageState();
}

class _TodoListLearnmorePageState extends State<TodoListLearnmorePage> {
  bool isGoalSuccess = false;

  void successGoal(Map<String, dynamic> goalSuccess) {
    setState(() {
      isGoalSuccess = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withOpacity(0.15),
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(25, 172, 25, 172),
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(25, 43, 25, 10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 30,
                              height: 30,
                              child: IconButton.filled(
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(
                                  minWidth: 24,
                                  minHeight: 24,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: ButtonStyle(
                                  backgroundColor: WidgetStateProperty.all(
                                    const Color.fromARGB(255, 255, 255, 255),
                                  ),
                                ),
                                icon: const Icon(
                                  Icons.chevron_left,
                                  color: Colors.black,
                                  size: 30,
                                ),
                              ),
                            ),
                            Text(
                              widget.goal['title'] ?? '제목 없음',
                              style: const TextStyle(
                                fontFamily: 'PretendardBold',
                                fontSize: 24,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Text(
                          widget.goal['detail'] ?? '',
                          style: const TextStyle(
                            fontFamily: 'PretendardRegular',
                            fontSize: 18,
                            color: Color(0xff5a5a5a),
                          ),
                        ),
                        const SizedBox(height: 45),
                        const Text(
                          '기한',
                          style: TextStyle(
                            fontFamily: 'PretendardRegular',
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          '${widget.goal['startDate'] ?? '----. --. --.'}'
                          '  ~  '
                          '${widget.goal['endDate'] ?? '----. --. --.'}',
                          style: const TextStyle(
                              fontFamily: 'PretendardMedium', fontSize: 24),
                        ),
                        const SizedBox(
                          height: 70,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 110,
                              height: 48.4,
                              child: OutlinedButton(
                                onPressed: () {
                                  widget.onDelete();
                                  Navigator.pop(context);
                                },
                                style: OutlinedButton.styleFrom(
                                  side: const BorderSide(
                                      color: Color(0xffFF8A00),
                                      width: 1.0,
                                      style: BorderStyle.solid),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(16),
                                    ),
                                  ),
                                ),
                                child: const Text(
                                  '삭제하기',
                                  style: TextStyle(
                                      fontFamily: 'PretendardSemiBold',
                                      fontSize: 16,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            SizedBox(
                              width: 110,
                              height: 48.4,
                              child: FilledButton(
                                onPressed: () {
                                  successGoal(widget.goal);
                                  widget.onSuccess();
                                },
                                style: FilledButton.styleFrom(
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(16),
                                      ),
                                    ),
                                    backgroundColor: const Color(0xffFF8A00)),
                                child: const Text(
                                  '목표 달성',
                                  style: TextStyle(
                                      fontFamily: 'PretendardSemiBold',
                                      fontSize: 16,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                          ],
                        )
                      ]),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
