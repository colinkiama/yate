public class Yate.ShellViewModel : GLib.Object {
    public Yate.MainWindow window { get; construct; }
    public SimpleActionGroup actions { get; construct; }

    private Yate.FileIOService _file_service;
    private ActionEntry[] _action_entries;

    construct {
        this._file_service = Yate.FileIOService.instance ();

        this._action_entries = {
            { Yate.Constants.ACTION_SAVE, action_save },
            { Yate.Constants.ACTION_SAVE_AS, action_save_as },
            { Yate.Constants.ACTION_OPEN, action_open },
        };

        actions = new SimpleActionGroup ();
        actions.add_action_entries (_action_entries, this);
        window.insert_action_group (Yate.Constants.WIN_ACTION_GROUP, actions);

        ActionUtils.set_initial_window_action_accels (Yate.MainWindow.action_accelerators);
        ActionUtils.register_window_action_accels (Yate.MainWindow.action_accelerators, actions, window.app);
    }

    public ShellViewModel (Yate.MainWindow window) {
        Object (
            window: window
        );
    }

    public void action_save () {
        debug ("ACTION SAVE!");
    }

    public void action_save_as () {
        debug ("ACTION SAVE AS");
    }

    public void action_open () {
        this._file_service.load_file_from_dialog.begin (window, null);
    }
}
