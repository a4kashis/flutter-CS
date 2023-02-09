import 'package:flutter/material.dart';
import 'package:flutter_authentication/edit_screen.dart';
import 'package:photo_view/photo_view_gallery.dart';

import 'galleryhome.dart';

class GalleryWidget extends StatefulWidget {

  final List<String> urlImages;
  final int index;
  final PageController pageController;
  // ignore: use_key_in_widget_constructors
  GalleryWidget({
    required this.urlImages,
    this.index = 0,
  }) : pageController = PageController(initialPage: index);
  @override
  State<GalleryWidget> createState() => _GalleryWidgetState();
}
class _GalleryWidgetState extends State<GalleryWidget> {
  var urlImage;
  int bottomIndex = 0;

  @override
  void initState() {
    // provider = AssetImage(widget.urlImages[widget.index]);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: whitecolor,
        centerTitle: true,
        title: const Text(
          'Gallery',
          style: TextStyle(color: blackcolor),
        ),
        iconTheme: const IconThemeData(color: blackcolor),
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: PhotoViewGallery.builder(
              pageController: widget.pageController,
              itemCount: widget.urlImages.length,
              builder: (context, index) {
                urlImage = widget.urlImages[index];
                return PhotoViewGalleryPageOptions(
                  imageProvider: AssetImage(urlImage),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (e) {
          setState(() {
            bottomIndex = e;
            if (e == 1) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EditScreen(image: urlImage)));
            }
          });
        },
        currentIndex: bottomIndex,
        backgroundColor: Colors.white,
        iconSize: 30,
        selectedItemColor: Colors.black,
        unselectedIconTheme: const IconThemeData(
          color: Colors.black38,
        ),
        elevation: 0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.share), label: 'Share'),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: 'Edit',
          ),
        ],
      ),
    );
  }
}
