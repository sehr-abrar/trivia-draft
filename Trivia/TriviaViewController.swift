import UIKit

struct Question {
    let prompt: String
    let choices: [String]
    let answerIndex: Int
}

class TriviaViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var answerButton3: UIButton!
    @IBOutlet weak var answerButton4: UIButton!
    @IBOutlet weak var restartButton: UIButton!

    let questions: [Question] = [
        Question(prompt: "What's the capital of France?", choices: ["Berlin", "Madrid", "Paris", "Rome"], answerIndex: 2),
        Question(prompt: "Which planet is known as the Red Planet?", choices: ["Earth", "Mars", "Jupiter", "Venus"], answerIndex: 1),
        Question(prompt: "Who wrote 'Hamlet'?", choices: ["Shakespeare", "Homer", "Tolkien", "Dickens"], answerIndex: 0),
    ]

    var currentQuestionIndex = 0
    var correctAnswersCount = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        displayQuestion()
    }

    func displayQuestion() {
        let currentQuestion = questions[currentQuestionIndex]
        questionLabel.text = currentQuestion.prompt
        answerButton1.setTitle(currentQuestion.choices[0], for: .normal)
        answerButton2.setTitle(currentQuestion.choices[1], for: .normal)
        answerButton3.setTitle(currentQuestion.choices[2], for: .normal)
        answerButton4.setTitle(currentQuestion.choices[3], for: .normal)

        progressLabel.text = "Question \(currentQuestionIndex + 1) of \(questions.count)"

        answerButton1.isHidden = false
        answerButton2.isHidden = false
        answerButton3.isHidden = false
        answerButton4.isHidden = false
        restartButton.isHidden = true
    }

    @IBAction func answerTapped(_ sender: UIButton) {
        let currentQuestion = questions[currentQuestionIndex]

        if sender.currentTitle == currentQuestion.choices[currentQuestion.answerIndex] {
            print("Correct!")
            correctAnswersCount += 1
        } else {
            print("Wrong!")
        }

        currentQuestionIndex += 1

        if currentQuestionIndex < questions.count {
            displayQuestion()
        } else {
            questionLabel.text = "Game Over! You got \(correctAnswersCount) out of \(questions.count) correct."
            progressLabel.text = ""

            answerButton1.isHidden = true
            answerButton2.isHidden = true
            answerButton3.isHidden = true
            answerButton4.isHidden = true
            restartButton.isHidden = false
        }
    }

    @IBAction func restartTapped(_ sender: UIButton) {
        currentQuestionIndex = 0
        correctAnswersCount = 0
        displayQuestion()
    }
}
