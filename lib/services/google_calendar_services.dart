import 'dart:io';

import 'package:googleapis/calendar/v3.dart';
import "package:googleapis_auth/auth_io.dart";
import 'package:todo_app/models/ToDo.dart';
import 'package:url_launcher/url_launcher.dart';

class GoogleCalandarServices {
  static const _scope = [CalendarApi.CalendarScope];
  var _clientId;

  GoogleCalandarServices() {
    if (Platform.isAndroid) {
      _clientId = ClientId(
          "375625408870-t43ocuouurfqriig7qibe9cj2b678o48.apps.googleusercontent.com",
          "");
    } else if (Platform.isIOS) {
      _clientId = ClientId(
          "375625408870-1rusevcvqgdbec7a8mijk5vb11a751jf.apps.googleusercontent.com",
          "");
    } else {
      _clientId = ClientId(
          "375625408870-sgtmiunb9pit557hk5iidjd84lt72htt.apps.googleusercontent.com",
          "");
    }
  }

  insertEvent(ToDo toDo) {
    Event event = _todoToEvent(toDo);
    try {
      clientViaUserConsent(_clientId, _scope, prompt).then((AuthClient client) {
        String calendarId = "primary";
        CalendarApi(client).events.insert(event, calendarId).then((value) {
          if (value.status == "confirmed") {
            print('Event added in google calendar');
          } else {
            print("Unable to add event in google calendar");
          }
        });
      });
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<void> prompt(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw Exception;
    }
  }

  deleteEvent(ToDo toDo) {
    Event event = _todoToEvent(toDo);
    try {
      clientViaUserConsent(_clientId, _scope, prompt).then((AuthClient client) {
        String calendarId = "primary";
        CalendarApi(client).events.delete(event.id, calendarId).then((value) {
          if (value.status == "confirmed") {
            print('Event deleted in google calendar');
          } else {
            print("Unable to delete event in google calendar");
          }
        });
      });
    } on Exception catch (e) {
      print(e);
    }
  }

  Event _todoToEvent(ToDo toDo) {
    Event event = Event();
    event.summary = toDo.todoTitle;
    event.description = toDo.description;
    EventDateTime startEventDateTime = EventDateTime();
    startEventDateTime.timeZone = "GMT+05:30";
    startEventDateTime.dateTime = toDo.endingDateTime;
    event.start = startEventDateTime;
    EventDateTime endEventDateTime = EventDateTime();
    endEventDateTime.timeZone = "GMT+05:30";
    endEventDateTime.dateTime = toDo.endingDateTime.add(Duration(minutes: 30));
    event.end = endEventDateTime;
    return event;
  }
}
