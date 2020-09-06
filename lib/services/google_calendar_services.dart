// import 'package:googleapis/calendar/v3.dart';
// import "package:googleapis_auth/auth_browser.dart";
// import 'package:todo_app/models/ToDo.dart';
//
// class GoogleCalandarServices {
//   static const _scope = [CalendarApi.CalendarScope];
//   var _credentials;
//
//   GoogleCalandarServices() {
//     _credentials = ClientId("AIzaSyAxuBNkpGbt3aNC1Hcp8ht4eLmdclyp21M",null);
//   }
//
//   insertEvent(ToDo toDo){
//
//     try{
//       String calendarId="primary";
//       Event event =Event();
//       event.summary=toDo.todoTitle;
//       event.description=toDo.description;
//       EventDateTime eventDateTime =EventDateTime();
//       eventDateTime.dateTime=toDo.endingDateTime;
//       event.start=eventDateTime;
//       CalendarApi(_credentials).events.import(event, calendarId).then((value) => print("Event Added to Calendar"));
//     }catch(e){
//       print(e);
//     }
//
//   }
//
// }
