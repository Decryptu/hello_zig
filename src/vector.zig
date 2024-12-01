const std = @import("std");

pub fn main() !void {
    // Create 4-element vectors
    const vec1 = @Vector(4, i32){ 1, 2, 3, 4 };
    const vec2 = @Vector(4, i32){ 4, 3, 2, 1 };

    // Perform vector operations
    const sum = vec1 + vec2;
    const diff = vec1 - vec2;
    const product = vec1 * vec2;

    // Print results
    std.debug.print("Vector 1: {any}\n", .{vec1});
    std.debug.print("Vector 2: {any}\n", .{vec2});
    std.debug.print("Sum: {any}\n", .{sum});
    std.debug.print("Difference: {any}\n", .{diff});
    std.debug.print("Product: {any}\n", .{product});
}
