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

