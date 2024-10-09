//
//  Generated code. Do not modify.
//  source: sync.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use syncRequestDescriptor instead')
const SyncRequest$json = {
  '1': 'SyncRequest',
  '2': [
    {'1': 'sep', '3': 1, '4': 1, '5': 9, '10': 'sep'},
    {'1': 'user', '3': 2, '4': 1, '5': 9, '10': 'user'},
    {'1': 'clientTree', '3': 3, '4': 3, '5': 11, '6': '.sync.SyncRequest.ClientTreeEntry', '10': 'clientTree'},
    {'1': 'toRemove', '3': 4, '4': 3, '5': 9, '10': 'toRemove'},
  ],
  '3': [SyncRequest_ClientTreeEntry$json],
};

@$core.Deprecated('Use syncRequestDescriptor instead')
const SyncRequest_ClientTreeEntry$json = {
  '1': 'ClientTreeEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.sync.FileData', '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `SyncRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List syncRequestDescriptor = $convert.base64Decode(
    'CgtTeW5jUmVxdWVzdBIQCgNzZXAYASABKAlSA3NlcBISCgR1c2VyGAIgASgJUgR1c2VyEkEKCm'
    'NsaWVudFRyZWUYAyADKAsyIS5zeW5jLlN5bmNSZXF1ZXN0LkNsaWVudFRyZWVFbnRyeVIKY2xp'
    'ZW50VHJlZRIaCgh0b1JlbW92ZRgEIAMoCVIIdG9SZW1vdmUaTQoPQ2xpZW50VHJlZUVudHJ5Eh'
    'AKA2tleRgBIAEoCVIDa2V5EiQKBXZhbHVlGAIgASgLMg4uc3luYy5GaWxlRGF0YVIFdmFsdWU6'
    'AjgB');

@$core.Deprecated('Use syncResponseDescriptor instead')
const SyncResponse$json = {
  '1': 'SyncResponse',
  '2': [
    {'1': 'elements', '3': 1, '4': 3, '5': 11, '6': '.sync.SyncResponse.ElementsEntry', '10': 'elements'},
    {'1': 'toUpdate', '3': 2, '4': 3, '5': 11, '6': '.sync.ChecksumsList', '10': 'toUpdate'},
    {'1': 'toClientUpdate', '3': 3, '4': 3, '5': 11, '6': '.sync.ChecksumsList', '10': 'toClientUpdate'},
  ],
  '3': [SyncResponse_ElementsEntry$json],
};

@$core.Deprecated('Use syncResponseDescriptor instead')
const SyncResponse_ElementsEntry$json = {
  '1': 'ElementsEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.sync.FileList', '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `SyncResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List syncResponseDescriptor = $convert.base64Decode(
    'CgxTeW5jUmVzcG9uc2USPAoIZWxlbWVudHMYASADKAsyIC5zeW5jLlN5bmNSZXNwb25zZS5FbG'
    'VtZW50c0VudHJ5UghlbGVtZW50cxIvCgh0b1VwZGF0ZRgCIAMoCzITLnN5bmMuQ2hlY2tzdW1z'
    'TGlzdFIIdG9VcGRhdGUSOwoOdG9DbGllbnRVcGRhdGUYAyADKAsyEy5zeW5jLkNoZWNrc3Vtc0'
    'xpc3RSDnRvQ2xpZW50VXBkYXRlGksKDUVsZW1lbnRzRW50cnkSEAoDa2V5GAEgASgJUgNrZXkS'
    'JAoFdmFsdWUYAiABKAsyDi5zeW5jLkZpbGVMaXN0UgV2YWx1ZToCOAE=');

@$core.Deprecated('Use uploadBlockRequestDescriptor instead')
const UploadBlockRequest$json = {
  '1': 'UploadBlockRequest',
  '2': [
    {'1': 'path', '3': 1, '4': 1, '5': 9, '10': 'path'},
    {'1': 'block', '3': 2, '4': 1, '5': 11, '6': '.sync.Block', '10': 'block'},
  ],
};

/// Descriptor for `UploadBlockRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List uploadBlockRequestDescriptor = $convert.base64Decode(
    'ChJVcGxvYWRCbG9ja1JlcXVlc3QSEgoEcGF0aBgBIAEoCVIEcGF0aBIhCgVibG9jaxgCIAEoCz'
    'ILLnN5bmMuQmxvY2tSBWJsb2Nr');

@$core.Deprecated('Use downloadBlockRequestDescriptor instead')
const DownloadBlockRequest$json = {
  '1': 'DownloadBlockRequest',
  '2': [
    {'1': 'path', '3': 1, '4': 1, '5': 9, '10': 'path'},
    {'1': 'number', '3': 2, '4': 1, '5': 4, '10': 'number'},
    {'1': 'block_size', '3': 3, '4': 1, '5': 3, '10': 'blockSize'},
    {'1': 'user', '3': 4, '4': 1, '5': 9, '10': 'user'},
  ],
};

