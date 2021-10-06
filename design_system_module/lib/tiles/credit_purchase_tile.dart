import 'package:design_system_module/themes/app_text_style.dart';
import 'package:flutter/material.dart';

class CreditPurchaseTileWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final double totalvalue;
  final String? subdivision;

  const CreditPurchaseTileWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.totalvalue,
    this.subdivision,
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
          backgroundColor: Colors.grey.shade300,
          radius: 40,
          child: Icon(
            Icons.grid_view,
            size: 25,
            color: Colors.grey.shade800,
          ),
        ),
        title: Text(
          title,
          style: AppTextStyles.titleListTile,
        ),
        subtitle: Text(
          subtitle,
          style: AppTextStyles.subtitleListTile,
        ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "${r"R$"} " + totalvalue.toStringAsFixed(2),
              style: AppTextStyles.titleListTile,
              textAlign: TextAlign.end,
            ),
            Text(
              subdivision ?? '',
              style: AppTextStyles.subtitleListTile,
              textAlign: TextAlign.end,
            )
          ],
        ),
      ),
    );
  }
}
