
import 'package:flutter/material.dart';
void main() {
  runApp(const MainApp());
}
class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      
      home: QuizApp(),
      debugShowCheckedModeBanner: false,
      );
      }
}


class QuizApp extends StatefulWidget {
  const QuizApp({super.key});
  @override
  State createState() => _QuizAppState();
}


class ModelClass{
  final String? question;
  final List<String>? options;
  final int? answerIndex;

  const ModelClass({this.question,this.options,this.answerIndex});
}

class _QuizAppState extends State {
  List allQuestions = [
    const ModelClass(
      question: "     Who is the founder of Microsoft?",
      options: ["Steve Jobs", "Jeff Bezos", "Bill Gates", "Elon Musk"],
      answerIndex: 2, 
    ),
    const ModelClass(
      question: "     Who is the founder of Apple?" ,
      options:["Steve Jobs", "Jeff Bezos", "Bill Gates", "Elon Musk"] ,
      answerIndex: 0,
    ),
    const ModelClass(
    question: "     Who is the founder of Amazon?",
    options: ["Steve Jobs", "Jeff Bezos", "Bill Gates", "Elon Musk"],
    answerIndex: 1,
    ),
    const ModelClass(
    question: "     Who is the founder of Tesla?",
    options: ["Steve Jobs", "Jeff Bezos", "Bill Gates", "Elon Musk"],
    answerIndex: 3,
    ),
    const ModelClass(
    question: "     Who is the founder of Google?",
    options: ["Steve Jobs", "Lary Page", "Bill Gates", "Elon Musk"],
    answerIndex: 1,
    ),
  ];
  
  int selectedans=-1;
  bool questionScreen = true;
  int questionIndex = 0;
  // ignore: non_constant_identifier_names
  int correct_answer=0;

  void currentPage(){
    if(selectedans==-1){
      return;
    }
    if(selectedans==allQuestions[questionIndex].answerIndex){
      correct_answer+=1;
    }
    if(selectedans!=-1){
      if(questionIndex==allQuestions.length-1){
        setState(() {
          questionScreen=false;
        });
      }
      selectedans=-1;
      setState(() {
        questionIndex+=1;
      });
      
    }
  }