/// Descriptor for `DownloadBlockRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List downloadBlockRequestDescriptor = $convert.base64Decode(
    'ChREb3dubG9hZEJsb2NrUmVxdWVzdBISCgRwYXRoGAEgASgJUgRwYXRoEhYKBm51bWJlchgCIA'
    'EoBFIGbnVtYmVyEh0KCmJsb2NrX3NpemUYAyABKANSCWJsb2NrU2l6ZRISCgR1c2VyGAQgASgJ'
    'UgR1c2Vy');

@$core.Deprecated('Use downloadBlockResponseDescriptor instead')
const DownloadBlockResponse$json = {
  '1': 'DownloadBlockResponse',
  '2': [
    {'1': 'block', '3': 2, '4': 1, '5': 11, '6': '.sync.Block', '10': 'block'},
  ],
};

/// Descriptor for `DownloadBlockResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List downloadBlockResponseDescriptor = $convert.base64Decode(
    'ChVEb3dubG9hZEJsb2NrUmVzcG9uc2USIQoFYmxvY2sYAiABKAsyCy5zeW5jLkJsb2NrUgVibG'
    '9jaw==');

@$core.Deprecated('Use blockDescriptor instead')
const Block$json = {
  '1': 'Block',
  '2': [
    {'1': 'reference', '3': 1, '4': 1, '5': 8, '10': 'reference'},
    {'1': 'number', '3': 2, '4': 1, '5': 13, '10': 'number'},
    {'1': 'payload', '3': 3, '4': 1, '5': 12, '10': 'payload'},
  ],
};

/// Descriptor for `Block`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List blockDescriptor = $convert.base64Decode(
    'CgVCbG9jaxIcCglyZWZlcmVuY2UYASABKAhSCXJlZmVyZW5jZRIWCgZudW1iZXIYAiABKA1SBm'
    '51bWJlchIYCgdwYXlsb2FkGAMgASgMUgdwYXlsb2Fk');

@$core.Deprecated('Use fileDataDescriptor instead')
const FileData$json = {
  '1': 'FileData',
  '2': [
    {'1': 'path', '3': 1, '4': 1, '5': 9, '10': 'path'},
    {'1': 'fingerprint', '3': 2, '4': 1, '5': 9, '10': 'fingerprint'},
    {'1': 'folderFingerprint', '3': 3, '4': 1, '5': 9, '10': 'folderFingerprint'},
    {'1': 'modified', '3': 4, '4': 1, '5': 9, '10': 'modified'},
    {'1': 'isDir', '3': 5, '4': 1, '5': 8, '10': 'isDir'},
    {'1': 'permissions', '3': 6, '4': 1, '5': 9, '10': 'permissions'},
    {'1': 'size', '3': 7, '4': 1, '5': 3, '10': 'size'},
  ],
};

/// Descriptor for `FileData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fileDataDescriptor = $convert.base64Decode(
    'CghGaWxlRGF0YRISCgRwYXRoGAEgASgJUgRwYXRoEiAKC2ZpbmdlcnByaW50GAIgASgJUgtmaW'
    '5nZXJwcmludBIsChFmb2xkZXJGaW5nZXJwcmludBgDIAEoCVIRZm9sZGVyRmluZ2VycHJpbnQS'
    'GgoIbW9kaWZpZWQYBCABKAlSCG1vZGlmaWVkEhQKBWlzRGlyGAUgASgIUgVpc0RpchIgCgtwZX'
    'JtaXNzaW9ucxgGIAEoCVILcGVybWlzc2lvbnMSEgoEc2l6ZRgHIAEoA1IEc2l6ZQ==');

@$core.Deprecated('Use fileListDescriptor instead')
const FileList$json = {
  '1': 'FileList',
  '2': [
    {'1': 'elements', '3': 1, '4': 3, '5': 11, '6': '.sync.FileData', '10': 'elements'},
  ],
};

/// Descriptor for `FileList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fileListDescriptor = $convert.base64Decode(
    'CghGaWxlTGlzdBIqCghlbGVtZW50cxgBIAMoCzIOLnN5bmMuRmlsZURhdGFSCGVsZW1lbnRz');

@$core.Deprecated('Use checksumDescriptor instead')
const Checksum$json = {
  '1': 'Checksum',
  '2': [
    {'1': 'strong', '3': 1, '4': 1, '5': 9, '10': 'strong'},
  ],
};

