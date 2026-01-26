//
//  CameraPermission.swift
//  Read+Practice
//
//  Created by Kari Douglas on 1/26/26.
//

import UIKit
import AVFoundation

enum CameraPermission {
    enum CameraError: Error, LocalizedError {
        case unauthorized
        case unavailable
        
        
        var errorDescription: String? {
            switch self {
            case .unauthorized:
                return NSLocalizedString("You have not authorized camera use", comment: "")
            case .unavailable:
                return NSLocalizedString("A camera is not available for this device", comment: "")
            }
        }
        
        var recoverSuggestion: String? {
            switch self {
            case .unauthorized:
                return "Go to Settings -> Privacy and Security -> Camera and turn on for this app"
                
            case .unavailable:
                return "Use a picture from the photo album instead."
            }
        }
        
        static func checkPermission() -> CameraError? {
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                let authStatus = AVCaptureDevice.authorizationStatus(
                    for: AVMediaType
                        .video)
                switch authStatus {
                case .notDetermined:
                    return nil
                case .restricted:
                    return nil
                case .denied:
                    return .unauthorized
                case .authorized:
                    return nil
                @unknown default:
                    return nil 
                }
            } else {
                return .unavailable
            }
        }
    }
}
