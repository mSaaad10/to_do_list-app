import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_route/providers/AppConfigProvider.dart';

class ModeBottomSheet extends StatefulWidget {
  @override
  _ModeBottomSheetState createState() => _ModeBottomSheetState();
}

class _ModeBottomSheetState extends State<ModeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    AppConfigProvider provider = Provider.of(context);
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          InkWell(
              onTap: () {
                provider.setNewMode(ThemeMode.light);
              },
              child: getMainView(AppLocalizations.of(context)!.light,
                  provider.mode == ThemeMode.light)),
          InkWell(
              onTap: () {
                provider.setNewMode(ThemeMode.dark);
              },
              child: getMainView(AppLocalizations.of(context)!.dark,
                  provider.mode == ThemeMode.dark))
        ],
      ),
    );
  }

  Widget getMainView(String lang, bool selected) {
    if (selected) {
      return Container(
        margin: EdgeInsets.all(16),
        child: Row(
          children: [
            Text(
              lang,
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Icon(
              Icons.check,
              color: Theme.of(context).primaryColor,
            )
          ],
        ),
      );
    } else {
      return Container(
          margin: EdgeInsets.all(16),
          child: Row(
            children: [
              Text(
                lang,
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold),
              ),
              Spacer(),
            ],
          ));
    }
  }
}
