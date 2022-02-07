import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:shoes_shop_ui/consts.dart';
import 'package:shoes_shop_ui/models/cart_model.dart';
import 'package:shoes_shop_ui/pages/myhomepage.dart';

class CheckoutPage extends StatefulWidget {
  final List<CartModel> cartModel;
  const CheckoutPage({Key? key, required this.cartModel}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  var isloading = false;
  @override
  Widget build(BuildContext context) {
    var _screenheight = MediaQuery.of(context).size.height;
    var _screenwidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: bleu,
          leading: Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.chevron_left,
                size: 40,
              ),
            ),
          ),
        ),
        body: Container(
          color: bleu,
          width: _screenwidth,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 8,
                  child: ClipPath(
                    clipper: MovieTicketClipper(),
                    child: Container(
                      color: white,
                      width: _screenwidth * .8,
                      height: _screenheight * .7,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/shop.png',
                              width: 80,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Shoes Shop',
                              style: style.copyWith(
                                  color: Colors.black, fontSize: 16),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              '\$$total',
                              maxLines: 1,
                              style: style.copyWith(
                                  color: Colors.black, fontSize: 40),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Divider(
                              color: Colors.grey,
                              thickness: 1,
                              endIndent: 10,
                              indent: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: Row(
                                children: [
                                  Text(
                                    DateTime.now().toString().substring(0, 16),
                                    style: style.copyWith(
                                        fontSize: 12, color: Colors.black),
                                  ),
                                  const Spacer(),
                                  Text(
                                    'Visa #3246445',
                                    style: style.copyWith(
                                        fontSize: 12, color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                            const Divider(
                              color: Colors.grey,
                              indent: 10,
                              endIndent: 10,
                              thickness: 1,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Expanded(
                                flex: 2,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: widget.cartModel.length,
                                    itemBuilder: (context, index) {
                                      return _builditems(
                                          name: widget.cartModel[index].name,
                                          price: widget.cartModel[index].price,
                                          items: widget.cartModel[index].items);
                                    })),
                            const SizedBox(
                              height: 15,
                            ),
                            Expanded(
                                flex: 1,
                                child: Column(
                                  children: const [
                                    Text('www.shoesshop.com'),
                                    Text('0983645537'),
                                  ],
                                )),
                            const SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                _buildbutton(_screenheight, _screenwidth),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Expanded _buildbutton(double _screenheight, _screenwidth) {
    return Expanded(
      child: Container(
        width: _screenwidth * .6,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: white),
        child: MaterialButton(
          onPressed: () {
            setState(() {
              isloading = true;
            });
            Future.delayed(const Duration(seconds: 3)).then((value) {
              setState(() {
                isloading = false;
              });
              _buildawesomedialog();
            });
          },
          child: (isloading)
              ? const CircularProgressIndicator()
              : Text(
                  'Pay Now',
                  style: style.copyWith(fontSize: 18, color: Colors.black),
                ),
        ),
      ),
    );
  }

  _buildawesomedialog() {
    return AwesomeDialog(
            context: context,
            animType: AnimType.SCALE,
            dialogType: DialogType.SUCCES,
            title: 'Success Payment',
            btnOkText: 'OK',
            btnOkIcon: Icons.check,
            dismissOnBackKeyPress: false,
            btnOkOnPress: () {
              boughtitems.clear();
              total = 0.0;
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) => const MyHomePage()));
            },
            btnOkColor: Colors.green,
            buttonsBorderRadius: BorderRadius.circular(20))
        .show();
  }

  Widget _builditems(
      {required String name, required double price, required int items}) {
    return Align(
      alignment: Alignment.topCenter,
      child: Row(
        children: [
          Text(
            items > 1 ? '$name * $items' : name,
            style: style.copyWith(fontSize: 12, color: Colors.black),
          ),
          const Spacer(),
          Text(
            '\$$price',
            style: style.copyWith(fontSize: 12, color: Colors.black),
          )
        ],
      ),
    );
  }
}
