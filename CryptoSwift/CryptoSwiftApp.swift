//
//  CryptoSwiftApp.swift
//  CryptoSwift
//
//  Created by Nortiz M1 on 2022/10/18.
//

import SwiftUI

@main
struct CryptoSwiftApp: App {
	
	init() {
		UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
		UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
	}
	
	@StateObject private var vm = HomeViewModel()
	
    var body: some Scene {
        WindowGroup {
			NavigationStack {
				HomeView()
//					.navigationBarHidden(true)
			}
			.environmentObject(vm)
        }
    }
}
