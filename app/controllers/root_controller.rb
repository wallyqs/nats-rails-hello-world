class RootController < ApplicationController
  def greetings
    # Publish event
    $nats.publish("hello", 'Received request on /greetings')

    render plain:'Sent message through NATS'
  end

  def streaming
    $stan.publish("hello", 'Received request on /streaming')

    render plain: 'Sent message through NATS Streaming'
  end
end

