import 'package:flutter/material.dart';
import 'package:health_app/model/category.dart';
import 'package:health_app/model/option.dart';
import 'package:health_app/model/question.dart';
import 'package:health_app/widget/question_numbers_widget.dart';
import 'package:health_app/widget/questions_widget.dart';


class CategoryPage extends StatefulWidget {
  final Category category;

  const CategoryPage({Key key, @required this.category}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  PageController controller;
  Question question;

  @override
  void initState() {
    super.initState();

    controller = PageController();
    question = widget.category.questions.first;
  }

  @override
  Widget build(BuildContext context) => Scaffold(

        body: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: QuestionNumbersWidget(
                questions: widget.category.questions,
                question: question,
                onClickedNumber: (index) =>
                    nextQuestion(index: index, jump: true),
              ),
            ),
            Expanded(
              child: QuestionsWidget(
                category: widget.category,
                controller: controller,
                onChangedPage: (index) => nextQuestion(index: index),
                onClickedOption: selectOption,
              ),
            ),
          ],
        ),
      );



  void selectOption(Option option) {
    if (question.isLocked) {
      return;
    } else {
      setState(() {
        question.isLocked = true;
        question.selectedOption = option;
      });
    }
  }

  void nextQuestion({int index, bool jump = false}) {
    final nextPage = controller.page + 1;
    final indexPage = index ?? nextPage.toInt();

    setState(() {
      question = widget.category.questions[indexPage];
    });

    if (jump) {
      controller.jumpToPage(indexPage);
    }
  }
}
