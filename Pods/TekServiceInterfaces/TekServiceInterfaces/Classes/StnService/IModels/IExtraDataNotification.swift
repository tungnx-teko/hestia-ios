//
//  IExtraDataNotification.swift
//  TekStnServiceInterface
//
//  Created by linhvt on 8/3/20.
//

import Foundation

public enum NotificationType: String {
    case order = "order"
}

public protocol IExtraDataNotification {
    var type: NotificationType? { get }
    var data: IOrderNotificationData? { get }
}
