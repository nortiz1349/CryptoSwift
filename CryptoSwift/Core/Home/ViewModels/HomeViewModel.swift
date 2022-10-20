//
//  HomeViewModel.swift
//  CryptoSwift
//
//  Created by Nortiz M1 on 2022/10/19.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
	
	@Published var statistic: [StatisticModel] = [
		StatisticModel(title: "Title", value: "Value", percentageChange: 1),
		StatisticModel(title: "Title", value: "Value"),
		StatisticModel(title: "Title", value: "Value"),
		StatisticModel(title: "Title", value: "Value", percentageChange: -7)
	]
	
	@Published var allCoins: [CoinModel] = []
	@Published var portfolioCoins: [CoinModel] = []
	
	@Published var searchText: String = ""
	
	private let dataService = CoinDataService()
	private var cancellables = Set<AnyCancellable>()
	
	
	init() {
		addSubscriber()
	}
	
	func addSubscriber() {
		
		// updates allCoins
		$searchText
			.combineLatest(dataService.$allCoins)
			.debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
			.map(filterCoins)
			.sink { [weak self] returnedCoin in
				self?.allCoins = returnedCoin
			}
			.store(in: &cancellables)
	}
	
	private func filterCoins(text: String, coins: [CoinModel]) -> [CoinModel] {
		guard !text.isEmpty else {
			return coins
		}
		
		let lowercasedText = text.lowercased()
		
		return coins.filter { coin in
			return coin.name.lowercased().contains(lowercasedText) ||
			coin.symbol.lowercased().contains(lowercasedText) ||
			coin.id.lowercased().contains(lowercasedText)
		}
	}
	
}
