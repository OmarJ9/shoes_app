import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:shoes_shop_ui/consts.dart';
import 'package:shoes_shop_ui/pages/details_page.dart';

class MyFavorite extends StatefulWidget {
  const MyFavorite({Key? key}) : super(key: key);

  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyFavorite> {
  @override
  Widget build(BuildContext context) {
    var _screenheight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.chevron_left,
              size: 30,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            'My Favorite',
            style: style.copyWith(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          elevation: 0,
        ),
        body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: favouriteitems.isNotEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: _screenheight * .8,
                          child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: favouriteitems.length,
                              itemBuilder: (context, index) {
                                return index % 2 == 0
                                    ? BounceInRight(
                                        child: _buildfavoriteitem(index: index))
                                    : BounceInLeft(
                                        child:
                                            _buildfavoriteitem(index: index));
                              })),
                    ],
                  )
                : Center(
                    child: Text(
                      'Nothing To Show',
                      style: style.copyWith(
                        color: Colors.black,
                        fontSize: 24,
                      ),
                    ),
                  )),
      ),
    );
  }

  Widget _buildfavoriteitem({required int index}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => DetailsPage(item: favouriteitems[index])))
            .then((value) {
          setState(() {});
        });
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                blurRadius: 10,
                color: Colors.grey,
                offset: Offset(0, 10),
              ),
            ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: favouriteitems[index].color),
                child: Image.asset(
                  favouriteitems[index].img,
                  fit: BoxFit.cover,
                  width: 80,
                )),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  favouriteitems[index].name,
                  maxLines: 1,
                  style: style.copyWith(fontSize: 16, color: Colors.black),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '\$${favouriteitems[index].price}',
                  maxLines: 1,
                  style: style.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ],
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                setState(() {
                  favouriteitems[index].isselected = false;
                  favouriteitems.remove(favouriteitems[index]);
                });
              },
              child: const Icon(
                Icons.favorite_sharp,
                color: red,
                size: 40,
              ),
            )
          ],
        ),
      ),
    );
  }
}
