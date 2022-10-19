//
//  CoinRowView.swift
//  CryptoSwift
//
//  Created by Nortiz M1 on 2022/10/19.
//

import SwiftUI

struct CoinRowView: View {
	
	let coin: CoinModel
	let showHoldingsColumn: Bool
	
    var body: some View {
		HStack(spacing: 0) {
			leftColumn
			Spacer()
			if showHoldingsColumn {
				centerColumn
			}
			rightColumn
		}
		.font(.subheadline)
    }
}

// MARK: - PREVIEW
struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
		CoinRowView(coin: dev.coin, showHoldingsColumn: true)
			.previewLayout(.sizeThatFits)
    }
}
// MARK: - EXTENSION
extension CoinRowView {
	
	private var leftColumn: some View {
		HStack(spacing: 0.0) {
			Text("\(coin.rank)")
				.font(.caption)
				.foregroundColor(.theme.secondaryText)
				.frame(minWidth: 30)
			CoinImageView(coin: coin)
				.frame(width: 30, height: 30)
			Text(coin.symbol.uppercased())
				.font(.headline)
				.padding(.leading, 6)
				.foregroundColor(.theme.accent)
		}
	}
	
	private var centerColumn: some View {
		VStack(alignment: .trailing) {
			Text(coin.currentHoldingsValue.asCurrecyWith2Decimals())
				.bold()
			Text((coin.currentHoldings ?? 0).asNumberString())
		}
		.foregroundColor(.theme.accent)
	}
	
	private var rightColumn: some View {
		VStack(alignment: .trailing) {
			Text(coin.currentPrice.asCurrecyWith6Decimals())
				.bold()
				.foregroundColor(.theme.accent)
			Text(coin.priceChangePercentage24H?.asPercentString() ?? "")
				.foregroundColor(
					(coin.priceChangePercentage24H ?? 0) >= 0 ?
						.theme.green :
							.theme.red
				)
		}
		.frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
	}
}
