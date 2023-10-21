<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--amCharts 관련 CDN-->
<script src="https://cdn.amcharts.com/lib/4/core.js"></script>
<script src="https://cdn.amcharts.com/lib/4/charts.js"></script>
<script src="https://cdn.amcharts.com/lib/4/themes/material.js"></script>
<script src="https://cdn.amcharts.com/lib/4/lang/de_DE.js"></script>
<script src="https://cdn.amcharts.com/lib/4/geodata/germanyLow.js"></script>
<script src="https://cdn.amcharts.com/lib/4/fonts/notosans-sc.js"></script>

<style>
    #chartdiv {
        width: 100%;
        height: 600px;
    }
</style>

<!-- Resources -->
<script src="https://cdn.amcharts.com/lib/5/index.js"></script>
<script src="https://cdn.amcharts.com/lib/5/xy.js"></script>
<script src="https://cdn.amcharts.com/lib/5/themes/Animated.js"></script>

<!-- Chart code -->
<script>
    am5.ready(function() {

// Create root element
// https://www.amcharts.com/docs/v5/getting-started/#Root_element
        var root = am5.Root.new("chartdiv");

// Set themes
// https://www.amcharts.com/docs/v5/concepts/themes/
        root.setThemes([
            am5themes_Animated.new(root)
        ]);

        var data = [
            <c:forEach var="branch" items="${branch}">
            {
                name: "${branch.branch}",
                steps: ${branch.contributions},
                pictureSettings: {
                    src: "/kbmaestro/${branch.branch}.png"
                }
            },
            </c:forEach>
            // {
            //     name: "member2",
            //     steps: 31,
            //     pictureSettings: {
            //         src: "/assets/img/logos/KBmaestro.png"
            //     }
            // },
            // {
            //     name: "member3",
            //     steps: 13,
            //     pictureSettings: {
            //         src: "/assets/img/logos/KBmaestro.png"
            //     }
            // },
            // {
            //     name: "member4",
            //     steps: 9,
            //     pictureSettings: {
            //         src: "/assets/img/logos/KBmaestro.png"
            //     }
            // }
        ];

// Create chart
// https://www.amcharts.com/docs/v5/charts/xy-chart/
        var chart = root.container.children.push(
            am5xy.XYChart.new(root, {
                panX: false,
                panY: false,
                wheelX: "none",
                wheelY: "none",
                paddingLeft: 50,
                paddingRight: 40
            })
        );

// Create axes
// https://www.amcharts.com/docs/v5/charts/xy-chart/axes/

        var yRenderer = am5xy.AxisRendererY.new(root, {});
        yRenderer.grid.template.set("visible", false);

        var yAxis = chart.yAxes.push(
            am5xy.CategoryAxis.new(root, {
                categoryField: "name",
                renderer: yRenderer,
                paddingRight:40
            })
        );

        var xRenderer = am5xy.AxisRendererX.new(root, {});
        xRenderer.grid.template.set("strokeDasharray", [3]);

        var xAxis = chart.xAxes.push(
            am5xy.ValueAxis.new(root, {
                min: 0,
                renderer: xRenderer
            })
        );

// Add series
// https://www.amcharts.com/docs/v5/charts/xy-chart/series/
        var series = chart.series.push(
            am5xy.ColumnSeries.new(root, {
                name: "Income",
                xAxis: xAxis,
                yAxis: yAxis,
                valueXField: "steps",
                categoryYField: "name",
                sequencedInterpolation: true,
                calculateAggregates: true,
                maskBullets: false,
                tooltip: am5.Tooltip.new(root, {
                    dy: -30,
                    pointerOrientation: "vertical",
                    labelText: "{valueX}"
                })
            })
        );

        series.columns.template.setAll({
            strokeOpacity: 0,
            cornerRadiusBR: 10,
            cornerRadiusTR: 10,
            cornerRadiusBL: 10,
            cornerRadiusTL: 10,
            maxHeight: 50,
            fillOpacity: 0.8
        });

        var currentlyHovered;

        series.columns.template.events.on("pointerover", function(e) {
            handleHover(e.target.dataItem);
        });

        series.columns.template.events.on("pointerout", function(e) {
            handleOut();
        });

        function handleHover(dataItem) {
            if (dataItem && currentlyHovered != dataItem) {
                handleOut();
                currentlyHovered = dataItem;
                var bullet = dataItem.bullets[0];
                bullet.animate({
                    key: "locationX",
                    to: 1,
                    duration: 600,
                    easing: am5.ease.out(am5.ease.cubic)
                });
            }
        }

        function handleOut() {
            if (currentlyHovered) {
                var bullet = currentlyHovered.bullets[0];
                bullet.animate({
                    key: "locationX",
                    to: 0,
                    duration: 600,
                    easing: am5.ease.out(am5.ease.cubic)
                });
            }
        }


        var circleTemplate = am5.Template.new({});

        series.bullets.push(function(root, series, dataItem) {
            var bulletContainer = am5.Container.new(root, {});
            var circle = bulletContainer.children.push(
                am5.Circle.new(
                    root,
                    {
                        radius: 34
                    },
                    circleTemplate
                )
            );

            var maskCircle = bulletContainer.children.push(
                am5.Circle.new(root, { radius: 27 })
            );

            // only containers can be masked, so we add image to another container
            var imageContainer = bulletContainer.children.push(
                am5.Container.new(root, {
                    mask: maskCircle
                })
            );

            // not working
            var image = imageContainer.children.push(
                am5.Picture.new(root, {
                    templateField: "pictureSettings",
                    centerX: am5.p50,
                    centerY: am5.p50,
                    width: 60,
                    height: 60
                })
            );

            return am5.Bullet.new(root, {
                locationX: 0,
                sprite: bulletContainer
            });
        });

// heatrule
        series.set("heatRules", [
            {
                dataField: "valueX",
                min: am5.color(0xf9f8d6),
                max: am5.color(0x54e7a9),
                target: series.columns.template,
                key: "fill"
            },
            {
                dataField: "valueX",
                min: am5.color(0xf9f8d6),
                max: am5.color(0x54e7a9),
                target: circleTemplate,
                key: "fill"
            }
        ]);

        series.data.setAll(data);
        yAxis.data.setAll(data);

        var cursor = chart.set("cursor", am5xy.XYCursor.new(root, {}));
        cursor.lineX.set("visible", false);
        cursor.lineY.set("visible", false);

        cursor.events.on("cursormoved", function() {
            var dataItem = series.get("tooltip").dataItem;
            if (dataItem) {
                handleHover(dataItem)
            }
            else {
                handleOut();
            }
        })

// Make stuff animate on load
// https://www.amcharts.com/docs/v5/concepts/animations/
        series.appear();
        chart.appear(1000, 100);

    }); // end am5.ready()
