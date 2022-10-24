//
//  DetailView.swift
//  CryptoSwift
//
//  Created by Nortiz M1 on 2022/10/21.
//

import SwiftUI

struct DetailView: View {
	
	@StateObject private var vm: DetailViewModel
	private let columns: [GridItem] = [
		GridItem(.flexible()),
		GridItem(.flexible())
	]
	private let spacing: CGFloat = 30
	
	init(coin: CoinModel) {
		_vm = StateObject(wrappedValue: DetailViewModel(coin: coin))
	}
	
    var body: some View {
		ScrollView {

			VStack {
				ChartView(coin: vm.coin)
					.padding(.vertical)
				
				VStack(spacing: 20) {
					overviewTitle
					Divider()
					overviewGrid
					additionalTitle
					Divider()
					additionalGrid
				}
				.padding()
			}
		}
		.navigationTitle(vm.coin.name)
		.navigationBarTitleDisplayMode(.large)
		.toolbar {
			ToolbarItem(placement: .navigationBarTrailing) {
				navigationBarTrailingItem
			}
		}
    }
}

// MARK: - PREVIEW
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
		NavigationStack {
			DetailView(coin: dev.coin)
		}
    }
}

// MARK: - EXTENSION
extension DetailView {
	
	private var overviewTitle: some View {
		Text("Overview")
			.font(.title)
			.bold()
			.foregroundColor(.theme.accent)
			.frame(maxWidth: .infinity, alignment: .leading)
	}
	
	private var additionalTitle: some View {
		Text("Additional Details")
			.font(.title)
			.bold()
			.foregroundColor(.theme.accent)
			.frame(maxWidth: .infinity, alignment: .leading)
	}
	
	private var overviewGrid: some View {
		LazyVGrid(
			columns: columns,
			alignment: .leading,
			spacing: spacing,
			pinnedViews: []) {
				ForEach(vm.overviewStatistics) { stat in
					StatisticView(stat: stat)
				}
			}
	}
	
	private var additionalGrid: some View {
		LazyVGrid(
			columns: columns,
			alignment: .leading,
			spacing: spacing,
			pinnedViews: []) {
				ForEach(vm.additionalStatistics) { stat in
					StatisticView(stat: stat)
				}
			}
	}
	
	private var navigationBarTrailingItem: some View {
		HStack {
			Text(vm.coin.symbol.uppercased())
				.font(.headline)
				.foregroundColor(.theme.secondaryText)
			CoinImageView(coin: vm.coin)
				.frame(width: 25, height: 25)
		}
	}
}
