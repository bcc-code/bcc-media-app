import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

class FAQQuestionList {
  final int id;
  final String question;
  final String answer;

  FAQQuestionList({
    required this.id,
    required this.question,
    required this.answer,
  });
}

class FAQ extends StatefulWidget {
  const FAQ({super.key});

  @override
  State<FAQ> createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  var listOfList = [
    FAQQuestionList(
      id: 1,
      question: 'Title 1 Title 1 Title 1 Title 1 Title 1 Title1',
      answer: 'title 2',
      // question: 'Hvorfor funker dette ikke som jeg forventer?',
      // answer: 'Fordi lorem ipsum dolor sit amet consectur osv.',
    ),
    FAQQuestionList(
      id: 2,
      question: 'Hvorfor funker dette ikke som jeg forventer?',
      answer: 'Fordi lorem ipsum dolor sit amet consectur osv.',
    ),
    FAQQuestionList(
      id: 3,
      question: 'Hvorfor funker dette ikke som jeg forventer?',
      answer: 'Fordi lorem ipsum dolor sit amet consectur osv.',
    ),
    FAQQuestionList(
      id: 4,
      question: 'Hvorfor funker dette ikke som jeg forventer?',
      answer: 'Fordi lorem ipsum dolor sit amet consectur osv.',
    ),
    FAQQuestionList(
      id: 5,
      question: 'Hvorfor funker dette ikke som jeg forventer?',
      answer: 'Fordi lorem ipsum dolor sit amet consectur osv.',
    ),
    FAQQuestionList(
      id: 6,
      question: 'Hvorfor funker dette ikke som jeg forventer?',
      answer: 'Fordi lorem ipsum dolor sit amet consectur osv.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(13, 22, 35, 1),
        leadingWidth: 90,
        leading: GestureDetector(
          onTapDown: (details) {
            context.router.pop();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Icon(
                Icons.arrow_back_ios_new,
                color: Color.fromRGBO(110, 176, 230, 1),
              ),
              const Text(
                'Profil',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(110, 176, 230, 1),
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
        title: const Text(
          'Ofte stillede spørsmål',
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 17),
          child: Column(
            children: <Widget>[
              for (var i in listOfList)
                ExpansionTileDropDown(i, listOfList.indexOf(i))
            ],
          ),
        ),
      ),
    );
  }
}

class ExpansionTileDropDown extends StatefulWidget {
  final FAQQuestionList questionList;
  final int index;

  const ExpansionTileDropDown(this.questionList, this.index, {super.key});

  @override
  State<ExpansionTileDropDown> createState() => _ExpansionTileDropDownState();
}

class _ExpansionTileDropDownState extends State<ExpansionTileDropDown> {
  bool _customTileExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 16,
        top: 18,
        right: 19,
        bottom: 16,
      ),
      margin: EdgeInsets.symmetric(
        // vertical: MediaQuery.of(context).size.height * 0.006,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(29, 40, 56, 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ListTileTheme(
          minVerticalPadding: 0.0,
          dense: true,
          contentPadding: const EdgeInsets.all(0),
          child: ExpansionTile(
            title: Text(
              widget.questionList.question,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.w700,
              ),
            ),
            textColor: Colors.teal,
            trailing: !_customTileExpanded
                ? const Icon(
                    Icons.keyboard_arrow_down,
                    color: Color.fromRGBO(110, 176, 230, 1),
                  )
                : const Icon(
                    Icons.keyboard_arrow_up,
                    color: Color.fromRGBO(255, 15, 15, 1),
                  ),
            childrenPadding: EdgeInsets.only(
              top: 12,
            ),
            expandedAlignment: Alignment.centerLeft,
            children: <Widget>[
              Text(
                widget.questionList.answer,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(180, 192, 210, 1),
                ),
              )
            ],
            onExpansionChanged: (bool expanded) {
              setState(() => _customTileExpanded = expanded);
            },
          ),
        ),
      ),
    );
  }
}
