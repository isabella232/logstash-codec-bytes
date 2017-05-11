# encoding: utf-8
require "logstash/codecs/base"
require "logstash/namespace"

class LogStash::Codecs::Bytes < LogStash::Codecs::Base

  # This codec will chunk input into parts of a
  # specified length
  #
  # input {
  #   file {
  #     delimiter => ""
  #     codec => bytes {
  #       length => X
  #     }
  #   }
  # }

  config_name "bytes"

  config :length, :validate => :number, :required => true

  public
  def register
    @payload = ""
  end

  public
  def decode(data)
    @payload << data

    payload_size = @payload.bytesize
    count        = payload_size / @length
    byte_offset  = 0

    lines    = @payload.byteslice(0...count * @length)
    @payload = @payload.byteslice(count * @length...payload_size)

    while count > 0
      yield LogStash::Event.new({
        "message" => lines.byteslice(byte_offset...byte_offset + @length)
      })

      count -= 1
      byte_offset += @length
    end

  end

end
