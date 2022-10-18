//
//  CircleButtonView.swift
//  CryptoSwift
//
//  Created by Nortiz M1 on 2022/10/18.
//

import SwiftUI

struct CircleButtonView: View {
	
	let iconName: String
	
    var body: some View {
        Image(systemName: iconName)
			.font(.headline)
			.foregroundColor(.theme.accent)
			.frame(width: 50, height: 50)
			.background(
				Circle()
					.foregroundColor(.theme.background)
			)
			.shadow(
				color: .theme.accent.opacity(0.25),
				radius: 10)
			.padding()
    }
}

struct CircleButtonView_Previews: PreviewProvider {
    static var previews: some View {
		CircleButtonView(iconName: "info")
			.padding()
			.previewLayout(.sizeThatFits)
		CircleButtonView(iconName: "plus")
			.padding()
			.previewLayout(.sizeThatFits)
    }
}
