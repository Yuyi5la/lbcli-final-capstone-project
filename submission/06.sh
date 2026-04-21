# Only one tx in block 243,821 signals opt-in RBF. What is its txid?

block_height=243821
block_hash=$(bitcoin-cli -signet getblockhash $block_height)

rbf_txid=$(bitcoin-cli -signet getblock $block_hash 2 | jq -r '.tx[]| select(any(.vin[]?; .sequence < 4294967294)) | .txid')

echo $rbf_txid