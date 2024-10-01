
# NT Channel
NT Channel is a piece of software made to assist in the creation and customization of chatrooms, forums and imageboards using batch.

Please take this software as a novelty and limit the scope of your use. It almost certainly contains high severity bugs, exploits and instabilities.

I am not responsible for any damage caused by this software.
You have been forewarned!
## Installation
NT Channel is intended to be used with [ttyd version 1.7.3](https://github.com/tsl0922/ttyd/releases/tag/1.7.3). I have not tested other releases and cannot gurantee their compatability.

STARTS~1.BAT will not function without ttyd.win32.exe placed in the same directory.

By default, NT Channel will be forwarded to port 5464 using the login "username" and "password", with the maximum concurrent user count set to 4.

Without ttyd, NT Channel is purely local and single-user.
## Configuration
When first launched, a file called NTCHAN.INI will be created. This can be used to customize your webpage.

	SITE
		The name of your website. Default value is "NT Channel"
	MOTD
		A message of the day, tagline, or splash text. Blank by default.
	ANON
		The global display name. Default value is "Anonymous"
	LOAD
		How many seconds between thread refreshes. Default value is "15"
	COOL
		Currently unused. Default value is "60"
## Operation
The "X" key can be used to create a post. This will more than likely be customizable in the future.
