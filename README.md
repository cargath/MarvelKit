# MarvelKit

[![Swift 3](https://img.shields.io/badge/Swift-3.0-orange.svg?style=flat)](https://swift.org)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

A Swift SDK for working with the https://developer.marvel.com/ API.

## Usage

    let marvelKitClient = MarvelKitClient(privateKey: "abcd", publicKey: "1234")
    
    func performRequest() {
        marvelKitClient
            .request(MarvelKit.Comic)
            .withParameters([.dateRange(Date(timeIntervalSinceReferenceDate: 0), Date()), .limit(2)])
            .exec(success: onSuccess, error: onError)
    }

    func onSuccess(comicDataWrapper: ComicDataWrapper) {
        print(comicDataWrapper)
    }

    func onError(error: MarvelKitError) {
        print(error.description)
    }

## Acknowledgements

I'm using the MD5 related bits from https://github.com/krzyzanowskim/CryptoSwift by Marcin Krzyżanowski until CommonCrypto works better with Swift. I could have used a Wrapper framework, but i didn't want to introduce a dependency and thought this was a great opportunity to see how MD5 is implemented.
