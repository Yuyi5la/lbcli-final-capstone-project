# Which tx in block 216,351 spends the coinbase output of block 216,128?
coinbase_blockhash=$(bitcoin-cli -signet getblockhash 216128)
coinbase_txid=$(bitcoin-cli -signet getblock $coinbase_blockhash 2 | jq -r '.tx[0].txid')

spending_blockhash=$(bitcoin-cli -signet getblockhash 216351)

spending_blocktx=$(bitcoin-cli -signet getblock $spending_blockhash 2 | jq -r --arg cb "$coinbase_txid" '
  .tx[]
  | select(any(.vin[]?; .txid == $cb))
  | .txid
')

echo "$spending_blocktx"