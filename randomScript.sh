# Create an array of ASCII art
art[0]="  _   _      _ _         __        __         _     _ _ "
art[1]=" | | | | ___| | | ___    \\ \\      / /__  _ __| | __| | |"
art[2]=" | |_| |/ _ \\ | |/ _ \\    \\ \\ /\\ / / _ \\| '__| |/ _\` | |"
art[3]=" |  _  |  __/ | | (_) |    \\ V  V / (_) | |  | | (_| |_|"
art[4]=" |_| |_|\\___|_|_|\\___( )    \\_/\\_/ \\___/|_|  |_|\\__,_(_)"
art[5]="                     |/                                  "

# Get a random number to select the ASCII art
num=$(($RANDOM % ${#art[@]}))

# Print the selected ASCII art
echo "${art[$num]}"
