import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:personal_finance_management_application/widgets/home_screen_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Status'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            InkWell(
              onTap: () => Navigator.pushNamed(context, '/assetsLiabilities'),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      buildTitleRow(
                          FontAwesomeIcons.chartPie, 'Assets / Liabilities'),
                      buildInfoRow(
                        ['Assets', 'Liabilities', 'Net Assets'],
                        ['9.790,70 TL', '0,00 TL', '9.790,70 TL'],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      buildTitleRow(
                          FontAwesomeIcons.dollarSign, 'Revenues / Expenses'),
                      buildInfoRow(
                        ['Revenues', 'Expenses', 'Current Situation'],
                        ['11.747,43 TL', '6.120,53 TL', '5.626,90 TL'],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