/// Descriptor for `Checksum`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List checksumDescriptor = $convert.base64Decode(
    'CghDaGVja3N1bRIWCgZzdHJvbmcYASABKAlSBnN0cm9uZw==');

@$core.Deprecated('Use checksumsListDescriptor instead')
const ChecksumsList$json = {
  '1': 'ChecksumsList',
  '2': [
    {'1': 'path', '3': 1, '4': 1, '5': 9, '10': 'path'},
    {'1': 'block_size', '3': 2, '4': 1, '5': 13, '10': 'blockSize'},
    {'1': 'checksums', '3': 3, '4': 3, '5': 11, '6': '.sync.Checksum', '10': 'checksums'},
  ],
};

/// Descriptor for `ChecksumsList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List checksumsListDescriptor = $convert.base64Decode(
    'Cg1DaGVja3N1bXNMaXN0EhIKBHBhdGgYASABKAlSBHBhdGgSHQoKYmxvY2tfc2l6ZRgCIAEoDV'
    'IJYmxvY2tTaXplEiwKCWNoZWNrc3VtcxgDIAMoCzIOLnN5bmMuQ2hlY2tzdW1SCWNoZWNrc3Vt'
    'cw==');

@$core.Deprecated('Use pingRequestDescriptor instead')
const PingRequest$json = {
  '1': 'PingRequest',
};

/// Descriptor for `PingRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pingRequestDescriptor = $convert.base64Decode(
    'CgtQaW5nUmVxdWVzdA==');

@$core.Deprecated('Use pingReplyDescriptor instead')
const PingReply$json = {
  '1': 'PingReply',
  '2': [
    {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `PingReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pingReplyDescriptor = $convert.base64Decode(
    'CglQaW5nUmVwbHkSGAoHbWVzc2FnZRgBIAEoCVIHbWVzc2FnZQ==');

@$core.Deprecated('Use fileUploadRequestDescriptor instead')
const FileUploadRequest$json = {
  '1': 'FileUploadRequest',
  '2': [
    {'1': 'fileName', '3': 1, '4': 1, '5': 9, '10': 'fileName'},
    {'1': 'folderFingerprint', '3': 2, '4': 1, '5': 9, '10': 'folderFingerprint'},
    {'1': 'chunk', '3': 3, '4': 1, '5': 12, '10': 'chunk'},
    {'1': 'username', '3': 4, '4': 1, '5': 9, '10': 'username'},
  ],
};

/// Descriptor for `FileUploadRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fileUploadRequestDescriptor = $convert.base64Decode(
    'ChFGaWxlVXBsb2FkUmVxdWVzdBIaCghmaWxlTmFtZRgBIAEoCVIIZmlsZU5hbWUSLAoRZm9sZG'
    'VyRmluZ2VycHJpbnQYAiABKAlSEWZvbGRlckZpbmdlcnByaW50EhQKBWNodW5rGAMgASgMUgVj'
    'aHVuaxIaCgh1c2VybmFtZRgEIAEoCVIIdXNlcm5hbWU=');

@$core.Deprecated('Use fileUploadResponseDescriptor instead')
const FileUploadResponse$json = {
  '1': 'FileUploadResponse',
};

/// Descriptor for `FileUploadResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fileUploadResponseDescriptor = $convert.base64Decode(
    'ChJGaWxlVXBsb2FkUmVzcG9uc2U=');

@$core.Deprecated('Use downloadRequestDescriptor instead')
const DownloadRequest$json = {
  '1': 'DownloadRequest',
  '2': [
    {'1': 'fingerprint', '3': 1, '4': 1, '5': 9, '10': 'fingerprint'},
  ],
};

/// Descriptor for `DownloadRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List downloadRequestDescriptor = $convert.base64Decode(
    'Cg9Eb3dubG9hZFJlcXVlc3QSIAoLZmluZ2VycHJpbnQYASABKAlSC2ZpbmdlcnByaW50');

@$core.Deprecated('Use downloadResponseDescriptor instead')
const DownloadResponse$json = {
  '1': 'DownloadResponse',
  '2': [
    {'1': 'chunk', '3': 1, '4': 1, '5': 12, '10': 'chunk'},
  ],
};

/// Descriptor for `DownloadResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List downloadResponseDescriptor = $convert.base64Decode(
    'ChBEb3dubG9hZFJlc3BvbnNlEhQKBWNodW5rGAEgASgMUgVjaHVuaw==');

@$core.Deprecated('Use uploadResponseDescriptor instead')
const UploadResponse$json = {
  '1': 'UploadResponse',
};

/// Descriptor for `UploadResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List uploadResponseDescriptor = $convert.base64Decode(
    'Cg5VcGxvYWRSZXNwb25zZQ==');

