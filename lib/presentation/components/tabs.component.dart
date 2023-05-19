import 'package:flutter/material.dart';
class TabsComponent extends StatefulWidget {
  int stateTab;
  TabsComponent({Key? key, required this.stateTab}) : super(key: key);

  @override
  State<TabsComponent> createState() => _TabsComponentState();
}

class _TabsComponentState extends State<TabsComponent> {

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
                Container(
                    width: 160,
                    decoration: BoxDecoration(
                      color: widget.stateTab == 1 ? Colors.white : Colors.transparent,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: widget.stateTab == 1
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
               Container(
                    width: 160,
                    decoration: BoxDecoration(
                      color: widget.stateTab == 2? Colors.white : Colors.transparent,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: widget.stateTab == 2
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
                      onTap: () => Navigator.pushNamed(context, "/favorites"),
                      child: Text("Favoritos",
                          style: Theme.of(context).textTheme.titleSmall,
                          textAlign: TextAlign.center),
                    ),
                  ),
              ],
            ),
          ]),
    );
  }
}
