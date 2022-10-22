//
//  HomeView.swift
//  CryptoSwift
//
//  Created by Nortiz M1 on 2022/10/18.
//

import SwiftUI

struct HomeView: View {
	
	@EnvironmentObject private var vm: HomeViewModel
	@State private var showPortfolio: Bool = false // animate right
	@State private var showPortfolioView: Bool = false // new sheet
	
	@State private var selectedCoin: CoinModel? = nil
	@State private var showDetailView: Bool = false
	
    var body: some View {
		ZStack {
			// background layer
			Color.theme.background
				.ignoresSafeArea()
				.sheet(isPresented: $showPortfolioView) {
					PortfolioView()
						.environmentObject(vm)
				}
			
			// content layer
			VStack {
				homeHeader
				
				HomeStatsView(showPortfolio: $showPortfolio)
				
				SearchBarView(searchText: $vm.searchText)
				
				columnTitle
				
				if !showPortfolio {
					allCoinsList
						.transition(.move(edge: .leading))
				}
				if showPortfolio {
					portfolioCoinsList
						.transition(.move(edge: .trailing))
				}
				
				
				Spacer(minLength: 0)
			}
		}
    }
}

// MARK: - PREVIEW
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
		NavigationStack {
			HomeView()
				.navigationBarHidden(true)
		}
		.environmentObject(dev.homeVM)
    }
}

// MARK: - EXTENSION
extension HomeView {
	
	private var homeHeader: some View {
		HStack {
			CircleButtonView(iconName: showPortfolio ? "plus" : "info")
				.animation(.none, value: showPortfolio)
				.onTapGesture {
					if showPortfolio {
						showPortfolioView.toggle()
					}
				}
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
	
	private var allCoinsList: some View {
		List(vm.allCoins) { coin in
			NavigationLink(value: coin) {
				CoinRowView(coin: coin, showHoldingsColumn: false)
			}
			.padding(.trailing, -10)
			.padding(.leading, -20)
		}
		.navigationDestination(for: CoinModel.self, destination: { coin in
			DetailView(coin: coin)
		})
		.refreshable {
			vm.reloadData()
		}
		.listStyle(.plain)
	}
	
	private var portfolioCoinsList: some View {
		List(vm.portfolioCoins) { coin in
			NavigationLink(value: coin) {
				CoinRowView(coin: coin, showHoldingsColumn: true)
			}
			.padding(.trailing, -10)
			.padding(.leading, -20)
		}
		.navigationDestination(for: CoinModel.self, destination: { coin in
			DetailView(coin: coin)
		})
		.refreshable {
			vm.reloadData()
		}
		.listStyle(.plain)
	}
	
	private var columnTitle: some View {
		HStack {
			HStack(spacing: 4.0) {
				Text("Coin")
				Image(systemName: "chevron.down")
					.opacity((vm.sortOption == .rank || vm.sortOption == .rankReversed) ? 1.0 : 0)
					.rotation3DEffect(Angle(degrees: vm.sortOption == .rank ? 0 : 180), axis: (x:1, y:0, z:0))
//					.rotationEffect(Angle(degrees: vm.sortOption == .rank ? 0 : 180))
			}
			.onTapGesture {
				withAnimation {
					vm.sortOption = vm.sortOption == .rank ? .rankReversed : .rank
				}
			}
			Spacer()
			if showPortfolio {
				HStack(spacing: 4.0) {
					Text("Holding")
					Image(systemName: "chevron.down")
						.opacity((vm.sortOption == .holdings || vm.sortOption == .holdingReversed) ? 1.0 : 0)
						.rotation3DEffect(Angle(degrees: vm.sortOption == .holdings ? 0 : 180), axis: (x:1, y:0, z:0))
				}
				.onTapGesture {
					withAnimation {
						vm.sortOption = vm.sortOption == .holdings ? .holdingReversed : .holdings
					}
				}
			}
			HStack(spacing: 4.0) {
				Text("Price")
					.frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
				Image(systemName: "chevron.down")
					.opacity((vm.sortOption == .price || vm.sortOption == .priceReversed) ? 1.0 : 0)
					.rotation3DEffect(Angle(degrees: vm.sortOption == .price ? 0 : 180), axis: (x:1, y:0, z:0))
			}
			.onTapGesture {
				withAnimation {
					vm.sortOption = vm.sortOption == .price ? .priceReversed : .price
				}
			}
			
//			Button {
//				withAnimation(.linear(duration: 2.0)) {
//					vm.reloadData()
//				}
//			} label: {
//				Image(systemName: "goforward")
//					.rotationEffect(Angle(degrees: vm.isLoading ? 360 : 0), anchor: .center)
//			}
			

		}
		.font(.caption)
		.foregroundColor(.theme.secondaryText)
		.padding(.horizontal)
	}
}
