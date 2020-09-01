//
//  IStnService.swift
//  TekServiceInterfaces
//
//  Created by linhvt on 8/3/20.
//

import Foundation

public typealias GetNotificationHandler = (_ notifications: [INotification], _ checkPoint: Int, _ unread: Int) -> Void
public typealias GetUnreadCountHandler = (_ count: Int) -> Void
public typealias MarkAsReadHandler = (_ success: Bool) -> Void

public protocol IStnService {
    func register(userId: String, token: String)
    func unregister(userId: String, token: String)
    func getNotificationList(checkPoint: Int?, handler: @escaping GetNotificationHandler)
    func getUnreadCount(handler: @escaping GetUnreadCountHandler)
    func markAsRead(id: Int, handler: @escaping MarkAsReadHandler)
}

