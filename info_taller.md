Wifi: Campus Community_Fast
Pass: WelcomeBack

PARTE 1 - FLUTTER


REPO
https://github.com/omartinma/workshop_flutter/



INSTALL FLUTTER
https://docs.flutter.dev/get-started/install




VS Extensions
https://marketplace.visualstudio.com/items?itemName=FelixAngelov.bloc
Awesome Flutter Snippets



INSTALL VERY_GOOD CLI
$ dart pub global activate very_good_cli




Gif Url:
https://media2.giphy.com/media/R6gvnAxj2ISzJdbA63/giphy.gif?cid=9f49c3a5wj2g5mr3rt8fybhl1hthpkoa2fvm91keggua6ug7&rid=giphy.gif&ct=g














PARTE 2 - BLOC



WEB BLOC
https://bloclibrary.dev/#/




GIST BLOC
https://gist.github.com/jamesblasco/2b1dbf64e795a6a95a7a88027a934c5a




PARTE 3 - API


Giphy url
https://developers.giphy.com/docs/clips/

Endpoint
final url =    'https://api.giphy.com/v1/gifs/search?api_key=$_apiKey&limit=25&rating=g&lang=en&q=$query';



final gifsJson = json.decode(response.body) as Map<String, dynamic>;
final data = gifsJson['data'] as List<dynamic>;
return data.map((e) => Gif.fromJson(e as Map<String, dynamic>)).toList();



factory Gif.fromJson(Map<String, dynamic> data) {
   final images = data['images'] as Map<String, dynamic>;
   final originalMapImage = images['original'] as Map<String, dynamic>;
   final url = originalMapImage['url'] as String;
   return Gif(image: url);
 }
EXTRA: SHARE


 final file = await DefaultCacheManager().getSingleFile(url);
 await Share.shareXFiles([XFile(file.path)]);



















PARTE 1:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class GifListPage extends StatelessWidget {
  const GifListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GifListView();
  }
}

class GifListView extends StatelessWidget {
  const GifListView({super.key});

  @override
  Widget build(BuildContext context) {
    final gifs = [
      'https://media2.giphy.com/media/R6gvnAxj2ISzJdbA63/giphy.gif?cid=9f49c3a5wj2g5mr3rt8fybhl1hthpkoa2fvm91keggua6ug7&rid=giphy.gif&ct=g',
      'https://media2.giphy.com/media/R6gvnAxj2ISzJdbA63/giphy.gif?cid=9f49c3a5wj2g5mr3rt8fybhl1hthpkoa2fvm91keggua6ug7&rid=giphy.gif&ct=g',
      'https://media2.giphy.com/media/R6gvnAxj2ISzJdbA63/giphy.gif?cid=9f49c3a5wj2g5mr3rt8fybhl1hthpkoa2fvm91keggua6ug7&rid=giphy.gif&ct=g',
      'https://media2.giphy.com/media/R6gvnAxj2ISzJdbA63/giphy.gif?cid=9f49c3a5wj2g5mr3rt8fybhl1hthpkoa2fvm91keggua6ug7&rid=giphy.gif&ct=g',
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gifs'),
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 48),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: CupertinoSearchTextField(
              onChanged: (value) {},
            ),
          ),
        ),
      ),
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          final gif = gifs[index];
          return Image.network(gif);
        },
        itemCount: gifs.length,
      ),
    );
  }
}




 cupertino_icons: ^1.0.5
dependencies:
 bloc: ^8.1.0
 flutter:
   sdk: flutter
 flutter_bloc: ^8.1.1
 flutter_localizations:
   sdk: flutter
 intl: ^0.17.0
 cupertino_icons: ^1.0.5
 equatable: ^2.0.5

