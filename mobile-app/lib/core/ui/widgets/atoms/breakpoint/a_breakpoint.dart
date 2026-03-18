import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ABreakpoint extends StatelessWidget {
  final Map<String, Widget> breakpoints;
  final Map<String, double> customBreakpoints;

  ABreakpoint({
    Key? key,
    required this.breakpoints,
    this.customBreakpoints = const {},
  }) : super(key: key);

  final Map<String, double> defaultBreakpoints = {
    'xs': 0,
    'sm': 600,
    'md': 960,
    'lg': 1280,
    'xl': 1920,
  };

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = context.width;
        final mergedBreakpoints = {...defaultBreakpoints, ...customBreakpoints};
        final sortedBreakpoints = mergedBreakpoints.entries.toList()
          ..sort((a, b) => b.value.compareTo(a.value));

        for (var entry in sortedBreakpoints) {
          if (width >= entry.value && breakpoints.containsKey(entry.key)) {
            return breakpoints[entry.key]!;
          }
        }

        // Fallback to the smallest breakpoint if no match is found
        return breakpoints[sortedBreakpoints.last.key] ?? Container();
      },
    );
  }
}