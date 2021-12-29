// To parse this JSON data, do
//
//     final productDetailsResponseModel = productDetailsResponseModelFromJson(jsonString);

import 'dart:convert';

ProductDetailsResponseModel productDetailsResponseModelFromJson(String str) =>
    ProductDetailsResponseModel.fromJson(json.decode(str));

String productDetailsResponseModelToJson(ProductDetailsResponseModel data) =>
    json.encode(data.toJson());

class ProductDetailsResponseModel {
  ProductDetailsResponseModel({
    required this.status,
    required this.data,
    required this.message,
  });

  final bool status;
  final CourseDetails data;
  final String message;

  factory ProductDetailsResponseModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailsResponseModel(
        status: json["status"],
        data: CourseDetails.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
        "message": message,
      };
}

class CourseDetails {
  CourseDetails({
    required this.id,
    required this.title,
    required this.titleSlug,
    required this.teaserVideo,
    required this.totalLessons,
    required this.totalDuration,
    required this.shortDescription,
    required this.offers,
    required this.createdBy,
    required this.rating,
    required this.ratingCount,
    required this.actualPrice,
    required this.listingImage,
    required this.price,
    required this.description,
    required this.updatedAt,
    required this.courseValidity,
    required this.learningNotes,
    required this.courseChapter,
    required this.reviews,
    required this.percentageStar,
  });

  final int id;
  final String title;
  final String titleSlug;
  final String teaserVideo;
  final int totalLessons;
  final double totalDuration;
  final String shortDescription;
  final String offers;
  final String createdBy;
  final dynamic rating;
  final int ratingCount;
  final String actualPrice;
  final String listingImage;
  final String price;
  final String description;
  final DateTime updatedAt;
  final int courseValidity;
  final List<LearningNote> learningNotes;
  final List<CourseChapter> courseChapter;
  final List<dynamic> reviews;
  final PercentageStar percentageStar;

  factory CourseDetails.fromJson(Map<String, dynamic> json) => CourseDetails(
        id: json["id"],
        title: json["title"],
        titleSlug: json["title_slug"],
        teaserVideo: json["teaser_video"],
        totalLessons: json["total_lessons"],
        totalDuration: json["total_duration"].toDouble(),
        shortDescription: json["short_description"],
        offers: json["offers"],
        createdBy: json["created_by"],
        rating: json["rating"],
        ratingCount: json["rating_count"],
        actualPrice: json["actual_price"],
        listingImage: json["listing_image"],
        price: json["price"],
        description: json["description"],
        updatedAt: DateTime.parse(json["updated_at"]),
        courseValidity: json["course_validity"],
        learningNotes: List<LearningNote>.from(
            json["learning_notes"].map((x) => LearningNote.fromJson(x))),
        courseChapter: List<CourseChapter>.from(
            json["course_chapter"].map((x) => CourseChapter.fromJson(x))),
        reviews: List<dynamic>.from(json["reviews"].map((x) => x)),
        percentageStar: PercentageStar.fromJson(json["percentage_star"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "title_slug": titleSlug,
        "teaser_video": teaserVideo,
        "total_lessons": totalLessons,
        "total_duration": totalDuration,
        "short_description": shortDescription,
        "offers": offers,
        "created_by": createdBy,
        "rating": rating,
        "rating_count": ratingCount,
        "actual_price": actualPrice,
        "listing_image": listingImage,
        "price": price,
        "description": description,
        "updated_at": updatedAt.toIso8601String(),
        "course_validity": courseValidity,
        "learning_notes":
            List<dynamic>.from(learningNotes.map((x) => x.toJson())),
        "course_chapter":
            List<dynamic>.from(courseChapter.map((x) => x.toJson())),
        "reviews": List<dynamic>.from(reviews.map((x) => x)),
        "percentage_star": percentageStar.toJson(),
      };
}

class CourseChapter {
  CourseChapter({
    required this.id,
    required this.chapterTitle,
    required this.titleSlug,
    required this.chaptersCount,
    required this.durationCount,
    required this.chapters,
  });

  final int id;
  final String chapterTitle;
  final String titleSlug;
  final int chaptersCount;
  final double durationCount;
  final List<Chapter> chapters;

  factory CourseChapter.fromJson(Map<String, dynamic> json) => CourseChapter(
        id: json["id"],
        chapterTitle: json["chapter_title"],
        titleSlug: json["title_slug"],
        chaptersCount: json["chapters_count"],
        durationCount: json["duration_count"].toDouble(),
        chapters: List<Chapter>.from(
            json["chapters"].map((x) => Chapter.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "chapter_title": chapterTitle,
        "title_slug": titleSlug,
        "chapters_count": chaptersCount,
        "duration_count": durationCount,
        "chapters": List<dynamic>.from(chapters.map((x) => x.toJson())),
      };
}

class Chapter {
  Chapter({
    required this.id,
    required this.libraryName,
    required this.duration,
    required this.contentVideo,
    required this.freeVideo,
  });

  final int id;
  final String libraryName;
  final double duration;
  final String contentVideo;
  final bool freeVideo;

  factory Chapter.fromJson(Map<String, dynamic> json) => Chapter(
        id: json["id"],
        libraryName: json["library_name"],
        duration: json["duration"].toDouble(),
        contentVideo: json["content_video"],
        freeVideo: json["free_video"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "library_name": libraryName,
        "duration": duration,
        "content_video": contentVideo,
        "free_video": freeVideo,
      };
}

class LearningNote {
  LearningNote({
    required this.id,
    required this.courseName,
    required this.text,
    required this.isActive,
    required this.course,
  });

  final int id;
  final String courseName;
  final String text;
  final bool isActive;
  final int course;

  factory LearningNote.fromJson(Map<String, dynamic> json) => LearningNote(
        id: json["id"],
        courseName: json["course_name"],
        text: json["text"],
        isActive: json["is_active"],
        course: json["course"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "course_name": courseName,
        "text": text,
        "is_active": isActive,
        "course": course,
      };
}

class PercentageStar {
  PercentageStar({
    required this.the1Stars,
    required this.the2Stars,
    required this.the3Stars,
    required this.the4Stars,
    required this.the5Stars,
  });

  final String the1Stars;
  final String the2Stars;
  final String the3Stars;
  final String the4Stars;
  final String the5Stars;

  factory PercentageStar.fromJson(Map<String, dynamic> json) => PercentageStar(
        the1Stars: json["1stars"],
        the2Stars: json["2stars"],
        the3Stars: json["3stars"],
        the4Stars: json["4stars"],
        the5Stars: json["5stars"],
      );

  Map<String, dynamic> toJson() => {
        "1stars": the1Stars,
        "2stars": the2Stars,
        "3stars": the3Stars,
        "4stars": the4Stars,
        "5stars": the5Stars,
      };
}
