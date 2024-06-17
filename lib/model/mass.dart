class massages {
  final String t;
  final String _email;
  massages(
    this.t,
    this._email,
  );
  factory massages.fromJson(dynamic json) {
    return massages(json['text'], json['email']);
  }

  get text => t;
  get email => _email;
}
//snapshot.data!.docs[index]