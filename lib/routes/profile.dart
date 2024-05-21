import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';
import 'package:tinasha_v2/data/app_settings.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _githubRepoUri = Uri.parse('https://github.com/haashemi/TinashaV2');

class ProfileRoute extends StatefulWidget {
  const ProfileRoute({super.key});

  @override
  State<ProfileRoute> createState() => _ProfileRouteState();
}

class _ProfileRouteState extends State<ProfileRoute> {
  bool isDark = false;
  bool nsfw = false;

  AppSettings settings = AppSettings();

  Future<void> _askedToLead(ThemeMode current) async {
    final value = await showDialog<ThemeMode>(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const Text('Select assignment'),
          children: <Widget>[
            RadioListTile<ThemeMode>(
              value: ThemeMode.light,
              groupValue: current,
              onChanged: (iv) {
                Navigator.pop(context, ThemeMode.light);
              },
              title: const Text('Light'),
            ),
            RadioListTile<ThemeMode>(
              value: ThemeMode.dark,
              groupValue: current,
              onChanged: (iv) {
                Navigator.pop(context, ThemeMode.dark);
              },
              title: const Text('Dark'),
            ),
            RadioListTile<ThemeMode>(
              value: ThemeMode.system,
              groupValue: current,
              onChanged: (iv) {
                Navigator.pop(context, ThemeMode.system);
              },
              title: const Text('System Theme'),
            ),
          ],
        );
      },
    );

    await settings.themeMode.setValue(value ?? ThemeMode.system);
  }

  Future<void> _launchGithubRepo() async {
    if (!await launchUrl(_githubRepoUri)) {
      throw Exception('Could not launch $_githubRepoUri');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(30),
              child: Row(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    child: Image.network(
                      'https://cdn.myanimelist.net/s/common/userimages/962292aa-3091-45ea-a71c-de38093d38ae_225w?s=4dd7d4fdb2b51fc552f8f0e61ffeb928',
                      width: 150,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            'VMProtected',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          Row(
                            children: <Widget>[
                              const Icon(
                                Icons.cake,
                                size: 20,
                              ),
                              const Gap(10),
                              Text(
                                'May 12th, 2021',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              const Icon(
                                Icons.event_available_outlined,
                                size: 20,
                              ),
                              const Gap(10),
                              Text(
                                'May 12th, 2021',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            PreferenceBuilder<ThemeMode>(
              preference: settings.themeMode,
              builder: (context, value) => ListTile(
                title: const Text('Change Theme'),
                leading: const Icon(Icons.brightness_4_rounded),
                subtitle: const Text("Change the current Tinasha's theme."),
                onTap: () async => _askedToLead(value),
              ),
            ),
            PreferenceBuilder<bool>(
              preference: settings.nsfw,
              builder: (context, value) => SwitchListTile.adaptive(
                title: const Text('Show NSFW content'),
                secondary: const Icon(Icons.no_adult_content_rounded),
                subtitle: const Text(
                  'Show age restricted anime/manga',
                ),
                thumbIcon: WidgetStateProperty.resolveWith(
                  (states) => states.contains(WidgetState.selected)
                      ? const Icon(Icons.done_rounded)
                      : const Icon(Icons.close_rounded),
                ),
                value: value,
                onChanged: (val) async => settings.nsfw.setValue(val),
              ),
            ),
            ListTile(
              title: const Text('GitHub'),
              leading: const Icon(SimpleIcons.github),
              subtitle: const Text(
                "Tinasha's source code is publicly available! Give a star",
              ),
              onTap: _launchGithubRepo,
            ),
            ListTile(
              title: const Text('Logout'),
              leading: Icon(
                Icons.logout_outlined,
                color: Theme.of(context).colorScheme.error,
              ),
              subtitle: const Text('Logout from Tinasha.'),
              onTap: () {},
            ),
            const AboutListTile(),
          ],
        ),
      ),
    );
  }
}