</script>

<!-- HTML -->



<div class="text-white bg-success" style="width: 100%; max-width: 100%;">
    <div class="content col-xxl-9" style="padding: 6.5rem 0 2rem 0; width: 100%; max-width: 1200px; margin: 0 auto;">
        <p class="text-white text-900" style="font-size: 1.5rem; font-weight: bolder;">프로젝트 생성
            <br/><span style="font-size: 0.9rem; font-weight: revert;">만들고 싶은 프로젝트가 있다면 KB Maestro와 같이 하나씩 정리해봐요!</span>
        </p>
    </div>
</div>
<div class="content col-xxl-9" style="margin: auto;">
    <!-- style="margin-left: 16.25rem-->
    <div style="margin-top: 0.9rem;">
        <div class="card body p-3 pt-3">
            <form>
                여기내용
                <input id="title"
                       class="form-control"
                       name="title"
                       placeholder="3-20글자로 적어주세요  예) KB마에스트로"
                />

                <div id="chartdiv"></div>
                <c:forEach var="recent" items="${recent}">
                    <br/>${recent.date}
                    <br/>${recent.author}
                    <br/>${recent.message}
                    <br/>---------------
                </c:forEach>



                <c:forEach var="lang" items="${lang}">
                    <br/>${lang.bytes}
                    <br/>${lang.language}
                    <br/>---------------
                </c:forEach>

                <c:forEach var="branch" items="${branch}">
                    <br/>${branch.branch}
                    <br/>${branch.contributions}
                    <br/>---------------
                </c:forEach>



            </form>
        </div>
    </div>
</div>


