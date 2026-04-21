# what is the coinbase tx in this block 243,834

block_height=243834
block_hash=$(bitcoin-cli -signet getblockhash $block_height)

coinbase_txid=$(bitcoin-cli -signet getblock $block_hash 1 | jq -r '.tx[0]')

echo $coinbase_txid