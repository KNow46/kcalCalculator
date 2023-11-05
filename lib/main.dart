import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'dada',
      home: mainMenu()
    );
  }
}
enum Sex{man,
  woman
}
class mainMenu extends StatefulWidget {
  const mainMenu({super.key});

  @override
  State<mainMenu> createState() => _mainMenuState();
}

class _mainMenuState extends State<mainMenu> {
  Sex sex = Sex.man;
  int height = 0;
  int weight = 0;
  int age = 0;
  double caloricDemand = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        backgroundColor: Colors.grey[500],
        title: Text('kalkulator zapotrzebowania kalorycznego',
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
          ),
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: (newHeight) {
                setState(() {
                  height = int.tryParse(newHeight) ?? 0;
                });
              },
          decoration: InputDecoration(
          hintText: "Wzrost: "
            ),
            ),
      TextField(
          onChanged: (newWeight) {
            setState(() {
              weight = int.tryParse(newWeight) ?? 0;
            });
          },
          decoration: InputDecoration(
              hintText: "Waga: "
          )
      ),
            TextField(
                onChanged: (newAge) {
                  setState(() {
                    age = int.tryParse(newAge) ?? 0;
                  });
                },
                decoration: InputDecoration(
                    hintText: "Wiek: "
                )
            ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children:<Widget>[
            new Flexible(
              flex: 1,
              child: RadioListTile(
                value: Sex.man,
                title: Text("M"),
                groupValue: sex,
                onChanged: (value) {
                  setState(() {
                    sex = Sex.man;
                  });
                },
              ),),
           new Flexible(
             flex: 1,
             child: RadioListTile(
                    value: Sex.woman,
                    title: Text("K"),
                    groupValue: sex,
                    onChanged: (value){
                      setState(() {
                        sex = Sex.woman;
                      });
                    },
                  ),
           ),
                   new Flexible(
                   child: SizedBox(
                   ),
                     flex:2),
            ],
              ),
              ElevatedButton(
              onPressed: (){
                if(sex == Sex.man) {
                  caloricDemand = 1.2 * (88.362 + 13.397 * weight + 4.799 * height - 5.677 * age);
                }
                else{
                  caloricDemand = 1.2 * (655.1 + 9.247 * weight + 3.098 * height - 4.330 * age);
                }

                setState(() {
                });
              },
              child: Text("Oblicz zapotrzbowanie"),
            ),
                  Text("Zapotrzebowanie: ${caloricDemand.toStringAsFixed(0)}")
            //])
          ]

        ),
    ),
      ),
    );
  }
}



