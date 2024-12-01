const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    // Basic example
    const basic_exe = b.addExecutable(.{
        .name = "basic",
        .root_source_file = .{ .cwd_relative = "src/basic.zig" },
        .target = target,
        .optimize = optimize,
    });
    b.installArtifact(basic_exe);

    const run_basic = b.addRunArtifact(basic_exe);
    run_basic.step.dependOn(b.getInstallStep());
    const basic_step = b.step("basic", "Run the basic example");
    basic_step.dependOn(&run_basic.step);

    // GUI example
    const gui_exe = b.addExecutable(.{
        .name = "gui",
        .root_source_file = .{ .cwd_relative = "src/gui.zig" },
        .target = target,
        .optimize = optimize,
    });

    // SDL2 configuration for GUI example
    gui_exe.linkSystemLibrary("SDL2");
    gui_exe.addIncludePath(.{ .cwd_relative = "/opt/homebrew/include/SDL2" });
    gui_exe.addIncludePath(.{ .cwd_relative = "/opt/homebrew/include" });
    gui_exe.addLibraryPath(.{ .cwd_relative = "/opt/homebrew/lib" });
    gui_exe.linkLibC();

    b.installArtifact(gui_exe);

    const run_gui = b.addRunArtifact(gui_exe);
    run_gui.step.dependOn(b.getInstallStep());
    const gui_step = b.step("gui", "Run the GUI example");
    gui_step.dependOn(&run_gui.step);
}
