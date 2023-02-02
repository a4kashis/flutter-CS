import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'gallerywidget.dart';

const whitecolor = Colors.white;
const blackcolor = Colors.black;

class GalleryHome extends StatefulWidget {
  const GalleryHome({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<GalleryHome> createState() => _GalleryHomeState();
}

class _GalleryHomeState extends State<GalleryHome> {
  final urlImages = [
    'assets/images/a.jpeg',
    'assets/images/b.jpeg',
    'assets/images/c.jpeg',
    'assets/images/d.jpeg',
    'assets/images/e.jpeg',
  ];
  var transformedImages = [];

  Future<dynamic> getSizeOfImages() async {
    transformedImages = [];
    for (int i = 0; i < urlImages.length; i++) {
      final imageObject = {};
      await rootBundle.load(urlImages[i]).then((value) => {
        imageObject['path'] = urlImages[i],
        imageObject['size'] = value.lengthInBytes,
      });
      transformedImages.add(imageObject);
    }
  }

  Future<dynamic> sortImagesByIncreseSize() async {
    transformedImages.sort((a, b) => a['size'].compareTo(b['size']));
  }
  Future<dynamic> sortImagesByDecreseSize() async {
    transformedImages.sort((b, a) => a['size'].compareTo(b['size']));
  }
  Future<dynamic> sortImagesByNamesIncrease() async {
    transformedImages.sort((a, b) => a['path'].compareTo(b['path']));
  }
  Future<dynamic> sortImagesByNamesDecrease() async {
    transformedImages.sort((b, a) => a['path'].compareTo(b['path']));
  }

  @override
  void initState() {
    getSizeOfImages();
    super.initState();
    // Refresh state once layout is loaded, gives images time to load
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: whitecolor,
        centerTitle: true,
        title: Text(
          widget.title,
          style: const TextStyle(color: blackcolor),
        ),
        iconTheme: const IconThemeData(color: blackcolor),
        actions: [GestureDetector(
          onTap: () {
            // show the dialog
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("Filter By"),
                  // content: const Text("This is my message."),
                  actions: [
                    TextButton(
                      child: Column(
                        children: const [
                          Text('By size (Ascending)'),
                        ],
                      ),
                      onPressed: () {
                        sortImagesByIncreseSize()
                            .then((value) => setState(() {}));
                        Navigator.pop(context);
                      },
                    ),
                    TextButton(
                      child: Column(
                        children: const [
                          Text('By size (descending)'),
                        ],
                      ),
                      onPressed: () {
                        sortImagesByDecreseSize()
                            .then((value) => setState(() {}));
                        Navigator.pop(context);
                      },
                    ),
                    TextButton(
                      child: Column(
                        children: const [
                          Text('By name (Ascending)'),
                        ],
                      ),
                      onPressed: () {
                        sortImagesByNamesIncrease()
                            .then((value) => setState(() {}));
                        Navigator.pop(context);
                      },
                    ),
                    TextButton(
                      child: Column(
                        children: const [
                          Text('By name (descending)'),
                        ],
                      ),
                      onPressed: () {
                        sortImagesByNamesDecrease()
                            .then((value) => setState(() {}));
                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
              },
            );
          },
          child: Container(
            margin: const EdgeInsets.only(right: 20),
            child: const Icon(Icons.more_vert),
          ),
        )],
      ),
      // Body area
      body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                  child: Container(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      decoration: const BoxDecoration(
                        color: whitecolor,
                      ),
                      child: GridView.builder(
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5,
                        ),
                        itemBuilder: (context, index) {
                          return RawMaterialButton(
                            child: InkWell(
                              child: Ink.image(
                                image: AssetImage(transformedImages[index]['path']),
                                height: 300,
                                fit: BoxFit.cover,
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => GalleryWidget(
                                        urlImages: urlImages,
                                        index: index,
                                      )));
                            },
                          );
                        },
                        itemCount: transformedImages.length,
                      )))
            ],
          )),
    );
  }
}