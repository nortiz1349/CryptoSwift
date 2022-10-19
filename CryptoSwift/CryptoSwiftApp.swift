//
//  CryptoSwiftApp.swift
//  CryptoSwift
//
//  Created by Nortiz M1 on 2022/10/18.
//

import SwiftUI

@main
struct CryptoSwiftApp: App {
	
	@StateObject private var vm = HomeViewModel()
	
    var body: some Scene {
        WindowGroup {
			NavigationView {
				HomeView()
					.navigationBarHidden(true)
			}
			.environmentObject(vm)
        }
    }
}
