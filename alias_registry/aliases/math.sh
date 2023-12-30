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

    # ANSI escape code for colored output
    # Here, 205 is the color code for light purple. You can change it as per your preference.
    color_start = "\033[38;5;205m"
    color_end = "\033[0m"

    print(f"{color_start}Result: {result}{color_end}")

if __name__ == "__main__":
    main()
