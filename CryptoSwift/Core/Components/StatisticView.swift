//
//  StatisticView.swift
//  CryptoSwift
//
//  Created by Nortiz M1 on 2022/10/20.
//

import SwiftUI

struct StatisticView: View {
	
	let stat: StatisticModel
	
    var body: some View {
		VStack(alignment: .leading, spacing: 4.0) {
			Text(stat.title)
				.font(.caption)
				.foregroundColor(.theme.secondaryText)
			Text(stat.value)
				.font(.headline)
				.foregroundColor(.theme.accent)
			
			HStack(spacing: 4.0) {
				Image(systemName: "triangle.fill")
					.font(.caption2)
					.rotationEffect(
						Angle(degrees: (stat.percentageChange ?? 0) >= 0 ? 0 : 180))
				Text(stat.percentageChange?.asPercentString() ?? "")
					.font(.caption)
				.bold()
			}
			.foregroundColor(
				(stat.percentageChange ?? 0) >= 0 ? .red : .blue
			)
			.opacity(stat.percentageChange == nil ? 0 : 1.0)
		}
    }
}

struct StatisticView_Previews: PreviewProvider {
    static var previews: some View {
		HStack(spacing: 30.0) {
			StatisticView(stat: dev.stat1)
			StatisticView(stat: dev.stat2)
			StatisticView(stat: dev.stat3)
		}
		.padding()
		.previewLayout(.sizeThatFits)
		
    }
}
