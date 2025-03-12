import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/show_details.dart';
import '../../domain/usecases/get_show_details.dart';

class ShowDetailsBloc extends Cubit<ShowDetails?> {
  final GetShowDetails getShowDetails;

  ShowDetailsBloc(this.getShowDetails) : super(null);

  void loadShowDetails(int id) async {
    final details = await getShowDetails(id);
    emit(details);
  }
}