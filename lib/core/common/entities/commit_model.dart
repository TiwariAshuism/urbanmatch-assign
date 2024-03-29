class CommitRepos {
  CommitRepos({
    required this.sha,
    required this.nodeId,
    required this.commit,
    required this.url,
    required this.htmlUrl,
    required this.commentsUrl,
    required this.author,
    required this.committer,
    required this.parents,
  });

  final String? sha;
  final String? nodeId;
  final Commit? commit;
  final String? url;
  final String? htmlUrl;
  final String? commentsUrl;
  final CommitRepoAuthor? author;
  final CommitRepoAuthor? committer;
  final List<Parent> parents;

  CommitRepos copyWith({
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
    return CommitRepos(
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

  factory CommitRepos.fromJson(Map<String, dynamic> json) {
    return CommitRepos(
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

class CommitRepoAuthor {
  CommitRepoAuthor({
    required this.login,
    required this.id,
    required this.nodeId,
    required this.avatarUrl,
    required this.gravatarId,
    required this.url,
    required this.htmlUrl,
    required this.followersUrl,
    required this.followingUrl,
    required this.gistsUrl,
    required this.starredUrl,
    required this.subscriptionsUrl,
    required this.organizationsUrl,
    required this.reposUrl,
    required this.eventsUrl,
    required this.receivedEventsUrl,
    required this.type,
    required this.siteAdmin,
  });

  final String? login;
  final int? id;
  final String? nodeId;
  final String? avatarUrl;
  final String? gravatarId;
  final String? url;
  final String? htmlUrl;
  final String? followersUrl;
  final String? followingUrl;
  final String? gistsUrl;
  final String? starredUrl;
  final String? subscriptionsUrl;
  final String? organizationsUrl;
  final String? reposUrl;
  final String? eventsUrl;
  final String? receivedEventsUrl;
  final String? type;
  final bool? siteAdmin;

  CommitRepoAuthor copyWith({
    String? login,
    int? id,
    String? nodeId,
    String? avatarUrl,
    String? gravatarId,
    String? url,
    String? htmlUrl,
    String? followersUrl,
    String? followingUrl,
    String? gistsUrl,
    String? starredUrl,
    String? subscriptionsUrl,
    String? organizationsUrl,
    String? reposUrl,
    String? eventsUrl,
    String? receivedEventsUrl,
    String? type,
    bool? siteAdmin,
  }) {
    return CommitRepoAuthor(
      login: login ?? this.login,
      id: id ?? this.id,
      nodeId: nodeId ?? this.nodeId,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      gravatarId: gravatarId ?? this.gravatarId,
      url: url ?? this.url,
      htmlUrl: htmlUrl ?? this.htmlUrl,
      followersUrl: followersUrl ?? this.followersUrl,
      followingUrl: followingUrl ?? this.followingUrl,
      gistsUrl: gistsUrl ?? this.gistsUrl,
      starredUrl: starredUrl ?? this.starredUrl,
      subscriptionsUrl: subscriptionsUrl ?? this.subscriptionsUrl,
      organizationsUrl: organizationsUrl ?? this.organizationsUrl,
      reposUrl: reposUrl ?? this.reposUrl,
      eventsUrl: eventsUrl ?? this.eventsUrl,
      receivedEventsUrl: receivedEventsUrl ?? this.receivedEventsUrl,
      type: type ?? this.type,
      siteAdmin: siteAdmin ?? this.siteAdmin,
    );
  }

  factory CommitRepoAuthor.fromJson(Map<String, dynamic> json) {
    return CommitRepoAuthor(
      login: json["login"],
      id: json["id"],
      nodeId: json["node_id"],
      avatarUrl: json["avatar_url"],
      gravatarId: json["gravatar_id"],
      url: json["url"],
      htmlUrl: json["html_url"],
      followersUrl: json["followers_url"],
      followingUrl: json["following_url"],
      gistsUrl: json["gists_url"],
      starredUrl: json["starred_url"],
      subscriptionsUrl: json["subscriptions_url"],
      organizationsUrl: json["organizations_url"],
      reposUrl: json["repos_url"],
      eventsUrl: json["events_url"],
      receivedEventsUrl: json["received_events_url"],
      type: json["type"],
      siteAdmin: json["site_admin"],
    );
  }

  Map<String, dynamic> toJson() => {
        "login": login,
        "id": id,
        "node_id": nodeId,
        "avatar_url": avatarUrl,
        "gravatar_id": gravatarId,
        "url": url,
        "html_url": htmlUrl,
        "followers_url": followersUrl,
        "following_url": followingUrl,
        "gists_url": gistsUrl,
        "starred_url": starredUrl,
        "subscriptions_url": subscriptionsUrl,
        "organizations_url": organizationsUrl,
        "repos_url": reposUrl,
        "events_url": eventsUrl,
        "received_events_url": receivedEventsUrl,
        "type": type,
        "site_admin": siteAdmin,
      };

  @override
  String toString() {
    return "$login, $id, $nodeId, $avatarUrl, $gravatarId, $url, $htmlUrl, $followersUrl, $followingUrl, $gistsUrl, $starredUrl, $subscriptionsUrl, $organizationsUrl, $reposUrl, $eventsUrl, $receivedEventsUrl, $type, $siteAdmin, ";
  }
}

class Commit {
  Commit({
    required this.author,
    required this.committer,
    required this.message,
    required this.tree,
    required this.url,
    required this.commentCount,
    required this.verification,
  });

  final CommitAuthor? author;
  final CommitAuthor? committer;
  final String? message;
  final Tree? tree;
  final String? url;
  final int? commentCount;
  final Verification? verification;

  Commit copyWith({
    CommitAuthor? author,
    CommitAuthor? committer,
    String? message,
    Tree? tree,
    String? url,
    int? commentCount,
    Verification? verification,
  }) {
    return Commit(
      author: author ?? this.author,
      committer: committer ?? this.committer,
      message: message ?? this.message,
      tree: tree ?? this.tree,
      url: url ?? this.url,
      commentCount: commentCount ?? this.commentCount,
      verification: verification ?? this.verification,
    );
  }

  factory Commit.fromJson(Map<String, dynamic> json) {
    return Commit(
      author:
          json["author"] == null ? null : CommitAuthor.fromJson(json["author"]),
      committer: json["committer"] == null
          ? null
          : CommitAuthor.fromJson(json["committer"]),
      message: json["message"],
      tree: json["tree"] == null ? null : Tree.fromJson(json["tree"]),
      url: json["url"],
      commentCount: json["comment_count"],
      verification: json["verification"] == null
          ? null
          : Verification.fromJson(json["verification"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "author": author?.toJson(),
        "committer": committer?.toJson(),
        "message": message,
        "tree": tree?.toJson(),
        "url": url,
        "comment_count": commentCount,
        "verification": verification?.toJson(),
      };

  @override
  String toString() {
    return "$author, $committer, $message, $tree, $url, $commentCount, $verification, ";
  }
}

class CommitAuthor {
  CommitAuthor({
    required this.name,
    required this.email,
    required this.date,
  });

  final String? name;
  final String? email;
  final DateTime? date;

  CommitAuthor copyWith({
    String? name,
    String? email,
    DateTime? date,
  }) {
    return CommitAuthor(
      name: name ?? this.name,
      email: email ?? this.email,
      date: date ?? this.date,
    );
  }

  factory CommitAuthor.fromJson(Map<String, dynamic> json) {
    return CommitAuthor(
      name: json["name"],
      email: json["email"],
      date: DateTime.tryParse(json["date"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "date": date?.toIso8601String(),
      };

  @override
  String toString() {
    return "$name, $email, $date, ";
  }
}

class Tree {
  Tree({
    required this.sha,
    required this.url,
  });

  final String? sha;
  final String? url;

  Tree copyWith({
    String? sha,
    String? url,
  }) {
    return Tree(
      sha: sha ?? this.sha,
      url: url ?? this.url,
    );
  }

  factory Tree.fromJson(Map<String, dynamic> json) {
    return Tree(
      sha: json["sha"],
      url: json["url"],
    );
  }

  Map<String, dynamic> toJson() => {
        "sha": sha,
        "url": url,
      };

  @override
  String toString() {
    return "$sha, $url, ";
  }
}

class Verification {
  Verification({
    required this.verified,
    required this.reason,
    required this.signature,
    required this.payload,
  });

  final bool? verified;
  final String? reason;
  final dynamic signature;
  final dynamic payload;

  Verification copyWith({
    bool? verified,
    String? reason,
    dynamic signature,
    dynamic payload,
  }) {
    return Verification(
      verified: verified ?? this.verified,
      reason: reason ?? this.reason,
      signature: signature ?? this.signature,
      payload: payload ?? this.payload,
    );
  }

  factory Verification.fromJson(Map<String, dynamic> json) {
    return Verification(
      verified: json["verified"],
      reason: json["reason"],
      signature: json["signature"],
      payload: json["payload"],
    );
  }

  Map<String, dynamic> toJson() => {
        "verified": verified,
        "reason": reason,
        "signature": signature,
        "payload": payload,
      };

  @override
  String toString() {
    return "$verified, $reason, $signature, $payload, ";
  }
}

class Parent {
  Parent({
    required this.sha,
    required this.url,
    required this.htmlUrl,
  });

  final String? sha;
  final String? url;
  final String? htmlUrl;

  Parent copyWith({
    String? sha,
    String? url,
    String? htmlUrl,
  }) {
    return Parent(
      sha: sha ?? this.sha,
      url: url ?? this.url,
      htmlUrl: htmlUrl ?? this.htmlUrl,
    );
  }

  factory Parent.fromJson(Map<String, dynamic> json) {
    return Parent(
      sha: json["sha"],
      url: json["url"],
      htmlUrl: json["html_url"],
    );
  }

  Map<String, dynamic> toJson() => {
        "sha": sha,
        "url": url,
        "html_url": htmlUrl,
      };

  @override
  String toString() {
    return "$sha, $url, $htmlUrl, ";
  }
}
