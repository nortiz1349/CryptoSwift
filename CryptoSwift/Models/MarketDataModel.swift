//
//  MarketDataModel.swift
//  CryptoSwift
//
//  Created by Nortiz M1 on 2022/10/20.
//

import Foundation

// JSON Data
/*
 URL: https://api.coingecko.com/api/v3/global
 JSON Response:
 {
 "data": {
 "active_cryptocurrencies": 13249,
 "upcoming_icos": 0,
 "ongoing_icos": 49,
 "ended_icos": 3376,
 "markets": 598,
 "total_market_cap": {
 "btc": 49968463.142907165,
 "eth": 739712229.809129,
 "ltc": 18488617152.34645,
 "bch": 8885395697.66698,
 "bnb": 3520379578.2432203,
 "eos": 919648684636.8544,
 "xrp": 2073627888121.7683,
 "xlm": 8529491822384.119,
 "link": 139625314712.81342,
 "dot": 155851492728.2938,
 "yfi": 125696258.5560366,
 "usd": 956391004730.4701,
 "aed": 3512828942330.0405,
 "ars": 146479497773202.03,
 "aud": 1526873457097.172,
 "bdt": 101381536985757.11,
 "bhd": 360565147129.41547,
 "bmd": 956391004730.4701,
 "brl": 5040468468621.996,
 "cad": 1316213992440.2144,
 "chf": 961009416892.3137,
 "clp": 931716116808423.5,
 "cny": 6917097941713.104,
 "czk": 23996806699692.207,
 "dkk": 7273119275179.069,
 "eur": 977663053457.6832,
 "gbp": 852572848384.9673,
 "hkd": 7506463378077.219,
 "huf": 403707695734754.6,
 "idr": 14897044858694850,
 "ils": 3383104066448.401,
 "inr": 79516308734851.02,
 "jpy": 143402198468080,
 "krw": 1368192337231485.5,
 "kwd": 297121993439.6153,
 "lkr": 350176673100690.3,
 "mmk": 2011995912057031.5,
 "mxn": 19252007466573.645,
 "myr": 4520669001159.985,
 "ngn": 418180044472478.56,
 "nok": 10127265473904.16,
 "nzd": 1691015019675.0435,
 "php": 56417027173548.28,
 "pkr": 211499594858370.28,
 "pln": 4698922113012.653,
 "rub": 59081061011962.01,
 "sar": 3594778261961.3745,
 "sek": 10716316257627.688,
 "sgd": 1363293296039.0776,
 "thb": 36481995855908.06,
 "try": 17781428140405.945,
 "twd": 30677676063236.902,
 "uah": 35384865220094.46,
 "vef": 95763431303.66208,
 "vnd": 23461099221045524,
 "zar": 17501500144449.348,
 "xdr": 714991220399.4679,
 "xag": 51807432936.76805,
 "xau": 586105099.4289757,
 "bits": 49968463142907.164,
 "sats": 4996846314290716
 },
 "total_volume": {
 "btc": 2731399.7077243766,
 "eth": 40434498.9062886,
 "ltc": 1010633513.8169092,
 "bch": 485697691.80639684,
 "bnb": 192432649.44115633,
 "eos": 50270270295.13055,
 "xrp": 113349625970.01314,
 "xlm": 466243106258.20056,
 "link": 7632264828.854098,
 "dot": 8519227827.139906,
 "yfi": 6870868.18940398,
 "usd": 52278696331.324585,
 "aed": 192019913018.4369,
 "ars": 8006931417143.842,
 "aud": 83462677299.47807,
 "bdt": 5541765407104.618,
 "bhd": 19709382189.087353,
 "bmd": 52278696331.324585,
 "brl": 275524465553.6761,
 "cad": 71947510252.05882,
 "chf": 52531150155.90856,
 "clp": 50929905965976.39,
 "cny": 378105671216.30396,
 "czk": 1311724769649.2644,
 "dkk": 397566677319.1225,
 "eur": 53441479095.12581,
 "gbp": 46603739287.166595,
 "hkd": 410321842764.8239,
 "huf": 22067660535853.656,
 "idr": 814309294576969.6,
 "ils": 184928830648.0561,
 "inr": 4346557984313.8076,
 "jpy": 7838718630639.843,
 "krw": 74788775058719.73,
 "kwd": 16241422589.25262,
 "lkr": 19141522520387.695,
 "mmk": 109980669816043.58,
 "mxn": 1052362315345.1138,
 "myr": 247110941818.90506,
 "ngn": 22858754890692.055,
 "nok": 553581363436.3387,
 "nzd": 92435060836.03796,
 "php": 3083894157236.684,
 "pkr": 11561090640867.1,
 "pln": 256854697519.83356,
 "rub": 3229516831818.461,
 "sar": 196499465392.2827,
 "sek": 585780335293.764,
 "sgd": 74520981357.66466,
 "thb": 1994196069890.008,
 "try": 971976814390.3956,
 "twd": 1676917602871.7322,
 "uah": 1934224197442.6545,
 "vef": 5234665863.655538,
 "vnd": 1282441674701626,
 "zar": 956675258203.7861,
 "xdr": 39083187426.42403,
 "xag": 2831922342.23287,
 "xau": 32037953.472725745,
 "bits": 2731399707724.3765,
 "sats": 273139970772437.66
 },
 "market_cap_percentage": {
 "btc": 38.39263966380989,
 "eth": 16.304399551331368,
 "usdt": 7.159399560809156,
 "usdc": 4.647828298460379,
 "bnb": 4.637593057116158,
 "xrp": 2.4057924523810392,
 "busd": 2.2706408864303294,
 "ada": 1.2562464098874295,
 "sol": 1.095420750681882,
 "doge": 0.8541998315853475
 },
 "market_cap_change_percentage_24h_usd": -0.6365175423603191,
 "updated_at": 1666245416
 }
 }
 */

struct GlobalData: Codable {
	let data: MarketDataModel?
}

struct MarketDataModel: Codable {
	let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
	let marketCapChangePercentage24HUsd: Double
	
	enum CodingKeys: String, CodingKey {
		case totalMarketCap = "total_market_cap"
		case totalVolume = "total_volume"
		case marketCapPercentage = "market_cap_percentage"
		case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
	}
	
	var marketCap: String {
		if let item = totalMarketCap.first(where: { $0.key == "usd" }) {
			return "$" + item.value.formattedWithAbbreviations()
		}
		return ""
	}
	
	var volume: String {
		if let item = totalVolume.first(where: { $0.key == "usd" }) {
			return "$" + item.value.formattedWithAbbreviations()
		}
		return ""
	}
	
	var btcDominance: String {
		if let item = marketCapPercentage.first(where: { $0.key == "btc" }) {
			return item.value.asPercentString()
		}
		return ""
	}
}

