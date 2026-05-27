namespace Yate.ActionUtils {
    public static void set_initial_window_action_accels (Gee.MultiMap<string, string> action_accelerators) {
        action_accelerators.set (Yate.Constants.ACTION_SAVE, @"$(ShortcutUtils.platform_ctrl ())s");
        action_accelerators.set (Yate.Constants.ACTION_SAVE_AS, @"$(ShortcutUtils.platform_ctrl ())<Shift>s");
        action_accelerators.set (Yate.Constants.ACTION_OPEN, @"$(ShortcutUtils.platform_ctrl ())o");
    }

    public static void register_window_action_accels (
        Gee.MultiMap<string, string> action_accelerators,
        GLib.ActionMap actions,
        Gtk.Application app
    ) {
        foreach (var action in action_accelerators.get_keys ()) {
            var accels_array = action_accelerators[action].to_array ();
            accels_array += null;
            app.set_accels_for_action (Yate.Constants.WIN_ACTION_PREFIX + action, accels_array);
        }
    }

}
