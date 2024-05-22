import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class SignInRoute extends StatefulWidget {
  const SignInRoute({super.key});

  @override
  State<SignInRoute> createState() => _SignInRouteState();
}

class _SignInRouteState extends State<SignInRoute> {
  void login(BuildContext context) {
    context.replace("/");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            // TODO: width: 60%
            height: 400,
            child: Center(
              child: Text("TINASHA-LOGO-PLACEHOLDER"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Text(
                  "Welcome to Tinasha!",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const Gap(10),
                Text(
                  "Please sign in with your MyAnimeList account.",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: ButtonTheme(
                buttonColor: const Color.fromARGB(255, 29, 78, 216),
                child: FilledButton.icon(
                  onPressed: () => login(context),
                  icon: const Icon(Icons.login),
                  label: const Text("Sign in with MyAnimeList"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
