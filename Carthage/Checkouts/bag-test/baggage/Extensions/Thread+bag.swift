//
//  Thread+bag.swift
//  baggage
//
//  Created by Nicolas Palmieri on 12/14/17.
//  Copyright © 2017 Nicolas Palmieri. All rights reserved.
//

import Foundation

extension Thread {
    fileprivate class var globalMainQueue: DispatchQueue {
        return DispatchQueue.main
    }

    fileprivate class var globalUserInteractiveQueue: DispatchQueue {
        return DispatchQueue.global(qos: DispatchQoS.QoSClass.userInteractive)
    }

    fileprivate class var globalUserInitiatedQueue: DispatchQueue {
        return DispatchQueue.global(qos: DispatchQoS.QoSClass.userInteractive)
    }

    fileprivate class var globalUtilityQueue: DispatchQueue {
        return DispatchQueue.global(qos: DispatchQoS.QoSClass.utility)
    }

    fileprivate class var globalBackgroundQueue: DispatchQueue {
        return DispatchQueue.global(qos: DispatchQoS.QoSClass.background)
    }

    fileprivate class func runOnQueue(_ queue: DispatchQueue, delay: Double? = nil, completion: @escaping () -> Void) {
        if isValidDelay(delay) {
            let dispatchTime = DispatchTime.now() + Double(Int64(delay! * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
            queue.asyncAfter(deadline: dispatchTime) {
                completion()
            }
        } else {
            queue.async {
                completion()
            }
        }
    }

    fileprivate class func isValidDelay(_ delay: Double?) -> Bool {
        return delay != nil && delay != 0
    }

    // MARK: - RunOnQueue methods
    /// Use this method when you want to run a block on the main-thread
    /// - Parameters:
    ///     - delay: if there is a specified delay, code will be executed after that value in seconds. If the value is nil, it will run the code right away.
    ///     - completion: closure block where you put the code that you want to execute on the main thread.
    open class func runOnMainQueue(_ delay: Double? = nil, completion: @escaping () -> Void) {
        runOnQueue(globalMainQueue, delay: delay, completion: completion)
    }

    /// Use the following method when you want to run a block of code on a background thread
    /// - Parameters:
    ///     - delay: if there is a specified delay, code will be executed after that value in seconds. If the value is nil, the code will be run immediately.
    ///     - completion: closure block where you put the code that you want to execute on a background thread.
    open class func runOnBackgroundQueue(_ delay: Double? = nil, completion: @escaping () -> Void) {
        runOnQueue(globalBackgroundQueue, delay: delay, completion: completion)
    }

    /// Use this method whenyou want to run a block of code on a user interactive thread
    /// - Parameters:
    ///     - delay: if there is a specified delay, code will be executed after that value in seconds. If the value is nil, the code will be run immediately.
    ///     - completion: closure block where you put the code that you want to execute on an user-interactive thread.
    open class func runOnUserInteractiveQueue(_ delay: Double? = nil, completion: @escaping () -> Void) {
        runOnQueue(globalUserInteractiveQueue, delay: delay, completion: completion)
    }

    /// Use this method whenyou want to run a block of code on a user interactive thread
    /// - Parameters:
    ///     - delay: if there is a specified delay, code will be executed after that value in seconds. If the value is nil, the code will be run immediately.
    ///     - completion: closure block where you put the code that you want to execute on an user-initiated thread.
    open class func runOnUserInitiatedQueue(_ delay: Double? = nil, completion: @escaping () -> Void) {
        runOnQueue(globalUserInitiatedQueue, delay: delay, completion: completion)
    }

    /// Use this method whenyou want to run a block of code on a user interactive thread
    /// - Parameters:
    ///     - delay: if there is a specified delay, code will be executed after that value in seconds. If the value is nil, the code will be run immediately.
    ///     - completion: closure block where you put the code that you want to execute on an utility thread.
    open class func runOnUtilityQueue( _ delay: Double? = nil, completion: @escaping () -> Void) {
        runOnQueue(globalUtilityQueue, delay: delay, completion: completion)
    }
}
