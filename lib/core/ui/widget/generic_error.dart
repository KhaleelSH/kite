import 'package:flutter/material.dart';
import 'package:kite/core/exception_handling/error_formatter.dart';
import 'package:kite/core/ui/widget/animated_kite_logo.dart';

class GenericError extends StatelessWidget {
  const GenericError({super.key, this.exception, this.onRetry, this.actions = const []});

  final Object? exception;
  final VoidCallback? onRetry;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.surface,
      child: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedKiteLogo(),
                const SizedBox(height: 16),
                Text(
                  'Oops! Something went wrong!',
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
                if (exception != null) ...[
                  const SizedBox(height: 8),
                  Flexible(
                    child: SingleChildScrollView(
                      child: Text(
                        ErrorFormatter.format(exception is Exception ? exception as Exception : Exception(exception)),
                        style: Theme.of(context).textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
                if (onRetry != null) ...[
                  const SizedBox(height: 16),
                  FilledButton(onPressed: onRetry!, child: const Text('Retry')),
                ],
                if (actions.isNotEmpty) ...[
                  const SizedBox(height: 16),
                  Column(mainAxisAlignment: MainAxisAlignment.center, spacing: 16, children: actions),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
