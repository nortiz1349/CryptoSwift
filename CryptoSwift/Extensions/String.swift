//
//  String.swift
//  CryptoSwift
//
//  Created by Nortiz M1 on 2022/10/24.
//

import Foundation

extension String {
	
	var removingHTML: String {
		return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression)
	}
	
}
