# How many satoshis did this transaction pay for fee?: b71fb9ab7707407cc7265591e0c0d47d07afede654f91de1f63c0cb522914bcb
tx=b71fb9ab7707407cc7265591e0c0d47d07afede654f91de1f63c0cb522914bcb

#first former input value 
vin_txid=$( bitcoin-cli -signet getrawtransaction $tx true |jq -r '.vin[0].txid')
vin_value=$(bitcoin-cli -signet getrawtransaction $vin_txid true | jq -r '.vout[0].value')

#fee = input − 0.20730602 i.e output
output_sum=$(bitcoin-cli -signet getrawtransaction $tx true | jq '[.vout[].value] | add')

fee=$(echo "$vin_value - $output_sum" | bc)

fee_sats=$(echo "$fee * 100000000" | bc)

echo $fee_sats
