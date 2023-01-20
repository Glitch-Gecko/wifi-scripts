# Wifi scripts
Scripts for wifi password hacking using aircrack-ng

## Obtaining handshake
Change wlan0 to your network adapter name in 1_discover.sh 2_capture.sh and 3_deauth.sh

Each program will be ran sequentially.

Start by running 1_discover.sh to find bssids and channels.
While this is running, run 2_capture.sh to dump captures into captures/
While both of the above scripts are running, use 3_deauth.sh to send deauth packets to grab the handshake.

Run the deauth script until PMKID is listed under the capture script.

After handshake is obtained, all 3 scripts can be closed.

## Cracking hash
Run 4_converter.sh to convert packet capture to hashcat file, which is placed into hashes/

Run 5_crack.sh to crack the password. Cracked password will be stored in passwords/ and will be cleaned up using awk.

(Optional) Run 6_cleanup.sh to clear hashes/* and captures/* after the password is obtained.

# Notes
## Dependencies
- hcxtools
- aircrack-ng
- hashcat
- a good wordlist (such as rockyou)
- must have a monitor-mode capable network adapter. I recommend using Alfa's adapters.

## Troubleshooting
Make sure to install all required drivers for the adapter before attempting this.

Remember to change the adapter name.
