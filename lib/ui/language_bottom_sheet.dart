import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_route/providers/AppConfigProvider.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({Key? key}) : super(key: key);

  @override
  _LanguageBottomSheetState createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    AppConfigProvider provider = Provider.of(context);
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          InkWell(
              onTap: () {
                provider.setNewLang('en');
              },
              child: getMainView('English', provider.language == 'en')),
          InkWell(
              onTap: () {
                provider.setNewLang('ar');
              },
              child: getMainView('العربية', provider.language == 'ar'))
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
