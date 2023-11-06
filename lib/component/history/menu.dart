import 'package:flutter/material.dart';
import 'package:typing_contest_mobile/component/history/list_rank.dart';
import 'package:typing_contest_mobile/component/ranking/ranking_round_screen.dart';
import 'package:typing_contest_mobile/models/contest.dart';

class MenuItems extends StatelessWidget {
  const MenuItems({
    super.key,
    required this.ct,
  });
  final Contest ct;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: 'item1',
          child: Text('Item 1'),
        ),
        const PopupMenuItem(
          value: 'item2',
          child: Text('Item 2'),
        ),
      ],
      onSelected: (value) {
        switch (value) {
          case 'item1':
            // Xử lý khi chọn menu item 1
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const RankingRoundScreen()));
            break;
          case 'item2':
            // Xử lý khi chọn menu item 2
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => List_Rank(ct: ct),
              ),
            );
            break;
        }
      },
    );
  }
}
