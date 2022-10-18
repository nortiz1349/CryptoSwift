//
//  ContentView.swift
//  CryptoSwift
//
//  Created by Nortiz M1 on 2022/10/18.
//
import SwiftUI

struct ContentView: View {
    var body: some View {
		ZStack {
			Color.theme.background.ignoresSafeArea()
			
			VStack {
				Text("Accent Color")
					.foregroundColor(.theme.accent)
				
				Text("Secondary Text Color")
					.foregroundColor(.theme.secondaryText)
				
				Text("Red Color")
					.foregroundColor(.theme.red)
				
				Text("Green Color")
					.foregroundColor(.theme.green)
			}
			.font(.title)
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
