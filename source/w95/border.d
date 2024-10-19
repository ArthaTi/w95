module w95.border;

import fluid.style;
import fluid.utils;
import fluid.border;
import fluid.backend;

@safe:


W95Border w95Border(Color topLeftCorner, Color bottomRightCorner, Color shadow = color("#000")) {

    auto result = new W95Border;
    result.color = [
        topLeftCorner, bottomRightCorner,
        topLeftCorner, bottomRightCorner
    ];
    result.shadowColor = shadow;
    return result;

}

class W95Border : ColorBorder {

    Color shadowColor = .color("#000");
    Color shineColor = .color("#0000");

    override void apply(FluidBackend io, Rectangle borderBox, float[4] size) const @trusted {

        const boxStart = borderBox.start;
        const boxEnd = borderBox.end;
        const boxSize = boxEnd - boxStart;

        // Draw regular lines
        if (size.sideTop) {
            io.drawRectangle(
                Rectangle(
                    boxStart.x,    boxStart.y,
                    boxSize.x - 1, 1
                ),
                color[Style.Side.top]
            );
        }
        if (size.sideLeft) {
            io.drawRectangle(
                Rectangle(
                    boxStart.x, boxStart.y,
                    1,          boxSize.y  - 1,
                ),
                color[Style.Side.left]
            );
        }
        if (size.sideRight) {
            io.drawRectangle(
                Rectangle(
                    boxEnd.x - 2, boxStart.y + 1,
                    1,            boxSize.y - 2,
                ),
                color[Style.Side.right]
            );
        }
        if (size.sideBottom) {
            io.drawRectangle(
                Rectangle(
                    boxStart.x + 1, boxEnd.y - 2,
                    boxSize.x  - 2,  1,
                ),
                color[Style.Side.bottom]
            );
        }

        // Draw shine lines
        if (size.sideTop) {
            io.drawRectangle(
                Rectangle(
                    boxStart.x + 1, boxStart.y + 1,
                    boxSize.x - 2,  1
                ),
                shineColor
            );
        }
        if (size.sideLeft) {
            io.drawRectangle(
                Rectangle(
                    boxStart.x + 1, boxStart.y + 1,
                    1,              boxSize.y  - 2,
                ),
                shineColor
            );
        }

        // Draw the shadow lines
        if (size.sideRight) {
            io.drawRectangle(
                Rectangle(
                    boxEnd.x - 1, boxStart.y,
                    1,            boxSize.y,
                ),
                shadowColor
            );
        }
        if (size.sideBottom) {
            io.drawRectangle(
                Rectangle(
                    boxStart.x, boxEnd.y - 1,
                    boxSize.x,  1,
                ),
                shadowColor
            );
        }

    }

    W95Border setShine(Color color) return {

        shineColor = color;
        return this;

    }

    W95Border setShadow(Color color) return {

        shadowColor = color;
        return this;

    }

}
