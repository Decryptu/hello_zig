# Zig Examples

This project contains two examples demonstrating different aspects of the Zig programming language:

1. A basic command-line program showcasing fundamental Zig features
2. A simple GUI application using SDL2

## Prerequisites

- Zig (0.13.0 or later)
- SDL2 (for the GUI example)
- macOS with Apple Silicon (M1/M2) or modify paths for your system

### Installation on macOS

```bash
# Install Zig
brew install zig

# Install SDL2 (required for GUI example)
brew install sdl2
```

## Building and Running

The project includes two examples that can be built and run separately. After building, the executables can be found in the `zig-out/bin/` directory:

- `zig-out/bin/basic` - The basic command-line example
- `zig-out/bin/gui` - The GUI application

### Basic Example

Demonstrates fundamental Zig features including:

- Functions
- Structs with methods
- Error handling
- String formatting
- Basic types

```bash
# Build all targets
zig build

# Run the basic example directly
./zig-out/bin/basic

# Or use zig build command
zig build run-basic
```

### GUI Example

Shows how to create a simple GUI application using SDL2:

- Window creation
- Event handling
- Basic graphics rendering
- Keyboard input
- Game loop implementation

```bash
# Build all targets
zig build

# Run the GUI example directly
./zig-out/bin/gui

# Or use zig build command
zig build run-gui
```

### GUI Controls

- Arrow keys: Move the red square
- Escape: Exit the program
- Window close button: Exit the program

## Project Structure

```t
.
├── .gitignore
├── LICENSE
├── README.md
├── build.zig        # Build configuration
├── src/
│   ├── basic.zig   # Basic Zig example
│   └── gui.zig     # SDL2 GUI example
└── .vscode/
    └── settings.json
```

## Build Output

After building, the project generates the following executables:

```t
zig-out/
└── bin/
    ├── basic       # Basic command-line example executable
    └── gui         # GUI application executable
```

## Features Demonstrated

### Basic Example (basic.zig)

- Function definitions
- Custom types (structs)
- String formatting and printing
- Error handling with `try`
- Basic arithmetic

### GUI Example (gui.zig)

- SDL2 integration
- Window management
- Input handling
- Basic graphics rendering
- Resource management with `defer`
- Game loop pattern

## Learning Resources

- [Zig Documentation](https://ziglang.org/documentation/master/)
- [SDL2 Documentation](https://wiki.libsdl.org/wiki/index)
- [Zig Learning Resources](https://github.com/zigenv/awesome-zig)

## Contributing

Feel free to:

- Report issues
- Suggest improvements
- Submit pull requests

All contributions are welcome!

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
