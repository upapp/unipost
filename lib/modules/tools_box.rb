module ToolsBox
	class Writers
		def msg( text = "" )
			@message = text
		end
		
		def write
			if( @message.blank? )
				@message = ""			
			end
			
			return @message
		end
	end
end