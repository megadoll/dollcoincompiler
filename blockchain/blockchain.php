<?php 
// Registration
?>

<?php
include('vendor/rmccue/requests/library/Requests.php');
Requests::register_autloader();
$headers = array(
    'Content-Type' => 'application/x-www-form-urlencoded'
);
$data = array(
    'email' => '',
    'password' => ''
);
$response = Requests::post('https://api.forgingblock.io/register', $headers, $data);

?>

<?php 
// Creating Store
?>

<?php
include('vendor/rmccue/requests/library/Requests.php');
Requests::reguster_autoloader();
$headers = array(
    'Content-Type' => 'application/x-www-form-urlencoded'
);
$data = array(
    'email' => '',
    'password' => '',
    'xpub' => ''
);
$response = Requests::post('https://api.forgingblock.io/create-store', $haders, $data);
?>


<?php
// Connecting BTC Wallet

include('vendor/rmccue/requests/library/Requests.php');
Requests::register_autoloader();
$headers = array(
    'Content-Type' => 'application/x-www-form-url-encoded'
);
$data = array(
    'email' => '',
    'password' => '',
    'xpub' => '',
    'store' => ''
)

?>

<?php 

// Connect BTC Wallet (single address)

include('vendor/rmccue/requests/library/Requests.php');
Requests::register_autloader();
$headers = array(
    'Content-Type' => 'application/x-www-form-urlencoded'
);
$data = array(
    'email' => '',
    'password' => '',
    'address' => '',
    'store' => ''
);
$response = Requests::post('https://api.forgingblock.io/connect-wallet-btc-single', $headers, $data);
$response = Requests::post('https://api.forgingblock.io/connect-wallet-ltc', $headers, $data); // LTC wallet
$response = Requests::post('https://api.forgingblock.io/connect-wallet-eth', $headers, $data); // ETH wallet
$response = Requests::post('https://api.forgingblock.io/connect-wallet-eth-token', $headers, $data); // USDT wallet
$response = Requests::post('https://api.forgingblock.io/connect-wallet-wallet-xmr', $headers, $data); // Monero wallet
$response = Requests::post('https://api.forgingblock.io/connect-wallet-xtz', $headers, $data); // Tezos wallet
$response = Requests::post('https://api.forgingblock.io/connect-wallet-eos', $headers, $data); // EOS wallet
$response = Requests::post('https://api.forgingblock.io/connect-wallet-eos-token', $headers, $data); // Everipedia wallet
$response = Requests::post('https://api.forgingblock.io/connect-wallet-dgb', $headers, $data); // Digibyte wallet
$response = Requests::post('https://api.forgingblock.io/connect-wallet-rdd', $headers, $data); // ReddCoin wallet
$response = Requests::post('https://api.forgingblock.io/connect-wallet-rvn', $headers, $data); // Ravencoin wallet
$response = Requests::post('https://api.forgingblock.io/connect-wallet-ksm', $headers, $data); // Kusama wallet
$response = Requests::post('https://api.forgingblock.io/connect-wallet-xnc', $headers, $data); // Xenios Coin wallet
$response = Requests::post('https://api.forgingblock.io/connect-wallet-owc', $headers, $data); // Oduwa Coin
$response = Requests::post('https://api.forgingblock.io/connect-wallet-tusc', $headers, $data); // TUSC wallet



// Wallets Connection Status

include('vendor(rmccue/requests/library/Requests.php');
Requests::register_autoloader();
$headers = array(
    'Conten-Type' => 'application/x-www-form-urlencoded'
);
$data = array(
    'email' => '',
    'password' => ''
);
$response = Requests::post('https://api.forgingblock.io/wallet-connection-status', $headers, $data);





?>

