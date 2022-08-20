import 'package:flutter/material.dart';

class ComfortChip extends StatelessWidget {
  const ComfortChip(
      {Key? key,
      required this.currentIndex,
      required this.index,
      required this.fn,
      required this.name})
      : super(key: key);
  final int index;
  final String name;
  final VoidCallback fn;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: fn,
      child: AnimatedContainer(
        decoration: currentIndex == index
            ? BoxDecoration(
                color: const Color(0xFFE4EDF0),
                borderRadius: BorderRadius.circular(15),
              )
            : const BoxDecoration(),
        duration: const Duration(milliseconds: 100),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              name,
              style: TextStyle(
                  fontFamily: 'Poppins-Regular',
                  color: currentIndex == index
                      ? const Color(0xFF005248)
                      : Colors.black,
                  fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
