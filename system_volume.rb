class SystemVolume < Plugin

  requires_version '1.0.3'
  
  class << self

    def initialize
      @is_muted = !(current > 0)
      @previous_volume = 0
    end
    
    def increase(increment=10)  
      @is_muted = !(@previous_volume + increment > 0)
      @previous_volume = current
			
      osaexec "set volume output volume (output volume of (get volume settings) + #{increment})"
    end

    def decrease(decrement=10)
      increase(-decrement)
    end

    def set(level)
      @is_muted = !(level > 0)
      @previous_volume = current
      
      osaexec "set volume output volume #{level}"
    end

    def toggle_mute
      muted? ? set(@previous_volume) : set(0)
    end

    def current
      osaexec('output volume of (get volume settings)').to_i
    end

    def muted?
      @is_muted
    end

    private
    
    def osaexec(osa_cmd)
      %x[osascript -e '#{osa_cmd}']
    end

  end

end
