//
//  AppDelegate.swift
//  AWSServer
//
//  Created by 신효근 on 2020/07/31.
//  Copyright © 2020 신효근. All rights reserved.
//

import UIKit
import Amplify
import AmplifyPlugins

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        do {
            try Amplify.add(plugin: AWSAPIPlugin(modelRegistration: AmplifyModels()))
            try Amplify.configure()
            print("Amplify configured with API plugin")
        } catch {
            print("Failed to initialize Amplify with \(error)")
        }
        createTodo()
        return true
    }

    func createTodo() {
        let todo = Todo(name: "my first todo", description: "todo description")
        _ = Amplify.API.mutate(request: .create(todo)) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let todo):
                    print("Successfully created the todo: \(todo)")
                case .failure(let graphQLError):
                    print("Failed to create graphql \(graphQLError)")
                }
            case .failure(let apiError):
                print("Failed to create a todo", apiError)
            }
        }
    }
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

