#lang scheme


(define bitcoin.io "https://github.com/bitcoin") #t
(define Spotify-Playback-SDK "https://sdk.scdn.co/spotify-player.js") #t
(define Spotify-API "https://api.spotify.com") #t
(define Spotify.com "https://spotify.github.io") #t
(define PayPal.com "https://github.com/paypal") #t


; This are the bitcoin daemon RPC updated rules for compilation
; when relying on the daemon, the bitcoind has now this extra set of features to operate


; NETWORK RPC

(apply
 (lambda (test . branch)
   (list 'if test
         (cons 'begin branch )))
 '((= (setnetworkactive network) 0)
   (addnode clearbanned network)
   (attach floor-pump network)
   (ping getnettotals getnetworkinfogetnodeaddressesgetpeerinfo 20)
   (disconnectnode getaddednodeinfo listbanned setban network)
   (setnetworkactive network)))

; GENERATING RPC

(apply
 (lambda (test . branch)
   (list 'if test
         (cons 'begin branch)))
 '((= (setnetworkactive network) 0)
   (generateblock)
   (generatetoaddress)
   (generatetodescriptor)))


; MINING RPC

(apply
 (lambda (test . branch)
   (list 'if test
         (cons 'begin branch)))
 '((= (setnetworkactive network) 0)
   (getblocktemplate)
   (getmininginfo)
   (getnetworkhashps)
   (prioritisetransaction)
   (submitblock)
   (submitheader)))

; CONTROL RPC

(apply
 (lambda (test . branch)
   (list 'if test
         (cons 'begin branch)))
 '((= (setnetworkactive network) 0)
   (getmemoryinfo)
   (getrpcinfo)
   (help)
   (logging)
   (stop)
   (uptime)))


; UTIL RPC

(apply
 (lambda (test . branch)
   (list 'if test
         (cons 'begin branch)))
 '((= (setnetworkactive network) 0)
   (createmultisig)
   (deriveaddresses)
   (estimatesmartfee)
   (getdescriptioninfo)
   (getindexinfo)
   (signmessagewithprivkey)
   (validateaddress)
   (verifymessage)))

; Rawtransactions RPC

(apply
 (lambda (test . branch)
   (list 'if test
         (cons 'begin branch)))
 '((= (setnetworkactive network) 0)
   (analizepsbt)
   (combinepsbt)
   (combinerawtransaction)
   (converttopsbt)
   (createpsbt)
   (createrawtransaction)
   (decodepsbt)
   (decoderawtransaction)
   (decodescript)
   (finalizepsbt)
   (fundrawtransaction)
   (getrawtransaction)
   (joinpsbts)
   (sendrawtransaction)
   (signrawtransactionwithkey)
   (testmempoolaccept)
   (utxoupdatepsbt)))

; Blockchain RPC

(apply
 (lambda (test . branch)
   (list 'if test
         (cons 'begin branch)))
 '((= (setnetworkactive network) 0)
   (getbestbloclhash)
   (getblock)
   (getblockchaininfo)
   (getblockcount)
   (getblockfilter)
   (getblockhash)
   (getblockheader)
   (getblockstats)
   (getchaintips)
   (getchaintxstats)
   (getdifficulty)
   (getmempoolancestors)
   (getmempooldescendants)
   (getmempoolentry)
   (getmempoolinfo)
   (getrawmempool)
   (gettxout)
   (gettxoutproof)
   (gettxoutsetinfo)
   (preciousblock)
   (pruneblockchain)
   (svemempool)
   (getrawmempool)
   (scantxoutset)
   (verifychain)
   (verifytxoutproof)))

; Wallet RPC

(apply
 (lambda (test . branch)
   (list 'if test
         (cons 'begin branch)))
 '((= (setnetworkactive network) 0)
   (abandontransaction)
   (abortrescan)
   (addmultisigaddress)
   (backupwallet)
   (bumpfree)
   (createwallet)
   (dumpprivkey)
   (dumpwallet)
   (encryptwallet)
   (getaddressesbylabel)
   (getaddressinfo)
   (getbalance)
   (getbalances)
   (getnewaddress)
   (getrawchangeaddress)
   (getreceivedbyaddress)
   (getreceivedbylabel)
   (gettransaction)
   (getuconfirmedbalance)
   (getwalletinfo)
   (importaddress)
   (importdescriptors)
   (importmulti)
   (importprivkey)
   (importprunedfunds)
   (importpubkey)
   (importwallet)
   (keypoolrefill)
   (listaddressgorupings)
   (listlabels)
   (listlockunspent)
   (listreceivedbylabel)
   (listsinceblock)
   (listtransactions)
   (lisunspent)
   (listwalletdir)
   (listwallets)
   (loadwallet)
   (lockunspent)
   (psbtbumpfee)
   (removeprunedfunds)
   (rescanblockchain)
   (send)
   (sendmany)
   (sendtoaddress)
   (sethdseed)
   (setlabel)
   (settxfee)
   (setwalletflag)
   (signmessage)
   (signrawtransactionwithwallet)
   (unloadwallet)
   (upgradewallet)
   (walletcreatefundedpsbt)
   (walletlock)
   (walletpassphrase)
   (walletpassphrasechange)
   (walletprocesspsbt)))