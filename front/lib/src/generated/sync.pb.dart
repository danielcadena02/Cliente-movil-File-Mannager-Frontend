//
//  Generated code. Do not modify.
//  source: sync.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class SyncRequest extends $pb.GeneratedMessage {
  factory SyncRequest({
    $core.String? sep,
    $core.String? user,
    $core.Map<$core.String, FileData>? clientTree,
    $core.Iterable<$core.String>? toRemove,
  }) {
    final $result = create();
    if (sep != null) {
      $result.sep = sep;
    }
    if (user != null) {
      $result.user = user;
    }
    if (clientTree != null) {
      $result.clientTree.addAll(clientTree);
    }
    if (toRemove != null) {
      $result.toRemove.addAll(toRemove);
    }
    return $result;
  }
  SyncRequest._() : super();
  factory SyncRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SyncRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SyncRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'sync'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'sep')
    ..aOS(2, _omitFieldNames ? '' : 'user')
    ..m<$core.String, FileData>(3, _omitFieldNames ? '' : 'clientTree', protoName: 'clientTree', entryClassName: 'SyncRequest.ClientTreeEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OM, valueCreator: FileData.create, valueDefaultOrMaker: FileData.getDefault, packageName: const $pb.PackageName('sync'))
    ..pPS(4, _omitFieldNames ? '' : 'toRemove', protoName: 'toRemove')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SyncRequest clone() => SyncRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SyncRequest copyWith(void Function(SyncRequest) updates) => super.copyWith((message) => updates(message as SyncRequest)) as SyncRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SyncRequest create() => SyncRequest._();
  SyncRequest createEmptyInstance() => create();
  static $pb.PbList<SyncRequest> createRepeated() => $pb.PbList<SyncRequest>();
  @$core.pragma('dart2js:noInline')
  static SyncRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SyncRequest>(create);
  static SyncRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sep => $_getSZ(0);
  @$pb.TagNumber(1)
  set sep($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSep() => $_has(0);
  @$pb.TagNumber(1)
  void clearSep() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get user => $_getSZ(1);
  @$pb.TagNumber(2)
  set user($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUser() => $_has(1);
  @$pb.TagNumber(2)
  void clearUser() => clearField(2);

  @$pb.TagNumber(3)
  $core.Map<$core.String, FileData> get clientTree => $_getMap(2);

  @$pb.TagNumber(4)
  $core.List<$core.String> get toRemove => $_getList(3);
}

class SyncResponse extends $pb.GeneratedMessage {
  factory SyncResponse({
    $core.Map<$core.String, FileList>? elements,
    $core.Iterable<ChecksumsList>? toUpdate,
    $core.Iterable<ChecksumsList>? toClientUpdate,
  }) {
    final $result = create();
    if (elements != null) {
      $result.elements.addAll(elements);
    }
    if (toUpdate != null) {
      $result.toUpdate.addAll(toUpdate);
    }
    if (toClientUpdate != null) {
      $result.toClientUpdate.addAll(toClientUpdate);
    }
    return $result;
  }
  SyncResponse._() : super();
  factory SyncResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SyncResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SyncResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'sync'), createEmptyInstance: create)
    ..m<$core.String, FileList>(1, _omitFieldNames ? '' : 'elements', entryClassName: 'SyncResponse.ElementsEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OM, valueCreator: FileList.create, valueDefaultOrMaker: FileList.getDefault, packageName: const $pb.PackageName('sync'))
    ..pc<ChecksumsList>(2, _omitFieldNames ? '' : 'toUpdate', $pb.PbFieldType.PM, protoName: 'toUpdate', subBuilder: ChecksumsList.create)
    ..pc<ChecksumsList>(3, _omitFieldNames ? '' : 'toClientUpdate', $pb.PbFieldType.PM, protoName: 'toClientUpdate', subBuilder: ChecksumsList.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SyncResponse clone() => SyncResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SyncResponse copyWith(void Function(SyncResponse) updates) => super.copyWith((message) => updates(message as SyncResponse)) as SyncResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SyncResponse create() => SyncResponse._();
  SyncResponse createEmptyInstance() => create();
  static $pb.PbList<SyncResponse> createRepeated() => $pb.PbList<SyncResponse>();
  @$core.pragma('dart2js:noInline')
  static SyncResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SyncResponse>(create);
  static SyncResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.Map<$core.String, FileList> get elements => $_getMap(0);

  @$pb.TagNumber(2)
  $core.List<ChecksumsList> get toUpdate => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<ChecksumsList> get toClientUpdate => $_getList(2);
}

class UploadBlockRequest extends $pb.GeneratedMessage {
  factory UploadBlockRequest({
    $core.String? path,
    Block? block,
  }) {
    final $result = create();
    if (path != null) {
      $result.path = path;
    }
    if (block != null) {
      $result.block = block;
    }
    return $result;
  }
  UploadBlockRequest._() : super();
  factory UploadBlockRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UploadBlockRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UploadBlockRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'sync'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'path')
    ..aOM<Block>(2, _omitFieldNames ? '' : 'block', subBuilder: Block.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UploadBlockRequest clone() => UploadBlockRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UploadBlockRequest copyWith(void Function(UploadBlockRequest) updates) => super.copyWith((message) => updates(message as UploadBlockRequest)) as UploadBlockRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UploadBlockRequest create() => UploadBlockRequest._();
  UploadBlockRequest createEmptyInstance() => create();
  static $pb.PbList<UploadBlockRequest> createRepeated() => $pb.PbList<UploadBlockRequest>();
  @$core.pragma('dart2js:noInline')
  static UploadBlockRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UploadBlockRequest>(create);
  static UploadBlockRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get path => $_getSZ(0);
  @$pb.TagNumber(1)
  set path($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPath() => $_has(0);
  @$pb.TagNumber(1)
  void clearPath() => clearField(1);

  @$pb.TagNumber(2)
  Block get block => $_getN(1);
  @$pb.TagNumber(2)
  set block(Block v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasBlock() => $_has(1);
  @$pb.TagNumber(2)
  void clearBlock() => clearField(2);
  @$pb.TagNumber(2)
  Block ensureBlock() => $_ensure(1);
}

class DownloadBlockRequest extends $pb.GeneratedMessage {
  factory DownloadBlockRequest({
    $core.String? path,
    $fixnum.Int64? number,
    $fixnum.Int64? blockSize,
    $core.String? user,
  }) {
    final $result = create();
    if (path != null) {
      $result.path = path;
    }
    if (number != null) {
      $result.number = number;
    }
    if (blockSize != null) {
      $result.blockSize = blockSize;
    }
    if (user != null) {
      $result.user = user;
    }
    return $result;
  }
  DownloadBlockRequest._() : super();
  factory DownloadBlockRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DownloadBlockRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DownloadBlockRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'sync'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'path')
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'number', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aInt64(3, _omitFieldNames ? '' : 'blockSize')
    ..aOS(4, _omitFieldNames ? '' : 'user')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DownloadBlockRequest clone() => DownloadBlockRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DownloadBlockRequest copyWith(void Function(DownloadBlockRequest) updates) => super.copyWith((message) => updates(message as DownloadBlockRequest)) as DownloadBlockRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DownloadBlockRequest create() => DownloadBlockRequest._();
  DownloadBlockRequest createEmptyInstance() => create();
  static $pb.PbList<DownloadBlockRequest> createRepeated() => $pb.PbList<DownloadBlockRequest>();
  @$core.pragma('dart2js:noInline')
  static DownloadBlockRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DownloadBlockRequest>(create);
  static DownloadBlockRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get path => $_getSZ(0);
  @$pb.TagNumber(1)
  set path($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPath() => $_has(0);
  @$pb.TagNumber(1)
  void clearPath() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get number => $_getI64(1);
  @$pb.TagNumber(2)
  set number($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearNumber() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get blockSize => $_getI64(2);
  @$pb.TagNumber(3)
  set blockSize($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBlockSize() => $_has(2);
  @$pb.TagNumber(3)
  void clearBlockSize() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get user => $_getSZ(3);
  @$pb.TagNumber(4)
  set user($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasUser() => $_has(3);
  @$pb.TagNumber(4)
  void clearUser() => clearField(4);
}

class DownloadBlockResponse extends $pb.GeneratedMessage {
  factory DownloadBlockResponse({
    Block? block,
  }) {
    final $result = create();
    if (block != null) {
      $result.block = block;
    }
    return $result;
  }
  DownloadBlockResponse._() : super();
  factory DownloadBlockResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DownloadBlockResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DownloadBlockResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'sync'), createEmptyInstance: create)
    ..aOM<Block>(2, _omitFieldNames ? '' : 'block', subBuilder: Block.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DownloadBlockResponse clone() => DownloadBlockResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DownloadBlockResponse copyWith(void Function(DownloadBlockResponse) updates) => super.copyWith((message) => updates(message as DownloadBlockResponse)) as DownloadBlockResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DownloadBlockResponse create() => DownloadBlockResponse._();
  DownloadBlockResponse createEmptyInstance() => create();
  static $pb.PbList<DownloadBlockResponse> createRepeated() => $pb.PbList<DownloadBlockResponse>();
  @$core.pragma('dart2js:noInline')
  static DownloadBlockResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DownloadBlockResponse>(create);
  static DownloadBlockResponse? _defaultInstance;

  @$pb.TagNumber(2)
  Block get block => $_getN(0);
  @$pb.TagNumber(2)
  set block(Block v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasBlock() => $_has(0);
  @$pb.TagNumber(2)
  void clearBlock() => clearField(2);
  @$pb.TagNumber(2)
  Block ensureBlock() => $_ensure(0);
}

class Block extends $pb.GeneratedMessage {
  factory Block({
    $core.bool? reference,
    $core.int? number,
    $core.List<$core.int>? payload,
  }) {
    final $result = create();
    if (reference != null) {
      $result.reference = reference;
    }
    if (number != null) {
      $result.number = number;
    }
    if (payload != null) {
      $result.payload = payload;
    }
    return $result;
  }
  Block._() : super();
  factory Block.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Block.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Block', package: const $pb.PackageName(_omitMessageNames ? '' : 'sync'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'reference')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'number', $pb.PbFieldType.OU3)
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'payload', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Block clone() => Block()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Block copyWith(void Function(Block) updates) => super.copyWith((message) => updates(message as Block)) as Block;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Block create() => Block._();
  Block createEmptyInstance() => create();
  static $pb.PbList<Block> createRepeated() => $pb.PbList<Block>();
  @$core.pragma('dart2js:noInline')
  static Block getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Block>(create);
  static Block? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get reference => $_getBF(0);
  @$pb.TagNumber(1)
  set reference($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasReference() => $_has(0);
  @$pb.TagNumber(1)
  void clearReference() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get number => $_getIZ(1);
  @$pb.TagNumber(2)
  set number($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearNumber() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get payload => $_getN(2);
  @$pb.TagNumber(3)
  set payload($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPayload() => $_has(2);
  @$pb.TagNumber(3)
  void clearPayload() => clearField(3);
}

class FileData extends $pb.GeneratedMessage {
  factory FileData({
    $core.String? path,
    $core.String? fingerprint,
    $core.String? folderFingerprint,
    $core.String? modified,
    $core.bool? isDir,
    $core.String? permissions,
    $fixnum.Int64? size,
  }) {
    final $result = create();
    if (path != null) {
      $result.path = path;
    }
    if (fingerprint != null) {
      $result.fingerprint = fingerprint;
    }
    if (folderFingerprint != null) {
      $result.folderFingerprint = folderFingerprint;
    }
    if (modified != null) {
      $result.modified = modified;
    }
    if (isDir != null) {
      $result.isDir = isDir;
    }
    if (permissions != null) {
      $result.permissions = permissions;
    }
    if (size != null) {
      $result.size = size;
    }
    return $result;
  }
  FileData._() : super();
  factory FileData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FileData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FileData', package: const $pb.PackageName(_omitMessageNames ? '' : 'sync'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'path')
    ..aOS(2, _omitFieldNames ? '' : 'fingerprint')
    ..aOS(3, _omitFieldNames ? '' : 'folderFingerprint', protoName: 'folderFingerprint')
    ..aOS(4, _omitFieldNames ? '' : 'modified')
    ..aOB(5, _omitFieldNames ? '' : 'isDir', protoName: 'isDir')
    ..aOS(6, _omitFieldNames ? '' : 'permissions')
    ..aInt64(7, _omitFieldNames ? '' : 'size')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FileData clone() => FileData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FileData copyWith(void Function(FileData) updates) => super.copyWith((message) => updates(message as FileData)) as FileData;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FileData create() => FileData._();
  FileData createEmptyInstance() => create();
  static $pb.PbList<FileData> createRepeated() => $pb.PbList<FileData>();
  @$core.pragma('dart2js:noInline')
  static FileData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FileData>(create);
  static FileData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get path => $_getSZ(0);
  @$pb.TagNumber(1)
  set path($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPath() => $_has(0);
  @$pb.TagNumber(1)
  void clearPath() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get fingerprint => $_getSZ(1);
  @$pb.TagNumber(2)
  set fingerprint($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFingerprint() => $_has(1);
  @$pb.TagNumber(2)
  void clearFingerprint() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get folderFingerprint => $_getSZ(2);
  @$pb.TagNumber(3)
  set folderFingerprint($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFolderFingerprint() => $_has(2);
  @$pb.TagNumber(3)
  void clearFolderFingerprint() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get modified => $_getSZ(3);
  @$pb.TagNumber(4)
  set modified($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasModified() => $_has(3);
  @$pb.TagNumber(4)
  void clearModified() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get isDir => $_getBF(4);
  @$pb.TagNumber(5)
  set isDir($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIsDir() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsDir() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get permissions => $_getSZ(5);
  @$pb.TagNumber(6)
  set permissions($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasPermissions() => $_has(5);
  @$pb.TagNumber(6)
  void clearPermissions() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get size => $_getI64(6);
  @$pb.TagNumber(7)
  set size($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasSize() => $_has(6);
  @$pb.TagNumber(7)
  void clearSize() => clearField(7);
}

class FileList extends $pb.GeneratedMessage {
  factory FileList({
    $core.Iterable<FileData>? elements,
  }) {
    final $result = create();
    if (elements != null) {
      $result.elements.addAll(elements);
    }
    return $result;
  }
  FileList._() : super();
  factory FileList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FileList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FileList', package: const $pb.PackageName(_omitMessageNames ? '' : 'sync'), createEmptyInstance: create)
    ..pc<FileData>(1, _omitFieldNames ? '' : 'elements', $pb.PbFieldType.PM, subBuilder: FileData.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FileList clone() => FileList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FileList copyWith(void Function(FileList) updates) => super.copyWith((message) => updates(message as FileList)) as FileList;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FileList create() => FileList._();
  FileList createEmptyInstance() => create();
  static $pb.PbList<FileList> createRepeated() => $pb.PbList<FileList>();
  @$core.pragma('dart2js:noInline')
  static FileList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FileList>(create);
  static FileList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<FileData> get elements => $_getList(0);
}

class Checksum extends $pb.GeneratedMessage {
  factory Checksum({
    $core.String? strong,
  }) {
    final $result = create();
    if (strong != null) {
      $result.strong = strong;
    }
    return $result;
  }
  Checksum._() : super();
  factory Checksum.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Checksum.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Checksum', package: const $pb.PackageName(_omitMessageNames ? '' : 'sync'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'strong')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Checksum clone() => Checksum()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Checksum copyWith(void Function(Checksum) updates) => super.copyWith((message) => updates(message as Checksum)) as Checksum;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Checksum create() => Checksum._();
  Checksum createEmptyInstance() => create();
  static $pb.PbList<Checksum> createRepeated() => $pb.PbList<Checksum>();
  @$core.pragma('dart2js:noInline')
  static Checksum getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Checksum>(create);
  static Checksum? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get strong => $_getSZ(0);
  @$pb.TagNumber(1)
  set strong($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStrong() => $_has(0);
  @$pb.TagNumber(1)
  void clearStrong() => clearField(1);
}

class ChecksumsList extends $pb.GeneratedMessage {
  factory ChecksumsList({
    $core.String? path,
    $core.int? blockSize,
    $core.Iterable<Checksum>? checksums,
  }) {
    final $result = create();
    if (path != null) {
      $result.path = path;
    }
    if (blockSize != null) {
      $result.blockSize = blockSize;
    }
    if (checksums != null) {
      $result.checksums.addAll(checksums);
    }
    return $result;
  }
  ChecksumsList._() : super();
  factory ChecksumsList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChecksumsList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChecksumsList', package: const $pb.PackageName(_omitMessageNames ? '' : 'sync'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'path')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'blockSize', $pb.PbFieldType.OU3)
    ..pc<Checksum>(3, _omitFieldNames ? '' : 'checksums', $pb.PbFieldType.PM, subBuilder: Checksum.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChecksumsList clone() => ChecksumsList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChecksumsList copyWith(void Function(ChecksumsList) updates) => super.copyWith((message) => updates(message as ChecksumsList)) as ChecksumsList;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChecksumsList create() => ChecksumsList._();
  ChecksumsList createEmptyInstance() => create();
  static $pb.PbList<ChecksumsList> createRepeated() => $pb.PbList<ChecksumsList>();
  @$core.pragma('dart2js:noInline')
  static ChecksumsList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChecksumsList>(create);
  static ChecksumsList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get path => $_getSZ(0);
  @$pb.TagNumber(1)
  set path($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPath() => $_has(0);
  @$pb.TagNumber(1)
  void clearPath() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get blockSize => $_getIZ(1);
  @$pb.TagNumber(2)
  set blockSize($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBlockSize() => $_has(1);
  @$pb.TagNumber(2)
  void clearBlockSize() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<Checksum> get checksums => $_getList(2);
}

class PingRequest extends $pb.GeneratedMessage {
  factory PingRequest() => create();
  PingRequest._() : super();
  factory PingRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PingRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PingRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'sync'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PingRequest clone() => PingRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PingRequest copyWith(void Function(PingRequest) updates) => super.copyWith((message) => updates(message as PingRequest)) as PingRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PingRequest create() => PingRequest._();
  PingRequest createEmptyInstance() => create();
  static $pb.PbList<PingRequest> createRepeated() => $pb.PbList<PingRequest>();
  @$core.pragma('dart2js:noInline')
  static PingRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PingRequest>(create);
  static PingRequest? _defaultInstance;
}

class PingReply extends $pb.GeneratedMessage {
  factory PingReply({
    $core.String? message,
  }) {
    final $result = create();
    if (message != null) {
      $result.message = message;
    }
    return $result;
  }
  PingReply._() : super();
  factory PingReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PingReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PingReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'sync'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PingReply clone() => PingReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PingReply copyWith(void Function(PingReply) updates) => super.copyWith((message) => updates(message as PingReply)) as PingReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PingReply create() => PingReply._();
  PingReply createEmptyInstance() => create();
  static $pb.PbList<PingReply> createRepeated() => $pb.PbList<PingReply>();
  @$core.pragma('dart2js:noInline')
  static PingReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PingReply>(create);
  static PingReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);
}

class FileUploadRequest extends $pb.GeneratedMessage {
  factory FileUploadRequest({
    $core.String? fileName,
    $core.String? folderFingerprint,
    $core.List<$core.int>? chunk,
    $core.String? username,
  }) {
    final $result = create();
    if (fileName != null) {
      $result.fileName = fileName;
    }
    if (folderFingerprint != null) {
      $result.folderFingerprint = folderFingerprint;
    }
    if (chunk != null) {
      $result.chunk = chunk;
    }
    if (username != null) {
      $result.username = username;
    }
    return $result;
  }
  FileUploadRequest._() : super();
  factory FileUploadRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FileUploadRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FileUploadRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'sync'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'fileName', protoName: 'fileName')
    ..aOS(2, _omitFieldNames ? '' : 'folderFingerprint', protoName: 'folderFingerprint')
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'chunk', $pb.PbFieldType.OY)
    ..aOS(4, _omitFieldNames ? '' : 'username')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FileUploadRequest clone() => FileUploadRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FileUploadRequest copyWith(void Function(FileUploadRequest) updates) => super.copyWith((message) => updates(message as FileUploadRequest)) as FileUploadRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FileUploadRequest create() => FileUploadRequest._();
  FileUploadRequest createEmptyInstance() => create();
  static $pb.PbList<FileUploadRequest> createRepeated() => $pb.PbList<FileUploadRequest>();
  @$core.pragma('dart2js:noInline')
  static FileUploadRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FileUploadRequest>(create);
  static FileUploadRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get fileName => $_getSZ(0);
  @$pb.TagNumber(1)
  set fileName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFileName() => $_has(0);
  @$pb.TagNumber(1)
  void clearFileName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get folderFingerprint => $_getSZ(1);
  @$pb.TagNumber(2)
  set folderFingerprint($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFolderFingerprint() => $_has(1);
  @$pb.TagNumber(2)
  void clearFolderFingerprint() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get chunk => $_getN(2);
  @$pb.TagNumber(3)
  set chunk($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasChunk() => $_has(2);
  @$pb.TagNumber(3)
  void clearChunk() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get username => $_getSZ(3);
  @$pb.TagNumber(4)
  set username($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasUsername() => $_has(3);
  @$pb.TagNumber(4)
  void clearUsername() => clearField(4);
}

class FileUploadResponse extends $pb.GeneratedMessage {
  factory FileUploadResponse() => create();
  FileUploadResponse._() : super();
  factory FileUploadResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FileUploadResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FileUploadResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'sync'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FileUploadResponse clone() => FileUploadResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FileUploadResponse copyWith(void Function(FileUploadResponse) updates) => super.copyWith((message) => updates(message as FileUploadResponse)) as FileUploadResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FileUploadResponse create() => FileUploadResponse._();
  FileUploadResponse createEmptyInstance() => create();
  static $pb.PbList<FileUploadResponse> createRepeated() => $pb.PbList<FileUploadResponse>();
  @$core.pragma('dart2js:noInline')
  static FileUploadResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FileUploadResponse>(create);
  static FileUploadResponse? _defaultInstance;
}

class DownloadRequest extends $pb.GeneratedMessage {
  factory DownloadRequest({
    $core.String? fingerprint,
  }) {
    final $result = create();
    if (fingerprint != null) {
      $result.fingerprint = fingerprint;
    }
    return $result;
  }
  DownloadRequest._() : super();
  factory DownloadRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DownloadRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DownloadRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'sync'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'fingerprint')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DownloadRequest clone() => DownloadRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DownloadRequest copyWith(void Function(DownloadRequest) updates) => super.copyWith((message) => updates(message as DownloadRequest)) as DownloadRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DownloadRequest create() => DownloadRequest._();
  DownloadRequest createEmptyInstance() => create();
  static $pb.PbList<DownloadRequest> createRepeated() => $pb.PbList<DownloadRequest>();
  @$core.pragma('dart2js:noInline')
  static DownloadRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DownloadRequest>(create);
  static DownloadRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get fingerprint => $_getSZ(0);
  @$pb.TagNumber(1)
  set fingerprint($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFingerprint() => $_has(0);
  @$pb.TagNumber(1)
  void clearFingerprint() => clearField(1);
}

class DownloadResponse extends $pb.GeneratedMessage {
  factory DownloadResponse({
    $core.List<$core.int>? chunk,
  }) {
    final $result = create();
    if (chunk != null) {
      $result.chunk = chunk;
    }
    return $result;
  }
  DownloadResponse._() : super();
  factory DownloadResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DownloadResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DownloadResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'sync'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'chunk', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DownloadResponse clone() => DownloadResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DownloadResponse copyWith(void Function(DownloadResponse) updates) => super.copyWith((message) => updates(message as DownloadResponse)) as DownloadResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DownloadResponse create() => DownloadResponse._();
  DownloadResponse createEmptyInstance() => create();
  static $pb.PbList<DownloadResponse> createRepeated() => $pb.PbList<DownloadResponse>();
  @$core.pragma('dart2js:noInline')
  static DownloadResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DownloadResponse>(create);
  static DownloadResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get chunk => $_getN(0);
  @$pb.TagNumber(1)
  set chunk($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChunk() => $_has(0);
  @$pb.TagNumber(1)
  void clearChunk() => clearField(1);
}

class UploadResponse extends $pb.GeneratedMessage {
  factory UploadResponse() => create();
  UploadResponse._() : super();
  factory UploadResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UploadResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UploadResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'sync'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UploadResponse clone() => UploadResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UploadResponse copyWith(void Function(UploadResponse) updates) => super.copyWith((message) => updates(message as UploadResponse)) as UploadResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UploadResponse create() => UploadResponse._();
  UploadResponse createEmptyInstance() => create();
  static $pb.PbList<UploadResponse> createRepeated() => $pb.PbList<UploadResponse>();
  @$core.pragma('dart2js:noInline')
  static UploadResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UploadResponse>(create);
  static UploadResponse? _defaultInstance;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
