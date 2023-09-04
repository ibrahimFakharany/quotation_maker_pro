import 'package:equatable/equatable.dart';

abstract class AllProuctsEvent extends Equatable {
  const AllProuctsEvent();

  @override
  List<Object> get props => [];
}

class GetAllProductsEvent extends AllProuctsEvent {
  GetAllProductsEvent();
}
