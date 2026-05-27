public class Yate.ShellView : Gtk.ApplicationWindow {
    public SimpleActionGroup actions { get; construct; }
    public Yate.App app { get; private set; }
    public ShellViewModel view_model { get; set; }

    public const string ACTION_GROUP = "win";
    public const string ACTION_PREFIX = ACTION_GROUP + ".";
    public const string ACTION_SAVE = "action-save";
    public const string ACTION_SAVE_AS = "action-save-as";
    public const string ACTION_OPEN = "action-load";

    public static Gee.MultiMap<string, string> action_accelerators = new Gee.HashMultiMap<string, string> ();

    private ActionEntry[] _action_entries;

    static construct {
        action_accelerators.set (ACTION_SAVE, @"$(ShortcutUtils.platform_ctrl ())s");
        action_accelerators.set (ACTION_SAVE_AS, @"$(ShortcutUtils.platform_ctrl ())<Shift>s");
        action_accelerators.set (ACTION_OPEN, @"$(ShortcutUtils.platform_ctrl ())o");
    }

    construct {
        this.application = ((Gtk.Application)(GLib.Application.get_default ()));
        this.app = (Yate.App) application;
        this.view_model = new ShellViewModel ();
        this._action_entries = {
            { ACTION_SAVE, this.view_model.action_save },
            { ACTION_SAVE_AS, this.view_model.action_save_as },
            { ACTION_OPEN, this.view_model.action_open },
        };

        actions = new SimpleActionGroup ();
        actions.add_action_entries (_action_entries, this);
        insert_action_group (ACTION_GROUP, actions);

        foreach (var action in action_accelerators.get_keys ()) {
            var accels_array = action_accelerators[action].to_array ();
            accels_array += null;
            app.set_accels_for_action (ACTION_PREFIX + action, accels_array);
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
}