  MaterialStateProperty<Color?> checkAnw(int buttonIndex){
    if(selectedans!=-1){
      if(buttonIndex==allQuestions[questionIndex].answerIndex){
        return const MaterialStatePropertyAll(Colors.green);
      }else if(buttonIndex==selectedans){
        return const MaterialStatePropertyAll(Colors.red);
      }else{
        return const MaterialStatePropertyAll(null);
      }
    }else{
      return const MaterialStatePropertyAll(null);
    }
  }
  Scaffold isQuestionScreen() {
    if (questionScreen == true) {
      return Scaffold(
        
        appBar: AppBar(
        title: const Text(
          "QuizApp",
            style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w800,
            color: Colors.white,
            ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,

        ),
        
        body: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center,

              children: [
                const Text(
                  "Questions : ",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "${questionIndex + 1}/${allQuestions.length}",
                    style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 380,
              height: 50,
              child: Text(
               allQuestions[questionIndex].question,
               style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(

             height: 30,
           ),
           SizedBox(
            height: 30,
            width: 300,
            child: 
              ElevatedButton(
              style:ButtonStyle(backgroundColor: checkAnw(0)),
              onPressed: () {   
                if(selectedans==-1){
                  setState(() {
                    selectedans=0;
                  });
                }
              },
                child: Text(
                  "A.${allQuestions[questionIndex].options[0]}",
                    style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
            ),

           ),
            
            const SizedBox(
             height: 20,
            ),
            SizedBox(
            height: 30,
            width: 300,
            child: 
              ElevatedButton(
              style:ButtonStyle(backgroundColor: checkAnw(1)),

              onPressed: () {   
                if(selectedans==-1){
                  setState(() {
                    selectedans=1;
                  });
                }
              },
                child: Text(
                  "B.${allQuestions[questionIndex].options[1]}",
                    style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
            ),

           ),
            const SizedBox(
             height: 20,
            ),
            SizedBox(
            height: 30,
            width: 300,
            child: 
              ElevatedButton(
              style:ButtonStyle(backgroundColor: checkAnw(2)),
              onPressed: () {   
                if(selectedans==-1){
                  setState(() {
                    selectedans=2;
                  });
                }
              },
                child: Text(
                  "C.${allQuestions[questionIndex].options[2]}",
                    style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
            ),

           ),

            const SizedBox(
             height: 20,
            ),
            SizedBox(
            height: 30,
            width: 300,
            child: 
             ElevatedButton(
              style:ButtonStyle(backgroundColor: checkAnw(3)),
              onPressed: () {   
                if(selectedans==-1){
                  setState(() {
                    selectedans=3;
                  });
                }
              },
                child: Text(
                  "D.${allQuestions[questionIndex].options[3]}",
                    style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
            ),

           ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            currentPage();
          },
          backgroundColor: Colors.blue,
          child: const Icon(
            Icons.forward,
            color: Colors.white,
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
        title: const Text(
          "QuizApp",
            style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w800,
            color: Colors.white,
            ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        ),

        body:Center(
          child: 
          Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           const SizedBox(
              height: 10,
            ),

            Image.network("https://img.freepik.com/premium-vector/winner-trophy-cup-with-ribbon-confetti_51486-122.jpg",height: 300,width: 300,),
            const SizedBox(
              height: 30,
            ),
            Text("Congratulations you have got $correct_answer/${allQuestions.length}",style: const TextStyle(fontSize: 25,fontWeight: FontWeight.w800),),

            ElevatedButton(onPressed:(){
              setState(() {
                questionIndex=0;
                questionScreen=true;
                correct_answer=0;
                selectedans=-1;
              });
            }, 
            child: const Text("Reset"))
          ],
          
        ),
        ),
        
      );
      
    }
  }
  @override
    Widget build(BuildContext context) {
      return isQuestionScreen();
    }
}

















































/*import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizApp(),
    );
  }
}


class QuizApp extends StatefulWidget{
  const QuizApp({super.key});

  @override
  State<StatefulWidget> createState()=> _QuizAppState();
}

class ModelClass{
  final String? question;
  final List<String>? options;
  final int? answerIndex;

  const ModelClass({this.question,this.options,this.answerIndex});
}

class _QuizAppState extends State<QuizApp>{

    int selectedans=-1;
    bool questionScreen = true;
    int questionIndex = 0;
    // ignore: non_constant_identifier_names
    int correct_answer=0;

    void currentPage(){
    if(selectedans==-1){
      return;
    }
    if(selectedans==allQuestions[questionIndex].answerIndex){
      correct_answer+=1;
    }
    if(selectedans!=-1){
      if(questionIndex==allQuestions.length-1){
        setState(() {
          questionScreen=false;
        });
      }
      selectedans=-1;
      setState(() {
        questionIndex+=1;
      });
      
    }
  }

  MaterialStateProperty<Color?> checkAnw(int buttonIndex){
    if(selectedans!=-1){
      if(buttonIndex==allQuestions[questionIndex].answerIndex){
        return const MaterialStatePropertyAll(Colors.green);
      }else if(buttonIndex==selectedans){
        return const MaterialStatePropertyAll(Colors.red);
      }else{
        return const MaterialStatePropertyAll(null);
      }
    }else{
      return const MaterialStatePropertyAll(null);
    }
  }

  List allQuestions = [
    const ModelClass(
      
      question: "     Who is the founder of Microsoft?",
      options: ["Steve Jobs", "Jeff Bezos", "Bill Gates", "Elon Musk"],
      answerIndex: 2,
      
    ),

    const ModelClass(
      
      question: "     Who is the founder of Apple?",
      options: ["Steve Jobs", "Jeff Bezos", "Bill Gates", "Elon Musk"],
      answerIndex: 0,
      
    ),

    const ModelClass(
      
      question: "     Who is the founder of Amazon?",
      options: ["Steve Jobs", "Jeff Bezos", "Bill Gates", "Elon Musk"],
      answerIndex: 1,
      
    ),

    const ModelClass(
      
      question: "     Who is the founder of Tesla?",
      options: ["Steve Jobs", "Jeff Bezos", "Bill Gates", "Elon Musk"],
      answerIndex: 3,
      
    ),

    const ModelClass(
      
      question: "     Who is the founder of Google?",
      options: ["Steve Jobs", "Lary Page", "Bill Gates", "Elon Musk"],
      answerIndex: 1,
      
    ),
    
  ];
  Scaffold isQuestionScreen(){
    if(questionScreen==true){
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          centerTitle: true,
          title: const Text("Quiz App",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w800,color: Colors.white),),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center,

              children: [
                const Text(
                  "Questions : ",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "${questionIndex + 1}/${allQuestions.length}",
                    style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 380,
              height: 50,
              child: Text(
               allQuestions[questionIndex].question,
               style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(

             height: 30,
           ),
           SizedBox(
            height: 30,
            width: 300,
            child: 
              ElevatedButton(
              style:ButtonStyle(backgroundColor: checkAnw(0)),
              onPressed: () {   
                if(selectedans==-1){
                  setState(() {
                    selectedans=0;
                  });
                }
              },
                child: Text(
                  "A.${allQuestions[questionIndex].options[0]}",
                    style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
            ),

           ),
            
            const SizedBox(
             height: 20,
            ),
            SizedBox(
            height: 30,
            width: 300,
            child: 
              ElevatedButton(
              style:ButtonStyle(backgroundColor: checkAnw(1)),
              onPressed: () {   
                if(selectedans==-1){
                  setState(() {
                    selectedans=1;
                  });
                }
              },
                child: Text(
                  "B.${allQuestions[questionIndex].options[1]}",
                    style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
            ),

           ),
            const SizedBox(
             height: 20,
            ),
            SizedBox(
            height: 30,
            width: 300,
            child: 
              ElevatedButton(
              style:ButtonStyle(backgroundColor: checkAnw(2)),
              onPressed: () {   
                if(selectedans==-1){
                  setState(() {
                    selectedans=2;
                  });
                }
              },
                child: Text(
                  "C.${allQuestions[questionIndex].options[2]}",
                    style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
            ),

           ),

            const SizedBox(
             height: 20,
            ),
            SizedBox(
            height: 30,
            width: 300,
            child: 
             ElevatedButton(
              style:ButtonStyle(backgroundColor: checkAnw(3)),
              onPressed: () {   
                if(selectedans==-1){
                  setState(() {
                    selectedans=3;
                  });
                }
              },
                child: Text(
                  "D.${allQuestions[questionIndex].options[3]}",
                    style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
            ),

           ),
          ],
        ),floatingActionButton: FloatingActionButton(
          onPressed: () {
            currentPage();
          },
          backgroundColor: Colors.blue,
          child: const Icon(
            Icons.forward,
            color: Colors.white,
          ),
        ),
      );
    }else{
      
      return Scaffold(
        appBar: AppBar(
        title: const Text(
          "QuizApp",
            style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w800,
            color: Colors.white,
            ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        ),

        body:Center(
          child: 
          Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           const SizedBox(
              height: 10,
            ),

            Image.network("https://img.freepik.com/premium-vector/winner-trophy-cup-with-ribbon-confetti_51486-122.jpg",height: 300,width: 300,),
            const SizedBox(
              height: 30,
            ),
            Text("Congratulations you have got $correct_answer/${allQuestions.length}",style: const TextStyle(fontSize: 25,fontWeight: FontWeight.w800),),

            ElevatedButton(onPressed:(){
              setState(() {
                questionIndex=0;
                questionScreen=true;
                correct_answer=0;
                selectedans=-1;
              });
            }, 
            child: const Text("Reset"))
          ],
          
        ),
        ),
        
      );
      
    }
  }
   @override
   Widget build(BuildContext context){
    return isQuestionScreen();
   }

}


*/