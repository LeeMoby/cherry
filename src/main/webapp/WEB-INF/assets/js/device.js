var device = {
    URL : {
        get : function (tab) { // index, multimedia, network, other, safety, server, storage
            return "/device/" + tab + "/list";
        },
        add : function (deviceType) { // multimedia, network, other, safety, server, storage
            return "/device/" + deviceType + "/add";
        },
        update : function (deviceType, deviceId) { // multimedia, network, other, safety, server, storage
            return "/device/" + deviceType + "/update/" + deviceId;
        },
        del : function (deviceType, deviceId) { // multimedia, network, other, safety, server, storage
            return "/device/" + deviceType + "/del/" + deviceId;
        }
    },
    // 页面初始化
    handleInit : function (tab) {
        $.post(device.URL.get(tab), {}, function(result) {

        })
    }
}