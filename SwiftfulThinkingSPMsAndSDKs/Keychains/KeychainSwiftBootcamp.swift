//
//  KeychainSwiftBootcamp.swift
//  SwiftfulThinkingSPMsAndSDKs
//
//  Created by Artur Remizov on 13.05.24.
//

import SwiftUI
import KeychainSwift

final class KeychainManager {
    private let keychain: KeychainSwift
    init(synchronizable: Bool = true) {
        keychain = KeychainSwift()
        keychain.synchronizable = synchronizable
    }
    
    func set(_ value: String, forKey key: String) {
        keychain.set(value, forKey: key)
    }
    
    func delete(_ key: String) {
        keychain.delete(key)
    }
    
    func get(_ key: String) -> String? {
        keychain.get(key)
    }
}

@propertyWrapper
struct KeychainStorage: DynamicProperty {
    
    @State private var newValue: String?
    let key: String
    
    var wrappedValue: String? {
        get {
            newValue
        }
        nonmutating set {
            save(newValue)
            self.newValue = newValue
        }
    }
    
    var projectedValue: Binding<String?> {
        Binding {
            wrappedValue
        } set: { newValue in
            wrappedValue = newValue
        }

    }
    
    private let keychain = KeychainManager()
    
    init(wrappedValue: String?, _ key: String, keychain: KeychainManager = .init()) {
        self.newValue = keychain.get(key) ?? ""
        self.key = key
    }
    
    private func save(_ value: String?) {
        guard let value else {
            keychain.delete(key)
            return
        }
        keychain.set(value, forKey: key)
    }
}

struct KeychainSwiftBootcamp: View {
    
//    private let keychain = KeychainManager()
//    @State private var userPassword: String? = nil
    @KeychainStorage("user_password") var userPassword: String? = nil
    
    var body: some View {
        Button(userPassword ?? "No password") {
//            let newPassword = "def123"
//            keychain.set(newPassword, forKey: "user_password")
//            userPassword = newPassword
            userPassword = "abc123"
        }
//        .onAppear {
//            userPassword = keychain.get("user_password")
//        }
    }
}

#Preview {
    KeychainSwiftBootcamp()
}
