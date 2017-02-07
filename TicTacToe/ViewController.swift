//
//  ViewController.swift
//  TicTacToe
//
//  Created by Jim Campagno on 2/5/17.
//  Copyright © 2017 Jim Campagno. All rights reserved.
//

import UIKit

class ViewController: UIViewController, BoardDelegate {
    
    @IBOutlet weak var boardZero: Board!
    @IBOutlet weak var boardOne: Board!
    @IBOutlet weak var boardTwo: Board!
    
    @IBOutlet weak var boardThree: Board!
    @IBOutlet weak var boardFour: Board!
    @IBOutlet weak var boardFive: Board!
    
    @IBOutlet weak var boardSix: Board!
    @IBOutlet weak var boardSeven: Board!
    @IBOutlet weak var boardEight: Board!
    
    var allBoards: [Board] {
        return [boardZero, boardOne, boardTwo, boardThree, boardFour, boardFive, boardSix, boardSeven, boardEight]
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    func initialSetup() { //sets up each board with a .position property equal to their numbered name
        var boardPosition = 0
        for board in allBoards {
            board.position = boardPosition
            board.delegate = self
            //board.makeGame()
            boardPosition += 1
        }
    }
    
    func playerTurn(board: Board, position: Int) -> Player {
        //board.setSquare(myLocation: position, myPlayer: .x )
        
        return board.game.setSquare(myLocation: position)
        
        
        
    }
}
