module w95.desktop_icon;

import fluid;
import raylib;

import w95.theme;
import w95.icon_button;

@safe:

alias desktopIcon = simpleConstructor!DesktopIcon;

/// Icon displayed on the desktop or in the file explorer.
class DesktopIcon : SizeLock!IconButton {

    public {

        ImageView icon;
        Label label;

    }

    this(ImageView icon, string text, void delegate() @safe callback) {

        this(
            icon, 
            .label(
                .layout!"center",
                .tags!(W95Tag.desktopText),
                text,
            ), 
            callback,
        );
        limit.x = 64;

    }

    this(ImageView icon, Label text, void delegate() @safe callback) {

        super(icon, text, callback);
        this.isHorizontal = false;

    }

}
