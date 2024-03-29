import 'package:assignment1/core/common/entities/api_model.dart';
import 'package:assignment1/feature/detailscreen/presentation/details_page.dart';
import 'package:flutter/material.dart';

class DataCard extends StatelessWidget {
  final Repos data;
  final Color color;
  const DataCard({
    super.key,
    required this.data,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailsPage(name: data.name ?? "")));
      },
      child: Container(
        margin: const EdgeInsets.all(16).copyWith(
          bottom: 4,
        ),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      data.language != null
                          ? Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Chip(label: Text(data.language!)),
                            )
                          : const Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Chip(
                                label: Text("No Language Available"),
                              ),
                            )
                    ],
                  ),
                ),
                Text(
                  data.name ?? "",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Text(
              "Allow Forking: ${data.allowForking.toString().toUpperCase()}",
            ),
          ],
        ),
      ),
    );
  }
}
