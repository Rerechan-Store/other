#!/bin/bash
clear
xp
clear

addwg() {


}















nma() {
clear

echo -e "
============================
[<=  Wireguard Menu VPN  =>]
============================

1. Create Akaun Wireguard
2. Delete Akaun Wireguard
3. Renew Expired Akaun Wireguard
4. Cek User Login Usage Akaun Wireguard
============================

x) Back To Menu
============================
"
read -p "Please Input Number  [1-4 or x] :  "  wgr
case  $wgr in
1) clear ; xp ; clear ; addwg ;;
2) clear ; xp ; clear ; delwg ;;
3) clear ; xp ; clear ; renwg ;;
4) clear ; xp ; clear ; cekwg ;;
x) clear ; funny ;;
*) clear ; echo "Please enter an correct number" ;;
esac
}
