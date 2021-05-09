# getmininginfo prints the information of miner activity in the past six 24 hour cycles
# mininginfo prints the total in the 6 days period
# 

assign("getmininginfo", c(set.seed(768), runif(384)))
mininginfo <- rep(getmininginfo, times=6)

twentyfourhourcycles <- array(1:1156, dim=c(96,24))

# getmininginfo.json prints the whole structure of the mininginfo

array(c("blocks", "currentblockweight", "currentblocktx", "difficulty", "networkhashps", "pooledtx", "chain", "warnings"), dim=c(4,2)) -> getmininginfo.json