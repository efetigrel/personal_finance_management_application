import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:personal_finance_management_application/providers/prov_assets_liabilities.dart';
import 'package:personal_finance_management_application/utils/button_styles.dart';
import 'package:personal_finance_management_application/utils/colors.dart';
import 'package:personal_finance_management_application/widgets/sign_in_and_sign_up.dart';
import 'package:provider/provider.dart';

class AssetsLiabilities extends StatelessWidget {
  const AssetsLiabilities({Key? key});

  @override
  Widget build(BuildContext context) {
    final assetsLiabilities = Provider.of<AssetsLiabilitiesNotifier>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Assets / Liabilities'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          assetsLiabilitiesText(),
          Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Center(child: Text('Add Asset')),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextFormField(
                              controller: assetsLiabilities.controllerAddAssets,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                            ),
                            sizedBox10(),
                            ElevatedButton(
                              onPressed: () {
                                assetsLiabilities.addAsset();
                              },
                              child: const Text('Add'),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                style: AssetsLiabilitiesBottomButtonsStyle.elevatedButtonStyle(
                    greenColor4),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Add Asset'),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Center(child: Text('Subtract Asset')),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextFormField(
                              controller:
                                  assetsLiabilities.controllerSubtractAssets,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                            ),
                            sizedBox10(),
                            ElevatedButton(
                              onPressed: () {
                                assetsLiabilities.addAsset();
                              },
                              child: const Text('Subtract'),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                style: AssetsLiabilitiesBottomButtonsStyle.elevatedButtonStyle(
                    greenColor4),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Subtract Asset'),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Center(child: Text('Add Liabilities')),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextFormField(
                              controller:
                                  assetsLiabilities.controllerAddLiabilities,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                            ),
                            sizedBox10(),
                            ElevatedButton(
                              onPressed: () {
                                assetsLiabilities.addAsset();
                              },
                              child: const Text('Add'),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                style: AssetsLiabilitiesBottomButtonsStyle.elevatedButtonStyle(
                    redColor4),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Add Liabilities'),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title:
                            const Center(child: Text('Subtract Liabilities')),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextFormField(
                              controller: assetsLiabilities
                                  .controllerSubtractLiabilities,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                            ),
                            sizedBox10(),
                            ElevatedButton(
                              onPressed: () {
                                assetsLiabilities.addAsset();
                              },
                              child: const Text('Subtract'),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                style: AssetsLiabilitiesBottomButtonsStyle.elevatedButtonStyle(
                    redColor4),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Subtract Liabilities'),
                  ],
                ),
              ),
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

Widget assetsLiabilitiesText() {
  return const Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('Assets: 11.747 TL'),
          Text('Liabilities: 6.120 TL'),
        ],
      ),
      SizedBox(height: 20),
      Text('Net Assets: 9.790 TL'),
    ],
  );
}
