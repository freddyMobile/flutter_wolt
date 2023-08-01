import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import './constants/url_constants.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

void main() => runApp(const CarouselImages());

class CarouselImages extends StatelessWidget {
  const CarouselImages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text(
            'Wolt',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.notifications,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: CarouselSlider.builder(
                  itemCount: images.length,
                  options: CarouselOptions(
                    viewportFraction: 1,
                    height: 200,
                    autoPlay: true,
                    enlargeCenterPage: false,
                    enableInfiniteScroll: true,
                    initialPage: 0,
                    autoPlayInterval: const Duration(seconds: 5),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                  ),
                  itemBuilder: (context, index, realIndex) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                        ),
                        child: Image.network(
                          images[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      'Popular right now',
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: images.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(
                              images[index],
                              width: 200,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      'Late lunch near you',
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: imagesOfFood.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(
                              imagesOfFood[index],
                              width: 200,
                              height: 400,
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: GNav(
            backgroundColor: Colors.black.withOpacity(0.8),
            color: Colors.blue,
            activeColor: Colors.blue,
            tabs: const [
              GButton(icon: Icons.home),
              GButton(icon: Icons.restaurant),
              GButton(icon: Icons.store),
              GButton(icon: Icons.search),
              GButton(icon: Icons.person),
            ]),
      ),
    );
  }
}
