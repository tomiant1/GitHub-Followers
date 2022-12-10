//
//  ErrorMessage.swift
//  GitHub Followers
//
//  Created by Tomi Antoljak on 12/6/22.
//

import Foundation

enum ErrorCase: String, Error {
    
    case invalidUsername = "Invalid username. Please try again."
    case unableToComplete = "Please check your internet connection and try again."
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "The data received from the server was invalid. Please try again."
    case unableToFavorite = "Error saving user as a favorite."
    case alreadyInFavorites = "User is already in favorites."
    
}
