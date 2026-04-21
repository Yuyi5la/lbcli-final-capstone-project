# How many new outputs were created by block 243,825?
block_height=243825
block_hash=$(bitcoin-cli -signet getblockhash $block_height)

outputs=$(bitcoin-cli -signet getblock $block_hash 2 | jq '[.tx[].vout | length] | add')

echo $outputs
