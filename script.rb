##options = ['start', 'stop', 'show']
puts "commands [1 = start, 2 = stop, 3 = show]"
choice = gets.to_i

if choice == 1

	system("netsh wlan start hostednetwork")

elsif choice == 2

	system("netsh wlan stop hostednetwork")

elsif choice == 3

	system("netsh wlan show hostednetwork")

else

	puts "ERROR:\tunknown command
	USAGE:\n
	choose 1 ==> start the hostednetwork
	choose 2 ==> stop the hostednetwork
	choose 3 ==> show clients on the hostednetwork"
	
end

system("pause")
