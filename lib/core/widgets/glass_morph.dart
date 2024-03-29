import 'package:flutter/material.dart';

class GlassMorph extends StatelessWidget {
  final String? name;
  final String? email;
  final String? commitMessage;

  const GlassMorph({
    super.key,
    this.name,
    this.email,
    this.commitMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white10.withAlpha(50)),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withAlpha(30),
            blurRadius: 10.0,
            spreadRadius: 0.0,
          ),
        ],
        color: Colors.white.withOpacity(0.2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Name: ${name ?? "Not Found"}',
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Email: ${email ?? "Not Found"}',
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Message: ${commitMessage ?? "Not Found"}',
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
