module w95.icon_grid;

import fluid;
import raylib;

import w95.theme;
import w95.image_button;

@safe:

alias iconGrid = simpleConstructor!IconGrid;

/// Displays a Windows 95 icon grid for use in a desktop or explorer app.
class IconGrid : Space {

    this(Node[] nodes...) {

        super(nodes);

    }

}
