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

function changeVerificationCode() {
    var img = document.getElementById("verificationCodeImage");
    img.src = "/verificationCode.do?s=" + Math.random();
}

function getCookie(cookie_name) {
    var allCookies = document.cookie;
    var cookie_pos = allCookies.indexOf(cookie_name);   // 如果找到了索引，就代表cookie存在
    if (cookie_pos != -1) {
        cookie_pos += cookie_name.length + 1;
        var cookie_end = allCookies.indexOf(";", cookie_pos);
        if (cookie_end == -1) {
            cookie_end = allCookies.length;
        }
        return unescape(allCookies.substring(cookie_pos, cookie_end));
    }
    return null;
}