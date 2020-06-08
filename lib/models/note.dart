class Note {
  int _id;
  String _title, _description;
  String _date;
  int _priority;

  Note(this._id, this._title, this._description, this._date, this._priority);

  Note.withId(this._id, this._title, this._date, this._priority);

  set id(int value) {
    _id = value;
  }

  int get priority => _priority;

  String get date => _date;

  get description => _description;

  String get titlr => _title;

  int get id => _id;

  set title(String value) {
    _title = value;
  }

  set priority(int value) {
    _priority = value;
  }

  set date(String value) {
    _date = value;
  }

  set description(value) {
    _description = value;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) map['id'] = _id;
    map['title'] = _title;
    map["description"] = _description;
    map["priority"] = _priority;
    map["date"] = _date;
    return map;
  }

  Note.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._title = map['title'];
    this._description = map["description"];
    this._date = map["date"];
    this._priority = map["priority"];
  }
}
