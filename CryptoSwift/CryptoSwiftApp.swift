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
	@State private var showLaunchView: Bool = true
	
	init() {
		UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
		UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
		UITableView.appearance().backgroundColor = UIColor.clear
		UINavigationBar.appearance().backgroundColor = UIColor.clear
	}
	
    var body: some Scene {
        WindowGroup {
			
			ZStack {
				NavigationStack {
					HomeView()
						.navigationBarHidden(true)
				}
				.environmentObject(vm)
				
				ZStack {
					if showLaunchView {
						LaunchView(showLaunchView: $showLaunchView)
							.transition(.move(edge: .leading))
					}
				}
				.zIndex(2.0)
			}
        }
    }
}
