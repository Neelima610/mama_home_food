import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constants/constants.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({
    super.key,
  });

  @override
  State<LanguageScreen> createState() =>
      _LanguageScreenState();
}

class _LanguageScreenState
    extends State<LanguageScreen> {

  //--------------------------------------------------
  // State
  //--------------------------------------------------

  String _selectedLanguage = 'English';

  //--------------------------------------------------
  // Languages
  //--------------------------------------------------

  final List<String> _languages = [
    'English',
    'Telugu',
  ];

  //--------------------------------------------------
  // Lifecycle
  //--------------------------------------------------

  @override
  void initState() {
    super.initState();

    _loadLanguage();
  }

  //--------------------------------------------------
  // Load Language
  //--------------------------------------------------

  Future<void> _loadLanguage() async {
    final preferences =
        await SharedPreferences.getInstance();

    final savedLanguage =
        preferences.getString(
      AppKeys.language,
    );

    if (!mounted || savedLanguage == null) {
      return;
    }

    setState(() {
      _selectedLanguage =
          savedLanguage;
    });
  }

  //--------------------------------------------------
  // Save Language
  //--------------------------------------------------

  Future<void> _saveLanguage(
    String language,
  ) async {
    final preferences =
        await SharedPreferences.getInstance();

    await preferences.setString(
      AppKeys.language,
      language,
    );
  }

  //--------------------------------------------------
  // Language Changed
  //--------------------------------------------------

  Future<void> _onLanguageChanged(
    String? language,
  ) async {
    if (language == null) {
      return;
    }

    setState(() {
      _selectedLanguage = language;
    });

    await _saveLanguage(
      language,
    );

    if (!mounted) {
      return;
    }

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(
      SnackBar(
        content: Text(
          '$language selected',
        ),
      ),
    );
  }

  //--------------------------------------------------
  // Build
  //--------------------------------------------------

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Language',
        ),
      ),

      body: RadioGroup<String>(
        groupValue: _selectedLanguage,
        onChanged: _onLanguageChanged,

        child: ListView.separated(
          padding: const EdgeInsets.all(
            AppSizes.screenPadding,
          ),

          itemCount: _languages.length,

          separatorBuilder: (
            context,
            index,
          ) {
            return const Divider();
          },

          itemBuilder: (
            context,
            index,
          ) {
            final language =
                _languages[index];

            return RadioListTile<String>(
              value: language,

              title: Text(
                language,
              ),
            );
          },
        ),
      ),
    );
  }
}