import 'package:drinking_water/models/water.dart';
import 'package:drinking_water/state/water_state.dart';
import 'package:drinking_water/ui/components/colors.dart';
//import 'package:drinking_water/ui/components/colors.dart';
import 'package:drinking_water/ui/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: myAppBar(),
        body: Consumer<WaterState>(builder: (context, state, widget) {
          var waters = state.waters;

          return Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 100,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Row(
                        children: <Widget>[
                          Text("Bugünlük İçilen Su Miktarı: "),
                          Text(
                            state.currentWater.value.toString() + " ml",
                            textScaleFactor: 3,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    var water = waters[index];
                    return ListTile(
                      title: Text(
                        "${water.date.day}.${water.date.month}.${water.date.year}",
                        textScaleFactor: 0.9,
                      ),
                      trailing: Text(
                        "${water.value} ml",
                        textScaleFactor: 2.0,
                      ),
                    );
                  },
                  itemCount: state.waters.length,
                ),
              )
            ],
          );
        }),
        floatingActionButton: FloatingActionButton(
          backgroundColor: bgColor,
          child: Icon(
            Icons.add,
            color: textColor,
          ),
          onPressed: () async {
            var state = Provider.of<WaterState>(context, listen: false);
            var result =
                await _shadowAddWaterDialog(context, state.currentWater.value);

            if (result != null && result > 0) {
              state.add(Water(value: result, date: DateTime.now()));
            }
          },
        ),
      ),
    );
  }

  Future<int> _shadowAddWaterDialog(
      BuildContext context, int currentWater) async {
    int _selectedValue = 250;
    int _newValue;

    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return Center(
            child: Card(
              margin: EdgeInsets.symmetric(
                vertical: 150,
                horizontal: 50,
              ),
              color: bgColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 200,
                    width: 150,
                    decoration: buildBoxDecoration(),
                    
                    //NumberPicker
                    child: NumberPicker(
                      minValue: 25,
                      maxValue: 500,
                      value: _selectedValue,
                      onChanged: (_selectedValue){
                        _newValue = _selectedValue;
                        _selectedValue = _newValue;
                        print("Secilen deger: "+ _selectedValue.toString());
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextButton(
                        onPressed: () {},
                        child: Text("Çık"),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text("Ekle"),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
          //title: Text("Add your new value"));
        });
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
        border: Border(
      top: buildBorderSide(),
      right: buildBorderSide(),
      bottom: buildBorderSide(),
      left: buildBorderSide(),
    ));
  }

  BorderSide buildBorderSide() {
    return BorderSide(
      width: 1.0,
      color: borderColor,
    );
  }
}
