const std = @import("std");

// A simple function that adds two numbers
fn add(a: i32, b: i32) i32 {
    return a + b;
}

// A struct to demonstrate custom types
const Person = struct {
    name: []const u8,
    age: u8,

    fn introduce(self: Person) void {
        std.debug.print("Hello, I'm {s} and I'm {} years old!\n", .{
            self.name,
            self.age,
        });
    }
};

pub fn main() !void {
    // Print a simple message
    std.debug.print("Hello from Zig!\n", .{});

    // Demonstrate the add function
    const result = add(5, 3);
    std.debug.print("5 + 3 = {}\n", .{result});

    // Create and use a Person instance
    const person = Person{
        .name = "Alice",
        .age = 25,
    };
    person.introduce();

    // Demonstrate error handling
    const number = try std.fmt.parseInt(i32, "123", 10);
    std.debug.print("Parsed number: {}\n", .{number});
}