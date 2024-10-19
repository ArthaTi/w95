module w95.icon_button;

import fluid;
import raylib;

import w95.theme;

@safe:

alias iconButton = simpleConstructor!IconButton;

/// Button that optionally displays an icon to its left.
class IconButton : FrameButton {

    public {

        NodeSlot!ImageView icon;
        NodeSlot!Label label;

    }

    this(ImageView icon, string text, void delegate() @safe callback) {

        this(
            icon, 
            .label(.layout!"center", text), 
            callback
        );

    }

    this(ImageView icon, Label text, void delegate() @safe callback) {

        super(
            this.icon  = nodeSlot!ImageView(
                .layout!"center", 
                icon
            ), 
            this.label = nodeSlot!Label(
                .layout!(1, "center"),
                text
            ), 
            callback
        );
        this.isHorizontal = true;

    }

    protected override void drawImpl(Rectangle outer, Rectangle inner) {

        const isHovered = tree.hover is this;

        super.drawImpl(outer, inner);

        // Ensure no child takes hover away from the button
        if (isHovered) {

            tree.hover = this;

        }

    }

}
