
class Results {

  List<Cards> items = List();
  Results();

  Results.fromJsonList(List<dynamic> jsonList) {
    
    if(jsonList == null) return;
    for(var item in jsonList) {
      final card = new Cards.fromJsonMap(item);
      items.add(card);
    }
  }

}

class Cards {
  int score;
  bool status;
  String id;
  User user;
  String profession;
  String phone;
  String email;
  String website;
  String address;
  String company;
  String slogan;
  String updatedAt;
  String createdAt;

  Cards({
    this.score,
    this.status,
    this.id,
    this.user,
    this.profession,
    this.phone,
    this.email,
    this.website,
    this.address,
    this.company,
    this.slogan,
    this.updatedAt,
    this.createdAt,
  });

  Cards.fromJsonMap(Map<String, dynamic> json) {

    score      = json['score'];
    status     = json['status'];
    id         = json['id'];
    user       = User.fromJsonMap(json['user']);
    profession = json['profession'];
    phone      = json['phone'];
    email      = json['email'];
    website    = json['website'];
    address    = json['address'];
    company    = json['company'];
    slogan     = json['slogan'];
    updatedAt  = json['updatedAt'];
    createdAt  = json['createdAt'];
  }
  getImg(){
    if( user.img == null ) {
      return 'https://quieroviajara.com/wp-content/uploads/2018/01/no-imagen.jpg';
    }else {
      return user.img;
    }
  }

}

class User {
  String id;
  String firstname;
  String lastname;
  String img;

  User({
    this.id,
    this.firstname,
    this.lastname,
    this.img,
  });

  User.fromJsonMap(Map<String, dynamic> json) {
    id        = json['id'];
    firstname = json['firstname'];
    lastname  = json['lastname'];
    img       = json['img'];
  }
}
