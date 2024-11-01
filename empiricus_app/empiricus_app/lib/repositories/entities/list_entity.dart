class ListEntity {
  List<Groups>? groups;

  ListEntity({this.groups});

  ListEntity.fromJson(Map<String, dynamic> json) {
    if (json['groups'] != null) {
      groups = <Groups>[];
      json['groups'].forEach((v) {
        groups!.add(Groups.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (groups != null) {
      data['groups'] = groups!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Groups {
  Identifier? identifier;
  String? name;
  String? shortDescription;
  String? description;
  String? imageLarge;
  String? imageSmall;
  List<Authors>? authors;
  List<Features>? features;

  Groups(
      {this.identifier,
      this.name,
      this.shortDescription,
      this.description,
      this.imageLarge,
      this.imageSmall,
      this.authors,
      this.features});

  Groups.fromJson(Map<String, dynamic> json) {
    identifier = json['identifier'] != null
        ? Identifier.fromJson(json['identifier'])
        : null;
    name = json['name'];
    shortDescription = json['shortDescription'];
    description = json['description'];
    imageLarge = json['imageLarge'];
    imageSmall = json['imageSmall'];
    if (json['authors'] != null) {
      authors = <Authors>[];
      json['authors'].forEach((v) {
        authors!.add(Authors.fromJson(v));
      });
    }
    if (json['features'] != null) {
      features = <Features>[];
      json['features'].forEach((v) {
        features!.add(Features.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (identifier != null) {
      data['identifier'] = identifier!.toJson();
    }
    data['name'] = name;
    data['shortDescription'] = shortDescription;
    data['description'] = description;
    data['imageLarge'] = imageLarge;
    data['imageSmall'] = imageSmall;
    if (authors != null) {
      data['authors'] = authors!.map((v) => v.toJson()).toList();
    }
    if (features != null) {
      data['features'] = features!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Identifier {
  String? slug;

  Identifier({this.slug});

  Identifier.fromJson(Map<String, dynamic> json) {
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['slug'] = slug;
    return data;
  }
}

class Authors {
  String? name;
  String? photoSmallUrl;
  String? photoLargeUrl;
  String? description;

  Authors(
      {this.name, this.photoSmallUrl, this.photoLargeUrl, this.description});

  Authors.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    photoSmallUrl = json['photoSmallUrl'];
    photoLargeUrl = json['photoLargeUrl'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['photoSmallUrl'] = photoSmallUrl;
    data['photoLargeUrl'] = photoLargeUrl;
    data['description'] = description;
    return data;
  }
}

class Features {
  String? title;
  String? description;

  Features({this.title, this.description});

  Features.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    return data;
  }
}
