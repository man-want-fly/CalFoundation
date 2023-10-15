//
//  File.swift
//
//
//  Created by DB H on 2023/10/15.
//
#if !os(macOS)
import EventKit
import Foundation

extension EKEventStore {

    /// full access to events
    public func requestAccessToEvents(
        completion: @escaping EKEventStoreRequestAccessCompletionHandler
    ) {
        if #available(iOS 17.0, *) {
            requestFullAccessToEvents(completion: completion)
        } else {
            requestAccess(to: .event, completion: completion)
        }
    }

    public func requestAccessToEvents() async throws -> Bool {
        if #available(iOS 17.0, *) {
            try await requestFullAccessToEvents()
        } else {
            try await requestAccess(to: .event)
        }
    }
}
#endif
