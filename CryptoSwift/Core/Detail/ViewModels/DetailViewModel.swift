//
//  DetailViewModel.swift
//  CryptoSwift
//
//  Created by Nortiz M1 on 2022/10/22.
//

import Foundation
import Combine

class DetailViewModel: ObservableObject {
	
	private let coinDetailService: CoinDetailDataService
	private var cancellables = Set<AnyCancellable>()
	
	init(coin: CoinModel) {
		self.coinDetailService = CoinDetailDataService(coin: coin)
		self.addSubscribers()
	}
	
	private func addSubscribers() {
		
		coinDetailService.$coinDetails
			.sink { returnedCoinDetail in
				print("recieve coin detail data")
				print(returnedCoinDetail)
			}
			.store(in: &cancellables)
	}
}
