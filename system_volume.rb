class SystemVolume < Plugin

  requires_version '1.0.3'

	def before
		SystemVolume.is_muted = !(SystemVolume.current_volume > 0)
	end
	
	class << self
		attr_accessor :previous_volume, :is_muted
	
		def increase(increment=10)	
			self.previous_volume = current_volume
			self.is_muted = !(self.previous_volume + increment > 0)
			osaexec "set volume output volume (output volume of (get volume settings) + #{increment})"
		end

		def decrease(decrement=10)
			increase(-decrement)
		end

		def set(level)
			self.is_muted = !(level > 0)
			self.previous_volume = current_volume
			
			osaexec "set volume output volume #{level}"
		end

		def toggle_mute
			self.is_muted ? set(self.previous_volume) : set(0)
		end

		def current_volume
			osaexec('output volume of (get volume settings)').to_i
		end

		private
		
		def osaexec(osa_cmd)
			%x[osascript -e '#{osa_cmd}']
		end

	end

end
