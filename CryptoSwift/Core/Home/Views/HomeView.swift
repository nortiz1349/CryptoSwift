//
//  HomeView.swift
//  CryptoSwift
//
//  Created by Nortiz M1 on 2022/10/18.
//

import SwiftUI

struct HomeView: View {
	
	@State private var showPortfolio: Bool = false
	
    var body: some View {
		ZStack {
			// background layer
			Color.theme.background
				.ignoresSafeArea()
			
			// content layer
			VStack {
				homeHeader
				
				Spacer(minLength: 0)
			}
		}
    }
}

// MARK: - PREVIEW
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
		NavigationView {
			HomeView()
				.navigationBarHidden(true)
		}
    }
}

// MARK: - EXTENSION
extension HomeView {
	
	private var homeHeader: some View {
		HStack {
			CircleButtonView(iconName: showPortfolio ? "plus" : "info")
				.animation(.none, value: showPortfolio)
				.background(
					CircleButtonAnimationView(animate: $showPortfolio)
				)
			Spacer()
			Text(showPortfolio ? "Portfolio" : "Live Prices")
				.font(.headline)
				.fontWeight(.heavy)
				.foregroundColor(.theme.accent)
				.animation(nil)
			Spacer()
			CircleButtonView(iconName: "chevron.right")
				.rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
				.onTapGesture {
					withAnimation(.spring()) {
						showPortfolio.toggle()
					}
				}
		}
		.padding(.horizontal)
	}
}