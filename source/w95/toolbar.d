module w95.toolbar;

import fluid;
import raylib;

import w95.theme;
import w95.image_button;

@safe:

alias toolbar = simpleConstructor!Toolbar;

/// Displays a Windows 95-style desktop toolbar.
class Toolbar : Frame {

    this(Node[] nodes...) {

        super(nodes);
        super.isHorizontal = true;
        super.theme = w95Theme;

    }

}
