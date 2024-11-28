import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/api_provider.dart';

class FavPage extends StatelessWidget {
  const FavPage({super.key});

  @override
  Widget build(BuildContext context) {
    ApiProvider apiProvider = Provider.of<ApiProvider>(context, listen: false);
    ApiProvider apiProviderTrue =
        Provider.of<ApiProvider>(context, listen: true);
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(''))),
        child: ListView.builder(
          itemCount: apiProvider.weather.length,
          itemBuilder: (context, index) => Card(
              child: ListTile(
            title: Text('${apiProviderTrue.weather[index]}'),
          )),
        ),
      ),
    );
  }
}
