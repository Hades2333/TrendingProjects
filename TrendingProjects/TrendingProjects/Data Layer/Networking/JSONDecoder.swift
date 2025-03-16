//
//  JSONDecoder.swift
//  CurrencyConverter
//
//  Created by Mikalai Bekliamishchau on 16/03/2025.
//

import Foundation

extension JSONDecoder {
    func decode<T: Decodable>(from data: Data) throws -> T {
        do {
            return try self.decode(T.self, from: data)
        } catch let DecodingError.dataCorrupted(context) {
            print(context)
            throw NetworkDataLayerError.decoding(DecodingError.dataCorrupted(context))
        } catch let DecodingError.keyNotFound(key, context) {
            print("Key '\(key)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
            throw NetworkDataLayerError.decoding(DecodingError.keyNotFound(key, context))
        } catch let DecodingError.valueNotFound(value, context) {
            print("Value '\(value)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
            throw NetworkDataLayerError.decoding(DecodingError.valueNotFound(value, context))
        } catch let DecodingError.typeMismatch(type, context) {
            print("Type '\(type)' mismatch:", context.debugDescription)
            print("codingPath:", context.codingPath)
            throw NetworkDataLayerError.decoding(DecodingError.typeMismatch(type, context))
        } catch {
            print("error: ", error)
            throw NetworkDataLayerError.decoding(error)
        }
    }
}
