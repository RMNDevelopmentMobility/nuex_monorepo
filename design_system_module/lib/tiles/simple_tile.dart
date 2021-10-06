import 'package:design_system_module/themes/app_text_style.dart';
import 'package:flutter/material.dart';

class SimpleTileWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final Icon icon;
  final Color circularBackground;

  const SimpleTileWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.circularBackground,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        leading: CircleAvatar(
          backgroundColor: circularBackground,
          radius: 40,
          child: icon,
        ),
        title: Text(
          title,
          style: AppTextStyles.titleListTile,
        ),
        subtitle: Text(
          subtitle,
          style: AppTextStyles.subtitleListTile,
        ),
      ),
    );
  }
}
