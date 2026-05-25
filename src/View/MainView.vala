public class Yate.MainView : Gtk.Widget {
    private Gtk.Box _container;
    private Gtk.Label _label;
    private Gtk.Button _button;

    class construct {
        set_layout_manager_type (typeof (Gtk.BoxLayout));
    }

    construct {
        this._label = new Gtk.Label ("Hello World!");
        this._label.hexpand = this._label.vexpand = true;
        this._button = new Gtk.Button.with_label ("Click Me!");

        this._button.clicked.connect (handle_button_click);

        this._container = new Gtk.Box (Gtk.Orientation.VERTICAL, 0);
        this._container.append (this._label);
        this._container.append (this._button);
        this._container.set_parent (this);
    }

    private void handle_button_click (Gtk.Widget _widget) {
        var str = this._label.label;
        var temp_str = str.reverse ();
        this._label.label = temp_str;
    }

    ~MainView () {
        if (_container != null) {
            _container.unparent ();
        }
    }
}
