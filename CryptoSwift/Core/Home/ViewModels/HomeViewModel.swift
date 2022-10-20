//
//  HomeViewModel.swift
//  CryptoSwift
//
//  Created by Nortiz M1 on 2022/10/19.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
	
	@Published var allCoins: [CoinModel] = []
	@Published var portfolioCoins: [CoinModel] = []
	
	@Published var searchText: String = ""
	
	private let dataService = CoinDataService()
	private var cancellables = Set<AnyCancellable>()
	
	
	init() {
		addSubscriber()
	}
	
	func addSubscriber() {
		dataService.$allCoins
			.sink { [weak self] returnedCoins in
				self?.allCoins = returnedCoins
			}
			.store(in: &cancellables)
	}
	
}
