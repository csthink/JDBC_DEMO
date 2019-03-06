// 获取当前时间 "YYYY-mm-dd"
function currentTime() {
    var now = new Date();
    var year = now.getFullYear();       // 年
    var month = now.getMonth() + 1;     // 月
    var day = now.getDate();            // 日
    var clock = year + "-";

    if (month < 10) {
        clock += "0";
    }
    clock += month + "-";

    if (day < 10) {
        clock += "0";
    }
    clock += day + " ";

    return clock;
}