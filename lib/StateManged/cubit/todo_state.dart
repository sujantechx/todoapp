import 'package:equatable/equatable.dart';

class TodoState extends Equatable {
  final List<Map<String, dynamic>> allTodo;
  final bool isLoading;

  const TodoState({
    required this.allTodo,
    this.isLoading = false,
  });

  factory TodoState.initial() {
    return const TodoState(allTodo: []);
  }

  TodoState copyWith({
    List<Map<String, dynamic>>? allTodo,
    bool? isLoading,
  }) {
    return TodoState(
      allTodo: allTodo ?? this.allTodo,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [allTodo, isLoading];
}
