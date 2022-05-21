import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:webpage/widgets/text_widget.dart';

class TodoPage extends StatefulWidget {
  TodoPage({Key? key}) : super(key: key);

  @override
  State<TodoPage> createState() => _TodoPage();
}

class _TodoPage extends State<TodoPage> {
  List<Map> my_tasks = [];

  @override
  void initState() {
    super.initState();
  }

  TextEditingController controller = TextEditingController();

  String my_input = "";

  @override
  Widget build(BuildContext context) {
    my_tasks.sort(
        (a, b) => a["Czekboks"].toString().compareTo(b["Czekboks"].toString()));
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: MyTextWidget(
          text: 'Things to do:',
          color: Colors.white,
        ),
        actions: [
          my_add_button(),
        ],
      ),
      body: ListView(
        children: [
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 11,
              // height: 100.0,
              color: Colors.green,
              child: TextFormField(
                // onChanged: (string) {
                //   setState(() {
                //     my_input = string;
                //     my_tasks.add(my_input);
                //   });
                //   ;
                // },
                controller: controller,
                minLines: 1,
                maxLines: 5,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    prefixIcon: my_add_button(), border: InputBorder.none),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: my_tasks.length,
                itemBuilder: (context, index) {
                  return mytask(index);
                }),
          )
        ],
      ),
    );
  }

  IconButton my_add_button() {
    return IconButton(
      onPressed: () {
        Map newmap = {};
        newmap["Czekboks"] = false;
        newmap["Tekts"] = controller.text;
        setState(() {
          my_tasks.add(newmap);
          controller.clear();
        });
      },
      icon: Icon(Icons.add),
    );
  }

  Widget mytask(int index) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (kierunkowy) {
        if (kierunkowy == DismissDirection.startToEnd ||
            kierunkowy == DismissDirection.endToStart) my_tasks.removeAt(index);
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Checkbox(
                  value: my_tasks[index].values.elementAt(0),
                  onChanged: (ischecked) {
                    // print(my_tasks[index]["Tekts"]);
                    setState(() {
                      bool boli = my_tasks[index].values.elementAt(0);
                      my_tasks[index]["Czekboks"] = !boli;
                      print(my_tasks[index]["Tekts"]);
                    });
                  }),
              MyTextWidget(
                text: my_tasks[index].values.elementAt(1).toString(),
                color: Colors.red,
                size: 25,
                checkbox: my_tasks[index]["Czekboks"],
              ),
            ],
          ),
          const Divider(
            color: Colors.red,
            thickness: 10,
          )
        ],
      ),
    );
  }
}
