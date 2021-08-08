import 'dart:developer';

import 'package:flutter_clock/logic/cubit/addalarm_cubit.dart';
import 'package:flutter_clock/views/AlarmScreen/widgets/add_alarm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show ReadContext;

class AlarmName extends StatelessWidget {
  const AlarmName({Key key}) : super(key: key);

  Future<String> showDialogForTitle(BuildContext context,String initialValue) async {
    return await showDialog(
        context: context, builder: (_) =>  AlarmNameTextField(
          initialValue: initialValue!="None" ? initialValue : "",
        ));
  }

  @override
  Widget build(BuildContext context) {


    final AddalarmCubit addalarmCubit = context.read<AddalarmCubit>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => showDialogForTitle(context,addalarmCubit.alarmTitle.value).then((value) => value != null
            ? addalarmCubit.title =
                value.trim().isEmpty ? "None" : value
            : ""),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Alarm name",
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            ValueListenableBuilder(
              valueListenable: addalarmCubit.alarmTitle,
              builder: (BuildContext context, String value, Widget child) {
                return Text(
                  value,
                  style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff896d73)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AlarmNameTextField extends StatefulWidget {
  const AlarmNameTextField({Key key, this.initialValue}) : super(key: key);

final String initialValue;

  @override
  _AlarmNameTextFieldState createState() => _AlarmNameTextFieldState();
}

class _AlarmNameTextFieldState extends State<AlarmNameTextField> {



  TextEditingController textEditingController;

  @override
  void initState() {
     textEditingController=TextEditingController(
      text: widget.initialValue
    );
    super.initState();
  }

  @override
  void dispose() {
      textEditingController?.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    log("ALARMM NAME TEXT FIELD BUILDED");

    return FittedBox(
      alignment: Alignment.center,
      fit: BoxFit.scaleDown,
      child: Center(
        child: SizedBox(
          height: 140,
          width: 300,
          child: Card(
            color: Color(0xfff4e1e9),
            child: DefaultTextStyle(
              style: TextStyle(
                  fontSize: 24.0,
                  color: Color(0xff896d73),
                  fontWeight: FontWeight.w600),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Alarm Name",
                    ),
                    Expanded(
                      child: TextField(
                        cursorColor: Color(0xff896d73),
                        style:
                            TextStyle(fontSize: 20.0, color: Color(0xffd4a9b1)),
                        decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xffd4a9b1)))),
                        controller: textEditingController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Spacer(),
                          GestureDetector(
                              onTap: () {

                                Navigator.of(context).pop(null);

                              },
                              child: Text(
                                "CANAL",
                                style: TextStyle(fontSize: 18.0),
                              )),
                          SizedBox(
                            width: 20.0,
                          ),
                          GestureDetector(
                              onTap: () async {
                                Navigator.of(context).pop(textEditingController?.text);
                              },
                              child: Text(
                                "OK",
                                style: TextStyle(fontSize: 18.0),
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
