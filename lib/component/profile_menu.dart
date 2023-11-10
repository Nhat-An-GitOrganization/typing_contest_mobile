import 'package:flutter/material.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    super.key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  });
  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: size.width * 0.1,
        height: size.height * 0.046,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: const Color.fromARGB(255, 26, 115, 232).withOpacity(0.1)),
        child: Icon(
          icon,
          color: const Color.fromARGB(255, 26, 115, 232),
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: size.height * 0.017)
            .apply(color: textColor),
      ),
      trailing: endIcon
          ? Container(
              width: size.width * 0.08,
              height: size.height * 0.04,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: isDarkMode
                      ? const Color.fromARGB(255, 46, 55, 67)
                      : const Color.fromARGB(255, 232, 245, 255)),
              child: Icon(
                Icons.chevron_right,
                color: const Color.fromARGB(255, 26, 115, 232),
                size: size.height * 0.02,
              ),
            )
          : null,
    );
  }
}
