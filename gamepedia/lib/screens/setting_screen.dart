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
      backgroundColor: const Color(0xFF0E1126),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0E1126),
        elevation: 0,
        title: Text(
          loc.settings,
          style: const TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Quicksand',
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [
                  Color(0xFF3A3FF2),
                  Color(0xFF7754F4),
                  Color(0xFF965FF5),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(bounds),
              child: Image.asset(
                'images/console.png',
                height: 40,
                width: 40,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListTile(
          title: Text(
            loc.language,
            style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          subtitle: Text(
            languageNames[currentLocale.languageCode] ?? loc.unknownLanguage,
            style: const TextStyle(color: Colors.white70, fontSize: 14),
          ),
          trailing: DropdownButton<Locale>(
            dropdownColor: const Color.fromARGB(255, 255, 255, 255),
            style: const TextStyle(color: Colors.black, fontSize: 14),
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
