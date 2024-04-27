import 'package:brewery_info02/brewery_data_service.dart';

import 'package:rxdart/rxdart.dart';
import 'package:brewery_info02/models/brewery_model.dart';

class BreweriesBloc {
  final _repository = Repository();
  final _breweriesFetcher = PublishSubject<List<BreweryModel>>();

  Stream<List<BreweryModel>> get allBreweries => _breweriesFetcher.stream;

  getAllBreweries() async {
    List<BreweryModel> listBreweryModel = await _repository.getAllBreweries();
    _breweriesFetcher.sink.add(listBreweryModel);
  }

  // this is just here so I can avoid re-architecting the whole app.
  Repository getRepositoryInstance() {
    return _repository;
  }

  dispose() {
    _breweriesFetcher.close();
  }
}

// accessor to an instance of the above class.
final bloc = BreweriesBloc();
