module w95.dialog_window;

import fluid;

import w95.window;
import w95.titlebar;
import w95.dialog_button;

@safe:

alias dialogWindow = simpleConstructor!DialogWindow;

/// Create an info dialog.
///
/// ---
/// dialogWindow.info("Text")
/// ---
DialogWindow info(Ts...)(typeof(dialogWindow), Ts params, string message) {

    DialogWindow window;

    return window = dialogWindow(
        params,
        titlebar("Info"),
        imageView("resources/dialog-icons/info.private.png"),
        label(message),
        dialogButton("OK", delegate {
            window.close();
        }),
    );
    
}

/// Create an error dialog.
///
/// ---
/// dialogWindow.error("Text")
/// ---
DialogWindow error(Ts...)(typeof(dialogWindow), Ts params, string message) {

    DialogWindow window;

    return window = dialogWindow(
        params,
        titlebar("Error"),
        imageView("resources/dialog-icons/cross2.private.png"),
        label(message),
        dialogButton("OK", delegate {
            window.close();
        }),
    );
    
}

class DialogWindow : Window95 {

    this(Titlebar titlebar, ImageView icon, Node content, DialogButton[] buttons...) {

        if (buttons != []) {

            super(
                titlebar, 
                hspace(
                    icon,
                    vspace(
                        content,
                        hspace(
                            .layout!"end",
                            buttons,
                        ),
                    ),
                )
            );

        }

        else {

            super(
                titlebar,
                hspace(
                    icon,
                    content,
                ),
            );

        }

    }

}
