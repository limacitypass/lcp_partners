class User {
  String _name;
  String _email;
  String _photo;

  User(this._name, this._email, this._photo);

  String get name => _name;
  String get email => _email;
  String get photo => _photo;
}

class Partner {
  String _id;
  String _name;
  String _backgroundImage;

  String _address;
  String _attractionName;

  Partner(this._id, this._name, this._backgroundImage, this._address,
      this._attractionName);

  String get id => _id;
  String get name => _name;
  String get backgroundImage => _backgroundImage;
  String get address => _address;
  String get attractionName => _attractionName;
}

class TicketVisitCard {
  String _id;
  User _user;
  DateTime _visitTime;

  TicketVisitCard(this._id, this._user, this._visitTime);

  String get id => _id;
  User get user => _user;
  DateTime get visitTime => _visitTime;
}
