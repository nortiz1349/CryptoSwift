//
//  SettingsView.swift
//  CryptoSwift
//
//  Created by Nortiz M1 on 2022/10/25.
//

import SwiftUI

struct SettingsView: View {
	
	@Environment(\.dismiss) var dismiss
	
	let defaultURL = URL(string: "https://www.google.com")!
	let youtubeURL = URL(string: "https://www.youtube.com")!
	let coingeckoURL = URL(string: "https://www.coingecko.com")!
	let personalURL = URL(string: "https://github.com/nortiz1349")!
	
    var body: some View {
		NavigationStack {
			List {
				introSection
				coinGeckoSection
			}
			.tint(.blue)
			.listStyle(.grouped)
			.navigationTitle("Settings")
			.toolbar {
				ToolbarItem(placement: .navigationBarLeading) {
					xButton
				}
			}
		}
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

extension SettingsView {
	
	private var introSection: some View {
		Section {
			VStack(alignment: .leading) {
				Image("logo")
					.resizable()
					.frame(width: 100, height: 100)
					.clipShape(RoundedRectangle(cornerRadius: 20))
				Text("This app was made by following a tutorial course. It uses MVVM Architecture, Combine, and CoreData!")
					.font(.callout)
					.fontWeight(.medium)
					.foregroundColor(.theme.accent)
			}
			.padding(.vertical)
			Link("Check in Github Repo ⭐️", destination: personalURL)
			
		} header: {
			Text("iOS Development")
		}
	}
	
	private var coinGeckoSection: some View {
		Section {
			VStack(alignment: .leading) {
				Image("coingecko")
					.resizable()
					.frame(height: 170)
					.scaledToFit()
					.clipShape(RoundedRectangle(cornerRadius: 20))
				Text("The cryptocurrency data that is used in this app comes from a free API from CoinGecko! Prices may be slightly delayed.")
					.font(.callout)
					.fontWeight(.medium)
					.foregroundColor(.theme.accent)
			}
			.padding(.vertical)
			Link("Visit CoinGecko 🥳", destination: coingeckoURL)
			
		} header: {
			Text("CoinGecko")
		}
	}
	
	private var xButton: some View {
		Button {
			dismiss()
		} label: {
			Image(systemName: "xmark")
				.font(.headline)
		}
	}
}
