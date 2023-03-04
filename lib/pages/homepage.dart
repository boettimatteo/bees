import 'package:bees/components/apiary_card.dart';
import 'package:bees/injector/injector.dart';
import 'package:bees/models/apiary.dart';
import 'package:bees/repository/apiaries_repository.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool _loading = true;

  List<Apiary> _apiaries = [];

  @override
  void initState() {
    super.initState();

    getIt.get<ApiariesRepository>().getApiaries(page: 1).then(
      (value) {
        setState(() {
          _loading = false;
          _apiaries = value.data!.results;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Homepage"),
      ),
      body: SizedBox(
        height: 256,
        child: _loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: _apiaries.length,
                padding: const EdgeInsets.all(16),
                itemBuilder: (context, index) {
                  final Apiary apiary = _apiaries[index];

                  return ApiaryCard(
                    apiary: apiary,
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 16);
                },
              ),
      ),
    );
  }
}
