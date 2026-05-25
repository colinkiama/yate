public class Yate.ShellView : Gtk.ApplicationWindow {
    public ShellView (Gtk.Application app) {
        Object (application: app);

        this.default_height = 400;
        this.default_width = 600;

        var header = new Gtk.HeaderBar ();
        this.set_titlebar (header);

        this.child = new Yate.MainView ();
    }
}
