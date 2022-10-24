//
//  DetailView.swift
//  CryptoSwift
//
//  Created by Nortiz M1 on 2022/10/21.
//

import SwiftUI

struct DetailView: View {
	
	@StateObject private var vm: DetailViewModel
	
	init(coin: CoinModel) {
		_vm = StateObject(wrappedValue: DetailViewModel(coin: coin))
		print("initializing Detail View for \(coin.name)")
	}
	
    var body: some View {
		ZStack {
			Text("test")
		}
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
		DetailView(coin: dev.coin)
    }
}
