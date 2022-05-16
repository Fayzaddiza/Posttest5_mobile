import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: splashScreen(),
    );
  }
}

class splashScreen extends StatefulWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    super.initState();
    start();
  }

  start() {
    return Timer(
      Duration(seconds: 5),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => firstpage(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f4f9),
      body: Center(
        child: Image.asset(
          "assets/logo emas.png",
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
      ),
    );
  }
}

class firstpage extends StatefulWidget {
  const firstpage({Key? key}) : super(key: key);

  @override
  State<firstpage> createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {
  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    var tinggi = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Fayza Virdana Addiza"),
        backgroundColor: Color(0xffc1bddc),
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.normal,
          color: Color(0xff000000),
        ),
      ),
      backgroundColor: Color(0xff687189),
      body: ListView(children: [
        Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Column(
            children: [
              Text(
                "\nCity Car Rental \nSamarinda",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff1e2534),
                ),
              ),
              Text(
                "\nBerdiri sejak 2017. \nMelayani penyewaan mobil lepas kunci, \nuntuk penyewaan mobil dan driver \nharap hubungi lebih lanjut.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xfff5f4f9),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          width: lebar,
                          height: tinggi / 2,
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/toyota agya matic.jpg")),
                          ),
                        ),
                        Container(
                          width: lebar,
                          height: tinggi / 2,
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/honda jazz matic.jpg")),
                          ),
                        ),
                        Container(
                          width: lebar,
                          height: tinggi / 2,
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/toyota avanza matic.jpg")),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      order(),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ]),
      ]),
    );
  }
}

class order extends StatefulWidget {
  const order({Key? key}) : super(key: key);

  @override
  State<order> createState() => _orderState();
}

class _orderState extends State<order> {
  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    var tinggi = MediaQuery.of(context).size.height;
    return Container(
      width: lebar / 2,
      height: 70,
      margin: EdgeInsets.only(top: 10, bottom: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Color(0xfff5f4f9), borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Icon(Icons.car_rental),
        title: Text("Order Now"),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) {
              return page();
            }),
          );
        },
      ),
    );
  }
}

class page extends StatefulWidget {
  const page({Key? key}) : super(key: key);

  @override
  State<page> createState() => _pageState();
}

enum Sizechart { unknown, sim, ktp, motor }

class _pageState extends State<page> {
  Sizechart jaminan = Sizechart.unknown;
  String nama = "", NIK = "", alamat = "";
  TextEditingController controllerNama = TextEditingController();
  TextEditingController controllerNIK = TextEditingController();
  TextEditingController controllerAlamat = TextEditingController();

  String getSizechart(Sizechart? value) {
    if (value == Sizechart.sim) {
      return "SIM";
    } else if (value == Sizechart.ktp) {
      return "KTP";
    } else if (value == Sizechart.motor) {
      return "Motor";
    }
    return "Wajib memiliki jaminan";
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controllerNama.dispose();
    controllerNIK.dispose();
    controllerAlamat.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    var tinggi = MediaQuery.of(context).size.height;

    Widget welcom = Row(
      children: [
        Text(
          "\nCITY CAR RENTAL SAMARINDA",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: Color(0xff000000),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Fayza Virdana Addza"),
        backgroundColor: Color(0xffc1bddc),
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color(0xff000000),
        ),
      ),
      backgroundColor: Color(0xfff5f4f9),
      body: ListView(children: [
        welcom,
        SizedBox(height: 50),
        TextField(
          controller: controllerNama,
          decoration: InputDecoration(
            labelText: "Nama",
            hintText: "Masukkan nama sesuai yang ada di KTP anda",
            border: OutlineInputBorder(),
            fillColor: Color(0xff000000),
          ),
        ),
        SizedBox(height: 10),
        TextFormField(
          controller: controllerNIK,
          decoration: InputDecoration(
            labelText: "NIK",
            hintText: "Masukkan NIK yang sesuai di KTP anda",
            border: OutlineInputBorder(),
            fillColor: Color(0xff000000),
          ),
        ),
        SizedBox(height: 10),
        TextFormField(
          controller: controllerAlamat,
          decoration: InputDecoration(
            labelText: "Alamat",
            hintText: "Masukkan alamat anda tinggal",
            border: OutlineInputBorder(),
            fillColor: Color(0xff000000),
          ),
        ),
        Text(
          "Jaminan : \n",
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: ListTile(
                title: const Text("SIM",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xff000000))),
                leading: Radio(
                  groupValue: jaminan,
                  value: Sizechart.sim,
                  onChanged: (Sizechart? value) {
                    setState(() {
                      jaminan = value!;
                    });
                  },
                ),
              ),
            ),
            Expanded(
              child: ListTile(
                title: const Text("KTP",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xff000000))),
                leading: Radio(
                  groupValue: jaminan,
                  value: Sizechart.ktp,
                  onChanged: (Sizechart? value) {
                    setState(() {
                      jaminan = value!;
                    });
                  },
                ),
              ),
            ),
            Expanded(
              child: ListTile(
                title: const Text("Motor",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xff000000))),
                leading: Radio(
                  groupValue: jaminan,
                  value: Sizechart.motor,
                  onChanged: (Sizechart? value) {
                    setState(() {
                      jaminan = value!;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              nama = controllerNama.text;
              NIK = controllerNIK.text;
              alamat = controllerAlamat.text;
            });
          },
          child: Text(
            "Submit",
            style: TextStyle(
              fontSize: 20,
              color: Color(0xff000000),
            ),
          ),
          style: TextButton.styleFrom(
              backgroundColor: Color(0xff687189), alignment: Alignment.center),
          onLongPress: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) {
                return thirdPage();
              }),
            );
          },
        ),
        SizedBox(height: 25),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context, MaterialPageRoute(builder: (_) {
              return firstpage();
            }));
          },
          child: Text("Cancel"),
          style: TextButton.styleFrom(
              backgroundColor: Color(0xff1e2534), alignment: Alignment.center),
        )
      ]),
    );
  }
}

class thirdPage extends StatefulWidget {
  const thirdPage({Key? key}) : super(key: key);

  @override
  State<thirdPage> createState() => _thirdPageState();
}

class _thirdPageState extends State<thirdPage> {
  final List<BottomNavigationBarItem> _bottomItem = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: "home",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: "profil",
    ),
  ];

  final List<Tab> _myTabBars = [
    Tab(text: "Keranjang"),
    Tab(text: "Menu"),
  ];

  final List<Icon> _myTabBarView = [
    Icon(Icons.shop),
    Icon(Icons.home),
  ];

  int indexBottom = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _myTabBars.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffc1bddc),
          title: Text(
            "City Car Rental",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.normal,
              color: Color(0xff000000),
            ),
          ),
          bottom: TabBar(
            tabs: _myTabBars,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: indexBottom,
          onTap: (int index) {
            setState(() {
              indexBottom = index;
            });
          },
          items: _bottomItem,
        ),
        body: TabBarView(
          children: _myTabBarView,
        ),
      ),
    );
  }
}
