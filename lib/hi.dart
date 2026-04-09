import "package:flutter/cupertino.dart";

void main(){
  runApp(MyApps());
}

class MyApps extends StatelessWidget {
  const MyApps({super.key});

  @override
  Widget build(BuildContext context) {
    bool _var=true;
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: CupertinoPageScaffold(
        child: CupertinoCheckbox(value: _var, onChanged:(val){
          _var=val!;
        }),



      )
    );
  }
}
