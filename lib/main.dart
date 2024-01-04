import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var mController = TextEditingController();
  var custController = TextEditingController();
  var mPlus = 1;
  var mTip = 0.0;
  var totBill = 0.0;
  var totPerson = 0.0;
  var totCustom = 0.0;

  CreateAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Custom Tip'),
            backgroundColor: Color(0xff00CABE),
            content: TextField(
              controller: custController,
            ),
            actions: <Widget>[
              MaterialButton(
                elevation: 5.0,
                child: Text('Tapped'),
                onPressed: () {
                  Navigator.of(context).pop(custController.text.toString());
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F3F4),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/tip_cap.jpg'),
                  Column(
                    children: [
                      Row(children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(
                            'Mr',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                        ),
                        Text(
                          'TIP',
                          style: TextStyle(
                              fontSize: 32, fontWeight: FontWeight.w700),
                        )
                      ]),
                      Text(
                        'Calculator',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(34.0),
              child: Container(
                width: double.infinity,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 11.0),
                      child: Text(
                        'Total p/person',
                        style: TextStyle(
                            fontSize: 21, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 21.0),
                          child: Icon(Icons.currency_rupee, size: 35),
                          // child: Text(
                          //   '\$',
                          //   style: TextStyle(
                          //       fontSize: 35, fontWeight: FontWeight.w700),
                          // ),
                        ),
                        Text(
                          (totPerson.toStringAsFixed(2)),
                          style: TextStyle(
                              fontSize: 65, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                      child: Container(
                        width: double.infinity,
                        height: 1,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(
                                  'Total bill',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 10),
                                      child: Icon(
                                        Icons.currency_rupee,
                                        size: 20,
                                        color: Color(0xff00CABE),
                                      ),
                                      // child: Text(
                                      //   '\$',
                                      //   style: TextStyle(
                                      //     fontSize: 16,
                                      //     fontWeight: FontWeight.w700,
                                      //     color: Color(0xff00CABE),
                                      //   ),
                                      // ),
                                    ),
                                    Text(
                                      totBill.toString(),
                                      style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff00CABE),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(
                                  'Total tip',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(top: 10),
                                        child: Icon(
                                          Icons.currency_rupee,
                                          size: 20,
                                          color: Color(0xff00CABE),
                                        )
                                        // child: Text(
                                        //   '\$',
                                        //   style: TextStyle(
                                        //     fontSize: 16,
                                        //     fontWeight: FontWeight.w700,
                                        //     color: Color(0xff00CABE),
                                        //   ),
                                        // ),
                                        ),
                                    Text(
                                      mTip.toString(),
                                      style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff00CABE),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(21),
                  color: Colors.white,
                ),
                //
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0, top: 10.0),
                        child: Text(
                          'Enter   ',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          'your bill',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 25.0),
                      child: TextField(
                        controller: mController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.currency_rupee,
                            color: Colors.black,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(color: Color(0xffffffff))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                  color: Color(0xffffffff), width: 2)),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0, top: 10.0),
                        child: Text(
                          'Choose   ',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 0.0),
                        child: Text(
                          'your tip',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 11,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: InkWell(
                                onTap: () {
                                  mTip = (double.parse(
                                          mController.text.toString())) *
                                      0.1;
                                  updateAmt();
                                  setState(() {});
                                },
                                child: Container(
                                  child: Center(
                                    child: Text(
                                      '10%',
                                      style: TextStyle(
                                        fontSize: 21,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  width: 65,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Color(0xff00CABE),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 11,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: InkWell(
                                onTap: () {
                                  mTip = (double.parse(
                                          mController.text.toString())) *
                                      0.15;
                                  updateAmt();
                                  setState(() {});
                                },
                                child: Container(
                                  child: Center(
                                    child: Text(
                                      '15%',
                                      style: TextStyle(
                                        fontSize: 21,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  width: 65,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Color(0xff00CABE),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 11,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: InkWell(
                                onTap: () {
                                  mTip = (double.parse(
                                          mController.text.toString())) *
                                      0.2;
                                  updateAmt();
                                  setState(() {});
                                },
                                child: Container(
                                  child: Center(
                                    child: Text(
                                      '20%',
                                      style: TextStyle(
                                        fontSize: 21,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  width: 65,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Color(0xff00CABE),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Center(
                            child: InkWell(
                              onTap: () {},
                              child: InkWell(
                                onTap: () {
                                  // add popup reference
                                  CreateAlertDialog(context);
                                },
                                child: Container(
                                  child: Center(
                                    child: Text(
                                      'Custom tip',
                                      style: TextStyle(
                                        fontSize: 21,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  width: 250,
                                  height: 55,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Color(0xff00CABE),
                                  ),
                                ),
                              ),
                            ),
                            /*child: TextField(
                              controller: mController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(0xff00CABE),
                                label: Center(
                                  child: Text('Custom tip',style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 21,
                                    color: Colors.white
                                  ),),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide:
                                        BorderSide(color: Color(0xffffffff))),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                        color: Color(0xffffffff), width: 2)),
                              ),
                            ),*/
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 10.0),
                        child: Text(
                          'Split   ',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          'the total',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 25.0),
                      child: Row(
                        children: [
                          Expanded(
                              child: InkWell(
                            onTap: () {
                              if (mPlus > 1) {
                                mPlus--;
                                updateAmt();
                                setState(() {});
                              }
                            },
                            child: Container(
                              child: Center(
                                child: Text(
                                  '-',
                                  style: TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              decoration: BoxDecoration(
                                  color: Color(0xff00CABE),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5.0),
                                      bottomLeft: Radius.circular(5.0))),
                              height: 50,
                            ),
                          )),
                          Expanded(
                              flex: 2,
                              child: Container(
                                child: Center(
                                  child: Text(
                                    mPlus.toString(),
                                    style: TextStyle(
                                      fontSize: 21,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                height: 50,
                                color: Colors.white,
                              )),
                          Expanded(
                              child: InkWell(
                            onTap: () {
                              mPlus++;
                              updateAmt();
                              setState(() {});
                            },
                            child: Container(
                              child: Center(
                                child: Text(
                                  '+',
                                  style: TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              decoration: BoxDecoration(
                                  color: Color(0xff00CABE),
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(5.0),
                                      bottomRight: Radius.circular(5.0))),
                              height: 50,
                            ),
                          )),
                        ],
                      ),

                      /*child: TextField(
                        controller: mController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.currency_rupee),
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide:
                              BorderSide(color: Color(0xffffffff))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                  color: Color(0xffffffff), width: 2)),
                        ),
                      ),*/
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void updateAmt() {
    if (mController.text.toString() != null) {
      totBill = int.parse(mController.text.toString()) +
          double.parse(mTip.toString());
      totPerson = (totBill / double.parse(mPlus.toString()));
      totCustom = (totBill + int.parse(mController.text.toString()));
      setState(() {});
    }
  }
}
