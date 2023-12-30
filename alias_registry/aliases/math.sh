#!/usr/bin/env python3

import argparse
import re

def is_safe_expression(expression):
    # Regular expression to allow only numbers, operators, and spaces
    if re.fullmatch(r"[0-9+\-*/(). ]+", expression):
        return True
    return False

def calculate(expression):
    if is_safe_expression(expression):
        try:
            # Directly evaluate the expression
            return eval(expression)
        except Exception as e:
            return f"Error: {e}"
    else:
        return "Invalid input: Only numbers and +, -, *, /, (, ) are allowed."

def main():
    parser = argparse.ArgumentParser(description="Command-line calculator")
    parser.add_argument("expression", type=str, help="Mathematical expression to evaluate")

    args = parser.parse_args()
    result = calculate(args.expression)

    # ANSI escape code for colored output
    color_start = "\033[38;5;205m"
    color_end = "\033[0m"

    print(f"{color_start}Result: {result}{color_end}")

if __name__ == "__main__":
    main()
