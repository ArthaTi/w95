module w95.window;

import fluid;
import raylib;

import w95.theme;
import w95.titlebar;
import w95.image_button;

@safe:

alias window95 = simpleConstructor!Window95;

/// Displays a Windows 95-like window.
class Window95 : DragSlot {

    public {

        Titlebar titlebar;
        Node content;

    }

    alias close = remove;

    this(Titlebar titlebar, Node content) {

        super(
            this.content = content,
        );
        this.titlebar = titlebar;
        super.handle = new WindowDragHandle(titlebar);
        super.handle.layout = .layout!"fill";
        super.theme = w95Theme;

        // Set custom default onClose handler
        if (titlebar.onClose is null) {

            titlebar.onClose = delegate {
                remove();
            };

        }

    }

    static Selector selector() {

        return Selector(typeid(Window95));

    }

}

private class WindowDragHandle : DragHandle {

    public {

        Node titlebar;

    }

    this(Node titlebar) {

        this.titlebar = titlebar;

    }

    override void resizeImpl(Vector2 space) {

        titlebar.resize(tree, theme, space);
        minSize = titlebar.minSize;

    }

    override void drawImpl(Rectangle outer, Rectangle inner) {

        titlebar.draw(outer);
        
    }

}
