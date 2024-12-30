import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddGoalDialog extends StatefulWidget {
  const AddGoalDialog({super.key});

  @override
  _AddGoalDialogState createState() => _AddGoalDialogState();
}

class _AddGoalDialogState extends State<AddGoalDialog> {
  final Color myColor = Colors.black.withOpacity(0.15);
  final DateTime now = DateTime.now();
  final todoListTitle = TextEditingController();
  final todoListDetail = TextEditingController();
  String? selectedEndDate;

  void selectEndDate(BuildContext context) async {
    final DateTime? endDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(1900),
      lastDate: DateTime(2099),
    );

    if (endDate != null) {
      setState(() {
        selectedEndDate = DateFormat("yyyy. MM. dd").format(endDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: myColor,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(10, 100, 10, 100),
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: Container(
              margin: const EdgeInsets.fromLTRB(25, 43, 25, 43),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('목표 추가하기',
                      style: TextStyle(
                          fontSize: 24, fontFamily: 'PretendardSemiBold')),
                  const SizedBox(height: 25),
                  const Text('목표',
                      style: TextStyle(
                          fontFamily: 'PretendardRegular', fontSize: 16)),
                  const SizedBox(height: 5),
                  SizedBox(
                    height: 40,
                    child: TextField(
                      controller: todoListTitle,
                      textAlignVertical: TextAlignVertical.center,
                      style: const TextStyle(
                        fontFamily: 'PretendardRegular',
                        fontSize: 14,
                      ),
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xffFF8A00),
                            width: 1,
                          ),
                        ),
                        contentPadding: EdgeInsets.fromLTRB(11, 12, 12, 0),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffFF8A00)),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  const Text('세부사항',
                      style: TextStyle(
                          fontFamily: 'PretendardRegular', fontSize: 16)),
                  const SizedBox(height: 5),
                  SizedBox(
                    height: 115,
                    child: TextField(
                      controller: todoListDetail,
                      maxLines: 5,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffFF8A00)),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('시작날짜',
                              style: TextStyle(
                                  fontFamily: 'PretendardRegular',
                                  fontSize: 16)),
                          const SizedBox(height: 5),
                          GestureDetector(
                            onTap: () {},
                            child: SizedBox(
                              width: 140,
                              height: 40,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xffFF8A00)),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      DateFormat("yyyy. MM. dd.").format(now),
                                      style: const TextStyle(
                                          fontFamily: 'PretendardRegular',
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('종료날짜',
                              style: TextStyle(
                                  fontFamily: 'PretendardRegular',
                                  fontSize: 16)),
                          const SizedBox(height: 5),
                          GestureDetector(
                            onTap: () {
                              selectEndDate(context);
                            },
                            child: SizedBox(
                              width: 140,
                              height: 40,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xffFF8A00)),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      selectedEndDate ?? "----. --. --.",
                                      style: const TextStyle(
                                          fontFamily: 'PretendardRegular',
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 110,
                        height: 48.4,
                        child: OutlinedButton(
                          onPressed: () {
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
                            '뒤로가기',
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
                            Navigator.pop(
                              context,
                              {
                                'title': todoListTitle.text,
                                'detail': todoListDetail.text,
                                'startDate':
                                    DateFormat("yyyy. MM. dd.").format(now),
                                'endDate': selectedEndDate,
                                'isDone': false,
                              },
                            );
                          },
                          style: FilledButton.styleFrom(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(16),
                                ),
                              ),
                              backgroundColor: const Color(0xffFF8A00)),
                          child: const Text(
                            '추가하기',
                            style: TextStyle(
                                fontFamily: 'PretendardSemiBold',
                                fontSize: 16,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ],
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
