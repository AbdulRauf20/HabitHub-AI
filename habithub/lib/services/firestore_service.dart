import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  FirestoreService._();

  static final FirestoreService instance = FirestoreService._();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Get Firestore instance (when needed)
  FirebaseFirestore get firestore => _firestore;

  Future<QuerySnapshot<Map<String, dynamic>>> queryCollection({
    required String collection,
    String? whereField,
    dynamic isEqualTo,
    dynamic isGreaterThan,
    dynamic isLessThan,
    String? orderBy,
    bool descending = false,
    int? limit,
  }) {
    Query<Map<String, dynamic>> query = _firestore.collection(collection);

    if (whereField != null && isEqualTo != null) {
      query = query.where(whereField, isEqualTo: isEqualTo);
    }

    if (whereField != null && isGreaterThan != null) {
      query = query.where(whereField, isGreaterThan: isGreaterThan);
    }

    if (whereField != null && isLessThan != null) {
      query = query.where(whereField, isLessThan: isLessThan);
    }

    if (orderBy != null) {
      query = query.orderBy(orderBy, descending: descending);
    }

    if (limit != null) {
      query = query.limit(limit);
    }

    return query.get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> queryCollectionAfter({
    required String collection,
    required DocumentSnapshot lastDocument,
    String? orderBy,
    bool descending = false,
    int limit = 20,
  }) {
    Query<Map<String, dynamic>> query = _firestore.collection(collection);

    if (orderBy != null) {
      query = query.orderBy(orderBy, descending: descending);
    }

    return query.startAfterDocument(lastDocument).limit(limit).get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getSubCollection({
    required String collection,
    required String documentId,
    required String subCollection,
  }) {
    return _firestore
        .collection(collection)
        .doc(documentId)
        .collection(subCollection)
        .get();
  }

  Future<void> incrementField({
    required String collection,
    required String documentId,
    required String field,
    int value = 1,
  }) {
    return _firestore.collection(collection).doc(documentId).update({
      field: FieldValue.increment(value),
    });
  }

  Future<void> addToArray({
    required String collection,
    required String documentId,
    required String field,
    required dynamic value,
  }) {
    return _firestore.collection(collection).doc(documentId).update({
      field: FieldValue.arrayUnion([value]),
    });
  }

  Future<void> removeFromArray({
    required String collection,
    required String documentId,
    required String field,
    required dynamic value,
  }) {
    return _firestore.collection(collection).doc(documentId).update({
      field: FieldValue.arrayRemove([value]),
    });
  }

  /// Read a single document
  Future<DocumentSnapshot<Map<String, dynamic>>> getDocument({
    required String collection,
    required String documentId,
  }) {
    return _firestore.collection(collection).doc(documentId).get();
  }

  /// Create or replace a document
  Future<void> setDocument({
    required String collection,
    required String documentId,
    required Map<String, dynamic> data,
    bool merge = false,
  }) {
    return _firestore
        .collection(collection)
        .doc(documentId)
        .set(data, SetOptions(merge: merge));
  }

  /// Update an existing document
  Future<void> updateDocument({
    required String collection,
    required String documentId,
    required Map<String, dynamic> data,
  }) {
    return _firestore.collection(collection).doc(documentId).update(data);
  }

  /// Delete document
  Future<void> deleteDocument({
    required String collection,
    required String documentId,
  }) {
    return _firestore.collection(collection).doc(documentId).delete();
  }

  /// Read an entire collection
  Future<QuerySnapshot<Map<String, dynamic>>> getCollection({
    required String collection,
  }) {
    return _firestore.collection(collection).get();
  }

  /// Listen to a document
  Stream<DocumentSnapshot<Map<String, dynamic>>> documentStream({
    required String collection,
    required String documentId,
  }) {
    return _firestore.collection(collection).doc(documentId).snapshots();
  }

  /// Listen to a collection
  Stream<QuerySnapshot<Map<String, dynamic>>> collectionStream({
    required String collection,
  }) {
    return _firestore.collection(collection).snapshots();
  }

  /// Firestore transaction
  Future<T> runTransaction<T>(TransactionHandler<T> transactionHandler) {
    return _firestore.runTransaction(transactionHandler);
  }

  /// Firestore batch
  WriteBatch batch() {
    return _firestore.batch();
  }
}
