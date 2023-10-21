<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!--amCharts 관련 CDN-->
<script src="https://cdn.amcharts.com/lib/4/core.js"></script>
<script src="https://cdn.amcharts.com/lib/4/charts.js"></script>
<script src="https://cdn.amcharts.com/lib/4/themes/material.js"></script>
<script src="https://cdn.amcharts.com/lib/4/lang/de_DE.js"></script>
<script src="https://cdn.amcharts.com/lib/4/geodata/germanyLow.js"></script>
<script src="https://cdn.amcharts.com/lib/4/fonts/notosans-sc.js"></script>
<!-- Resources -->
<script src="https://cdn.amcharts.com/lib/5/index.js"></script>
<script src="https://cdn.amcharts.com/lib/5/xy.js"></script>
<script src="https://cdn.amcharts.com/lib/5/themes/Animated.js"></script>

<!-- Resources -->
<script src="https://cdn.amcharts.com/lib/5/percent.js"></script>

<style>
    #chartdiv {
        width: 100%;
        height: 600px;
    }

    #chartdiv1 {
        width: 63%;
        height: 300px;
    }

    canvas  {
        margin: auto 0;
    }
</style>

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

        // Create root element
// https://www.amcharts.com/docs/v5/getting-started/#Root_element
        var root1 = am5.Root.new("chartdiv1");

// Set themes
// https://www.amcharts.com/docs/v5/concepts/themes/
        root1.setThemes([
            am5themes_Animated.new(root1)
        ]);

// Create chart
// https://www.amcharts.com/docs/v5/charts/percent-charts/pie-chart/
// start and end angle must be set both for chart and series
        var chart1 = root1.container.children.push(am5percent.PieChart.new(root1, {
            startAngle: 180,
            endAngle: 360,
            layout: root1.verticalLayout,
            innerRadius: am5.percent(50)
        }));

// Create series
// https://www.amcharts.com/docs/v5/charts/percent-charts/pie-chart/#Series
// start and end angle must be set both for chart and series
        var series1 = chart1.series.push(am5percent.PieSeries.new(root1, {
            startAngle: 180,
            endAngle: 360,
            valueField: "value",
            categoryField: "category",
            alignLabels: false
        }));

        series1.states.create("hidden", {
            startAngle: 180,
            endAngle: 180
        });

        series1.slices.template.setAll({
            cornerRadius: 5
        });

        series1.ticks.template.setAll({
            forceHidden: true
        });

// Set data
// https://www.amcharts.com/docs/v5/charts/percent-charts/pie-chart/#Setting_data
        series1.data.setAll([
            <c:forEach var="lang" items="${lang}">
            { value: ${lang.bytes}, category: "${lang.language}" },
            </c:forEach>
        ]);




    }); // end am5.ready()
</script>


<div class="carousel slide" id="carouselExampleControls" data-ride="carousel">
    <ol class="carousel-indicators">
        <li class="active" data-target="#carouselExampleControls" data-slide-to="0"></li>
    </ol>
    <div class="carousel-inner rounded"   style="padding-top: 4%;">
        <div class="carousel-item active"><img class="d-block w-100" src="/assets/img/banner/banner_4.png" alt="First slide" /></div>
    </div>
