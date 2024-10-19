module w95.titlebar;

import fluid;
import std.path;

import w95.util;
import w95.theme;
import w95.image_button;

@safe:

alias titlebar = simpleConstructor!Titlebar;

class Titlebar : Frame {

    public {

        void delegate() @safe onClose;
        Label titlebarLabel;

    }

    this(Rope text, void delegate() @safe onClose = null) {

        super(
            titlebarLabel = label(
                .ignoreMouse,
                .layout!(1, "start", "end"),
                text
            ),
            imageButton(
                .layout!("center"),
                exeDir.buildPath("resources/x.png"),
                delegate {
                    if (this.onClose) this.onClose();
                }
            ),
        );
        super.theme = w95TitlebarTheme;
        super.layout = .layout!"fill";
        super.isHorizontal = true;
        this.onClose = onClose;

    }

    this(string text, void delegate() @safe onClose = null) {

        this(Rope(text), onClose);

    }

    Rope text() const {

        return titlebarLabel.text;

    }

    override bool hoveredImpl(Rectangle, Vector2) {

        return false;

    }

}
