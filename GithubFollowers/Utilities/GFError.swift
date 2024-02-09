//
//  GFError.swift
//  GithubFollowers
//
//  Created by Neddy Ksenia Gonzalez Siles on 30/1/24.
//

import Foundation

/* associated value = each case in the enum has a type
vs. raw value = the whole enum hasa type */
enum GFError: String, Error {
    case invalidUsername = "This username created an invalid request. Please try again."
    case unableToComplete = "Unable to complete your request. Please check your internet connection."
    case invalidResponse = "Invalid response from server. Please try again."
    case invalidData = "The data received from the server was invalid. Please try again."
    case unableToFavorite = "There was an error adding this user to favorites. Please try again."
    case alreadyInFavorites = "This user is already in your favorites!"
}
