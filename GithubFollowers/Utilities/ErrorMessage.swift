//
//  ErrorMessage.swift
//  GithubFollowers
//
//  Created by Neddy Ksenia Gonzalez Siles on 12/1/24.
//

import Foundation

/* associated value = each case in the enum has a type
vs. raw value = the whole enum hasa type */
enum ErrorMessage: String {
    case invalidUsername = "This username created an invalid request. Please try again."
    case unableToComplete = "Unable to complete your request. Please check your internet connection."
    case invalidResponse = "Invalid response from server. Please try again."
    case invalidData = "The data received from the server was invalid. Please try again."
}
