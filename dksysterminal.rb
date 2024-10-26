require 'io/console'

# Define color mapping
COLOR_MAP = {
  '#' => "\e[37m", # White
  '.' => "\e[30m", # Black
  ' ' => "\e[0m"   # Reset color (default)
}

def clear_screen
  system('clear') || system('cls')
end

def draw_grid(prompt)
  # Create a grid of filled characters based on the user input
  grid = Array.new(10) { Array.new(30, ' ') }

  # Repeat the prompt until it reaches 300 characters
  full_prompt = (prompt * (300 / prompt.length + 1))[0...300]

  # Fill the grid based on the full prompt
  full_prompt.each_char.with_index do |char, index|
    row = index / 30
    col = index % 30
    grid[row][col] = char
  end

  # Display the grid with colors based on the mapping
  grid.each do |row|
    row.each do |char|
      print COLOR_MAP[char] + '█' + COLOR_MAP[' '] # Use filled character
    end
    puts "\e[0m" # Reset color after each row
  end
end

def display_color_mapping
  puts "Character Color Mapping:"
  puts "# - White"
  puts ". - Black"
  puts "Press any key to continue..."
  STDIN.getch  # Wait for user input to continue
end

def main
  loop do
    clear_screen
    display_color_mapping
    puts "Enter your prompt (up to 300 characters, type 'exit' to quit):"
    prompt = gets.chomp

    break if prompt.downcase == 'exit'

    if prompt.length > 300
      prompt = prompt[0...300] # Truncate if longer than 300 characters
    end

    draw_grid(prompt)
    puts "Press any key to continue..."
    STDIN.getch  # Wait for user input to continue
  end
end

main
