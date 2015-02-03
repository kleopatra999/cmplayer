import QtQuick 2.0
import bomi 1.0 as B

B.Button {
    width: text.contentWidth; height: parent.height; text.color: "white"
    property int msecs: 0
    property int __secs: (msecs/1000.0) | 0
    property bool showMSecs: false
    function getText(msec, point) {
        var text = "";
        if (msec < 0) {
            msec = -msec;
            text += "-"
        }
        var hours = ~~(msec/3600000)
        msec = msec%3600000
        var mins = ~~(msec/60000)
        msec = msec%60000
        var secs = msec/1000;
        text += hours.toString();
        text += mins < 10 ? ":0" : ":";
        text += mins.toString();
        text += secs < 10 ? ":0" : ":";
        text += point ? secs.toFixed(3) : (secs | 0);
        return text;
    }
    text.content: getText(msecs, showMSecs)
    text.font { pixelSize: 10; family: Util.monospace }
}
