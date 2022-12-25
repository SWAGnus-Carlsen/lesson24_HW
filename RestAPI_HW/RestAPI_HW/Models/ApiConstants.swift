//
//  ApiConstants.swift
//  RestAPICW
//
//  Created by Martynov Evgeny on 22.12.22.
//

import Foundation

class ApiConstants {
    // Remote server
    static let remoteServerPath = "https://jsonplaceholder.typicode.com/"
    
    // Local server
    static let localServerPath = "http://localhost:3000/"
    
    //users
    static let usersPath = localServerPath + "users"
    static let usersPathURL = URL(string: usersPath)
    
    // posts
    static let postsPath = localServerPath + "posts"
    static let postsPathURL = URL(string: postsPath)
    
    // comments
    static let commentsPath = localServerPath + "comments"
    static let commentsPathURL = URL(string: commentsPath)
    
    // albums
    static let albumsPath = localServerPath + "albums"
    static let albumsPathURL = URL(string: albumsPath)
    
    // photos
    static let photosPath = localServerPath + "photos"
    static let photosPathURL = URL(string: photosPath)
    
    //todos
    static let todosPath = localServerPath + "todos"
    static let todosPathURL = URL(string: todosPath)
}
