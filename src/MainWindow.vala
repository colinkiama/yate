public class Yate.MainWindow : Gtk.ApplicationWindow {
    public Yate.App app { get; private set; }
    public static Gee.MultiMap<string, string> action_accelerators = new Gee.HashMultiMap<string, string> ();

    construct {
        this.application = ((Gtk.Application)(GLib.Application.get_default ()));
        this.app = (Yate.App) application;
        this.default_height = 400;
        this.default_width = 600;

        this.child = new Yate.ShellView (this);
    }
}
