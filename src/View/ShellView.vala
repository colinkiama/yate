public class Yate.ShellView : Gtk.ApplicationWindow {
    public SimpleActionGroup actions { get; construct; }
    public Yate.App app { get; private set; }

    public const string ACTION_GROUP = "win";
    public const string ACTION_PREFIX = ACTION_GROUP + ".";
    public const string ACTION_SAVE = "action-save";
    public const string ACTION_SAVE_AS = "action-save-as";
    public const string ACTION_OPEN = "action-load";

    public static Gee.MultiMap<string, string> action_accelerators = new Gee.HashMultiMap<string, string> ();

    private const ActionEntry[] ACTION_ENTRIES = {
        { ACTION_SAVE, action_save },
        { ACTION_SAVE_AS, action_save_as },
        { ACTION_OPEN, action_open },
    };

    static construct {
        action_accelerators.set (ACTION_SAVE, "<Primary>s");
        action_accelerators.set (ACTION_SAVE_AS, "<Primary><Shift>s");
        action_accelerators.set (ACTION_OPEN, "<Primary>o");
    }

    public ShellView (Gtk.Application application) {
        Object (application: application);
    }

    construct {
        application = application;
        app = (Yate.App) application;
        actions = new SimpleActionGroup ();
        actions.add_action_entries (ACTION_ENTRIES, this);
        insert_action_group (ACTION_GROUP, actions);

         foreach (var action in action_accelerators.get_keys ()) {
            var accels_array = action_accelerators[action].to_array ();
            accels_array += null;

            application.set_accels_for_action (ACTION_PREFIX + action, accels_array);
        }

        this.default_height = 400;
        this.default_width = 600;

        var menu_model = new GLib.Menu ();
        menu_model.append ("Open", ACTION_PREFIX + ACTION_OPEN);
        menu_model.append ("Save", ACTION_PREFIX + ACTION_SAVE);
        menu_model.append ("Save As", ACTION_PREFIX + ACTION_SAVE_AS);

        var menu_button = new Gtk.MenuButton ();
        menu_button.icon_name = "open-menu-symbolic";
        menu_button.menu_model = menu_model;

        var header_bar = new Gtk.HeaderBar ();
        header_bar.pack_end (menu_button);
        this.set_titlebar (header_bar);

        this.child = new Yate.MainView ();
    }

    private void action_save () {
        debug ("ACTION SAVE!");
    }

    private void action_save_as () {
        debug ("ACTION SAVE AS");
    }

    private void action_open () {
        debug ("ACTION OPEN");
    }


}
