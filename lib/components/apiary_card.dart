import 'package:bees/models/apiary.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ApiaryCard extends StatelessWidget {
  final Apiary apiary;

  const ApiaryCard({
    super.key,
    required this.apiary,
  });

  @override
  Widget build(BuildContext context) {
    final weights = apiary.getWeights();

    return SizedBox(
      height: 256,
      width: 256,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(8),
          side: const BorderSide(
            width: 2,
            color: Colors.green,
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            apiary.imageUrl != null
                ? Positioned.fill(
                    child: Image.network(
                      apiary.imageUrl!,
                      fit: BoxFit.cover,
                    ),
                  )
                : const Placeholder(
                    color: Colors.green,
                  ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    apiary.name,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  const Spacer(),
                  if (weights != null && weights.isNotEmpty)
                    Text(
                      "${(weights.values.first as double).toStringAsPrecision(1)} KG",
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: Colors.white,
                              ),
                    ),
                  if (weights != null && weights.isNotEmpty)
                    Text(
                      DateFormat("dd MMMM").format(
                        DateTime.fromMillisecondsSinceEpoch(
                          int.parse(weights.keys.first) * 1000,
                        ),
                      ),
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: Colors.white,
                              ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
