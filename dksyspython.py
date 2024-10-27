import os

# Define color mapping
COLOR_MAP = {
    '#': "\033[37m",  # White
    '.': "\033[30m",  # Black
    ' ': "\033[0m"    # Reset color (default)
}

def clear_screen():
    os.system('cls' if os.name == 'nt' else 'clear')

def draw_grid(prompt):
    grid = [[' ' for _ in range(30)] for _ in range(10)]
    full_prompt = (prompt * (300 // len(prompt) + 1))[:300]

    for index, char in enumerate(full_prompt):
        row = index // 30
        col = index % 30
        grid[row][col] = char

    for row in grid:
        for char in row:
            print(COLOR_MAP[char] + '█' + COLOR_MAP[' '], end='')
        print("\033[0m")

def display_color_mapping():
    print("Character Color Mapping:")
    print("# - White")
    print(". - Black")
    print("Press Enter to continue...")
    input()  # Wait for user input to continue

def main():
    while True:
        clear_screen()
        display_color_mapping()
        prompt = input("Enter your prompt (up to 300 characters, type 'exit' to quit): ")

        if prompt.lower() == 'exit':
            break

        if len(prompt) > 300:
            prompt = prompt[:300]  # Truncate if longer than 300 characters

        draw_grid(prompt)
        print("Press Enter to continue...")
        input()  # Wait for user input to continue

if __name__ == "__main__":
    main()
