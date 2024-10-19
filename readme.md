# w95

A Windows 95 themed set of Fluid components.

Please note that for copyright reasons, this package is missing some icons and uses bootleg fonts.

```d
import w95;

run(
    window95(
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
    )
);
```
