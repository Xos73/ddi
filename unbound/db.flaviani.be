;
; BIND data file for zone flaviani.be
;
$TTL	604800
@	IN	SOA	coreos.flaviani.be. admin.flaviani.be. (
			2014110511
			604800
			86400
			2419200
			604800 )
;
		IN	NS	coreos.flaviani.be.
		IN      A       10.10.10.10
adsl		IN	A	192.168.1.1
router		IN	A	10.10.10.1
rtr002		IN	A	10.10.10.2

;servers - nas devices
switch		IN	A	10.10.10.9
apollo		IN	A	10.10.10.10
apollo30	IN	A	10.10.10.30
iomega		IN	A	10.10.10.11
plextor		IN	A	10.10.10.12
coreos		IN	A	10.10.10.14
ds214		IN	A	10.10.10.15

;TV-consoles-Raspberry
LG-tv-lan	IN	A	10.10.10.20
LG-tv		IN	A	10.10.10.21
PS3-lan		IN	A	10.10.10.22
PS3		IN	A	10.10.10.23
Wii		IN	A	10.10.10.24
Xios-DS		IN	A	10.10.10.25
Bedroom-PI	IN	A	10.10.10.26
Living-PI	IN	A	10.10.10.27
SoundTouch20	IN	A	10.10.10.28

;Laptop-PCs
; reservations: even = lan; odd = wan
MacAir-Eef	IN	A	10.10.10.54
lpt-bt-05.flaviani.be.	IN	A	10.10.10.50
Surface2-Pro	IN	A	10.10.10.56
Lenovo-Papa-lan	IN	A	10.10.10.58
Lenovo-Papa	IN	A	10.10.10.59
Lenovo-Anna-lan	IN	A	10.10.10.60
Lenovo-Anna	IN	A	10.10.10.61
Lenovo-Milo-lan	IN	A	10.10.10.62
Lenovo-Milo	IN	A	10.10.10.63

;Belgacom decoders - receive their IP "magically" - from .64 on
decoder-living	IN	A	10.10.10.64
decoder-bedroom	IN	A	10.10.10.65

;Tablets-Cell
iPad-Senne	IN	A	10.10.10.70
iPad-Anna	IN	A	10.10.10.71
iPad-Milo	IN	A	10.10.10.72
samsung-tablet	IN	A	10.10.10.73
gsm-Eef		IN	A	10.10.10.74
gsm-Papa	IN	A	10.10.10.75
SurfaceRT	IN	A	10.10.10.76
Surface2	IN	A	10.10.10.77

;10.10.10.100-150 range for occasional usage

;Printers
cp1215          IN      A       10.10.10.10
ml-3561nd       IN      A       10.10.10.240
mfc-j4620dw     IN      A       10.10.10.241

srv001		IN      CNAME   apollo
monit		IN      CNAME   apollo
www			IN      CNAME   apollo
mail		IN      CNAME   apollo
webmail		IN      CNAME   apollo
search		IN      CNAME   apollo
rtr001		IN      CNAME   router
gw			IN      CNAME   router
modem		IN      CNAME   adsl
bbox		IN      CNAME   adsl
bridge		IN      CNAME   rtr002
dir615		IN      CNAME   rtr002
samsung		IN      CNAME   ml-3561nd
printer		IN      CNAME   ml-3561nd
bw			IN      CNAME   ml-3561nd
hp			IN      CNAME   cp1215
color		IN      CNAME   cp1215
brother		IN      CNAME   mfc-j4620dw
inktjet		IN      CNAME   mfc-j4620dw
scanner		IN      CNAME   mfc-j4620dw
nas			IN	CNAME	ds214
procurve	IN	CNAME	switch
