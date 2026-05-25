public class Yate.App : Gtk.Application {
    // Member variables

    // Constructor
    public App () {
        Object (application_id: "com.colinkiama.yate",
                flags : GLib.ApplicationFlags.FLAGS_NONE
        );
    }

    protected override void activate () {
        var win = this.get_active_window ();
        if (win == null) {
            win = new MainWindow (this);
        }
        win.present ();
    }

    protected override void open (GLib.File[] files, string hint) {
    }
}

int main (string[] args) {
    var my_app = new Yate.App ();
    return my_app.run (args);
}
