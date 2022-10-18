//
//  CryptoSwiftApp.swift
//  CryptoSwift
//
//  Created by Nortiz M1 on 2022/10/18.
//

import SwiftUI

@main
struct CryptoSwiftApp: App {
    var body: some Scene {
        WindowGroup {
			NavigationView {
				HomeView()
					.navigationBarHidden(true)
			}
        }
    }
}
