import 'package:flutter/material.dart';
import 'package:gamepedia/helper/locale_provider.dart';
import 'package:gamepedia/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final provider = Provider.of<LocaleProvider>(context, listen: true);
    final currentLocale = provider.locale;

    final supportedLanguages = {
      'en': const Locale('en'),
      'id': const Locale('id'),
      'ko': const Locale('ko'),
      'zh': const Locale('zh'),
      'th': const Locale('th'),
      'es': const Locale('es'),
      'fil': const Locale('fil'),
      'ru': const Locale('ru'),
      'ja': const Locale('ja'),
      'ar': const Locale('ar'),
    };

    final languageNames = {
      'en': loc.english,
      'id': loc.indonesian,
      'ko': loc.korean,
      'zh': loc.chinese,
      'th': loc.thai,
      'es': loc.spanish,
      'fil': loc.filipino,
      'ru': loc.russian,
      'ja': loc.japanese,
      'ar': loc.arabic,
    };

    return Scaffold(
      appBar: AppBar(title: Text(loc.settings)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListTile(
          title: Text(loc.language),
          subtitle: Text(
            languageNames[currentLocale.languageCode] ?? loc.unknownLanguage,
          ),
          trailing: DropdownButton<Locale>(
            value: currentLocale,
            items: supportedLanguages.entries.map((entry) {
              return DropdownMenuItem<Locale>(
                value: entry.value,
                child: Text(languageNames[entry.key] ?? entry.key),
              );
            }).toList(),
            onChanged: (locale) {
              if (locale != null) {
                provider.setLocale(locale);
              }
            },
          ),
        ),
      ),
    );
  }
}
