import 'package:flutter/material.dart';

class ProfileInfoItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final bool showEditIcon;
  final VoidCallback? onEditPressed;
  final Color iconColor;
  final bool isSignedIn;
  final BuildContext? context;
  final String? navigateTo;

  const ProfileInfoItem({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    this.showEditIcon = false,
    this.onEditPressed,
    required this.iconColor,
    this.isSignedIn = false,
    this.context,
    this.navigateTo,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (navigateTo != null) {
          Navigator.pushNamed(context, navigateTo!);
        } else if (!isSignedIn) {
          Navigator.pushNamed(context, '/login');
        }
      },
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: Row(
              children: [
                Icon(icon, color: iconColor),
                SizedBox(width: 10),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontFamily: 'Quicksand',
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          ),
          if (showEditIcon)
            InkWell(onTap: onEditPressed, child: Icon(Icons.edit)),
        ],
      ),
    );
  }
}
