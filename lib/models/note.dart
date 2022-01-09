class Note {
   int? _id = null;
   int? _priority;
   String? _description ;
   String? _title;
   String? _date;

  Note(
    this._title,
    this._date,
    this._priority,
    this._description
  );
  // named constructor
  Note.withID(
    this._id,
    this._title,
    this._date,
    this._priority,
    this._description
  );

// getter
  int? get id => _id;
  int get priority => _priority!;
  String get title => _title!;
  String get date => _date!;
  String get description => _description!;

  // setter
  set priority(int newPriority) {
    if (newPriority >= 1 && newPriority <= 2) {
      _priority = newPriority;
    }
  }

  set title(String newTitle) {
    if (newTitle.length <= 255) {
      _title = newTitle;
    }
  }

  set description(String? newdesc) {
    if (newdesc!.length <= 255) {
      _description = newdesc;
    }
  }

  set date(String newDate) {
    _date = newDate;
  }

  // note to map
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['title'] = _title;
    map['description'] = _description;
    map['date'] = _date;
    map['priority'] = _priority;
    return map;
  }

  //Extract a note object from a map object

  Note.fromMapObject(Map<String, dynamic> map) {
    _id = map['id'];
    _date = map['date'];
    _description = map['description'];
    _priority = map['priority'];
    _title = map['title'];
  }
}
