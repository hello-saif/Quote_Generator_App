import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'dart:math';

import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(QuoteGeneratorApp());
}

class QuoteGeneratorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: QuotePage(),
    );
  }
}

class QuotePage extends StatefulWidget {
  @override
  _QuotePageState createState() => _QuotePageState();
}

class _QuotePageState extends State<QuotePage> {
  final List<String> _quotes = [
    "The only way to do great work is to love what you do. – Steve Jobs",
    "Innovation distinguishes between a leader and a follower. – Steve Jobs",
    "Your time is limited, don’t waste it living someone else’s life. – Steve Jobs",
    "Stay hungry, stay foolish. – Steve Jobs",
    // Add more quotes here
  ];

  String _currentQuote = '';

  void _generateQuote() {
    setState(() {
      _currentQuote = _quotes[Random().nextInt(_quotes.length)];
    });
  }

  void _shareQuote() {
    Share.share(_currentQuote); // Share the current quote
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Random Quote Generator',
          style: TextStyle(
            color: Colors.blueGrey,
          ),
        ),
        centerTitle: true,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                _currentQuote,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: _generateQuote,
                 icon: const Icon(Icons.skip_next),
                color: Colors.deepPurple,
                ),
                const SizedBox(width: 16),
                IconButton(
                  icon: const Icon(Icons.share), // Add share icon
                  onPressed: _shareQuote,
                  color: Colors.blue, // Change icon color
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
