//
//  Notification.swift
//  TekStnServiceInterface
//
//  Created by linhvt on 8/3/20.
//

import Foundation

public protocol INotification {
    var appId: String? { get }
    var id: Int? { get }
    var isRead: Bool? { get }
    var link: String? { get }
    var message: String? { get }
    var receivedId: String? { get }
    var sender: String? { get }
    var senderId: String? { get }
    var title: String? { get }
    var createdAt: String? { get }
    var extraData: IExtraDataNotification? { get }
    
    var photoUrl: String? { get }
    
}

