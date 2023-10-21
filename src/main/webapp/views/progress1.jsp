<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--amCharts 관련 CDN-->
<script src="https://cdn.amcharts.com/lib/4/core.js"></script>
<script src="https://cdn.amcharts.com/lib/4/charts.js"></script>
<script src="https://cdn.amcharts.com/lib/4/themes/material.js"></script>
<script src="https://cdn.amcharts.com/lib/4/lang/de_DE.js"></script>
<script src="https://cdn.amcharts.com/lib/4/geodata/germanyLow.js"></script>
<script src="https://cdn.amcharts.com/lib/4/fonts/notosans-sc.js"></script>

<!-- Resources -->
<script src="https://cdn.amcharts.com/lib/5/index.js"></script>
<script src="https://cdn.amcharts.com/lib/5/percent.js"></script>
<script src="https://cdn.amcharts.com/lib/5/themes/Animated.js"></script>

<!-- Styles -->
<style>
    #chartdiv1 {
        width: 50%;
        height: 250px;
    }
</style>



<!-- Chart code -->
<script>
    am5.ready(function() {

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
        series.appear(1000, 100);

    }); // end am5.ready()
</script>


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

                <div id="chartdiv1"></div>
                <c:forEach var="recent" items="${recent}">
                    <br/>${recent.date}
                    <br/>${recent.author}
                    <br/>${recent.message}
                    <br/>---------------
                </c:forEach>

            </form>
        </div>
    </div>
</div>


