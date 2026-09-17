import 'package:flutter/material.dart';

class AppBottomNav extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const AppBottomNav({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: const BoxDecoration(
        color: Color(0xFFFCEFF4),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Container(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // 1) Home
              _buildNavItem(
                index: 0,
                label: 'Home',
                icon: Icons.home_outlined,
                isImage: false,
              ),

              // 2) Explore (map.png)
              _buildNavItem(
                index: 1,
                label: 'Explore',           // ← ✏️ اتغيرت من 'Map'
                iconPath: 'assets/images/map.png',
                isImage: true,
              ),

              // 3) Bookmark
              _buildNavItem(
                index: 2,
                label: 'Bookmark',
                iconPath: 'assets/images/bookmarkpic.png',
                isImage: true,
              ),

              // 4) Weather
              _buildNavItem(
                index: 3,
                label: 'Weather',
                iconPath: 'assets/images/weather.png',
                isImage: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required String label,
    IconData? icon,
    String? iconPath,
    bool isImage = false,
  }) {
    final bool isActive = selectedIndex == index;

    final Color itemColor =
        isActive ? Colors.white : const Color(0xFF292929);

    Widget iconWidget;
    if (isImage) {
      iconWidget = Image.asset(
        iconPath!,
        width: 24,
        height: 24,
        fit: BoxFit.contain,
        color: itemColor,
      );
    } else {
      iconWidget = Icon(
        icon!,
        size: 24,
        color: itemColor,
      );
    }

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => onItemTapped(index),
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        splashColor: Colors.black.withOpacity(0.15),
        highlightColor: Colors.black.withOpacity(0.08),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          width: isActive ? 130 : null,
          height: isActive ? 48 : null,
          padding: isActive
              ? const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 12,
                )
              : const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: isActive ? const Color(0xFF292929) : Colors.transparent,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              iconWidget,
              if (isActive) ...[
                const SizedBox(width: 7),
                Text(
                  label,
                  maxLines: 1,
                  softWrap: false,
                  style: const TextStyle(
                    fontFamily: 'Title',
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    height: 18 / 14,
                    letterSpacing: 0,
                    color: Colors.white,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}