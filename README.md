# MarvelKit

A Swift SDK for working with the https://developer.marvel.com/ API.

## Usage

    let client = MarvelKit(privateKey: "abcd", publicKey: "1234")
    
    func performRequest() {
        client
            .request(Comic.self)
            .withParameters([.DateRange(NSDate(timeIntervalSinceReferenceDate: 0), NSDate()), .Limit(2)])
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
