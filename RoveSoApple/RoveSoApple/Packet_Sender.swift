//
//  Packet_Sender.swift
//  RoveSoApple
//
//  Created by Eli Byrd on 4/1/22.
//

import Foundation
import Network

func sendUDP(_ host: String, _ port: Int, _ header: RoveCommHeader, _ data: [UInt8] ) {
    guard let addresses = try? addressesFor(host: "192.168.201.\(String(host.suffix(3)))", port: 11000) else {
        print("host not found")
        return
    }
    if addresses.count != 1 {
        print("host ambiguous; using the first one")
    }
    let address = addresses[0]
    let fd = socket(Int32(address.ss_family), SOCK_DGRAM, 0)
    guard fd >= 0 else {
        print("`socket` failed`")
        return
    }
    defer {
        let junk = close(fd)
        assert(junk == 0)
    }
    
    var packet: Data = Data([header.version])
    packet.append(header.data_id.twoBytes[0])
    packet.append(header.data_id.twoBytes[1])
    packet.append(header.data_count.twoBytes[0])
    packet.append(header.data_count.twoBytes[1])
    packet.append(Data([header.data_type]))
    
    for i in data {
        packet.append(Data([i]))
    }
    
    let sendResult = packet.withUnsafeBytes { (messagePtr: UnsafePointer<UInt8>) -> Int in
        return address.withSockAddr { (sa, saLen) -> Int in
            return sendto(fd, messagePtr, packet.count, 0, sa, saLen)
        }
    }
    guard sendResult >= 0 else {
        print("send failed")
        return
    }
}
