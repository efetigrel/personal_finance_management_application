import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:personal_finance_management_application/utils/colors.dart';
import 'package:personal_finance_management_application/widgets/sign_in_and_sign_up.dart';

class AssetsLiabilities extends StatelessWidget {
  const AssetsLiabilities({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assets / Liabilities'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Column(
            children: [
              Container(
                height: 250,
                child: PieChart(
                  PieChartData(
                    sections: getSections(),
                    sectionsSpace: 5,
                    centerSpaceRadius: 0,
                  ),
                ),
              ),
              sizedBox20(),
              AssetsLiabilitiesText()
            ],
          ),
        ],
      ),
    );
  }
}

List<PieChartSectionData> getSections() {
  return List.generate(
    2,
    (index) {
      switch (index) {
        case 0:
          return PieChartSectionData(
            color: greenColor4,
            value: 11747,
            title: 'Assets',
            radius: 100,
          );
        case 1:
          return PieChartSectionData(
            color: redColor4,
            value: 6120,
            title: 'Liabilities',
            radius: 100,
          );
        default:
          return PieChartSectionData();
      }
    },
  );
}

Widget AssetsLiabilitiesText() {
  return const Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('Assets : 11.747 TL'),
          Text('Liabilities : 6.120 TL'),
        ],
      ),
      SizedBox(height: 20),
      Text('Net Assets : 9.790 TL'),
    ],
  );
}
