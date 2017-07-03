var width = 0, height = 0, selected, chart = "actors", showTrends = 0;

var parseTime = d3.timeParse("%Y-%m-%d");

function initStarpaths(data, ids) {
    //selected = d3.map();
    //showList();
    console.log('tata');
    selectPlayers(ids);
    drawAllCharts(data);
}

function drawAllCharts(data) {
    null != d3.selectAll("#graph") && d3.selectAll("#graph").remove();
    $("#graphHolder").html("");
    var a = {
        top: 50,
        right: 40,
        bottom: 0,
        left: 50
    };
    width = Math.round($(window).width() - 20 - $("#graphHolder").position().left) - a.left - a.right;
    $("#graphHolder").width(width);
    height = Math.round($(window).height() - 60 - $("#graphHolder").position().top) - a.top - a.bottom;
    $("#graphHolder").height(height);
    console.log('tata');
    var c = null;
    "actors" == chart ? c = actors : "directors" == chart ? c = directors : "composers" == chart && (c = composers);
    dataObject = [];
    var b = parseTime("2099-12-31")
    var d = parseTime("2000-01-01")
    c.forEach(function(a) {
        selected.has(a.id) && (dataObject.push(a),
        b = d3.min([b, d3.min(a.budget, function(a) {
            return a[0]
        })]),
        b = d3.min([b, d3.min(a.ratings, function(a) {
            return a[0]
        })]),
        d = d3.max([d, d3.max(a.budget, function(a) {
            return a[0]
        })]),
        d = d3.max([d, d3.max(a.ratings, function(a) {
            return a[0]
        })]))
    });
    b == 3E3 - yearOffset && (b = 1960 - yearOffset);
    d == 1E3 - yearOffset && (d = 2013 - yearOffset);
    var e = d3.scale.linear().domain([yearOffset + b - 1, yearOffset + d]).range([a.left, width]);
    drawChart(c, dataObject, "budget", "trend", e, "Million USD (considering inflation)", "Budget", "M$ (with inflation)", width, height, a);
}

function drawChart(a, c, b, d, e, m, n, p, q, g, f) {
    var h = d3.min(a, function(a) {
        return d3.min(a[b], function(a) {
            return a[1]
        })
    });
    a = d3.max(a, function(a) {
        return d3.max(a[b], function(a) {
            return a[1]
        })
    });
    var j = d3.scale.linear().domain([h, a]).range([g, 0])
    var k = d3.scale.category10().domain(c.map(function(a) { return a.id }))

    var h = d3.select("#graphHolder")
        .append("svg:svg")
        .attr("id", "graph")
        .attr("width", q + f.left + f.right)
        .attr("height", g + f.top + f.bottom)
        .attr("transform", "translate(" + f.left + "," + f.top + ")");

    a = make_x_axis(e);

    h.append("g")
        .attr("class", "grid")
        .attr("transform", "translate(0," + g + ")")
        .call(make_x_axis(e).tickSize(-g, 0, 0).tickFormat(""));

    h.append("g")
        .attr("class", "x axis")
        .attr("transform", "translate(0," + g + ")")
        .call(a)
        .append("text")
        .attr("x", q / 2)
        .attr("y", 20)
        .attr("dy", "1.5em")
        .style("text-anchor", "end")
        .text("Movie year");

    g = make_y_axis(j);

    h.append("g")
        .attr("class", "grid")
        .attr("transform", "translate(" + f.left + ",0)")
        .call(make_y_axis(j).tickSize(-(q - f.left), 0, 0).tickFormat(""));

    h.append("g")
        .attr("class", "y axis")
        .attr("transform", "translate(" + f.left + ",0)")
        .call(g)
        .append("text")
        .attr("transform", "rotate(-90)")
        .attr("y", -f.left).attr("dy", ".71em")
        .style("text-anchor", "end")
        .text(m);

    var r = d3.svg.line()
            .x(function(a) { return e(yearOffset + a[0])})
            .y(function(a) { return j(a[1]) })
            .interpolate("cardinal")
    var l = h.selectAll(".actor").data(c).enter().append("svg:g").attr("class", "actor");

    l.append("svg:path")
        .attr("d", function(a) { return r(a[b])})
        .attr("id", function(a) { return a.id })
        .attr("class", "actor")
        .attr("type", "budget")
        .style("stroke", function(a) { return k(a.id) });

    showTrends && l.append("svg:path")
        .attr("d", function(a) { return r(a[d])})
        .attr("id", function(a) { return a.id})
        .attr("class", "actor")
        .style("stroke-dasharray", "3, 3")
        .style("stroke", function(a) { return k(a.id) });

    l.append("svg:text")
        .attr("transform", function(a) {
            return "translate(" + (e(yearOffset + a[b][a[b].length - 1][0]) + 5) + "," + j(a[b][a[b].length - 1][1]) + ")"
        })
        .attr("x", 3).attr("dy", ".35em").attr("id", function(a) { return a.id })
        .attr("class", "actor").style("fill", function(a) { return k(a.id)})
        .text(function(a) { return a.name });

    c.forEach(function(a) { addPoints(a.id, l, e, j, a[b], n, p, k(a.id))})
}

function addPoints(a, c, b, d, e, m, n, p) {
    c.selectAll("data-point").data(e).enter().append("svg:circle").attr("class", "data-point").style("opacity", 1).style("stroke", p).attr("cx", function(a) {
        return b(yearOffset + a[0])
    }).attr("cy", function(a) {
        return d(a[1])
    }).attr("r", function() {
        return 4
    });
    $("svg circle").tipsy({
        gravity: "w",
        html: !0,
        title: function() {
            var a = this.__data__;
            return movies[a[2]] + "<br/>" + m + ": " + a[1] + " " + n
        }
    })
}
/*
function showList() {
    var a = null;
    "actors" == chart ? a = actors : "directors" == chart ? a = directors : "composers" == chart && (a = composers);
    var c = "";
    a.forEach(function(a) {
        c += "<option value='" + a.id + "'>" + a.name + "</option>"
    });
    $("#actor_list").html("<select id='actor_selector' size='20' multiple>" + c + "</select>");
    $("#actor_selector").change(function() {
        selectActors($(this).val())
    })
}*/
function selectPlayers(a) {
    null != a && (selected = d3.map(),
    a.forEach(function(a) {
        selected.set(a, 1)
    }),
    drawAllCharts())
}
function chartChange(a) {
    chart = a;
    initStarpaths()
}
function toggleTrends() {
    showTrends = $("#trend_checkbox").is(":checked") ? !0 : !1;
    drawAllCharts()
}
function make_x_axis(a) {
    return d3.svg.axis().scale(a).orient("bottom").ticks(10).tickFormat(d3.format("0000"))
}
function make_y_axis(a) {
    return d3.svg.axis().scale(a).orient("left").ticks(20)
}
function about() {
    $("#about").dialog("open");
    return !1
}
