import 'package:flutter/material.dart';

class BottomNaviBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNaviBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  State<BottomNaviBar> createState() => _BottomNaviBarState();
}

class _BottomNaviBarState extends State<BottomNaviBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      onTap: widget.onTap,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Theme.of(context).colorScheme.background,
      selectedItemColor: Theme.of(context).colorScheme.primary,
      unselectedItemColor: Theme.of(context).colorScheme.secondary,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home_filled,
            size: 35,
          ),
          label: 'HOME',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.video_library_outlined,
            size: 35,
          ),
          label: 'SHORTS',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.camera_alt_outlined,
            size: 35,
          ),
          label: 'CAMERA',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.language_sharp,
            size: 35,
          ),
          label: 'NEWS',
        ),
      ],
      selectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 12,
      ),
      unselectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 12,
      ),
    );
  }
}
