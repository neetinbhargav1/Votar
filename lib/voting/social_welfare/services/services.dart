import 'package:flutter/cupertino.dart';

import "package:frost/voting/social_welfare/models/vote.dart";
import 'package:uuid/uuid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import "package:provider/provider.dart";
import "package:frost/voting/social_welfare/state/vote.dart";

List<Vote> getVoteList() {
  // Mock Data
  List<Vote> voteList = List<Vote>();


  return voteList;
}

// firestore collection name
const String kVotes = 'social welfare';
const String kTitle = 'title';

void getVoteListFromFirestore(BuildContext context) async {
//  Firestore.instance.collection(kVotes).snapshots().listen((data) {
//    List<Vote> voteList = List<Vote>();
//
//    data.documents.forEach((DocumentSnapshot document) {
//      Vote vote = Vote(voteId: document.documentID);
//
//      List<Map<String, int>> options = List();
//
//      document.data.forEach((key, value) {
//        if (key == kTitle) {
//          vote.voteTitle = value;
//        } else {
//          options.add({key: value});
//        }
//      });
//
//      vote.options = options;
//      voteList.add(vote);
//    });
//
//    Provider.of<VoteState>(context, listen: false).voteList = voteList;
//  });

  Firestore.instance.collection(kVotes).getDocuments().then((snapshot) {
    List<Vote> voteList = List<Vote>();

    snapshot.documents.forEach((DocumentSnapshot document) {
      voteList.add(mapFirestoreDocToVote(document));
    });

    Provider.of<VoteState>(context, listen: false).voteList = voteList;
  });
}

Vote mapFirestoreDocToVote(document) {
  Vote vote = Vote(voteId: document.documentID);
  List<Map<String, int>> options = List();
  document.data.forEach((key, value) {
    if (key == kTitle) {
      vote.voteTitle = value;
    } else {
      options.add({key: value});
    }
  });

  vote.options = options;
  return vote;
}

void markVote(String voteId, String option) async {
  // increment value

  Firestore.instance.collection(kVotes).document(voteId).updateData({
    option: FieldValue.increment(1),
  });
}

void retrieveMarkedVoteFromFirestore({String voteId, BuildContext context}) {
  // Retrieve updated doc from server
  Firestore.instance.collection(kVotes).document(voteId).get().then((document) {
    Provider.of<VoteState>(context, listen: false).activeVote =
        mapFirestoreDocToVote(document);
  });
}
