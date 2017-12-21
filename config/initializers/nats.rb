require 'nats/io/client'
require 'stan/client'

# Establish connection to NATS
$nats = NATS::IO::Client.new
$nats.connect(servers: ["nats://127.0.0.1:4222"])

$nats.on_error do |e|
  Rails.logger.warn "NATS - Error: #{e}"
end

$nats.on_reconnect do
  Rails.logger.warn "NATS - Reconnected!"
end

# Mount NATS Streaming client on top of the NATS connection
$stan = STAN::Client.new
$stan.connect("test-cluster", "foo", nats: $nats)

