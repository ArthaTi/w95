import w95;
import fluid;
import raylib;

void main() {

    // Prepare the window
    SetConfigFlags(ConfigFlags.FLAG_WINDOW_RESIZABLE);
    SetTraceLogLevel(TraceLogLevel.LOG_WARNING);
    InitWindow(800, 600, "Hello, Fluid!");
    SetTargetFPS(60);
    scope (exit) CloseWindow();

    // Create UI
    auto ui = w95Demo();

    // Event loop
    while (!WindowShouldClose) {

        BeginDrawing();
        scope (exit) EndDrawing();

        ClearBackground(color("000"));

        ui.draw();

    }

}
