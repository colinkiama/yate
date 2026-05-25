namespace Yate.ShortcutUtils {
    public static string platform_ctrl () {
        #if DARWIN
        return "<Meta>";
        #else
        return "<Control>";
        #endif
    }
}
