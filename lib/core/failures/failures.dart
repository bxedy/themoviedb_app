// ignore_for_file: overridden_fields

import 'package:dio/dio.dart';

abstract class Failure extends DioException {
  final String key;
  @override
  final String message;
  final int code;
  final Object? list;

  Failure({
    this.message = "",
    this.key = "",
    DioException? dioError,
    int? code,
    this.list,
  })  : code = code ?? 0,
        super(
          requestOptions: dioError?.requestOptions ?? RequestOptions(path: ''),
          response: dioError?.response,
          error: dioError?.error,
        );

  static Failure fromDioError(DioException dioError) {
    final statusCode = dioError.response?.statusCode;
    return parse(
      statusCode: statusCode,
      message: dioError.message,
    );
  }

  static Failure parse({
    required int? statusCode,
    String? message,
    Object? list,
  }) {
    switch (statusCode) {
      case 501:
        return InvalidServiceFailure(code: statusCode);
      case 401:
        return AuthenticationFailed(code: statusCode);
      case 405:
        return InvalidFormatFailure(code: statusCode);
      case 422:
        return InvalidParametersFailure(code: statusCode);
      case 404:
        return InvalidIdFailure(code: statusCode);
      case 403:
        return DuplicateEntryFailure(code: statusCode);
      case 503:
        return ServiceOfflineFailure(code: statusCode);
      case 500:
        return InternalErrorFailure(code: statusCode);
      case 400:
        return ValidationFailed(code: statusCode);
      case 406:
        return InvalidAcceptHeader(code: statusCode);
      case 429:
        return RequestLimitExceeded(code: statusCode);
      case 504:
        return BackendServerTimeout(code: statusCode);
      case 502:
        return BackendConnectionFailed(code: statusCode);
      case 200:
        return EntryNotFound(code: statusCode);
      default:
        return UnhandledFailure(code: statusCode, list: list);
    }
  }
}

class InvalidServiceFailure extends Failure {
  InvalidServiceFailure({super.code}) : super(message: 'Serviço inválido: este serviço não existe.');
}

class AuthenticationFailed extends Failure {
  AuthenticationFailed({super.code})
      : super(message: 'Falha na autenticação: você não tem permissão para acessar o serviço.');
}

class InvalidFormatFailure extends Failure {
  InvalidFormatFailure({super.code}) : super(message: 'Formato inválido: este serviço não existe nesse formato.');
}

class InvalidParametersFailure extends Failure {
  InvalidParametersFailure({super.code})
      : super(message: 'Parâmetros inválidos: os parâmetros da solicitação estão incorretos.');
}

class InvalidIdFailure extends Failure {
  InvalidIdFailure({super.code}) : super(message: 'ID inválido: o ID pré-requisito é inválido ou não encontrado.');
}

class DuplicateEntryFailure extends Failure {
  DuplicateEntryFailure({super.code})
      : super(message: 'Entrada duplicada: os dados que você tentou enviar já existem.');
}

class ServiceOfflineFailure extends Failure {
  ServiceOfflineFailure({super.code})
      : super(message: 'Serviço offline: este serviço está temporariamente offline, tente novamente mais tarde.');
}

class InternalErrorFailure extends Failure {
  InternalErrorFailure({super.code}) : super(message: 'Erro interno: algo deu errado, contate o TMDB.');
}

class ItemUpdatedSuccessfully extends Failure {
  ItemUpdatedSuccessfully({super.code}) : super(message: 'O item/registro foi atualizado com sucesso.');
}

class ItemDeletedSuccessfully extends Failure {
  ItemDeletedSuccessfully({super.code}) : super(message: 'O item/registro foi deletado com sucesso.');
}

class ValidationFailed extends Failure {
  ValidationFailed({super.code}) : super(message: 'Falha na validação.');
}

class InvalidAcceptHeader extends Failure {
  InvalidAcceptHeader({super.code}) : super(message: 'Cabeçalho de aceitação inválido.');
}

class RequestLimitExceeded extends Failure {
  RequestLimitExceeded({super.code}) : super(message: 'O número de solicitações excedeu o limite permitido.');
}

class BackendServerTimeout extends Failure {
  BackendServerTimeout({super.code}) : super(message: 'Sua solicitação ao servidor backend expirou. Tente novamente.');
}

class BackendConnectionFailed extends Failure {
  BackendConnectionFailed({super.code}) : super(message: 'Não foi possível conectar ao servidor backend.');
}

class EntryNotFound extends Failure {
  EntryNotFound({super.code})
      : super(message: 'Entrada não encontrada: o item que você está tentando editar não pode ser encontrado.');
}

class UnhandledFailure extends Failure {
  UnhandledFailure({super.code, super.list})
      : super(message: 'Erro desconhecido, não foi possível concluir o processo. Tente novamente.');
}
