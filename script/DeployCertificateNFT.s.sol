// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../src/CertificateNFT.sol";

contract DeployCertificateNFT is Script {
    function run() external {
        // Ambil kunci privat dari environment variable
        address deployer = vm.envAddress("DEPLOYER_ADDRESS"); // bisa diganti hardcoded jika mau

        // Start broadcasting dari private key (otomatis ambil dari --private-key saat `forge script`)
        vm.startBroadcast();

        // Deploy kontraknya dengan nama dan simbol
        CertificateNFT cert = new CertificateNFT("CertificateNFT", "CERT", deployer);

        vm.stopBroadcast();

        // Optional: cetak address kontrak ke terminal
        console2.log("Deployed CertificateNFT to:", address(cert));
    }
}