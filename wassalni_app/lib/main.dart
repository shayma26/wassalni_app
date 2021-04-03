import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          child: Stack(
            children: [
              new FlutterMap(
                  options: new MapOptions(
                    minZoom: 10.0,
                    center: new LatLng(35.8245, 10.6346),
                    onLongPress: (point) => print("la postion est " +
                        point.latitude.toString() +
                        " et la latitude est: " +
                        point.longitude.toString()),
                  ), //first view

                  layers: [
                    new TileLayerOptions(
                        urlTemplate:
                            'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                        subdomains: ['a', 'b', 'c']),
                    new MarkerLayerOptions(markers: [
                      new Marker(
                          width: 45.0,
                          height: 45.0,
                          point: new LatLng(35.8245, 10.6346),
                          builder: (context) => new Container(
                                child: IconButton(
                                    icon: Icon(Icons.place, size: 30.0, color: Colors.orange[900]),
                                    onPressed: () {
                                      print('Marker tapped!');
                                    }),
                              ))
                    ])
                  ]),
              SafeArea(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 250.0,
                      height: 45.0,
                      child: PhysicalModel(
                        color: Colors.transparent,
                        elevation: 9.0,
                        shadowColor: Colors.black54,
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10.0),
                            hintText: "...لوّج على بلاصة",
                            hintStyle: TextStyle(color: Colors.grey[400]),
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 0.0),
                              borderRadius: BorderRadius.all(
                                Radius.circular(30.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    PhysicalModel(
                        color: Colors.transparent,
                        elevation: 10.0,
                        shadowColor: Colors.black26,
                        child: Container(
                          height: 45.0,
                          width: 45.0,
                          margin: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(19.0),
                            color: Colors.white,
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.near_me_outlined,
                              color: Colors.black87,
                            ),
                            onPressed: () {},
                          ),
                        ))
                  ],
                ),
              ),
              DraggableScrollableSheet(
                initialChildSize: 0.60,
                maxChildSize: 0.7,
                builder:
                    (BuildContext context, ScrollController scrollController) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Stack(
                      children: <Widget>[
                        ListView(
                          padding: EdgeInsets.all(20),
                          controller: scrollController,
                          children: [
                            Text(
                              'وين على خير؟',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 30, 
                                  fontFamily: 'Amiri',
                                  fontWeight: FontWeight.bold),
                            ),
                            MyForm(),
                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.only(top: 5.0),
                              width: 50,
                              height: 70,
                              child: Date_picker(),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 20.0),
                              padding: const EdgeInsets.only(top: 5.0),
                              child: SizedBox(
                                width: 300,
                                height: 55,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.black87,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    "يلّا بينا",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      ),
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  MyFormState createState() {
    return MyFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyFormState extends State<MyForm> {
  List<bool> isSelected = [false, false, false];

  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xFFDEE3F1),
            border: Border.all(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.all(Radius.circular(35.0))),
        padding: EdgeInsets.all(20.0),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 350,
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "منين",
                        contentPadding: EdgeInsets.all(10.0),
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.white, width: 0.0),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                      ),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'اكتب منين تحب تمشي';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                Container(
                  width: 350,
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "لوين",
                        contentPadding: EdgeInsets.all(10.0),
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.white, width: 0.0),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                      ),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'اكتب لوين تحب تمشي';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 35.0,
              right: 50.0,
              child: FloatingActionButton(
                onPressed: () {},
                backgroundColor: Color(0xFFF08D86),
                child: Icon(
                  Icons.import_export_rounded,
                  size: 35.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Date_picker extends StatefulWidget {
  //Date_picker({Key key, this.title}) : super(key: key);

  //final String title;

  @override
  _Date_pickerState createState() => _Date_pickerState();
}

class _Date_pickerState extends State<Date_picker> {
  DateTime selectedDate = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        IconButton(
          onPressed: () => _selectDate(context),
          color: Colors.pink[200],
          icon: Icon(Icons.event),
        ),
        SizedBox(
          height: 20.0,
        ),
        Text("${selectedDate.toLocal()}".split(' ')[0],style: TextStyle(fontWeight: FontWeight.bold),),
      ],
    );
  }
}
