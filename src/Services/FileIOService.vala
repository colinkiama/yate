public class Yate.FileIOService : GLib.Object {
    private static GLib.Once<Yate.FileIOService> _instance;

    public static unowned Yate.FileIOService instance () {
        return _instance.once (() => { return new Yate.FileIOService (); });
    }

    private FileIOService () {

    }

    public async string load_file_from_dialog (
        Gtk.Window window,
        GLib.Cancellable? cancellable = null
    ) throws GLib.Error {
        var file_dialog = new Gtk.FileDialog () {
            title = "Open File"
        };
        string output_text = "";
        file_dialog.open.begin (window, cancellable, (obj, res) => {
            var file = file_dialog.open.end (res);
            uint8[] contents;
            file.load_contents (null, out contents, null);
            output_text = (string) contents;
        });

        return output_text;
    }
}
