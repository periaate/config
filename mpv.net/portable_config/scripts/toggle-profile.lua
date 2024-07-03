local mp = require 'mp'

i = 0
function toggle_profile()
	if i == 0 then
		mp.set_property('af', '')
		i = 1
	else
		i = 0
		mp.set_property('af', 'lavfi=[loudnorm=I=-16:TP=-2:LRA=25:offset=2]')
	end
end

mp.add_key_binding('n', 'toggle-profile', toggle_profile)

