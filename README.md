# Wifi scripts
Scripts for wifi password hacking using aircrack-ng

## Obtaining handshake
1. Change wlan0 to your network adapter name in 1_discover.sh 2_capture.sh and 3_deauth.sh

Each program will be ran sequentially.

2. Start by running 1_discover.sh to find bssids and channels.
3. While this is running, run 2_capture.sh to dump captures into captures/
4. While both of the above scripts are running, use 3_deauth.sh to send deauth packets to grab the handshake.

5. Run the deauth script until PMKID is listed under the capture script.

After handshake is obtained, all 3 scripts can be closed.

## Cracking hash
1. Run 4_converter.sh to convert packet capture to hashcat file, which is placed into hashes/

2. Run 5_crack.sh to crack the password. Cracked password will be stored in passwords/ and will be cleaned up using awk.

3. (Optional) Run 6_cleanup.sh to clear hashes/* and captures/* after the password is obtained.

# Notes
## Dependencies
- hcxtools
- aircrack-ng
- hashcat
- a good wordlist (such as rockyou)
- must have a monitor-mode capable network adapter. I recommend using Alfa's adapters - [AWUS036AC](https://www.alfa.com.tw/products/awus036ac?variant=36473965838408) or [AWUS036ACS](https://www.alfa.com.tw/products/awus036acs?variant=36473965969480).

## Troubleshooting
Make sure to install all required drivers for the adapter before attempting this.

Remember to change the adapter name.

# Warning
Note that this is for educational purposes only. Don't use any network scanning or password cracking on a network you don't have explicit permission to do this on.
