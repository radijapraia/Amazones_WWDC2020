import SpriteKit

let questions = [
    "q1": girias["Morreu de colar"]?.enName,
    "q2": girias["Cortando"]?.enName,
    "q3": girias["Brocado"]?.enName,
    "q4": girias["Só de bubuia"]?.enName,
    "q5": girias["Pega tua merenda"]?.enName,
    "q6": girias["Caixa prego"]?.enName,
    "q7": girias["Chibata no balde"]?.enName,
    "q8": girias["Pai dégua"]?.enName
]

func getAnswers() -> [String]{
    var answers: [String] = []
    for (key, g) in girias {
        answers.append(g.enName.joined(separator: " "))
    }
    let shuffledAnswers = answers.shuffled()
    return (shuffledAnswers)
}


class MatchPhrasesScene : SKScene {
    
    override func sceneDidLoad() {
        self.anchorPoint = .init(x: 0.5, y: 0.5)
        self.scaleMode = .aspectFill
        
        let answersLabels: [String] = getAnswers()
        
        
//          
//          let expression1 = addExpression(text: "expessão 1",
//                                          position: .init(x: 0, y: 50))
//          expression1.name = "exp1"
//          
//          let expression2 = addExpression(text: "expessão 2",
//                                          position: .init(x: 0, y: 20))
//          expression2.name = "exp2"
//          
//          let expression3 = addExpression(text: "expessão 3",
//                                          position: .init(x: 0, y: -10))
//          expression3.name = "exp3"
//          
//          let phrase = addExpression(text: "Phrase", position: .init(x: 0, y: -60))
//          
//          self.addChild(expression1)
//          self.addChild(expression2)
//          self.addChild(expression3)
//          self.addChild(phrase)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let node : SKNode = self.atPoint(location)
            
            if (node.name == "exp1") {
                print("abc")
            }
            
            if (node.name == "exp2") {
                print("def")
            }
            
            if (node.name == "exp3") {
                print("ghi")
            }
        }
    }
}
