module w95.clock;

import fluid;
import raylib;
import std.datetime;

import w95.theme;
import w95.image_button;

@safe:

alias clock = simpleConstructor!Clock;

/// Displays a Windows 95 toolbar clock.
class Clock : Label {

    public {

        immutable TimeZone timezone;

    }

    private {

        int hour;
        int minute;

    }

    /// Create a clock, and set the timezone
    this(immutable TimeZone tz = LocalTime()) {

        super("12:00 AM");
        this.timezone = tz;
        updateClock();

    }

    override void drawImpl(Rectangle outer, Rectangle inner) {

        // Place the text in the center
        const size = text.size;
        inner = Rectangle(
            (inner.center - size / 2).tupleof,
            size.tupleof,    
        );

        super.drawImpl(outer, inner);
        updateClock();

    }

    /// Update the time.
    private void updateClock() {

        import std.format : format;

        const time = std.datetime.Clock.currTime(timezone);

        const newHour = time.hour;
        const newMinute = time.minute;

        // Do nothing if nothing has changed
        if (newHour == hour && newMinute == minute) return;

        // AM time
        const period = newHour < 12 ? "AM" : "PM";
        const displayHour = newHour % 12 == 0
            ? 12
            : newHour % 12;

        text = format!"%s:%02d %s"(displayHour, newMinute, period);

    }

}
