//
//  CoinImageService.swift
//  CryptoSwift
//
//  Created by Nortiz M1 on 2022/10/19.
//

import Foundation
import SwiftUI
import Combine

class CoinImageService {
	
	@Published var image: UIImage? = nil
	
	private var imageSubscription: AnyCancellable?
	private let coin: CoinModel
	private let fileManager = LocalFileManager.instance
	private let folderName = "coin_images"
	private let imageName: String
	
	init(coin: CoinModel) {
		self.coin = coin
		self.imageName = coin.id
		getCoinImage()
	}
	
	private func getCoinImage() {
		if let savedImage = fileManager.getImage(imageName: imageName, folderName: folderName) {
			image = savedImage
			//print("Retrieved image from File Manager.")
		} else {
			downloadCoinImage()
			//print("Downloading image now.")
		}
	}
	
	private func downloadCoinImage() {
		guard let url = URL(string: coin.image) else { return }
		
		imageSubscription = NetworkingManager.download(url: url)
			.tryMap({ data -> UIImage? in
				return UIImage(data: data)
			})
			.receive(on: DispatchQueue.main)
			.sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnedImage in
				guard let self = self, let downloadImage = returnedImage else { return }
				self.image = downloadImage
				self.imageSubscription?.cancel()
				self.fileManager.saveImage(image: downloadImage, imageName: self.imageName, folderName: self.folderName)
			})
	}
}
