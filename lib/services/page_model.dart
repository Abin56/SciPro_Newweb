class PageModel{
  late String   title,name,image;

  PageModel({required this.title, required this.name, required this.image});

  PageModel.fromJson(Map<String,dynamic>json)
  {
    title = json['title'];
    name = json['name'];
    image = json['image'];
  }

  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = new Map<String,dynamic>();
    data['name'] = name;
    data['title'] = title;
    data['image'] = image;
    return data;

  }
}