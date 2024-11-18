import 'package:advicer/application/core/services/theme_service.dart';
import 'package:advicer/application/pages/advice/widgets/advice_field.dart';
import 'package:advicer/application/pages/advice/widgets/custom_button.dart';
import 'package:advicer/application/pages/advice/widgets/error_message.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdvicePage extends StatelessWidget {
  const AdvicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Advicer',
          style: themeData.textTheme.headlineSmall,
        ),
        centerTitle: true,
        actions: [
          Switch(
              value: Provider.of<ThemeService>(context).isDarkModeOn,
              onChanged: (_) {
                Provider.of<ThemeService>(context, listen: false).toggleTheme();
              })
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: ErrorMessage(message: "Error"),
                /*AdviceField(advice: 'Sample advice'),*/
                /*CircularProgressIndicator(
                  color: themeData.colorScheme.secondary,
                )*/
                /*Text(
                  'Your Advice is waiting for you!',
                    style: themeData.textTheme.headlineSmall,
                ),*/
              ),
            ),
            SizedBox(
                height: 200,
                child: Center(
                  child: CustomButton(),
                ))
          ],
        ),
      ),
    );
  }
}
