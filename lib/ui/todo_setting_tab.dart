import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_route/my_theme_data.dart';
import 'package:to_do_list_route/providers/AppConfigProvider.dart';
import 'package:to_do_list_route/ui/language_bottom_sheet.dart';

import 'mode_bottom_sheet.dart';

class TodoSetting extends StatefulWidget {
  @override
  _TodoSettingState createState() => _TodoSettingState();
}

class _TodoSettingState extends State<TodoSetting> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 17),
          child: Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.headline2,
          )),
      Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.symmetric(vertical: 16, horizontal: 30),
        decoration: BoxDecoration(
          border: Border.all(
            color: Color.fromARGB(255, 93, 156, 236),
            width: 3,
          ),
          color: provider.mode == ThemeMode.dark
              ? MyThemeData.darkBackgroundColor
              : Colors.white,
        ),
        child: InkWell(
          onTap: () {
            showLanguageBottomSheet();
          },
          child: Row(
            children: [
              Text(provider.language == 'en' ? 'English' : 'العربية',
                  style: Theme.of(context).textTheme.headline1),
              Spacer(),
              Icon(
                Icons.arrow_downward_outlined,
                color: Theme.of(context).primaryColor,
              ),
            ],
          ),
        ),
      ),
      Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 17),
          child: Text(
            AppLocalizations.of(context)!.mode,
            style: Theme.of(context).textTheme.headline2,
          )),
      Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.symmetric(vertical: 16, horizontal: 30),
        decoration: BoxDecoration(
          border: Border.all(
            color: Color.fromARGB(255, 93, 156, 236),
            width: 3,
          ),
          color: provider.mode == ThemeMode.dark
              ? MyThemeData.darkBackgroundColor
              : Colors.white,
        ),
        child: InkWell(
          onTap: () {
            showModeBottomSheet();
          },
          child: Row(
            children: [
              Text(
                  provider.mode == ThemeMode.light
                      ? AppLocalizations.of(context)!.light
                      : AppLocalizations.of(context)!.dark,
                  style: Theme.of(context).textTheme.headline1),
              Spacer(),
              Icon(
                Icons.arrow_downward_outlined,
                color: Theme.of(context).primaryColor,
              ),
            ],
          ),
        ),
      ),
    ]);
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return LanguageBottomSheet();
        });
  }

  void showModeBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return ModeBottomSheet();
        });
  }
}
