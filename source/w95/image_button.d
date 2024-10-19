module w95.image_button;

import fluid.utils;
import fluid.button;
import fluid.backend;
import fluid.image_view;

@safe:

alias imageButton = simpleConstructor!ImageButton;

class ImageButton : ButtonImpl!ImageView {

    this(Args...)(Args args) {

        super(args);

    }

    override void drawImpl(Rectangle outer, Rectangle inner) {

        import std.algorithm : min;

        style.drawBackground(io, outer);

        // Ignore if there is no texture to draw
        if (texture.id <= 0) return;

        // Get the scale
        const scale = min(
            inner.width / texture.width,
            inner.height / texture.height
        );

        const size     = Vector2(texture.width * scale, texture.height * scale);
        const position = center(inner) - size/2;

        _targetArea = Rectangle(position.tupleof, size.tupleof);
        io.drawTextureAlign(_texture, _targetArea, color("#fff"));

    }

}
