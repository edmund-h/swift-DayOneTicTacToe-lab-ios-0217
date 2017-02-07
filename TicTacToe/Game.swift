//
//  game.swift
//  TicTacToe
//
//  Created by Edmund Holderbaum on 2/6/17.
//  Copyright © 2017 Jim Campagno. All rights reserved.
//

import Foundation
// my first thought was to use a class so that I have all the variables and functions available in the same place.
class Game {
    var locations : [String] = [ "","","","","","","","","" ]
    var hasBeenWon : Bool
    var playerHasMoved : Bool
    var lastMove : Int
    //let myGame: Game
    //var myBoard: Board! //assigns the game to a certain board
    
    convenience init(locationsIn : [String]) { //for checking win condition
        self.init()
        self.locations = locationsIn
    }
    
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
    
    func checkWin () -> Player?{     //when i code i think about how a human looks at things i asked myself...
        let refSet = ["xxx","ooo"]  //what does a tic tac toe win look like? it's three x or three o in a row
        let winSets = [            //so i have the locations of all possible wins coded in:
            locations [0] + locations [1] + locations [2],//horizontal
            locations [3] + locations [4] + locations [5],
            locations [6] + locations [7] + locations [8],
            locations [0] + locations [3] + locations [6],//vertical
            locations [1] + locations [4] + locations [7],
            locations [2] + locations [5] + locations [8],
            locations [0] + locations [4] + locations [8],//diagonal
            locations [2] + locations [4] + locations [6]
        ]
        if winSets.contains(refSet[0]) {return .x} //then check to see if they look like a win
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

