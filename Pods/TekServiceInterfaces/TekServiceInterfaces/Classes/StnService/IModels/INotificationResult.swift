//
//  NotificationResult.swift
//  TekStnServiceInterface
//
//  Created by linhvt on 8/3/20.
//

import Foundation

public protocol INotificationResult {
    var notifications: [INotification] { get }
    var checkPoint: Int? { get }
    var count: Int? { get }
    var unread: Int? { get }
}
