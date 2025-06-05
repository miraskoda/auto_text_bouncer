import 'package:auto_text_bouncer/auto_text_bouncer.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auto Text Bouncer Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DemoPage(),
    );
  }
}

class DemoPage extends StatelessWidget {
  const DemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auto Text Bouncer Demo'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Horizontal Scrolling Examples',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildExampleCard(
              context,
              'News Ticker',
              'Breaking News: Flutter 3 released with amazing features',
              Axis.horizontal,
              speed: 10,
              restTime: 1500,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 16),
            _buildExampleCard(
              context,
              'Fast Scrolling',
              'This is a fast scrolling text example... A very long text that will scroll vertically.',
              Axis.horizontal,
              speed: 30,
              restTime: 500,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Vertical Scrolling Examples',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildExampleCard(
              context,
              'Announcement',
              'Important Announcement\nPlease read carefully... '
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
                  'Integer vulputate mollis semper. Donec venenatis pulvinar sagittis.  '
                  'Morbi porta felis dui, sed vulputate tortor volutpat vitae. Sed fringilla vestibulum porta.'
                  'Phasellus tincidunt venenatis dolor, nec egestas neque scelerisque quis. '
                  'Suspendisse non arcu nec quam commodo laoreet tincidunt sed ipsum.',
              Axis.vertical,
              speed: 10,
              restTime: 1000,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 16),
            _buildExampleCard(
              context,
              'Long Text',
              'This is a very long text that will scroll vertically. '
                  'It contains multiple lines and demonstrates how the widget '
                  'handles longer content...'
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
              Axis.vertical,
              speed: 30,
              restTime: 1000,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExampleCard(
    BuildContext context,
    String title,
    String text,
    Axis axis, {
    required double speed,
    required int restTime,
    required TextStyle style,
  }) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              height: axis == Axis.vertical ? 100 : 40,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(8),
              ),
              child: ScrollingText(
                text: text,
                axis: axis,
                speed: speed,
                restTime: restTime,
                style: style,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
