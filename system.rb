framework 'ScriptingBridge'

class System < Plugin

  requires_version '1.4.0'

  class << self

    def volume_increase(increment=10)
      osaexec "set volume output volume (output volume of (get volume settings) + #{increment})"
    end

    def volume_decrease(decrement=10)
      increase(-decrement)
    end

    def toggle_pause
      osaexec <<-PAUSE
        if appIsRunning("iTunes") then
          tell application "iTunes"
            playpause
          end tell
        end if
        if appIsRunning("Rdio") then
          tell application "Rdio"
            playpause
          end tell
        end if
        on appIsRunning(appName)
          tell application "System Events" to (name of processes) contains appName
        end appIsRunning
      PAUSE
    end

    private

    def osaexec(osa_cmd)
      %x[osascript -e '#{osa_cmd}']
    end



  end

end
