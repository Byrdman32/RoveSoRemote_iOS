//
//  Packet_Sender.swift
//  RoveSoApple
//
//  Created by Eli Byrd on 4/1/22.
//

import Foundation

func sendRoveCommPacket(Octet4: String, Port: Int) {
    if (Octet4 != "" && Octet4.count < 4) {
        guard let addresses = try? addressesFor(host: "192.168.1.\(Octet4)", port: Port) else {
            print ("Host not found")
            return
        }
        
        if addresses.count != 1 {
            print("Host Ambiguous: Using the first one")
        }
        
        let address = addresses[0]
        let fd = socket(Int32(address.ss_family), SOCK_DGRAM, 0)
        
        guard fd >= 0 else {
            print("`Socket` Failed`")
            return
        }
        defer {
            let junk = close(fd)
            assert(junk == 0)
        }
        
        msgGenerationAndSend(address: address, fd: fd)
    }
    else if  (Octet4 != "" && Octet4.count >= 4) {
        guard let addresses = try? addressesFor(host: Octet4, port: Port) else {
            print ("Host not found")
            return
        }
        
        if addresses.count != 1 {
            print("Host Ambiguous: Using the first one")
        }
        
        let address = addresses[0]
        let fd = socket(Int32(address.ss_family), SOCK_DGRAM, 0)
        
        guard fd >= 0 else {
            print("`Socket` Failed`")
            return
        }
        defer {
            let junk = close(fd)
            assert(junk == 0)
        }
        
        msgGenerationAndSend(address: address, fd: fd)
    }
}

func msgGenerationAndSend(address: sockaddr_storage, fd: Int32) {
    let message = "11000\r\n".data(using: .utf8)!
    let messageCount = message.count
    
    let sendResult = message.withUnsafeBytes { (messagePtr: UnsafePointer<UInt8>) -> Int in
        return address.withSockAddr { (sa, saLen) -> Int in
            return sendto(fd, messagePtr, messageCount, 0, sa, saLen)
        }
    }
    
    guard sendResult >= 0 else {
        print("Send Failed")
        return
    }
    print("Success")
}
