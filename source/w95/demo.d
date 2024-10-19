module w95.demo;

import w95;
import fluid;

@safe:

NodeSlot!Window95 w95Demo() {

    auto root = nodeSlot!Window95(.layout!"fill");

    auto window = window95(
        .layout!"center",
        titlebar("Welcome"),
        gridFrame(
            .segments!2,
            vspace(
                label("Welcome to Windows95"),
            ),
            [
                hframe(
                    .layout!(1, "fill"),
                    .tags!(W95Tag.note),
                    imageView("resources/tip-of-the-day.png"),
                    vspace(
                        label("Did you know..."),
                        label("You now smell something not unlike rotting meat every time you boot "
                            ~ "me up.\n"
                            ~ "I cannot promise that the smell will ever go away  or that you will "
                            ~ "ever find its source."),
                        label("But I can promise that you will learn to love it."),
                    ),
                ),
                vspace(
                    .layout!"fill",
                    .tags!(W95Tag.column),
                    button(.layout!"fill", "What's new", delegate { }),
                    button(.layout!"fill", "Online registration", delegate { }),
                    button(.layout!"fill", "Next tip", delegate { }),
                    vspace(.layout!1),
                    hseparator(),
                ),
            ],
            [
                fieldSlot!hspace(
                    .layout!1,
                    checkbox(true),
                    label("Show this Welcome Screen next time you start Windows"),
                ),
                vspace(
                    .layout!"fill",
                    button(
                        .layout!("fill", "start"),
                        .tags!(W95Tag.column),
                        "Close",
                        delegate {
                            root = w95Demo2(root);
                        }
                    )
                ),
            ],
        ),
    );

    root.tree = new LayoutTree(root);
    root.io.scale = 1;
    return root = window;

}

Window95 w95Demo2(NodeSlot!Window95 root) {

    return window95(
        .layout!"center",
        titlebar(
            .tags!(W95Tag.teal),
            "Missing Skin"
        ),
        hspace(
            imageView("resources/dialog-icons/flashlight.png"),
            vspace(
                .layout!"fill",
                label("Windows is searching for your skin.\n"
                    ~ "To locate the skin yourself  click Browse."),
                hspace(
                    .layout!"end",
                    button("Browse", delegate { }),
                    button("Cancel", delegate { }),
                ),
            ),
        ),
    );

}
