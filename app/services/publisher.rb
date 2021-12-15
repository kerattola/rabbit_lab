class Publisher

	def self.publish(exchange, message = {})
		event = channel.fanout("docfile.#{exchange}")
        queue = channel.queue('', exclusive: true)
        queue.bind(event)
		event.publish(message.to_json)
	end

	def self.channel
		@channel ||=connection.create_channel
	end

	def self.connection
		@connection ||= Bunny.new.tap do |connect|
			connect.start
		end
	end

end