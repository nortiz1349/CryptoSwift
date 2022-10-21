//
//  HapticManager.swift
//  CryptoSwift
//
//  Created by Nortiz M1 on 2022/10/21.
//

import Foundation
import SwiftUI

class HapticManager {
	
	static let generator = UINotificationFeedbackGenerator()
	
	static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
		generator.notificationOccurred(type)
	}
}
