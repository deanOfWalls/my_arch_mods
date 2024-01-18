#!/bin/bash

# ANSI color codes
HOT_PINK="\033[1;95m"
YELLOW="\033[1;33m"
NC="\033[0m" # No Color

# Function to calculate BMR based on gender
calculate_bmr() {
    local gender=$1
    local weight_kg=$(echo "$2 * 0.453592" | bc)
    local height_cm=$(echo "($3 * 12 + $4) * 2.54" | bc)
    local age=$5
    if [ "$gender" == "Male" ]; then
        echo "scale=2; 10 * $weight_kg + 6.25 * $height_cm - 5 * $age + 5" | bc
    else
        echo "scale=2; 10 * $weight_kg + 6.25 * $height_cm - 5 * $age - 161" | bc
    fi
}

# Function to calculate TDEE (assuming sedentary activity level) and round to nearest whole number
calculate_tdee() {
    local bmr=$1
    echo "scale=2; $bmr * 1.2" | bc | xargs printf "%.0f"
}

# Function to calculate daily caloric needs for weight loss and round to nearest whole number
calculate_calories_for_weight_loss() {
    local tdee=$1
    echo "scale=2; $tdee - 500" | bc | xargs printf "%.0f"
}

# Function to calculate BMI and return classification
calculate_bmi_and_classify() {
    local weight_kg=$(echo "$1 * 0.453592" | bc)
    local height_m=$(echo "($2 * 12 + $3) * 0.0254" | bc)
    local bmi=$(echo "scale=2; $weight_kg / ($height_m * $height_m)" | bc)

    # BMI classification
    local classification
    if (( $(echo "$bmi < 18.5" | bc -l) )); then
        classification="Underweight"
    elif (( $(echo "$bmi >= 18.5 && $bmi < 25" | bc -l) )); then
        classification="Normal"
    elif (( $(echo "$bmi >= 25 && $bmi < 30" | bc -l) )); then
        classification="Overweight"
    else
        classification="Obese"
    fi

    echo "$bmi ($classification)"
}

# Main program
read -p "Enter your gender (Male/Female): " gender
read -p "Enter your age: " age
read -p "Enter your height (foot inches, e.g., 5 10): " height_ft height_in
read -p "Enter your weight in lbs: " weight
read -p "Enter your goal weight in lbs: " goal_weight

# Calculate initial BMR, TDEE, and caloric needs
bmr=$(calculate_bmr "$gender" $weight $height_ft $height_in $age)
tdee=$(calculate_tdee $bmr)
calories=$(calculate_calories_for_weight_loss $tdee)
initial_bmi=$(calculate_bmi_and_classify $weight $height_ft $height_in)

# Display initial information
echo -e "${YELLOW}You are a $gender${NC}"
echo -e "${YELLOW}You are ${HOT_PINK}$age${NC} ${YELLOW}years old${NC}"
echo -e "${YELLOW}You are ${HOT_PINK}$height_ft${NC} ${YELLOW}feet ${HOT_PINK}$height_in${NC} ${YELLOW}inches in height${NC}"
echo -e "${YELLOW}Initial BMI: ${HOT_PINK}$initial_bmi${NC}"
echo -e "${YELLOW}Your TDEE is ${HOT_PINK}$tdee${NC}"
echo -e "${YELLOW}The deficit you should use is ${HOT_PINK}500${NC}"
echo -e "${YELLOW}Your daily caloric intake should be ${HOT_PINK}$calories${NC}"
echo -e "${YELLOW}Your goal weight is ${HOT_PINK}$goal_weight${NC}"

# Loop for weekly updates
current_day=1
current_weight=$weight
weeks_left=$(echo "($current_weight - $goal_weight) / (500 * 7 / 3500)" | bc)

echo -e "${YELLOW}Estimated weeks left until goal weight: ${HOT_PINK}$weeks_left${NC}"

while [ $(echo "$current_weight > $goal_weight" | bc) -eq 1 ]; do
    # Recalculate BMR, TDEE, and caloric needs with updated weight
    bmr=$(calculate_bmr "$gender" $current_weight $height_ft $height_in $age)
    tdee=$(calculate_tdee $bmr)
    calories=$(calculate_calories_for_weight_loss $tdee)
    current_bmi=$(calculate_bmi_and_classify $current_weight $height_ft $height_in)

    # Display weekly update
    echo -e "\nWeek $current_day."
    echo -e "${YELLOW}TDEE: ${HOT_PINK}$tdee${NC}"
    echo -e "${YELLOW}Deficit number: ${HOT_PINK}500${NC}"
    echo -e "${YELLOW}Daily caloric intake to reach goal weight: ${HOT_PINK}$calories${NC}"
    echo -e "${YELLOW}Current weight: ${HOT_PINK}$current_weight${NC}"
    echo -e "${YELLOW}Goal weight: ${HOT_PINK}$goal_weight${NC}"
    echo -e "${YELLOW}Current BMI: ${HOT_PINK}$current_bmi${NC}"
    echo -e "${YELLOW}Estimated weeks left until goal weight: ${HOT_PINK}$(echo "($current_weight - $goal_weight) / (500 * 7 / 3500)" | bc)${NC}"

    # Update for next iteration
    current_weight=$(echo "$current_weight - (500 * 7 / 3500)" | bc)
    current_day=$(($current_day + 1))
done
#!/bin/bash
