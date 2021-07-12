#!/system/bin/sh
echo "seclet chip type"
pnx --mcc 0x0d
echo "nfc transmit stop"
pnx --frf 0
echo "nfc transmit stop end"
