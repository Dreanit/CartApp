import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var dishName = [];
  var customisation = [];
  var price = [];
  late String customText;
  String dropdownValue = 'One';
  int quantity0 = 1;
  int quantity1 = 1;
  bool custom1 = true;
  bool custom2 = true;
  bool container1 = true;
  bool container2 = true;
  @override
  void initState() {
    refreshUsers();
    super.initState();
  }

  Future refreshUsers() async {
    Uri uri = Uri.parse('http://demo3755793.mockable.io/dish');
    final response = await http.get(uri);
    var data = json.decode(response.body);

    dishName = [];
    customisation = [];
    price = [];

    setState(() {
      for (var i = 0; i < data.length; i++) {
        dishName.add(data[i]['dish_name']);
        customisation.add(data[i]['customisation']);
        price.add(data[i]['price']);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var totalPrice;
    totalPrice = quantity0 * price[0] + quantity1 * price[1];
    return Scaffold(
      appBar: _appBar(),
      body: Container(
        color: const Color(0xffe5e2e2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                padding: const EdgeInsets.all(10.0),
                width: MediaQuery.of(context).size.width,
                height: (custom2) && (custom1)
                    ? 175
                    : container1 && container2
                        ? 200
                        : container1 || container2
                            ? 125
                            : 0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    container1 ? dishContainer(context, 0) : Container(),
                    const SizedBox(
                      height: 20.0,
                    ),
                    container2 ? dishContainer(context, 1) : Container(),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: const Text(
                'Offers & Benefits',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
              ),
              padding: const EdgeInsets.only(left: 20),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.white,
                ),
                height: 70,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 15.0,
                    ),
                    Column(
                      children: const [
                        SizedBox(height: 15.0),
                        Text(
                          'Apply Coupon',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              fontFamily: 'Signa'),
                        ),
                        Text(
                          'Save \u{20B9}144 with Party ',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              fontFamily: 'Signa'),
                        )
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2.2,
                    ),
                    IconButton(
                      icon: const Icon(Icons.keyboard_arrow_right),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.white,
              height: 150,
              child: Column(
                children: [
                  const SizedBox(height: 10.0),
                  Row(
                    children: [
                      const SizedBox(width: 10.0),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.4,
                        child: Column(
                          children: const [
                            Text(
                              'Deliver to Anand Vihar | 53 MIN',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Signa'),
                            ),
                            Text(
                              ' Footover Bridge, Plot Alpha, Isbt Anand Vihar, Anand Vihar, Delhi, 110092',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Signa'),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(color: Colors.grey)),
                        child: Row(
                          children: [
                            IconButton(
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                              icon: const Icon(
                                IconData(0xf733,
                                    fontFamily: 'CupertinoIcons',
                                    fontPackage: 'cupertino_icons'),
                                color: Colors.orange,
                              ),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: Colors.orange,
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: List.generate(
                        150 ~/ 10,
                        (index) => Expanded(
                              child: Container(
                                color: index % 2 == 0
                                    ? Colors.transparent
                                    : Colors.grey,
                                height: 1 / 2,
                              ),
                            )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '\u{20B9}$totalPrice',
                              style: const TextStyle(
                                  fontSize: 25,
                                  color: Colors.black,
                                  fontFamily: 'Signa'),
                            ),
                            const Text(
                              'View Detailed Bill',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.green,
                                  fontFamily: 'Signa',
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 5.5,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: 200,
                              height: 60,
                              child: FlatButton(
                                color: Colors.green,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0)),
                                child: const Text(
                                  'Proceed to Pay',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontFamily: 'Signa'),
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ],
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

  dishContainer(BuildContext context, int index) {
    List<dynamic> custom = customisation[index];
    return Row(
      children: [
        Stack(
          children: const [
            Icon(
              Icons.crop_square_sharp,
              color: Colors.green,
              size: 25,
            ),
            Icon(Icons.circle, color: Colors.green, size: 10),
          ],
          alignment: Alignment.center,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: Text(
                '${dishName[index]}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontFamily: 'Signa', fontWeight: FontWeight.w500),
              ),
              width: MediaQuery.of(context).size.width / 2.5,
            ),
            index == 0
                ? custom1
                    ? const SizedBox()
                    : SizedBox(
                        child: Text(
                          '${customisation[index]}',
                          style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                              fontFamily: 'Signa'),
                          overflow: TextOverflow.ellipsis,
                        ),
                        width: MediaQuery.of(context).size.width / 2.5,
                      )
                : custom2
                    ? Container(
                        width: 0,
                      )
                    : SizedBox(
                        child: Text(
                          '${customisation[index]}',
                          style: const TextStyle(
                              color: Colors.grey, fontFamily: 'Signa'),
                          overflow: TextOverflow.ellipsis,
                        ),
                        width: MediaQuery.of(context).size.width / 2.5,
                      ),
            SizedBox(
              height: 20,
              width: MediaQuery.of(context).size.width / 4,
              child: DropdownButton(
                itemHeight: 100,
                underline: Container(),
                isExpanded: true,
                items: custom
                    .map(
                      (value) => DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    (index == 0) ? custom1 = false : custom2 = false;
                  });
                },
                hint: Text(
                  'customize',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 31,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Signa'),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 10.0,
        ),
        (index == 0)
            ? Container(
                padding:
                    const EdgeInsets.only(top: 1, bottom: 1, left: 2, right: 2),
                constraints: const BoxConstraints(),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10.0)),
                child: Row(
                  children: [
                    IconButton(
                      padding: const EdgeInsets.all(2),
                      constraints: const BoxConstraints(),
                      icon: const Icon(Icons.remove),
                      color: Colors.blue,
                      onPressed: (quantity0 == 1)
                          ? () {
                              setState(() {
                                quantity0 = 0;
                                container1 = false;
                              });
                            }
                          : () {
                              setState(() {
                                quantity0--;
                              });
                            },
                    ),
                    Text('$quantity0'),
                    IconButton(
                      padding: const EdgeInsets.only(
                          top: 1, bottom: 1, left: 2, right: 2),
                      constraints: const BoxConstraints(),
                      icon: const Icon(Icons.add),
                      color: Colors.blue,
                      onPressed: (quantity0 == 5)
                          ? () {}
                          : () {
                              setState(() {
                                quantity0++;
                              });
                            },
                    ),
                  ],
                ),
              )
            : Container(
                padding:
                    const EdgeInsets.only(top: 1, bottom: 1, left: 2, right: 2),
                constraints: const BoxConstraints(),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10.0)),
                child: Row(
                  children: [
                    IconButton(
                      padding: const EdgeInsets.only(
                          top: 1, bottom: 1, left: 2, right: 2),
                      constraints: const BoxConstraints(),
                      icon: const Icon(Icons.remove),
                      color: Colors.blue,
                      onPressed: (quantity1 == 1)
                          ? () {
                              setState(() {
                                quantity1 = 0;
                                container2 = false;
                              });
                            }
                          : () {
                              setState(() {
                                quantity1--;
                              });
                            },
                    ),
                    Text('$quantity1'),
                    IconButton(
                      padding: const EdgeInsets.only(
                          top: 1, bottom: 1, left: 2, right: 2),
                      constraints: const BoxConstraints(),
                      icon: const Icon(Icons.add),
                      color: Colors.blue,
                      onPressed: (quantity1 == 5)
                          ? () {}
                          : () {
                              setState(() {
                                quantity1++;
                              });
                            },
                    ),
                  ],
                ),
              ),
        SizedBox(width: MediaQuery.of(context).size.width / 12),
        Text('\u{20B9}${price[index]}')
      ],
    );
  }

  _appBar() {
    return AppBar(
      backgroundColor: const Color(0xffF0EFF4),
      leading: const BackButton(color: Colors.black),
      title: const Text(
        "Behrouz Biryani",
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
