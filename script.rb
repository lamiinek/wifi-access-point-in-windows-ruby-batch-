puts"wifi access point".upcase
puts"author: lamine ka (lamiinek)\n\n"

puts "commands [1 = start, 2 = stop, 3 = show, 4 = start-stop(delay), 5 = config]"
choice = gets.to_i

if choice == 1

	system("netsh wlan start hostednetwork")

elsif choice == 2

	system("netsh wlan stop hostednetwork")

elsif choice == 3

	system("netsh wlan show hostednetwork")

elsif choice == 4
	puts "Amount of time to wait before stopping"
	delay = gets.to_i

	if delay > 0

		system("netsh wlan start hostednetwork")
		puts "the hostednetwork will stop after #{delay} min"
		sleep(delay*60)
		system("netsh wlan stop hostednetwork")
	end
	
elsif choice == 5
	puts "ssid(name) :"
	ssid = gets
	if ssid.length < 3
		print "\tthe ssid must be at least 3 characters\n"
	end
	#---------------------------------------------------------
	puts "key(password) :"
	key = gets
	if key.length < 6
		print "\tthe key must be at least 6 characters\n"
	end

	if ssid != nil && ssid.length > 2 && key.length > 5
		system("netsh wlan set hostednetwork mode=allow ssid=#{ssid} key=\"#{key}\" keyUsage=persistent")
	else
		print "ERROR: unable to configure the hostednetwork, restart later\n"
	end
else

	puts "ERROR:\tunknown command
	USAGE:\n
	choose 1 ==> start the hostednetwork
	choose 2 ==> stop the hostednetwork
	choose 3 ==> show clients on the hostednetwork
	choose 4 ==> configure the hostednetwork"
	
end

system("pause")
