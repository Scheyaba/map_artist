import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:map_artist/data/database.dart';
import 'package:map_artist/data/points.dart';

final databaseProvider = Provider<DbHelper>(
  (_) => throw UnimplementedError(),
);

final pointsListProvider = StateNotifierProvider<PointsListState, List<ArtRecord>>(
  (ref) => PointsListState(
    [],
    ref.watch(databaseProvider),
  ),
);

class PointsListState extends StateNotifier<List<ArtRecord>> {
  PointsListState(List<ArtRecord> state, this.dbHelper) : super(state);

  final DbHelper dbHelper;

  Future<void> find() async {
    state = await dbHelper.find();
  }

  Future<void> add(PointsRecord points) async {
    final record = await dbHelper.add(points);
    state = state.sublist(0)..insert(0, record);
  }

  Future<void> update(ArtRecord record) async {
    await dbHelper.update(record.key, record.value);
    _replaceRecord(record);
  }

  void _replaceRecord(ArtRecord record) {
    final findIndex = state.indexWhere(
      (e) => e.key == record.key,
    );

    state = List.from(state)
      ..replaceRange(
        findIndex,
        findIndex + 1,
        [record],
      );
  }
}