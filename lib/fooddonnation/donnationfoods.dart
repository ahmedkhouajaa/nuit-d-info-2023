import 'package:flutter/material.dart';
import 'package:planet/fooddonnation/addinfo.dart';

import 'donnationmodel.dart';

class FoodDonnation extends StatefulWidget {
  @override
  _FoodDonnationState createState() => _FoodDonnationState();
}

class _FoodDonnationState extends State<FoodDonnation> {
// VARS

  String noneImage =
      'https://www.freeiconspng.com/thumbs/no-image-icon/no-image-icon-6.png';

  //List of rescues
  List<Rescue> rescues = [
    Rescue(
      saverName: 'Amine Boufares',
      peopleNumber: 9,
      peopleNames: 'ines, walid, jilani',
      boatName: 'Titanic',
      description: 'This is a Description',
      rescueDate: '15/01/2019',
      images: 'https://sisl.ch/images/photos/Slide15.jpg',
      phone: "2775999",
      Location: "sousse 4.3 km"
    ),
    Rescue(
      saverName: 'Rihab Ben Amor',
      peopleNumber: 4,
      peopleNames: 'monsef, hamma, jilani',
      boatName: 'Tomato boat',
      description: 'This is a Description',
      rescueDate: '06/07/2020',
      images:
          'https://media.ouest-france.fr/v1/pictures/MjAyMTEwZjRlMzk3ZDljZmExNDY3NjVkMmQ4MzNmZmNmMTk2NjU?width=940&height=528&focuspoint=50%2C25&cropresize=1&client_id=bpeditorial&sign=31f1b3a00d2cc46a64b597c05eedfe300f3849fac9607d3067da212b3252230a',
      phone: "2775999",
      Location: "sousse 4.3 km"    
    ),
    Rescue(
      saverName: 'Wejdi Ben Mimoun',
      peopleNumber: 1,
      peopleNames: 'monther, amine, marwa',
      boatName: 'Titanic',
      description: 'This is a Description',
      rescueDate: '17/11/2016',
      images:
          'https://cdn.unitycms.io/image/ocroped/1200,1200,1000,1000,0,0/IMKnDePyCsY/E5aDgtI74ip8KqCnJ2xfFh.jpg',
    ),
    Rescue(
      saverName: 'Mohamed Ben Slama',
      peopleNumber: 6,
      peopleNames: 'mohamed, borguiba, mokhles',
      boatName: 'Titanic',
      description: 'This is a Description',
      rescueDate: '20/10/2020',
      images:
          'https://thumbs.dreamstime.com/b/sauvetage-par-h%C3%A9licopt%C3%A8re-244974.jpg',
    ),
    Rescue(
      saverName: 'Riadh Bou Dinar',
      peopleNumber: 2,
      peopleNames: 'rami, raed, anas',
      boatName: 'Titanic',
      description: 'This is a Description',
      rescueDate: '29/05/2021',
      images:
          'https://media.istockphoto.com/photos/dam-construction-on-the-river-rescue-operation-with-a-boat-oil-spill-picture-id1055162726?k=20&m=1055162726&s=612x612&w=0&h=ENPF95-8jK0qin1UlrqdNhlbsrEeXPfFKPMiXLB7JDw=',
    ),
  ];

  Widget getRescueWidget(Rescue src) {
    return getRescueWidget(src);
  }

  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
//**********************************************
  Widget build(BuildContext context) {
    //the One getRescueWidget
    Widget getRescueWidget(Rescue rsc) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              child: Image.network(
                rsc.images ?? noneImage,
                fit: BoxFit.cover,
              ),
            ),
            Stack(children: [
              Container(
                margin: EdgeInsets.all(5),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Align(
                            alignment: Alignment.bottomRight,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 250,
                                ),
                                Icon(Icons.account_circle_rounded,
                                    color: Colors.orange),
                                Text(rsc.peopleNumber.toString()),
                                Container(
                    margin: EdgeInsets.only(right: 4),
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      (rsc.Location.toString()  ),
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                              ],
                            )),
                           
                            Text(rsc.Location)
                      ],
                    )
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5),
                  Container(
                    margin: EdgeInsets.only(right: 4),
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      (rsc.saverName ?? 'not available'),
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Text(
                    (rsc.description ?? 'not available'),
                    textDirection: TextDirection.ltr,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    'Date :' + (rsc.rescueDate ?? 'not available'),
                  ),
                ],
              ),
            ]),
          ],
        ),
      );
    }

    //*********************************
    return Scaffold(
    
      body: Container(
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Text(
                'you can find rescued boats here',
                textAlign: TextAlign.center,
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: rescues.length,
                itemBuilder: (context, i) {
                  return getRescueWidget(rescues[i]);
                },
              ),
            ),
          ],
        ),
      ),
    
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddInformation()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.deepOrangeAccent,
      ),
    );
  }
}
