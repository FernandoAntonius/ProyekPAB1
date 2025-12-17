import 'package:flutter/material.dart';

class ProfileInfoItem extends StatefulWidget {
  final IconData icon;
  final String label;
  final String value;
  final bool showEditIcon;
  final VoidCallback? onEditPressed;
  final Color iconColor;
  final Color iconBackgroundColor;
  final Color iconBackgroundHoverColor;
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
    required this.iconBackgroundColor,
    required this.iconBackgroundHoverColor,
    this.isSignedIn = false,
    this.context,
    this.navigateTo,
  });

  @override
  State<ProfileInfoItem> createState() => _ProfileInfoItemState();
}

class _ProfileInfoItemState extends State<ProfileInfoItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.navigateTo != null) {
          Navigator.pushNamed(context, widget.navigateTo!);
        } else if (!widget.isSignedIn) {
          Navigator.pushNamed(context, '/login');
        }
      },
      onHover: (hovering) {
        setState(() {
          _isHovered = hovering;
        });
      },
      borderRadius: BorderRadius.circular(8),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: _isHovered
              ? Colors.white.withOpacity(0.05)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 200),
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: _isHovered
                    ? widget.iconBackgroundHoverColor
                    : widget.iconBackgroundColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(widget.icon, color: widget.iconColor, size: 16),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                widget.label,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            if (widget.showEditIcon)
              InkWell(
                onTap: widget.onEditPressed,
                child: Icon(
                  Icons.edit,
                  color: Colors.white.withOpacity(0.7),
                  size: 18,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
