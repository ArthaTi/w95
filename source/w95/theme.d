module w95.theme;

import w95;
import fluid;
import raylib;

import std.file;
import std.path;
import fluid.typeface;

import w95.border;

@safe:

@NodeTag
enum W95Tag {
    compact,
    windowContent,
    column,
    note,
    teal,
    inset,
    white,
    strong,
    desktopText,
    menuLogo,
    table,
    tableHeaderRow,
}

Theme w95Theme;
Theme w95TitlebarTheme;

Typeface w95Typeface;
Typeface w95BoldTypeface;

package string exeDir;

static this() {

    import fluid.theme;

    const windowBackgroundColor = color("#b7bbb7");

    exeDir = thisExePath.dirName;

    auto genericFrame = rule(
        border = 2,
        backgroundColor = windowBackgroundColor,
        borderStyle = w95Border(color("#fff"), color("#777b77")),
    );

    auto clearBorder = rule(
        borderStyle = null,
        border = 0,
    );

    auto clearFrame = rule(
        clearBorder,
        margin = 0,
        padding = 0,
        gap = 0,
        backgroundColor = color("#0000"),
    );

    auto outsetBorder = w95Border(color("#b6bbb7"), color("#777b77"))
        .setShine(color("#fff"));
    auto insetBorder = w95Border(color("#85898d"), color("#c2c6ca"))
        .setShine(color("#000"))
        .setShadow(color("#fff"));

    auto insetFrame = rule(
        border = 2,
        borderStyle = insetBorder,
        backgroundColor = color("#fff"),
    );

    w95Typeface = Style.loadTypeface(exeDir.buildPath("resources/W95font.otf"));
    w95BoldTypeface = Style.loadTypeface(exeDir.buildPath("resources/W95font-Bold.otf"));
    
    w95Theme = nullTheme.derive(

        rule!Node(
            typeface = w95Typeface,
            fontSize = 14,
            textColor = color("#000"),
        ),
        rule!(Node, W95Tag.strong)(
            typeface = w95BoldTypeface,
        ),
        rule!Space(
            gap = 8,
            margin.sideX = 8,
        ),
        rule!(Space, W95Tag.column)(
            margin.sideX = 8,
        ),
        rule!(Space, W95Tag.compact)(
            gap = 4,
            margin = 0,
        ),
        rule!Frame(
            genericFrame,
            padding = [8, 8, 10, 8],
        ),
        rule!(Frame, W95Tag.compact)(
            padding = 0,
        ),
        rule!(Frame, W95Tag.white)(
            backgroundColor = color("#fff"),
        ),
        rule!PopupFrame(
            padding = 0,
            // i wish i could add a rule to affect all nested buttons
        ),
        rule!ScrollInput(
            backgroundColor = color("#dbdbdb"),
        ),
        rule!ScrollInputHandle(
            genericFrame,
        ),
        rule!OnionFrame(clearFrame),
        rule!MapFrame(clearFrame),
        rule!Window95(
            margin = 0,
            backgroundColor = windowBackgroundColor,
            border = 3,
            gap = 16,
            padding = 0,
            padding.sideBottom = 8,
            borderStyle = outsetBorder,
        ),
        rule!Desktop(
            clearFrame,
            backgroundColor = color("#007f7f"),
        ),
        rule!Toolbar(
            margin = 0,
            borderStyle = w95Border(color("#dedede"), color("#0000"))
                .setShine(color("#fff")),
            border.sideX = 0,
            border.sideBottom = 0,
            padding = 2,
        ),
        rule!Clock(
            insetFrame,
            backgroundColor = color("#0000"),
            margin = 0,
            padding.sideX = 8,
            padding.sideBottom = -4,
        ),
        rule!Separator(
            border = 1,
            borderStyle = outsetBorder,
        ),
        rule!Label(
            textColor = color("#000"),
        ),
        rule!(Label, W95Tag.desktopText)(
            textColor = color("#fff"),
        ),
        rule!Button(
            textColor = color("#000"),
            padding.sideX = 14,
            padding.sideY = 2,
            genericFrame,
            mouseCursor = FluidMouseCursor.pointer,
        ),
        rule!IconButton(
            padding.sideY = 2,
            padding.sideX = 1,
            margin = 0,
            gap = 10,
        ),
        rule!(IconButton, W95Tag.compact)(
            gap = 2,
        ),
        rule!DesktopIcon(
            clearBorder,
            backgroundColor = color("#0000"),
        ),
        rule!StartMenu(
            gap = 0,
            padding = 0,
            children!IconButton(
                clearBorder,
                padding.sideLeft = 6,
                padding.sideRight = 32,
            ),
        ),
        rule!(Node, W95Tag.menuLogo)(
            backgroundColor = color("#7f7f7f"),
            padding.sideY = 7,
            padding.sideLeft = 4,
            padding.sideRight = 3,
        ),
        rule!ImageButton(
            genericFrame,
            mouseCursor = FluidMouseCursor.pointer,
        ),
        rule!GridFrame(
            clearBorder,
            padding = 0,
        ),
        rule!GridRow(
            clearFrame,
            gap = 6,
        ),
        rule!TextInput(
            insetFrame,
            padding = 2,
            when!"a.isEmpty"(
                textColor = color("#000a"),
            ),
        ),
        rule!Checkbox(
            insetFrame,
            border = 1,
            padding = 1,
            mouseCursor = FluidMouseCursor.pointer,

            when!"a.isFocused"(backgroundColor = color("#ddd")),
            when!"a.isChecked"(
                extra = new Checkbox.Extra(
                    loadImage(exeDir.buildPath("resources/checkmark.png")),
                ),
            ),
        ),
        rule!Radiobox(
            clearFrame,
            extra = new Checkbox.Extra(
                loadImage(exeDir.buildPath("resources/radiobox.png")),
            ),
            when!"a.isChecked"(
                extra = new Checkbox.Extra(
                    loadImage(exeDir.buildPath("resources/radiobox-checked.png")),
                ),
            ),
        ),
        rule!(Frame, W95Tag.note)(
            insetFrame,
            backgroundColor = color("#fcfcd1"),  // TODO this should use dithering instead
            padding.sideX = 14,
            padding.sideY = 24,
        ),
        rule!(Node, W95Tag.inset)(
            border = 2,
            borderStyle = insetBorder,
        ),
        rule!(Frame, W95Tag.inset)(
            border = 2,
            borderStyle = insetBorder,
        ),
        rule!(GridFrame, W95Tag.inset)(
            border = 2,
            borderStyle = insetBorder,
        ),
        rule!(GridFrame, W95Tag.table)(
            insetFrame,
            gap = 2,
            children!GridRow(
                margin.sideX = 4,
            ),
            children!(GridRow, W95Tag.tableHeaderRow)(
                margin.sideX = 0,
            ),
        ),
        rule!(GridRow, W95Tag.tableHeaderRow)(
            gap = 0,
            children(
                margin = 0,
                border = 2,
                borderStyle = outsetBorder,
                padding.sideX = 4,
                backgroundColor = windowBackgroundColor,
            ),
        ),
    );

    w95TitlebarTheme = w95Theme.derive(
        rule!Node(
            typeface = w95BoldTypeface,
        ),
        rule!Titlebar(
            margin = 0,
            border = 0,
            borderStyle = null,
            padding = 2,
            backgroundColor = color("#000083"),
        ),
        rule!(Titlebar, W95Tag.teal)(
            backgroundColor = color("#007b77"),
        ),
        rule!Label(
            textColor = color("#fff"),
        ),
        rule!Button(
            margin = 0,
        ),
        rule!ImageButton(
            margin = 0,
        ),
    );

}

private fluid.Image loadImage(string source) @trusted {

    import std.string;

    auto image = LoadImage(source.toStringz);
    scope (exit) UnloadImage(image);

    auto colorsC = LoadImageColors(image);
    auto colors = colorsC[0 .. image.width * image.height].dup;
    scope (exit) UnloadImageColors(colorsC);

    return fluid.Image(
        colors,
        image.width,
        image.height
    );

}
