# Zig Examples

This project contains three examples demonstrating different aspects of the Zig programming language:

1. A basic command-line program showcasing fundamental Zig features
2. A simple GUI application using SDL2
3. A vector operations example with interactive visualization

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

The project includes three examples that can be built and run separately. After building, the executables can be found in the `zig-out/bin/` directory:

- `zig-out/bin/basic` - The basic command-line example
- `zig-out/bin/gui` - The GUI application
- `zig-out/bin/vector` - The vector operations example

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

### Vector Example

Demonstrates Zig's SIMD vector operations with an interactive visualization:

- Vector arithmetic operations
- SIMD instructions usage
- Interactive web visualization
- Real-time computation

```bash
# Build all targets
zig build

# Run the vector example directly
./zig-out/bin/vector

# Or use zig build command
zig build vector
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
│   ├── gui.zig     # SDL2 GUI example
│   └── vector.zig  # Vector operations example
└── .vscode/
    └── settings.json
```

## Build Output

After building, the project generates the following executables:

```t
zig-out/
└── bin/
    ├── basic       # Basic command-line example executable 
    ├── gui         # GUI application executable
    └── vector      # Vector operations executable
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

### Vector Example (vector.zig)

- SIMD vector operations
- Interactive visualization
- Real-time computation
- Vector arithmetic
- Web component integration
- User input handling
- Dynamic result visualization

## Learning Resources

- [Zig Documentation](https://ziglang.org/documentation/master/)
- [SDL2 Documentation](https://wiki.libsdl.org/wiki/index)
- [Zig Learning Resources](https://github.com/zigenv/awesome-zig)
- [Zig Vector Operations](https://ziglang.org/documentation/master/#Vectors)

## Contributing

Feel free to:

- Report issues
- Suggest improvements
- Submit pull requests

All contributions are welcome!

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
