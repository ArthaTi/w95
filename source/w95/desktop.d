module w95.desktop;

import fluid;
import raylib;

import w95.util;
import w95.theme;
import w95.window;
import w95.toolbar;
import w95.icon_grid;
import w95.image_button;

@safe:

alias desktop = simpleConstructor!Desktop;

/// Displays a Windows 95-style desktop.
class Desktop : Frame, WindowManager {

    enum Vector2 defaultSize = Vector2(640, 480);
    
    public {

        NodeSlot!IconGrid icons;
        NodeSlot!Toolbar toolbar;
        MapFrame windows;
        
    }

    private {

        Rectangle rect;

    }

    this(IconGrid icons, Toolbar toolbar) {

        super(
            onionFrame(
                .layout!(1, "fill"),
                this.icons = nodeSlot!IconGrid(
                    .layout!"fill",
                    icons
                ),
                windows = mapFrame(
                    .ignoreMouse,
                    .acceptDrop(Window95.selector),
                    .layout!"fill",
                ),
            ),
            this.toolbar = nodeSlot!Toolbar(
                .layout!"fill",
                toolbar
            ),
        );
        super.theme = w95Theme;
        this.layout = .layout!"fill";

        if (icons)
            icons.layout = .layout!"fill";
        if (toolbar)
            toolbar.layout = .layout!"fill";


    }

    override void resizeImpl(Vector2 space) {

        if (space.x < defaultSize.x) space.x = defaultSize.x;
        if (space.y < defaultSize.y) space.y = defaultSize.y;

        super.resizeImpl(space);
        minSize = defaultSize;

    }

    override void drawImpl(Rectangle outer, Rectangle inner) {

        super.drawImpl(outer, inner);
        rect = inner;        

    }

    /// Spawn a window.
    void addWindow(Window95 window) {

        addWindow(window,
            MapPosition(
                rect.size / 2,
                dropVector!"center"
            )
        );

    }

    /// ditto
    void addWindow(Window95 window, MapPosition position) {

        windows.addChild(window, position);
        windows.updateSize();

    }

}

interface WindowManager {

    void addWindow(Window95 window);

}
