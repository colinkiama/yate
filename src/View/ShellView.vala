public class Yate.ShellView : Gtk.Widget {
    public ShellViewModel view_model { get; set; }
    public Yate.MainWindow window { private get; construct; }
    private Gtk.Box _container;


    class construct {
        set_layout_manager_type (typeof (Gtk.BoxLayout));
    }

    construct {
        this.view_model = new ShellViewModel (window);

        var menu_model = new GLib.Menu ();
        menu_model.append ("Open", Yate.Constants.WIN_ACTION_PREFIX + Yate.Constants.ACTION_OPEN);
        menu_model.append ("Save", Yate.Constants.WIN_ACTION_PREFIX + Yate.Constants.ACTION_SAVE);
        menu_model.append ("Save As", Yate.Constants.WIN_ACTION_PREFIX + Yate.Constants.ACTION_SAVE_AS);

        var menu_button = new Gtk.MenuButton ();
        menu_button.icon_name = "open-menu-symbolic";
        menu_button.menu_model = menu_model;

        var header_bar = new Gtk.HeaderBar ();
        header_bar.pack_end (menu_button);
        window.set_titlebar (header_bar);

        var main_view = new Yate.MainView (window);
        main_view.vexpand = true;
        main_view.hexpand = true;

        this._container = new Gtk.Box (Gtk.Orientation.VERTICAL, 0);
        this._container.append (main_view);
        this._container.set_parent (this);
    }

    public ShellView (Yate.MainWindow window) {
        Object (
            window: window
        );
    }

    ~ShellView () {
        if (_container != null) {
            _container.unparent ();
        }
    }
}
