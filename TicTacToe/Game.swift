//
//  game.swift
//  TicTacToe
//
//  Created by Edmund Holderbaum on 2/6/17.
//  Copyright © 2017 Jim Campagno. All rights reserved.
//

import Foundation

class Game {
    var locations : [String] = [ "","","","","","","","","" ]
    var hasBeenWon : Bool
    var playerHasMoved : Bool
    var lastMove : Int
    //let myGame: Game
    //var myBoard: Board! //assigns the game to a certain board
    
    init() { // this is called by Board on init
        playerHasMoved = false
        hasBeenWon = false
        lastMove = 999
    }
    
    func setSquare (myLocation: Int)->Player{
        switch playerHasMoved {
        case false:
            /*if locations [myLocation] == 2 {
                return .o
            } else if locations [myLocation] == 1 {
                return .x
            }*/
            locations [myLocation] = "x"
            playerHasMoved = true
            lastMove = myLocation
            debugLocations()
            return .x
        default:
            let myMove = myLocation//aiMove()
            locations[myMove] = "o"
            playerHasMoved = false
            lastMove = myMove
            debugLocations()
            return .o
        }//1 is X, 2 is O --> These do not refer to player order
    }
    
    func aiMove () -> Int {
        let myMove = Int ( arc4random_uniform(8) )
        if locations[myMove] != "" {
            return aiMove()
        }
        return myMove // returns random nonoccupied for now
    }
    
    func checkWin () -> Player?{
        let refSet = ["xxx","ooo"]
        let winSets = [
            locations [0] + locations [1] + locations [2],
            locations [3] + locations [4] + locations [5],
            locations [6] + locations [7] + locations [8],
            locations [0] + locations [3] + locations [6],
            locations [1] + locations [4] + locations [7],
            locations [2] + locations [5] + locations [8],
            locations [0] + locations [4] + locations [8],
            locations [2] + locations [4] + locations [6]
        ]
        if winSets.contains(refSet[0]) {return .x}
        if winSets.contains(refSet[1]) {return .o}
        return nil
    }
    func debugLocations () {
        var output : [String] = []
        for loc in locations {
            output.append (loc)
        }
        print (output)
        print (lastMove)
    }
}

