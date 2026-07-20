import 'package:flutter/material.dart';

class TaskColorListView extends StatefulWidget {
  final Function(Color?) onvalue;
  TaskColorListView( {super.key, required this.onvalue});

  @override
  State<TaskColorListView> createState() => _TaskColorListViewState();
}

class _TaskColorListViewState extends State<TaskColorListView> {
  // Changed List<MaterialColor> to standard List<Color>
  List<Color> tasksColor = [
    Colors.red,
    Colors.yellow,
    Colors.green,
    Colors.orange,
    Colors.blue,
    Colors.brown,
    Colors.purple,
  ];

  int activeindex = -1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: tasksColor.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            setState(() {
              activeindex = index;
              widget.onvalue(tasksColor[index]);
            });
          },
          child: CircleAvatar(
            radius: 25,
            backgroundColor: tasksColor[index],
            child: activeindex == index
                ? const Center(child: Icon(Icons.check, color: Colors.white))
                : null,
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(width: 12),
      ),
    );
  }
}
