# ruby_backend/lib/sync_service.rb

require 'grpc'
require 'sync_services_pb'

class SyncService < Sync::SyncService::Service
  def ping(ping_req, _unused_call)
    Sync::PingReply.new(message: 'pong')
  end

  def sync(sync_req, _unused_call)
    # Implementa la lógica de sincronización aquí
    Sync::SyncResponse.new
  end

  def upload(call)
    # Implementa la lógica de subida de archivos aquí
    Sync::FileUploadResponse.new
  end

  def download(download_req, _unused_call)
    # Implementa la lógica de descarga de archivos aquí
    Sync::DownloadResponse.new
  end
end

def main
  server = GRPC::RpcServer.new
  server.add_http2_port('0.0.0.0:50051', :this_port_is_insecure)
  server.handle(SyncService)
  server.run_till_terminated
end

main