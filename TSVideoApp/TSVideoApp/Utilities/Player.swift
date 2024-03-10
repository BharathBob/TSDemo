//
//  Player.swift
//  TSVideoApp
//
//  Created by Viswa bharath on 10/03/24.
//

import Foundation
import AVKit
import SwiftUI

struct AVPlayerView: UIViewControllerRepresentable {
    var player: AVPlayer

    class Coordinator: NSObject {
        var parent: AVPlayerView

        init(parent: AVPlayerView) {
            self.parent = parent
        }

        @objc func playerDidFinishPlaying(note: NSNotification) {
            // Handle player finish, if needed
        }
    }

    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = UIViewController()
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        viewController.addChild(playerViewController)
        viewController.view.addSubview(playerViewController.view)
        playerViewController.didMove(toParent: viewController)

        // Add observer for player finish event
        NotificationCenter.default.addObserver(
            context.coordinator,
            selector: #selector(Coordinator.playerDidFinishPlaying(note:)),
            name: .AVPlayerItemDidPlayToEndTime,
            object: player.currentItem
        )
        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // Update any configurations if needed
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
}
