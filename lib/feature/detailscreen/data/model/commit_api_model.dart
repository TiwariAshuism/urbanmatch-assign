// ignore_for_file: annotate_overrides, overridden_fields

import 'package:assignment1/core/common/entities/commit_model.dart';

class CommitApiModel extends CommitRepos {
  CommitApiModel({
    required this.sha,
    required this.nodeId,
    required this.commit,
    required this.url,
    required this.htmlUrl,
    required this.commentsUrl,
    required this.author,
    required this.committer,
    required this.parents,
  }) : super(
            sha: '',
            nodeId: '',
            commit: null,
            url: '',
            htmlUrl: '',
            commentsUrl: '',
            author: null,
            committer: null,
            parents: []);

  final String? sha;
  final String? nodeId;
  final Commit? commit;
  final String? url;
  final String? htmlUrl;
  final String? commentsUrl;
  final CommitRepoAuthor? author;
  final CommitRepoAuthor? committer;
  final List<Parent> parents;

  CommitApiModel copyWith({
    String? sha,
    String? nodeId,
    Commit? commit,
    String? url,
    String? htmlUrl,
    String? commentsUrl,
    CommitRepoAuthor? author,
    CommitRepoAuthor? committer,
    List<Parent>? parents,
  }) {
    return CommitApiModel(
      sha: sha ?? this.sha,
      nodeId: nodeId ?? this.nodeId,
      commit: commit ?? this.commit,
      url: url ?? this.url,
      htmlUrl: htmlUrl ?? this.htmlUrl,
      commentsUrl: commentsUrl ?? this.commentsUrl,
      author: author ?? this.author,
      committer: committer ?? this.committer,
      parents: parents ?? this.parents,
    );
  }

  factory CommitApiModel.fromJson(Map<String, dynamic> json) {
    return CommitApiModel(
      sha: json["sha"],
      nodeId: json["node_id"],
      commit: json["commit"] == null ? null : Commit.fromJson(json["commit"]),
      url: json["url"],
      htmlUrl: json["html_url"],
      commentsUrl: json["comments_url"],
      author: json["author"] == null
          ? null
          : CommitRepoAuthor.fromJson(json["author"]),
      committer: json["committer"] == null
          ? null
          : CommitRepoAuthor.fromJson(json["committer"]),
      parents: json["parents"] == null
          ? []
          : List<Parent>.from(json["parents"]!.map((x) => Parent.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "sha": sha,
        "node_id": nodeId,
        "commit": commit?.toJson(),
        "url": url,
        "html_url": htmlUrl,
        "comments_url": commentsUrl,
        "author": author?.toJson(),
        "committer": committer?.toJson(),
        "parents": parents.map((x) => x.toJson()).toList(),
      };

  @override
  String toString() {
    return "$sha, $nodeId, $commit, $url, $htmlUrl, $commentsUrl, $author, $committer, $parents, ";
  }
}
