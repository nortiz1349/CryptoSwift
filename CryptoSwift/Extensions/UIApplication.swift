//
//  UIApplication.swift
//  CryptoSwift
//
//  Created by Nortiz M1 on 2022/10/20.
//

import Foundation
import SwiftUI

extension UIApplication {
	
	func endEditing() {
		sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
	}
	
}
