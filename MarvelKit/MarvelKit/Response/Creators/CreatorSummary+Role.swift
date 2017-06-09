//
//  CreatorSummary+Role.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 09.06.2017.
//  Copyright © 2017 cargath. All rights reserved.
//

// MARK: - CreatorSummary + Role

extension CreatorSummary {
    
    enum Role {
        
        case writer
        case letterer
        case editor
        case colorist
        case coloristCover
        case inker
        case inkerCover
        case painterCover
        case penciler
        case pencilerCover
        case unknown
        
        init(role: String) {
            switch role.lowercased() {
                case "writer":
                    self = .writer
                case "letterer":
                    self = .letterer
                case "editor":
                    self = .editor
                case "colorist":
                    self = .colorist
                case "colorist (cover)":
                    self = .coloristCover
                case "inker":
                    self = .inker
                case "inker (cover)":
                    self = .inkerCover
                case "painter (cover)":
                    self = .painterCover
                case "penciler", "penciller":
                    self = .penciler
                case "penciler (cover)", "penciller (cover)":
                    self = .pencilerCover
                default:
                    self = .unknown
            }
        }
        
    }
    
    var roleEnum: Role {
        
        if let role = self.role {
            return Role(role: role)
        }
        
        return .unknown
    }
    
}

// MARK: - Comic + CreatorSummary.Role

extension Comic {
    
    func name(for role: CreatorSummary.Role) -> String? {
        
        var name: String? = nil
        
        for creatorSummary in creators?.items ?? [] {
            if creatorSummary.roleEnum == role {
                name = creatorSummary.name
                break
            }
        }
        
        return name
    }
    
    public var writer: String? {
        return name(for: .writer)
    }
    
    public var letterer: String? {
        return name(for: .letterer)
    }
    
    public var editor: String? {
        return name(for: .editor)
    }
    
    public var colorist: String? {
        return name(for: .colorist)
    }
    
    public var coloristCover: String? {
        return name(for: .coloristCover)
    }
    
    public var inker: String? {
        return name(for: .inker)
    }
    
    public var inkerCover: String? {
        return name(for: .inkerCover)
    }
    
    public var painterCover: String? {
        return name(for: .painterCover)
    }
    
    public var penciler: String? {
        return name(for: .penciler)
    }
    
    public var pencilerCover: String? {
        return name(for: .pencilerCover)
    }
    
}
