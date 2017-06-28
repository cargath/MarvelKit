//
//  Image.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 28.04.16.
//  Copyright © 2016 cargath. All rights reserved.
//

// MARK: - Image

public struct Image: Codable {

    /// The directory path of to the image.
    public let path: String?

    /// The file extension for the image.
    /// Actually 'extension', which is a keyword in Swift.
    public let `extension`: String?

}

// MARK: - Image + Size

extension Image {
    
    public enum Size: String {
        
        /// 50 x 75px
        case portraitSmall = "portrait_small"
        /// 100 x 150px
        case portraitMedium = "portrait_medium"
        /// 150 x 225px
        case portraitXLarge = "portrait_xlarge"
        /// 168 x 252px
        case portraitFantastic = "portrait_fantastic"
        /// 216 x 324px
        case portraitIncredible = "portrait_incredible"
        /// 300 x 450px
        case portraitUncanny = "portrait_uncanny"
        
        /// 65 x 45px
        case standardSmall = "standard_small"
        /// 100 x 100px
        case standardMedium = "standard_medium"
        /// 140 x 140px
        case standardLarge = "standard_large"
        /// 180 x 180px
        case standardAmazing = "standard_amazing"
        /// 200 x 200px
        case standardXLarge = "standard_xlarge"
        /// 250 x 250px
        case standardFantastic = "standard_fantastic"
        
        /// 120 x 90px
        case landscapeSmall = "landscape_small"
        /// 175 x 130px
        case landscapeMedium = "landscape_medium"
        /// 190 x 140px
        case landscapeLarge = "landscape_large"
        /// 250 x 156px
        case landscapeAmazing = "landscape_amazing"
        /// 270 x 200px
        case landscapeXLarge = "landscape_xlarge"
        /// 464 x 261px
        case landscapeIncredible = "landscape_incredible"
        
        /// full image, constrained to 500px wide
        case detail = "detail"
    }
    
    /// Image Representations and Pathing
    /// =================================
    ///
    /// The Marvel Comics API does not provide full paths to images.
    /// Instead, images are represented as a partial path to an image file and the canonical extension of that file.
    /// Developers may select from a set of image variants (predefined sizes and ratios)
    /// in order to best serve the presentation of their web site or application.
    ///
    /// To build a full image path from an image representation
    ///
    /// 1. Take the "path" element from the image representation
    /// 2. Append a variant name to the path element
    /// 3. Append the "extension" element to the variant name
    ///
    /// For example, to display the image represented here:
    ///
    ///     "thumbnail": {
    ///         "path": "http://i.annihil.us/u/prod/marvel/i/mg/3/40/4bb4680432f73",
    ///         "extension": "jpg"
    ///     }
    ///
    /// 1. Take the path element: `http://i.annihil.us/u/prod/marvel/i/mg/3/40/4bb4680432f73`
    /// 2. Select an image variant name (see the full list below) and append the variant name to the path element: `http://i.annihil.us/u/prod/marvel/i/mg/3/40/4bb4680432f73/portrait_xlarge`
    /// 3. Append the extension: `http://i.annihil.us/u/prod/marvel/i/mg/3/40/4bb4680432f73/portrait_xlarge.jpg`
    /// 4. In order to make your web site or application load and respond quickly and preserve end-user bandwidth, we recommend using the smallest-sized image necessary to meet the needs our user interface.
    public func urlString(size: Size? = nil) -> String? {
        
        guard let path = self.path,
              let `extension` = self.`extension` else {
                
            return nil
        }
        
        if let size = size {
            return "\(path)/\(size.rawValue).\(`extension`)"
        }
        
        return "\(path).\(`extension`)"
    }
    
}
