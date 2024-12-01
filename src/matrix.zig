const std = @import("std");

// Matrix type with compile-time known dimensions
fn Matrix(comptime rows: usize, comptime cols: usize) type {
    return struct {
        data: [rows][cols]f32,

        const Self = @This();

        // Initialize with zeros
        pub fn zero() Self {
            return Self{ .data = std.mem.zeroes([rows][cols]f32) };
        }

        // Initialize identity matrix (only for square matrices)
        pub fn identity() Self {
            if (rows != cols) @compileError("Identity matrix must be square");
            var result = Self.zero();
            for (0..rows) |i| {
                result.data[i][i] = 1;
            }
            return result;
        }

        // Print the matrix
        pub fn print(self: Self) void {
            for (0..rows) |i| {
                for (0..cols) |j| {
                    std.debug.print("{d:6.2} ", .{self.data[i][j]});
                }
                std.debug.print("\n", .{});
            }
        }

        // Add two matrices
        pub fn add(self: Self, other: Self) Self {
            var result = Self.zero();
            for (0..rows) |i| {
                for (0..cols) |j| {
                    result.data[i][j] = self.data[i][j] + other.data[i][j];
                }
            }
            return result;
        }

        // Multiply by scalar
        pub fn scale(self: Self, scalar: f32) Self {
            var result = Self.zero();
            for (0..rows) |i| {
                for (0..cols) |j| {
                    result.data[i][j] = self.data[i][j] * scalar;
                }
            }
            return result;
        }
    };
}

pub fn main() !void {
    // Create a 3x3 matrix type
    const Mat3 = Matrix(3, 3);

    // Create an identity matrix
    var mat1 = Mat3.identity();
    std.debug.print("Identity Matrix:\n", .{});
    mat1.print();

    // Create another matrix and initialize it
    var mat2 = Mat3.zero();
    mat2.data = .{
        .{ 1, 2, 3 },
        .{ 4, 5, 6 },
        .{ 7, 8, 9 },
    };
    std.debug.print("\nMatrix 2:\n", .{});
    mat2.print();

    // Add matrices
    var mat3 = mat1.add(mat2);
    std.debug.print("\nMatrix 1 + Matrix 2:\n", .{});
    mat3.print();

    // Scale matrix
    var scaled = mat2.scale(2);
    std.debug.print("\nMatrix 2 scaled by 2:\n", .{});
    scaled.print();
}
