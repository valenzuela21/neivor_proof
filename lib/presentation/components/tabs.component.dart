import 'package:flutter/material.dart';
class TabsComponent extends StatefulWidget {
  const TabsComponent({Key? key}) : super(key: key);

  @override
  State<TabsComponent> createState() => _TabsComponentState();
}

class _TabsComponentState extends State<TabsComponent> {

  bool stateTab = true;

  @override
  Widget build(BuildContext context) {

    return Container(
      margin:  const EdgeInsets.only( bottom: 20),
      child: Stack(
          alignment: Alignment.center,
          children:[
            Container(
              width: 320,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(50)
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){
                    setState(() {
                      stateTab = true;
                    });
                  },
                  child: Container(
                    width: 160,
                    decoration: BoxDecoration(
                      color: stateTab ? Colors.white : Colors.transparent,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: stateTab
                              ? Colors.grey.withOpacity(0.2)
                              : Colors.grey.withOpacity(0.0),
                          spreadRadius: 4,
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: GestureDetector(
                      onTap: () => Navigator.pushNamed(context, "/list_access"),
                      child: Text(
                        "Contactenos",
                        style: Theme.of(context).textTheme.titleSmall,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      stateTab = false;
                    });
                  },
                  child: Container(
                    width: 160,
                    decoration: BoxDecoration(
                      color: !stateTab ? Colors.white : Colors.transparent,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: !stateTab
                              ? Colors.grey.withOpacity(0.2)
                              : Colors.grey.withOpacity(0.0),
                          spreadRadius: 4,
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),

                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: GestureDetector(
                      onTap: () => Navigator.pushNamed(context, "/favoritos"),
                      child: Text("Favoritos",
                          style: Theme.of(context).textTheme.titleSmall,
                          textAlign: TextAlign.center),
                    ),
                  ),
                )
              ],
            ),
          ]),
    );
  }
}
