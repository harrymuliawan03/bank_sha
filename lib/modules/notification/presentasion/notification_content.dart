import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

class NotificationContent extends StatelessWidget {
  const NotificationContent({super.key});

  @override
  Widget build(BuildContext context) {
    List _elements = [
      {
        'message': 'Transaksi sebesar Rp23.000 di MYTELKOMSEL, telah berhasil.',
        'group': '22 Mei 2024'
      },
      {
        'message':
            'Rp1.000 telah dipotong dari Saldo untuk biaya top up dari BCA',
        'group': '22 Mei 2024'
      },
    ];
    return GroupedListView<dynamic, String>(
      elements: _elements,
      groupBy: (element) => element['group'],
      groupSeparatorBuilder: (String groupByValue) => Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 10),
        color: kGreyColor,
        child: Text(
          groupByValue,
          style: const TextStyle().copyWith(fontWeight: bold),
        ),
      ),
      itemBuilder: (context, dynamic element) => Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 15),
        // color: kWhiteColor,
        decoration: const BoxDecoration(
          // color: Colors.amber,
          border: Border(bottom: BorderSide(color: Colors.black, width: 0.3)),
        ),
        child: Text(
          element['message'],
        ),
      ),
      itemComparator: (item1, item2) =>
          item1['message'].compareTo(item2['message']), // optional
      useStickyGroupSeparators: true, // optional
      floatingHeader: true, // optional
      order: GroupedListOrder.ASC, // optional
    );
  }
}
