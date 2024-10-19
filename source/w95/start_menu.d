module w95.start_menu;

import fluid;

import w95.theme;

@safe:

alias startMenu = simpleConstructor!StartMenu;

class StartMenu : PopupFrame {

    public {

        NodeSlot!ImageView barLogo;
        NodeSlot!Node content;

    }

    this(ImageView barLogo, Node content) {

        super(
            this.barLogo = nodeSlot!ImageView(
                .layout!"fill",
                .tags!(W95Tag.menuLogo),
                barLogo
            ),
            this.content = nodeSlot!Node(
                .layout!"fill",   
                content
            ),
        );

        isHorizontal = true;

    }

}
