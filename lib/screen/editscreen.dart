import 'package:flutter/material.dart';
import 'package:quizz_app/widget/items.dart';

//Muốn màn hình này nhận dữ liệu từ màn hình trước.
//Thì b1: là khai báo biến như dòng 9, rồi thêm biến đó vào Constructor
//line 8 là constructor: nghĩa là khởi tạo, xem dart oop là biết :D
class EditScreen extends StatefulWidget {
  const EditScreen({super.key, required this.arguments});
  // final void Function(TodoModel todo) onEdit;
  static const String routeName = '/EditScreen';
  // final TodoModel todo;
  final EditScreenArg arguments;
  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  TextEditingController titles = TextEditingController();
  TextEditingController contents = TextEditingController();
  @override
  void initState() {
    //initState chỉ chạy 1 lần duy nhất lúc màn hình đc khởi tạo.
    super.initState();
    //vì đây là statefulWidget nên những muốn gọi "text" ở trên
    // thì phải là widget.text, nếu là stateless thôi,
    // thì chỉ đơn giản gọi "text" thôi.
    titles.text = widget.arguments.todo.title;
    contents.text = widget.arguments.todo.content;
    // controller1.text = widget.content;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        child: Column(
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: titles,
                  decoration: const InputDecoration(hintText: "title"),
                  validator: (value) {
                    var newValue = value ?? "";
                    if (newValue.isEmpty) {
                      return 'title is Required';
                    }
                    return null;
                  },
                ),
              ),
            ),
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: contents,
                  decoration: const InputDecoration(hintText: "Content"),
                  validator: (value) {
                    var newValue = value ?? "";
                    if (newValue.isEmpty) {
                      return 'Content is Required';
                    }
                    return null;
                  },
                ),
              ),
            ),
            MaterialButton(
              color: Colors.red,
              onPressed: () {
                ///Này là pop, mang theo giá trị [controller.text] về màn hình trước
                ///Màn hình trước là màn hình nào?
                ///tức là màn hình mà bạn dùng lệnh "Push" hay "pushnamed" để tới màn hình này ấy.
                Navigator.pop(
                  context,
                );
                widget.arguments.onEdit(
                    TodoModel(title: titles.text, content: contents.text));
              },
              child: const Text("Save"),
            )
          ],
        ),
      ),
    );
  }
}
