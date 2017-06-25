# MarvelKit

[![Swift 3](https://img.shields.io/badge/Swift-3.0-orange.svg?style=flat)](https://swift.org)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Build Status](https://travis-ci.org/cargath/MarvelKit.svg?branch=master)](https://travis-ci.org/cargath/MarvelKit)

A Swift SDK for working with the https://developer.marvel.com/ API.

## Usage

    let marvelKitClient = MarvelKitClient(privateKey: "abcd", publicKey: "1234")
    
    let request = marvelKitClient
        .request(MarvelKit.Comic)
        .withParameters([.dateRange(Date(timeIntervalSinceReferenceDate: 0), Date()), .limit(2)])
        
    let task = URLSession.shared.resourceTask(with: request, success: { comicDataWrapper in
        print(comicDataWrapper)
    }, error: { error in
        print(error.description)
    })
        
    task.resume()

## Attribution

Data provided by Marvel. © 2014 Marvel.
