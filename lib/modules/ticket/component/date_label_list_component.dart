import 'package:flutter/material.dart';
import 'package:movie_app/utils/k_colors.dart';

class DateLabelsComponent extends StatefulWidget {
  const DateLabelsComponent({
    Key? key,
  }) : super(key: key);

  @override
  State<DateLabelsComponent> createState() => _DateLabelsComponentState();
}

class _DateLabelsComponentState extends State<DateLabelsComponent> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Date',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: textColor,
            ),
          ),
        ),
        const SizedBox(height: 14),
        SizedBox(
          height: 32,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 30,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            itemBuilder: (context, index) {
              return DateTagComponent(
                isSelected: selectedIndex == index,
                text: '${index + 1} Mar',
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              );
            },
          ),
        )
      ],
    );
  }
}

class DateTagComponent extends StatelessWidget {
  const DateTagComponent({
    Key? key,
    required this.text,
    required this.onTap,
    required this.isSelected,
  }) : super(key: key);
  final String text;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isSelected
              ? lightBlueColor
              : const Color(0xffA6A6A6).withOpacity(.1)),
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              fontSize: 12,
              color: isSelected ? Colors.white : textColor,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
