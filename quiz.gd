extends Control

# Array of questions and answers
var questions = [
	{"question": "When was the first hero Abu Sayed killed?", "answer": 0, "options": ["16th July", "17th July", "18th July", "19th July"]},
	{"question": "How many siblings to Mugdho vai has?", "answer": 1, "options": ["1", "2", "3", "4"]},
	{"question": "Who gave the famous dialogue\"Net eka ekai bondho hoye geche\" ", "answer": 0, "options": ["Polok", "Hasina", "Murad", "Saddam"]},
	{"question": "From which institution is martyr Farhan Faiyaz?", "answer": 0, "options": ["DRMC", "RUMC", "DU", "Milestone"]},
	{"question": "Lakho sohider rokte kina, desh ta ____ na?", "answer": 3, "options": ["Hasinar", "Gunda bahinir", "dalaler", "karo baper"]},
	{"question": "What is the name of the place now where Abu Sayed was killed?", "answer": 2, "options": ["Bir Chottor", "Sadhinota Chottor", "Abu Sayed Chottor", "NOne of these"]},
	{"question": "How many points there were there in \"LONG MARCH TO DHAKA?", "answer": 0, "options": ["1", "2", "3", "4"]},
	{"question": "Which party introduced quota system in Bangladesh?", "answer": 2, "options": ["Muslim Party", "Jatiyo Party", "BAL", "BNP"]},
	{"question": "From where quota movement started in 2024?", "answer": 1, "options": ["JU", "DU", "RUET", "RU"]},
	{"question": "When Bangladesh became independent once again in 2024?", "answer": 1, "options": ["25th July", "33rd july", "29th July", "36th July"]},
]

#var questions = [
	#{"question": "When was the first hero Abu Sayed killed?", "answer": 0, "options": ["16th July", "17th July", "18th July", "19th July"]},
	##{"question": "When Bangladesh became independent once again in 2024?", "answer": 1, "options": ["25th July", "33rd july", "29th July", "36th July"]},
#]


var current_question_index = 0
var score = 0
var time = 0
var time_running = true



@onready var question_label = $QuestionLabel
@onready var option_button_1 = $OptionButton1
@onready var option_button_2 = $OptionButton2
@onready var option_button_3 = $OptionButton3
@onready var option_button_4 = $OptionButton4
@onready var score_label = $ScoreLabel
@onready var feedback_label = $FeedbackLabel
@onready var final_score = $FinalScore
@onready var timer = $TimerLabel

func _process(delta: float) -> void:
	if(time_running):
		time += delta
	timer.text = "Time: " + str(floor(time))
	


func _ready():
	# Connect the button signals
	option_button_1.connect("pressed", func(): _on_option_button_pressed(0))
	option_button_2.connect("pressed", func(): _on_option_button_pressed(1))
	option_button_3.connect("pressed", func(): _on_option_button_pressed(2))
	option_button_4.connect("pressed", func(): _on_option_button_pressed(3))
	
	# Display the first question
	show_question()

func show_question():
	# Update the question label with the current question
	question_label.text = questions[current_question_index]["question"]

	# Get the options for the current question and shuffle them
	var options = questions[current_question_index]["options"]


	# Assign the shuffled options to the buttons
	option_button_1.text =  options[0]
	option_button_2.text =  options[1]
	option_button_3.text =  options[2]
	option_button_4.text =  options[3]
	
	score_label.text = "Score: " + str(score)

func _on_option_button_pressed(selected_index):
	# Get the selected answer text
	var selected_answer = selected_index
	var correct_answer = questions[current_question_index]["answer"]

	if selected_answer == correct_answer:
		feedback_label.text = "Correct!"
		score += 1
	else:
		feedback_label.text = "Incorrect! Correct Answer: " + questions[current_question_index]["options"][correct_answer]


	
	# Move to the next question, or end the quiz if it’s the last one
	current_question_index += 1
	if current_question_index < questions.size():
		disable_all_buttons()
		await get_tree().create_timer(1.0).timeout
		enable_all_buttons()
		feedback_label.text = ""
		show_question()
	else:
		game_over()
		
func game_over():
	time_running = false
	question_label.text = "Quiz Complete!"
	disable_all_buttons()
	question_label.visible = false
		
	final_score.text = "Final Score: " + str(score) + "\nTime taken: " + str(floor(time)) + " seconds"
	final_score.visible = true
	option_button_1.visible = false
	option_button_2.visible = false
	option_button_3.visible = false
	option_button_4.visible = false
	feedback_label.visible = false
	
	await get_tree().create_timer(5).timeout
	get_tree().change_scene_to_file("res://Play.tscn")

func disable_all_buttons():
	# Disable all option buttons after the quiz is complete
	option_button_1.disabled = true
	option_button_2.disabled = true
	option_button_3.disabled = true
	option_button_4.disabled = true
	
func enable_all_buttons():
	# Disable all option buttons after the quiz is complete
	option_button_1.disabled = false
	option_button_2.disabled = false
	option_button_3.disabled = false
	option_button_4.disabled = false
	
