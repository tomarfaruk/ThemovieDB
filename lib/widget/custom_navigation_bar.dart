import 'package:flutter/material.dart';
import 'package:movie_app/utils/k_images.dart';
import 'package:movie_app/widget/custom_image.dart';

import '../utils/k_colors.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({
    Key? key,
    required this.currentIndex,
    this.height = 60,
    this.onItemSelected,
  }) : super(key: key);

  final int currentIndex;
  final double height;
  final ValueChanged<int>? onItemSelected;

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    const iconHeight = 18.0;
    return Material(
      elevation: 3,
      color: primaryColor,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(27),
        topRight: Radius.circular(27),
      ),
      child: SizedBox(
        width: double.infinity,
        height: widget.height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NavItem(
              onTap: () {
                if (widget.onItemSelected != null) widget.onItemSelected!(0);
                currentIndex = 0;
                setState(() {});
              },
              isSelected: currentIndex == 0,
              text: "Dashboard",
              icon: CustomImage(
                path: Kimages.dashboardIcon,
                height: iconHeight,
                width: iconHeight,
                color: currentIndex == 0 ? whiteColor : darkGreyColor,
              ),
            ),
            NavItem(
              onTap: () {
                if (widget.onItemSelected != null) widget.onItemSelected!(1);
                currentIndex = 1;
                setState(() {});
              },
              isSelected: currentIndex == 1,
              text: "Watch",
              icon: CustomImage(
                path: Kimages.watchIcon,
                height: iconHeight,
                width: iconHeight,
                color: currentIndex == 1 ? whiteColor : darkGreyColor,
              ),
            ),
            NavItem(
              onTap: () {
                if (widget.onItemSelected != null) widget.onItemSelected!(2);
                currentIndex = 2;
                setState(() {});
              },
              isSelected: currentIndex == 2,
              text: "Media Library",
              icon: CustomImage(
                path: Kimages.mediaLibraryIcon,
                height: iconHeight,
                width: iconHeight,
                color: currentIndex == 2 ? whiteColor : darkGreyColor,
              ),
            ),
            NavItem(
              onTap: () {
                if (widget.onItemSelected != null) widget.onItemSelected!(3);
                currentIndex = 3;
                setState(() {});
              },
              isSelected: currentIndex == 3,
              text: "More",
              icon: CustomImage(
                path: Kimages.moreIcon,
                height: iconHeight,
                width: iconHeight,
                color: currentIndex == 3 ? whiteColor : darkGreyColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  const NavItem({
    Key? key,
    required this.icon,
    required this.text,
    required this.isSelected,
    this.onTap,
  }) : super(key: key);

  final String text;
  final Widget icon;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          child: Tooltip(
            message: text,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                const SizedBox(height: 7),
                Text(
                  text,
                  style: TextStyle(
                    color: isSelected ? whiteColor : darkGreyColor,
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
                    fontSize: 10,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
