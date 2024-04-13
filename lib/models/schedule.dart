class Schedule {
  int _id = 0;
  late String _name;
  late String _tanggal;
  late String _keterangan;

  Schedule(this._name, this._tanggal, this._keterangan);

  Schedule.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._name = map['name'];
    this._tanggal = map['tanggal'];
    this._keterangan = map['keterangan'];
  }

  int get id => _id;
  String get name => _name;
  String get tanggal => _tanggal;
  String get keterangan => _keterangan;

  set name(String value) {
    _name = value;
  }

  set keterangan(String value) {
    _keterangan = value;
  }

  set tanggal(String value) {
    _tanggal = value;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['name'] = name;
    map['keterangan'] = keterangan;
    map['tanggal'] = tanggal;
    return map;
  }
}
