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
          type: dioError?.type ?? DioExceptionType.unknown,
          error: dioError?.error,
        );

  static Failure fromDioError(DioException dioError) {
    final data = dioError.response?.data;
    String? message;
    if (data is Map<String, dynamic> && data.containsKey('status_message')) {
      message = data['status_message'];
    } else if (dioError.message?.isNotEmpty == true) {
      message = dioError.message;
    } else if (dioError.response?.statusMessage?.isNotEmpty == true) {
      message = dioError.response!.statusMessage;
    }

    final dataResponse = data is Map<String, dynamic> ? data : null;
    return parse(
      statusCode: dataResponse?['status_code'] ?? dioError.response?.statusCode,
      message: message,
    );
  }

  static Failure parse({
    required int? statusCode,
    String? message,
    Object? list,
  }) {
    switch (statusCode) {
      case 501:
        return InvalidServiceFailure(message: message, code: statusCode);
      case 401:
        return AuthenticationFailed(message: message, code: statusCode);
      case 405:
        return InvalidFormatFailure(message: message, code: statusCode);
      case 422:
        return InvalidParametersFailure(message: message, code: statusCode);
      case 404:
        return InvalidIdFailure(message: message, code: statusCode);
      case 403:
        return DuplicateEntryFailure(message: message, code: statusCode);
      case 503:
        return ServiceOfflineFailure(message: message, code: statusCode);
      case 500:
        return InternalErrorFailure(message: message, code: statusCode);
      case 400:
        return ValidationFailed(message: message, code: statusCode);
      case 406:
        return InvalidAcceptHeader(message: message, code: statusCode);
      case 429:
        return RequestLimitExceeded(message: message, code: statusCode);
      case 504:
        return BackendServerTimeout(message: message, code: statusCode);
      case 502:
        return BackendConnectionFailed(message: message, code: statusCode);
      case 200:
        return EntryNotFound(message: message, code: statusCode);
      default:
        return UnhandledFailure(message: message, code: statusCode, list: list);
    }
  }
}

class InvalidServiceFailure extends Failure {
  InvalidServiceFailure({String? message, super.code})
      : super(message: message ?? 'Serviço inválido: este serviço não existe.');
}

class AuthenticationFailed extends Failure {
  AuthenticationFailed({String? message, super.code})
      : super(message: message ?? 'Falha na autenticação: você não tem permissão para acessar o serviço.');
}

class InvalidFormatFailure extends Failure {
  InvalidFormatFailure({String? message, super.code})
      : super(message: message ?? 'Formato inválido: este serviço não existe nesse formato.');
}

class InvalidParametersFailure extends Failure {
  InvalidParametersFailure({String? message, super.code})
      : super(message: message ?? 'Parâmetros inválidos: os parâmetros da solicitação estão incorretos.');
}

class InvalidIdFailure extends Failure {
  InvalidIdFailure({String? message, super.code})
      : super(message: message ?? 'ID inválido: o ID pré-requisito é inválido ou não encontrado.');
}

class DuplicateEntryFailure extends Failure {
  DuplicateEntryFailure({String? message, super.code})
      : super(message: message ?? 'Entrada duplicada: os dados que você tentou enviar já existem.');
}

class ServiceOfflineFailure extends Failure {
  ServiceOfflineFailure({String? message, super.code})
      : super(
            message:
                message ?? 'Serviço offline: este serviço está temporariamente offline, tente novamente mais tarde.');
}

class InternalErrorFailure extends Failure {
  InternalErrorFailure({String? message, super.code})
      : super(message: message ?? 'Erro interno: algo deu errado, contate o TMDB.');
}

class ItemUpdatedSuccessfully extends Failure {
  ItemUpdatedSuccessfully({String? message, super.code})
      : super(message: message ?? 'O item/registro foi atualizado com sucesso.');
}

class ItemDeletedSuccessfully extends Failure {
  ItemDeletedSuccessfully({String? message, super.code})
      : super(message: message ?? 'O item/registro foi deletado com sucesso.');
}

class ValidationFailed extends Failure {
  ValidationFailed({String? message, super.code}) : super(message: message ?? 'Falha na validação.');
}

class InvalidAcceptHeader extends Failure {
  InvalidAcceptHeader({String? message, super.code}) : super(message: message ?? 'Cabeçalho de aceitação inválido.');
}

class RequestLimitExceeded extends Failure {
  RequestLimitExceeded({String? message, super.code})
      : super(message: message ?? 'O número de solicitações excedeu o limite permitido.');
}

class BackendServerTimeout extends Failure {
  BackendServerTimeout({String? message, super.code})
      : super(message: message ?? 'Sua solicitação ao servidor backend expirou. Tente novamente.');
}

class BackendConnectionFailed extends Failure {
  BackendConnectionFailed({String? message, super.code})
      : super(message: message ?? 'Não foi possível conectar ao servidor backend.');
}

class EntryNotFound extends Failure {
  EntryNotFound({String? message, super.code})
      : super(
            message:
                message ?? 'Entrada não encontrada: o item que você está tentando editar não pode ser encontrado.');
}

class UnhandledFailure extends Failure {
  UnhandledFailure({String? message, super.code, super.list})
      : super(
          message: message ?? 'Erro desconhecido, não foi possível concluir o processo. Tente novamente.',
        );
}
