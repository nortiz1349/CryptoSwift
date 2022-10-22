//
//  DetailView.swift
//  CryptoSwift
//
//  Created by Nortiz M1 on 2022/10/21.
//

import SwiftUI

struct DetailView: View {
	
	let coin: CoinModel
	
//	init(coin: CoinModel) {
//		self.coin = coin
//		print("initializing Detail View for \(coin.name)")
//	}
	
    var body: some View {
		ZStack {
			Text(coin.name)
		}
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
		DetailView(coin: dev.coin)
    }
}
