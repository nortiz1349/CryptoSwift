//
//  HomeViewModel.swift
//  CryptoSwift
//
//  Created by Nortiz M1 on 2022/10/19.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
	
	@Published var statistic: [StatisticModel] = []
	
	@Published var allCoins: [CoinModel] = []
	@Published var portfolioCoins: [CoinModel] = []
	
	@Published var searchText: String = ""
	
	private let coinDataService = CoinDataService()
	private let marketDataService = MarketDataService()
	private var cancellables = Set<AnyCancellable>()
	
	
	init() {
		addSubscriber()
	}
	
	func addSubscriber() {
		
		// updates allCoins
		$searchText
			.combineLatest(coinDataService.$allCoins)
			.debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
			.map(filterCoins)
			.sink { [weak self] returnedCoin in
				self?.allCoins = returnedCoin
			}
			.store(in: &cancellables)
		
		// updates marketData
		marketDataService.$marketData
			.map(mapGlobalMarketData)
			.sink { [weak self] stats in
				self?.statistic = stats
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
	
	private func mapGlobalMarketData(marketDataModel: MarketDataModel?) -> [StatisticModel] {
		var stats: [StatisticModel] = []
		
		guard let data = marketDataModel else {
			return stats
		}
		
		let marketCap = StatisticModel(title: "Market Cap", value: data.marketCap, percentageChange: data.marketCapChangePercentage24HUsd)
		let volume = StatisticModel(title: "24H Volume", value: data.volume)
		let btcDominance = StatisticModel(title: "BTC Dominance", value: data.btcDominance)
		let portfolio = StatisticModel(title: "Portfolio", value: "$0.00", percentageChange: 0)
		
		stats.append(contentsOf: [
			marketCap,
			volume,
			btcDominance,
			portfolio
		])
		return stats
	}
}
