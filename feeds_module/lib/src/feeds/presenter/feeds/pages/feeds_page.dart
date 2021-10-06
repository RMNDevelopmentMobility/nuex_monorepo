import 'package:design_system_module/design_system_module.dart';

import '../../../domain/entities/feed.dart';
import 'package:flutter/material.dart';

class FeedsPage extends StatelessWidget {
  const FeedsPage({Key? key, required this.list /*, required this.onRefresh*/})
      : super(key: key);
  final List<Feed> list;
  //final Future<void> Function() onRefresh;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      shrinkWrap: true,
      itemCount: list.length,
      itemBuilder: (context, index) {
        switch (list[index].type) {
          case 'invoice_closed':
            return SimpleTileWidget(
              title: list[index].title,
              subtitle: list[index].subtitle,
              icon: Icon(
                Icons.calendar_today,
                size: 25,
                color: Colors.red.shade800,
              ),
              circularBackground: Colors.red.shade50,
            );
          case 'welcome':
            return SimpleTileWidget(
              title: list[index].title,
              subtitle: list[index].subtitle,
              icon: Icon(
                Icons.sentiment_satisfied_alt,
                size: 25,
                color: Colors.purple.shade800,
              ),
              circularBackground: Colors.purple.shade50,
            );
          case 'card_unlock':
            return SimpleTileWidget(
              title: list[index].title,
              subtitle: list[index].subtitle,
              icon: Icon(
                Icons.credit_card,
                size: 25,
                color: Colors.purple.shade800,
              ),
              circularBackground: Colors.purple.shade50,
            );
          case 'credit_purchase':
            return CreditPurchaseTileWidget(
              title: list[index].title,
              subtitle: list[index].subtitle,
              totalvalue: list[index].totalvalue ?? 0.0,
              subdivision: list[index].subdivision ?? '',
            );
          default:
            return ListTile(
              title: Text(list[index].title),
              subtitle: Text(list[index].subtitle),
            );
        }
      },
    ));
  }
}
