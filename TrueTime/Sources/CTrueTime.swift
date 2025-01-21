//
//  CTrueTime.swift
//
//
//  Created by Pavlo Boiko on 10/14/24.
//

import Foundation

@frozen
public struct ntp_time32_t {
    public var whole: UInt16
    public var fraction: UInt16

    // Default initializer
    public init() {
        self.whole = 0
        self.fraction = 0
    }

    // Parameterized initializer
    public init(whole: UInt16, fraction: UInt16) {
        self.whole = whole
        self.fraction = fraction
    }
}

@frozen
public struct ntp_time64_t {
    public var whole: UInt32
    public var fraction: UInt32

    // Default initializer
    public init() {
        self.whole = 0
        self.fraction = 0
    }

    // Parameterized initializer
    public init(whole: UInt32, fraction: UInt32) {
        self.whole = whole
        self.fraction = fraction
    }
}

public typealias ntp_time_t = ntp_time64_t

@frozen
public struct ntp_packet_t {
    // Bit fields in Swift can be represented using computed properties
    private var clientModeAndVersionLeap: UInt8

    public var client_mode: UInt8 {
        get { clientModeAndVersionLeap & 0b00000111 }
        set { clientModeAndVersionLeap = (clientModeAndVersionLeap & 0b11111000) | (newValue & 0b00000111) }
    }

    public var version_number: UInt8 {
        get { (clientModeAndVersionLeap >> 3) & 0b00000111 }
        set { clientModeAndVersionLeap = (clientModeAndVersionLeap & 0b11000111) | ((newValue & 0b00000111) << 3) }
    }

    public var leap_indicator: UInt8 {
        get { (clientModeAndVersionLeap >> 6) & 0b00000011 }
        set { clientModeAndVersionLeap = (clientModeAndVersionLeap & 0b00111111) | ((newValue & 0b00000011) << 6) }
    }

    public var stratum: UInt8
    public var poll: UInt8
    public var precision: UInt8
    public var root_delay: ntp_time32_t
    public var root_dispersion: ntp_time32_t
    public var reference_id: (UInt8, UInt8, UInt8, UInt8)
    public var reference_time: ntp_time_t
    public var originate_time: ntp_time_t
    public var receive_time: ntp_time_t
    public var transmit_time: ntp_time_t

    // Default initializer
    public init() {
        self.clientModeAndVersionLeap = 0
        self.stratum = 0
        self.poll = 0
        self.precision = 0
        self.root_delay = ntp_time32_t()
        self.root_dispersion = ntp_time32_t()
        self.reference_id = (0, 0, 0, 0)
        self.reference_time = ntp_time64_t()
        self.originate_time = ntp_time64_t()
        self.receive_time = ntp_time64_t()
        self.transmit_time = ntp_time64_t()
    }

    // Parameterized initializer
    public init(client_mode: UInt8, version_number: UInt8, leap_indicator: UInt8, stratum: UInt8, poll: UInt8, precision: UInt8, root_delay: ntp_time32_t, root_dispersion: ntp_time32_t, reference_id: (UInt8, UInt8, UInt8, UInt8), reference_time: ntp_time_t, originate_time: ntp_time_t, receive_time: ntp_time_t, transmit_time: ntp_time_t) {
        self.clientModeAndVersionLeap = (leap_indicator << 6) | (version_number << 3) | client_mode
        self.stratum = stratum
        self.poll = poll
        self.precision = precision
        self.root_delay = root_delay
        self.root_dispersion = root_dispersion
        self.reference_id = reference_id
        self.reference_time = reference_time
        self.originate_time = originate_time
        self.receive_time = receive_time
        self.transmit_time = transmit_time
    }
}
