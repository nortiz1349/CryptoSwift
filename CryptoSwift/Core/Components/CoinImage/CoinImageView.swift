//
//  CoinImageView.swift
//  CryptoSwift
//
//  Created by Nortiz M1 on 2022/10/19.
//

import SwiftUI

struct CoinImageView: View {
	
	@StateObject private var vm: CoinImageViewModel
	
	init(coin: CoinModel) {
		_vm = StateObject(wrappedValue: CoinImageViewModel(coin: coin))
	}
	
    var body: some View {
		ZStack {
			if let image = vm.image {
				Image(uiImage: image)
					.resizable()
					.scaledToFit()
			} else if vm.isLoading {
				ProgressView()
			} else {
				Image(systemName: "questionmark")
					.foregroundColor(.theme.secondaryText)
			}
		}
    }
}

struct CoinImageView_Previews: PreviewProvider {
    static var previews: some View {
		CoinImageView(coin: dev.coin)
			.previewLayout(.sizeThatFits)
    }
}
