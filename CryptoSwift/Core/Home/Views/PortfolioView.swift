//
//  PortfolioView.swift
//  CryptoSwift
//
//  Created by Nortiz M1 on 2022/10/20.
//

import SwiftUI

struct PortfolioView: View {
	
	@EnvironmentObject private var vm: HomeViewModel
	@State private var selectedCoin: CoinModel? = nil
	@State private var quantityText: String = ""
	@State private var isAnimateText: Bool = false
	@State private var showCheckMark: Bool = false
	
	@Environment(\.dismiss) private var dismiss
	
    var body: some View {
		NavigationView {
			ScrollView {
				VStack(alignment: .leading, spacing: 0) {
					SearchBarView(searchText: $vm.searchText)
					coinLogoList
					
					if selectedCoin != nil {
						portfolioInputSection
					}
				}
			}
			.navigationTitle("Edit Portfolio")
			.toolbar {
				ToolbarItem(placement: .navigationBarLeading) {
					xMarkButton
				}
				ToolbarItem(placement: .navigationBarTrailing) {
					saveButton
				}
			}
		}
    }
}

struct PortfolioView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioView()
			.environmentObject(dev.homeVM)
    }
}

extension PortfolioView {
	
	private var xMarkButton: some View {
		Button {
			dismiss()
		} label: {
			Image(systemName: "xmark")
				.font(.headline)
		}
	}
	
	private var saveButton: some View {
		HStack(spacing: 10) {
			Image(systemName: "checkmark")
				.opacity(showCheckMark ? 1.0 : 0.0)
			
			Button {
				saveButtonPressed()
			} label: {
				Text("Save".uppercased())
			}
			.opacity(!quantityText.isEmpty ? 1.0 : 0)
		}
		.font(.headline)
	}
	
	private func saveButtonPressed() {
		
		guard let coin = selectedCoin else { return }
		
		// save to portfolio
		
		// show checkmark
		withAnimation(.easeIn) {
			showCheckMark = true
			removeSelectedCoin()
		}
		
		// hide keyboard
		UIApplication.shared.endEditing()
		
		// hide check mark
		DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
			withAnimation(.easeOut) {
				showCheckMark = false
			}
		}
		
	}
	
	private func removeSelectedCoin() {
		selectedCoin = nil
		vm.searchText = ""
	}
	
	private var coinLogoList: some View {
		ScrollView(.horizontal, showsIndicators: false) {
			LazyHStack(spacing: 10) {
				ForEach(vm.allCoins) { coin in
					CoinLogoView(coin: coin)
						.frame(width: 75)
						.padding(4)
						.onTapGesture {
							withAnimation(.easeIn) {
								selectedCoin = coin
								isAnimateText = !isAnimateText
							}
						}
						.background(
							RoundedRectangle(cornerRadius: 10)
								.stroke(selectedCoin?.id == coin.id ? Color.theme.green : Color.clear, lineWidth: 2)
						)
				}
			}
			.frame(height: 120)
			.padding(.leading)
		}
	}
	
	private func getCurrentValue() -> Double {
		if let quantity = Double(quantityText) {
			return quantity * (selectedCoin?.currentPrice ?? 0)
		}
		return 0
	}
	
	private var portfolioInputSection: some View {
		VStack(spacing: 20) {
			HStack {
				Text("Current price of \(selectedCoin?.symbol.uppercased() ?? ""):")
				Spacer()
				Text(selectedCoin?.currentPrice.asCurrecyWith6Decimals() ?? "")
			}
			Divider()
			HStack {
				Text("Amount holding:")
				Spacer()
				TextField("Ex. 1.4", text: $quantityText)
					.multilineTextAlignment(.trailing)
					.keyboardType(.decimalPad)
			}
			Divider()
			HStack {
				Text("Current value:")
				Spacer()
				Text(getCurrentValue().asCurrecyWith2Decimals())
			}
		}
		.animation(nil, value: isAnimateText)
		.padding()
		.font(.headline)
	}
	
	
}
