import {GoogleCharts} from 'google-charts';

//Load the charts library with a callback
GoogleCharts.load(drawCharts);

function drawCharts() {
  const charts = document.querySelectorAll('.chart1');
  charts.forEach((item) => {
    google.charts.setOnLoadCallback(drawChart(item));
  });
}


function drawChart(item) {
  const chartData = JSON.parse(item.dataset.chart);
  // console.log(chartData);
    // Standard google charts functionality is available as GoogleCharts.api after load
    const data = GoogleCharts.api.visualization.arrayToDataTable(chartData);

    const options = {
        title: 'Your next 12 months',
        width: 900,
        height: 300,
        legend: { position: 'top', maxLines: 3 },
        bar: { groupWidth: '60%' },
        colors: ['#32B796', '#E67E22'],
        isStacked: true,
      };
    const chart = new GoogleCharts.api.visualization.ColumnChart(item);
    chart.draw(data, options);
}
