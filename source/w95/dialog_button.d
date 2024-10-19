module w95.dialog_button;

import fluid;

@safe:

alias dialogButton = simpleConstructor!DialogButton;

class DialogButton : Button {

    this(string label, void delegate() @safe callback) {

        super(label, callback);
        this.layout = .layout!"fill";

    }

    override void resizeImpl(Vector2 space) {

        super.resizeImpl(space);

        if (minSize.x < 46) {
            minSize.x = 46;
        }

    }

    override void drawImpl(Rectangle outer, Rectangle inner) {

        const position = inner.center - text.size/2;
        const style = pickStyle();
        style.drawBackground(tree.io, outer);
        text.draw(style, position);

    }

}
