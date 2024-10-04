
# But what *is* an NT Channel?
NT Channel is a piece of software made to assist in the creation and customization of chatrooms, forums and imageboards. All in batch, of course. What else were you thinking?

Unless you ***really*** understand what you're doing, you should take this software as nothing more than a novelty and limit the scope of your use. Any bugs aside, I'm sure some might argue opening a command prompt for public access to be an unwise decision. [*(lit. Here be dragons!)*](#security-recommendations)

I am not responsible for any damage caused by this software. Use at your own risk!
## Installation
NT Channel is tested and intended to be used with [ttyd version 1.7.3](https://github.com/tsl0922/ttyd/releases/tag/1.7.3). Any similar means of sharing a console application over the internet should work fine given some tweaks, but you'll be on your own.

`ttyd.win32.exe` must be placed in the same directory as `STARTS~1.BAT`.

By default, NT Channel will be forwarded to port 5464 using the login "username" and "password", with the maximum concurrent user count set to 4.

Without an intermediary piece of software to manage networking, NT Channel is LAN only.
## Configuration
When first launched, a file called `NTCHAN.INI` will be created. This can be used to customize your webpage.

| Option | Description | Default Value |
|--------|-------------|---------------|
| SITE   | Website name | NT Channel |
| MOTD   | Message of the day, tagline, splash text | *(No value)* |
| ANON   | Global display name | Anonymous |
| LOAD   | Time in seconds between thread refreshes | 5 |
| COOL   | Posting cooldown in seconds **(Currently unused)** | 60 |

This file accepts batch command arguments, allowing for extra functionality such as a linebreak in your MOTD using `&ECHO`. This also means that you'll have to escape any special characters. `&` becomes `^&`, `%` becomes `%%`, etc.
## Operation
The "X" key can be used to create a post.

Leading your message with ">" will turn the text contents of your post green.
## Security Recommendations
I know my *"Here be dragons!"* warning won't stop most people. I know it wouldn't stop me! But rather than leave you with a vague and ominous warning, I feel it would be responsible of me to outline things you can do as a host to make your NT Channel more secure. If you don't understand what any of the following means, come back after a coffee and some Stack Exchange, m'kay?
### Run NT Channel in a virtualized environment
Assume something goes wrong, and one way or another, users begin connecting in to an entirely uninhibited command prompt. One cleverly constructed delete command later, and you no longer have a computer.

In a scenario like this, running NT Channel in a virtualized environment will help avert *total* disaster. If properly configured, your actual computer should be spared from the attack and everything could be restored from a backup.
### Don't transmit secure information on an unsecured server
STARTS~1.BAT is **not** configured to launch ttyd with SSL enabled by default. SSL or otherwise, you should look in to methods for properly securing and encrypting traffic to and from the server.
### Consider changing the default login information from "username" and "password"
Gah... I'm pretty sure people end up in CVE databases for not forcing this one...

NT Channel doesn't require the default credentials to be changed because most NT Channel servers won't be using any credentials at all. If you do go the way of running a private NT Channel, you should seriously consider updating the login information to keep out randoms. The relevant section of code is `-c username:password` in `STARTS~1.BAT`.
### Run NT Channel from a user account with restricted permissions
To touch again on the [worst case scenario](#run-nt-channel-in-a-virtualized-environment), you should consider creating a user account made specifically to host NT Channel, one given the **absolute** ***minimum*** permissions required. An account like this should only need write access to the directory you've placed `NTCHAN.CMD` in, and in some cases `%TEMP%`.
### Keep an eye on the file size of your LOG.TXT
`LOG.TXT` can grow faster than you think, especially if you have a troll bent on trying to bloat the file size. While drive capacity is something of a concern, you should consider the actual network traffic an artificially large `LOG.TXT` might incur. If you let your log grow out of control, you could subtley bring a DOS attack on yourself.
### Disable tab-completion in CMD
On most systems, the default setting is for the tab button to auto-complete directory names in CMD. Chaining tab presses when creating a post could allow anyone to get an eventual readout of every directory and file name on your device. 

In avoidance of telling you to *"look it up yourself"* because it's *"easy to find online"*, you can cripple this feature by modifying the values of `CompletionChar` and `PathCompletionChar` at the registry location `Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Command Processor`.

Remember to tread lightly. It's not a scare tactic to say that misconfiguring the registry could cause permanent damage to your operating system.
## From Saga, with Love.
While this README is characteristic at best, development of NT Channel does mean a lot to me and I do hope you have your own fun with it in one way or another. I'm always open to contact, collaboration and grossly appreciative fan mail. Hate mail works too, I suppose.

> From [Saga, with Love.](https://github.com/SagaWithLove)
