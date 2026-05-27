public class Yate.MainView : Gtk.Widget {
    public Yate.MainViewModel view_model { get; set; }
    public Yate.MainWindow window { private get; construct; }
    private Gtk.Box _container;
    private Gtk.TextView _text_view;


    class construct {
        set_layout_manager_type (typeof (Gtk.BoxLayout));
    }

    construct {
        this._view_model = new MainViewModel ();
        this._text_view = new Gtk.TextView () {
            top_margin = 12,
            right_margin = 12,
            left_margin = 12,
            bottom_margin = 12,
            wrap_mode = Gtk.WrapMode.WORD_CHAR,
            hexpand = true,
            vexpand = true,
            valign = Gtk.Align.FILL,
        };

        var scroll_view = new Gtk.ScrolledWindow () {
            hscrollbar_policy = Gtk.PolicyType.NEVER,
            vscrollbar_policy = Gtk.PolicyType.AUTOMATIC,
            hexpand = true,
            vexpand = true,
            valign = Gtk.Align.FILL,
            child = this._text_view,
        };

        this._container = new Gtk.Box (Gtk.Orientation.VERTICAL, 0);
        this._container.hexpand = true;
        this._container.vexpand = true;
        this._container.valign = Gtk.Align.FILL;
        this._container.append (scroll_view);
        this._container.set_parent (this);
    }

    public MainView (Yate.MainWindow window) {
        Object (
            window: window
        );
    }

    ~MainView () {
        if (_container != null) {
            _container.unparent ();
        }
    }
}
