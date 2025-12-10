import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileInfoItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final bool showEditIcon;
  final VoidCallback? onEditPressed;
  final Color iconColor;

 const ProfileInfoItem({super.key,
    required this.icon,
    required this.label,
    required this.value,
    this.showEditIcon = false,
    this.onEditPressed,
    required this.iconColor,
  });
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          child: Row(
            children: [
              Icon(icon, color: iconColor,),
              SizedBox(width: 10,),
              Text(
                label,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ],
          ),
        ),
        if (showEditIcon) InkWell(onTap: onEditPressed, child: Icon(Icons.edit),)
      ],
    );
  }
}