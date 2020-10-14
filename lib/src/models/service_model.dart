
class Results {

  List<Service> items = List();
  Results();

  Results.fromJsonList(List<dynamic> jsonList) {
    if(jsonList == null) return;
    for(var item in jsonList) {
      final service = new Service.fromJsonMap(item);
      items.add(service);
    }
  }

}

class Service {
  double price;
  double score;
  bool status;
  String id;
  String user;
  String name;
  String desc;
  String time;
  String img;
  String updatedAt;
  String createdAt;

  Service({
    this.price,
    this.score,
    this.status,
    this.id,
    this.user,
    this.name,
    this.desc,
    this.time,
    this.img,
    this.updatedAt,
    this.createdAt,
  });

  Service.fromJsonMap(Map<String, dynamic> json ) {
    price     = json['price'] / 1;
    score     = json['score'] / 1;
    status    = json['status'];
    id        = json['id'];
    user      = json['user'];
    name      = json['name'];
    desc      = json['desc'];
    time      = json['time'];
    img       = json['img'];
    updatedAt = json['updatedAt'];
    createdAt = json['createdAt'];
  }
  getImg(){
    if( img == null ) {
      return 'https://quieroviajara.com/wp-content/uploads/2018/01/no-imagen.jpg';
    }else {
      return img;
    }
  }
}
