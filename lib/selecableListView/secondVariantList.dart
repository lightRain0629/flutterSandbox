import 'package:flutter/material.dart';

// bool containsSelectedItems = false;

// todo in production create listview statefull widget or create statemanagemant for selectable products
class YourListView extends StatefulWidget {
  @override
  _YourListViewState createState() => _YourListViewState();
}

class _YourListViewState extends State<YourListView> {
  List<String> items = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];
  List<String> selectedIndices = [];

  late TextEditingController qtyController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    qtyController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: selectedIndices.isNotEmpty
          ? FloatingActionButton(
              onPressed: () {
                // setState(() {
                //   for (var i = 0; i < selectedIndices.length; i++) {
                //     print('====');
                //     print(selectedIndices[i]);
                //     selectedIndices[i] = 'not item';
                //     print('=====');
                //     print(selectedIndices[i]);
                //   }
                //   selectedIndices.clear();
                //   selectedIndices.isNotEmpty = false;
                // });
                similarQuantitySheet(context, qtyController, selectedIndices);
              },
              child: Icon(Icons.add),
            )
          : SizedBox.shrink(),
      appBar: AppBar(
        title: Text('Selectable List'),
        actions: [
          selectedIndices.isNotEmpty
              ? TextButton(
                  onPressed: () {
                    setState(() {
                      selectedIndices.clear();
                    });
                  },
                  child: Text('Clear selections'))
              : SizedBox()
        ],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];
          final isSelected = selectedIndices.contains(item);

          return card(context, isSelected, item, index);
        },
      ),
    );
  }

  GestureDetector card(
      BuildContext context, bool isSelected, String item, int index) {
    return GestureDetector(
      onLongPress: () {
        selectedIndices.isNotEmpty
            ? similarQuantitySheet(context, qtyController, selectedIndices)
            : setState(() {
                if (isSelected) {
                  selectedIndices.remove(item);
                } else {
                  selectedIndices.add(item);
                  // selectedIndices.isNotEmpty = true;
                }
              });
      },
      onTap: () {
        selectedIndices.isNotEmpty
            ? setState(() {
                if (isSelected) {
                  selectedIndices.remove(item);
                } else {
                  selectedIndices.add(item);
                  // selectedIndices.isNotEmpty = true;
                }
              })
            : print('Tapped: ${items[index]}');
      },
      child: ListTile(
        title: Text(items[index]),
        tileColor: isSelected ? Colors.grey.withOpacity(0.5) : null,
      ),
    );
  }

  Future<dynamic> similarQuantitySheet(BuildContext context,
      TextEditingController qtyController, List selectedIndices) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                left: 20,
                right: 20),
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextField(
                    controller: qtyController,
                    cursorColor: Theme.of(context).colorScheme.primary,
                    style: TextStyle(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : const Color(0xff0B1527),
                      fontFamily: 'Inter',
                    ),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'add quantity',
                      border: InputBorder.none,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Cancel')),
                      TextButton(
                          onPressed: () {
                            print(qtyController.toString());
                            print(selectedIndices);
                            Navigator.pop(context);
                          },
                          child: Text('Add'))
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}

// class SelectableListView extends StatefulWidget {
//   final List<String> items;
//   const SelectableListView({
//     Key? key,
//     required this.items,
//   }) : super(key: key);

//   @override
//   State<SelectableListView> createState() => _SelectableListViewState();
// }

// class _SelectableListViewState extends State<SelectableListView> {
//   List<int> selectedIndices = [];
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: widget.items.length,
//       itemBuilder: (BuildContext context, int index) {
//         final isSelected = selectedIndices.contains(index);

//         return GestureDetector(
//           onLongPress: () {
//             setState(() {
//               if (isSelected) {
//                 selectedIndices.remove(index);
//               } else {
//                 selectedIndices.add(index);
//                 selectedIndices.isNotEmpty = true;
//               }
//             });
//           },
//           onTap: () {
//             // Handle normal tap action here
//             print('Tapped: ${widget.items[index]}');
//           },
//           child: ListTile(
//             title: Text(widget.items[index]),
//             tileColor: isSelected ? Colors.grey.withOpacity(0.5) : null,
//           ),
//         );
//       },
//     );
//   }
// }
