const std = @import("std");
const c = @cImport({
    @cInclude("SDL.h");
});

pub fn main() !void {
    // Initialize SDL
    if (c.SDL_Init(c.SDL_INIT_VIDEO) < 0) {
        std.debug.print("SDL2 initialization failed: {s}\n", .{c.SDL_GetError()});
        return error.SDLInitializationFailed;
    }
    defer c.SDL_Quit();

    // Create window
    const window = c.SDL_CreateWindow(
        "My Zig Window",
        c.SDL_WINDOWPOS_CENTERED,
        c.SDL_WINDOWPOS_CENTERED,
        800,
        600,
        c.SDL_WINDOW_SHOWN,
    ) orelse {
        std.debug.print("Failed to create window: {s}\n", .{c.SDL_GetError()});
        return error.SDLWindowCreationFailed;
    };
    defer c.SDL_DestroyWindow(window);

    // Create renderer
    const renderer = c.SDL_CreateRenderer(window, -1, c.SDL_RENDERER_ACCELERATED) orelse {
        std.debug.print("Failed to create renderer: {s}\n", .{c.SDL_GetError()});
        return error.SDLRendererCreationFailed;
    };
    defer c.SDL_DestroyRenderer(renderer);

    // Rectangle position
    var rect = c.SDL_Rect{
        .x = 400,
        .y = 300,
        .w = 50,
        .h = 50,
    };

    // Main loop
    mainLoop: while (true) {
        var event: c.SDL_Event = undefined;
        while (c.SDL_PollEvent(&event) != 0) {
            switch (event.type) {
                c.SDL_QUIT => break :mainLoop,
                c.SDL_KEYDOWN => {
                    switch (event.key.keysym.sym) {
                        c.SDLK_LEFT => rect.x -= 5,
                        c.SDLK_RIGHT => rect.x += 5,
                        c.SDLK_UP => rect.y -= 5,
                        c.SDLK_DOWN => rect.y += 5,
                        c.SDLK_ESCAPE => break :mainLoop,
                        else => {},
                    }
                },
                else => {},
            }
        }

        // Clear screen
        _ = c.SDL_SetRenderDrawColor(renderer, 255, 255, 255, 255);
        _ = c.SDL_RenderClear(renderer);

        // Draw rectangle
        _ = c.SDL_SetRenderDrawColor(renderer, 255, 0, 0, 255);
        _ = c.SDL_RenderFillRect(renderer, &rect);

        // Update screen
        c.SDL_RenderPresent(renderer);

        // Small delay to prevent too much CPU usage
        c.SDL_Delay(16); // roughly 60 FPS
    }
}
