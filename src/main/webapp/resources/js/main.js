$(function () {
    $.main.init()
});
$.main = {
    init: function () {
        var a = this;
        a.pageCut();
        $(".fuyj-top a").on("click", function (c) {
            var b = $(this).html();
            $(this).addClass("on").siblings("a").removeClass("on");
            $("#guest_type").val(b)
        })
    }, pageCut: function () {
        var f = 0, a = false, d = false, c = false, i = {
            WebkitAnimation: "webkitAnimationEnd",
            OAnimation: "oAnimationEnd",
            msAnimation: "MSAnimationEnd",
            animation: "animationend"
        }, g = i[Modernizr.prefixed("animation")], h = Modernizr.cssanimations;
        console.log("test", g);
        $(".main .page").eq(f).addClass("cur");
        $(".main .page").each(function (k, l) {
            var j = $(this);
            j.data("originalClassList", "page")
        });
        $(".bar a").on("click", function (m) {
            var l = $(this).index();
            if (l != f && a == false) {
                a = true;
                var n = $(".main .page").eq(f), o = $(".main .page").eq(l).addClass("cur"), j = "", k = "";
                if (l > f) {
                    j = "page-fade";
                    k = "page-moveFromRight page-ontop"
                }
                if (l < f) {
                    j = "page-fade";
                    k = "page-moveFromLeft page-ontop"
                }
                n.addClass(j).on(g, function () {
                    n.off(g);
                    d = true;
                    if (c) {
                        e(n, o);
                        f = l
                    }
                });
                o.addClass(k).on(g, function () {
                    o.off(g);
                    c = true;
                    if (d) {
                        e(n, o);
                        f = l
                    }
                });
                $(".bar a").eq(l).addClass("cur").siblings("a").removeClass("cur");
                if (!h) {
                    e(n, o)
                }
            }
        });
        function e(k, j) {
            d = false;
            c = false;
            b(k, j);
            a = false
        }

        function b(k, j) {
            k.attr("class", k.data("originalClassList"));
            j.attr("class", j.data("originalClassList") + " cur")
        }
    }
};