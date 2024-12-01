const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const exe = b.addExecutable(.{
        .name = "gui",
        .root_source_file = .{ .cwd_relative = "gui.zig" }, // Changed from .path
        .target = target,
        .optimize = optimize,
    });

    // Add SDL2 package with more specific paths for macOS
    exe.linkSystemLibrary("SDL2");
    // Add include paths for M1 Mac
    exe.addIncludePath(.{ .cwd_relative = "/opt/homebrew/include" });
    exe.addLibraryPath(.{ .cwd_relative = "/opt/homebrew/lib" });

    b.installArtifact(exe);

    const run_cmd = b.addRunArtifact(exe);
    run_cmd.step.dependOn(b.getInstallStep());

    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run_cmd.step);
}
