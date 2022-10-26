//
//  NetworkingManager.swift
//  CryptoSwift
//
//  Created by Nortiz M1 on 2022/10/19.
//

import Foundation
import Combine

class NetworkingManager {
	
	enum NetworkingError: LocalizedError {
		case badURLResponse(url: URL)
		case unknown
		
		var errorDescription: String? {
			switch self {
			case .badURLResponse(url: let url): return "[🔥] Bad response from URL: \(url)"
			case .unknown: return "[⚠️] Unknown error occured."
			}
		}
	}
	
	static func download(url: URL) -> AnyPublisher<Data, any Error> {
		return URLSession.shared.dataTaskPublisher(for: url)
//			.subscribe(on: DispatchQueue.global(qos: .default)) // 기본적으로 백그라운드에서 작동하므로 삭제
			.tryMap({ try handleURLResponse(output: $0, url: url) })
			.retry(3)
//			.receive(on: DispatchQueue.main) // 최종 UI 프로세스에서 main 스레드로 넘겨줌
			.eraseToAnyPublisher()
	}
	
	static func handleURLResponse(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data {
		guard let response = output.response as? HTTPURLResponse,
			  200..<300 ~= response.statusCode else {
			throw NetworkingError.badURLResponse(url: url)
		}
		return output.data
	}
	
	static func handleCompletion(completion: Subscribers.Completion<Error>) {
		switch completion {
		case .finished:
			break
		case .failure(let error):
			print(error.localizedDescription)
		}
	}
	
}