</div>
<div class="content col-xxl-9" style="margin: auto;">
    <!-- style="margin-left: 16.25rem-->
    <div style="margin-top: 0.9rem;">
        <div class="card body p-3 pt-3">
            <div class="mb-7">
                <h3>
                    <span class="text-success" style="font-size: 0.8rem;">Git-Hub 연동</span><br/>
                    <label class="form-label text-700" for="chartdiv">기여도 현황</label><br/>
                    <span class="text-success"style="font-size: 0.7rem;">
                            <span class="svg-icon svg-icon-danger svg-icon-2hx">
                                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M9.89557 13.4982L7.79487 11.2651C7.26967 10.7068 6.38251 10.7068 5.85731 11.2651C5.37559
                                    11.7772 5.37559 12.5757 5.85731 13.0878L9.74989 17.2257C10.1448 17.6455 10.8118 17.6455 11.2066
                                    17.2257L18.1427 9.85252C18.6244 9.34044 18.6244 8.54191 18.1427 8.02984C17.6175 7.47154 16.7303
                                    7.47154 16.2051 8.02984L11.061 13.4982C10.7451 13.834 10.2115 13.834 9.89557 13.4982Z" fill="currentColor"/>
                                </svg>
                            </span>
                        프로젝트 정보에 등록된 GITHUB Repository의 Commit 기반으로 팀원의 기여도를 한 눈에 알아보세요!</span><br/>
                </h3>
                <div class="mb-1">
                    <div id="chartdiv"></div>
                </div>
            </div>
            <div class="mb-7">
                <h3>
                    <span class="text-success" style="font-size: 0.8rem;">Git-Hub 연동</span><br/>
                    <label class="form-label text-700" for="chartdiv">사용 언어 집계</label><br/>
                    <span class="text-success"style="font-size: 0.7rem;">
                            <span class="svg-icon svg-icon-danger svg-icon-2hx">
                                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M9.89557 13.4982L7.79487 11.2651C7.26967 10.7068 6.38251 10.7068 5.85731 11.2651C5.37559
                                    11.7772 5.37559 12.5757 5.85731 13.0878L9.74989 17.2257C10.1448 17.6455 10.8118 17.6455 11.2066
                                    17.2257L18.1427 9.85252C18.6244 9.34044 18.6244 8.54191 18.1427 8.02984C17.6175 7.47154 16.7303
                                    7.47154 16.2051 8.02984L11.061 13.4982C10.7451 13.834 10.2115 13.834 9.89557 13.4982Z" fill="currentColor"/>
                                </svg>
                            </span>
                        프로젝트 정보에 등록된 GITHUB Repository의 코드 분석을 통한 사용 언어 통계를 확인하세요!</span><br/>
                </h3>
                <div class="mb-1" style="width: 100%; margin: auto 0; display: flex; justify-content: center; text-align: center; align-items: center;">
                    <div class="pl-3 bg-success text-white rounded" style="width: 27%; text-align: left; font-weight: bolder;">
                        <c:forEach var="lang" items="${lang}">
                            <fmt:formatNumber type="number" pattern="#,###" value="${lang.bytes}" var="formattedBytes"/>
                            <br/>${lang.language} : ${formattedBytes}
                        </c:forEach>
                    </div>
                    <div id="chartdiv1"></div>
                </div>
            </div>
            <div class="mb-7" style="margin: auto 0;">
                <h3>
                    <span class="text-success" style="font-size: 0.8rem;">Git-Hub 연동</span><br/>
                    <label class="form-label text-700" for="chartdiv">사용 언어 집계</label><br/>
                    <span class="text-success"style="font-size: 0.7rem;">
                            <span class="svg-icon svg-icon-danger svg-icon-2hx">
                                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M9.89557 13.4982L7.79487 11.2651C7.26967 10.7068 6.38251 10.7068 5.85731 11.2651C5.37559
                                    11.7772 5.37559 12.5757 5.85731 13.0878L9.74989 17.2257C10.1448 17.6455 10.8118 17.6455 11.2066
                                    17.2257L18.1427 9.85252C18.6244 9.34044 18.6244 8.54191 18.1427 8.02984C17.6175 7.47154 16.7303
                                    7.47154 16.2051 8.02984L11.061 13.4982C10.7451 13.834 10.2115 13.834 9.89557 13.4982Z" fill="currentColor"/>
                                </svg>
                            </span>
                        프로젝트 정보에 등록된 GITHUB Repository의 코드 분석을 통한 사용 언어 통계를 확인하세요!</span><br/>
                </h3>
                <div class="mb-1" style="width: 70%; margin: auto 0;">
                    <c:forEach var="recent" items="${recent}">
                        <div style="display: flex; justify-content: center;">
                            <div style="width: 60%;" >
                                ${recent.author}
                                <br/>${recent.message}
                            </div>
                            <div style="width: 10%;">
                                ${recent.date}
                             </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            </form>
        </div>
    </div>
</div>


