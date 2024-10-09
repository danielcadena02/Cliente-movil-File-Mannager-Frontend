//
//  Generated code. Do not modify.
//  source: sync.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'sync.pb.dart' as $0;

export 'sync.pb.dart';

@$pb.GrpcServiceName('sync.SyncService')
class SyncServiceClient extends $grpc.Client {
  static final _$ping = $grpc.ClientMethod<$0.PingRequest, $0.PingReply>(
      '/sync.SyncService/Ping',
      ($0.PingRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.PingReply.fromBuffer(value));
  static final _$sync = $grpc.ClientMethod<$0.SyncRequest, $0.SyncResponse>(
      '/sync.SyncService/Sync',
      ($0.SyncRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.SyncResponse.fromBuffer(value));
  static final _$upload = $grpc.ClientMethod<$0.FileUploadRequest, $0.FileUploadResponse>(
      '/sync.SyncService/Upload',
      ($0.FileUploadRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.FileUploadResponse.fromBuffer(value));
  static final _$download = $grpc.ClientMethod<$0.DownloadRequest, $0.DownloadResponse>(
      '/sync.SyncService/Download',
      ($0.DownloadRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.DownloadResponse.fromBuffer(value));
  static final _$uploadBlocks = $grpc.ClientMethod<$0.UploadBlockRequest, $0.UploadResponse>(
      '/sync.SyncService/UploadBlocks',
      ($0.UploadBlockRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UploadResponse.fromBuffer(value));
  static final _$downloadBlocks = $grpc.ClientMethod<$0.DownloadBlockRequest, $0.DownloadBlockResponse>(
      '/sync.SyncService/DownloadBlocks',
      ($0.DownloadBlockRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.DownloadBlockResponse.fromBuffer(value));

  SyncServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.PingReply> ping($0.PingRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$ping, request, options: options);
  }

  $grpc.ResponseFuture<$0.SyncResponse> sync($0.SyncRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$sync, request, options: options);
  }

  $grpc.ResponseFuture<$0.FileUploadResponse> upload($async.Stream<$0.FileUploadRequest> request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$upload, request, options: options).single;
  }

  $grpc.ResponseStream<$0.DownloadResponse> download($0.DownloadRequest request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$download, $async.Stream.fromIterable([request]), options: options);
  }

  $grpc.ResponseFuture<$0.UploadResponse> uploadBlocks($async.Stream<$0.UploadBlockRequest> request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$uploadBlocks, request, options: options).single;
  }

  $grpc.ResponseStream<$0.DownloadBlockResponse> downloadBlocks($0.DownloadBlockRequest request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$downloadBlocks, $async.Stream.fromIterable([request]), options: options);
  }
}

@$pb.GrpcServiceName('sync.SyncService')
abstract class SyncServiceBase extends $grpc.Service {
  $core.String get $name => 'sync.SyncService';

  SyncServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.PingRequest, $0.PingReply>(
        'Ping',
        ping_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.PingRequest.fromBuffer(value),
        ($0.PingReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SyncRequest, $0.SyncResponse>(
        'Sync',
        sync_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SyncRequest.fromBuffer(value),
        ($0.SyncResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FileUploadRequest, $0.FileUploadResponse>(
        'Upload',
        upload,
        true,
        false,
        ($core.List<$core.int> value) => $0.FileUploadRequest.fromBuffer(value),
        ($0.FileUploadResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DownloadRequest, $0.DownloadResponse>(
        'Download',
        download_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.DownloadRequest.fromBuffer(value),
        ($0.DownloadResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UploadBlockRequest, $0.UploadResponse>(
        'UploadBlocks',
        uploadBlocks,
        true,
        false,
        ($core.List<$core.int> value) => $0.UploadBlockRequest.fromBuffer(value),
        ($0.UploadResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DownloadBlockRequest, $0.DownloadBlockResponse>(
        'DownloadBlocks',
        downloadBlocks_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.DownloadBlockRequest.fromBuffer(value),
        ($0.DownloadBlockResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.PingReply> ping_Pre($grpc.ServiceCall call, $async.Future<$0.PingRequest> request) async {
    return ping(call, await request);
  }

  $async.Future<$0.SyncResponse> sync_Pre($grpc.ServiceCall call, $async.Future<$0.SyncRequest> request) async {
    return sync(call, await request);
  }

  $async.Stream<$0.DownloadResponse> download_Pre($grpc.ServiceCall call, $async.Future<$0.DownloadRequest> request) async* {
    yield* download(call, await request);
  }

  $async.Stream<$0.DownloadBlockResponse> downloadBlocks_Pre($grpc.ServiceCall call, $async.Future<$0.DownloadBlockRequest> request) async* {
    yield* downloadBlocks(call, await request);
  }

  $async.Future<$0.PingReply> ping($grpc.ServiceCall call, $0.PingRequest request);
  $async.Future<$0.SyncResponse> sync($grpc.ServiceCall call, $0.SyncRequest request);
  $async.Future<$0.FileUploadResponse> upload($grpc.ServiceCall call, $async.Stream<$0.FileUploadRequest> request);
  $async.Stream<$0.DownloadResponse> download($grpc.ServiceCall call, $0.DownloadRequest request);
  $async.Future<$0.UploadResponse> uploadBlocks($grpc.ServiceCall call, $async.Stream<$0.UploadBlockRequest> request);
  $async.Stream<$0.DownloadBlockResponse> downloadBlocks($grpc.ServiceCall call, $0.DownloadBlockRequest request);
}
