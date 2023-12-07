#!/usr/bin/env python3

import argparse
import re

def add(x, y):
    return x + y

def subtract(x, y):
    return x - y

def multiply(x, y):
    return x * y

def divide(x, y):
    if y == 0:
        return "Error: Division by zero"
    return x / y

def calculate(expression):
    # Use regular expressions to split the expression into operands and operator
    match = re.match(r'(\d*\.?\d+%?)([-+*/])(\d*\.?\d+%?)', expression)
    
    if match:
        x_str = match.group(1)
        operator = match.group(2)
        y_str = match.group(3)

        # Remove the percentage sign if present
        x_str = x_str.rstrip('%')
        y_str = y_str.rstrip('%')

        x = float(x_str)
        y = float(y_str)

        if operator == '+':
            result = add(x, y)
        elif operator == '-':
            result = subtract(x, y)
        elif operator == '*':
            result = multiply(x, y)
        elif operator == '/':
            result = divide(x, y)

        return result
    else:
        return "Invalid expression"

def main():
    parser = argparse.ArgumentParser(description="Command-line calculator")
    parser.add_argument("expression", type=str, help="Mathematical expression to evaluate")

    args = parser.parse_args()
    result = calculate(args.expression)
    print(f"Result: {result}")

if __name__ == "__main__":
    main()

