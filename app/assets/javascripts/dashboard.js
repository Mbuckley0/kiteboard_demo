$(function () {
  'use strict';
  window.Dashboard = {
    init: function () {
      setTimeout(function () {
        Dashboard.getData();
        Dashboard.init();
      }, 1500);
    },

    getData: function () {
      $.getJSON($(location).attr('href') + 'dashboard.json').then(function (data) {
        Kiteboard.updateWidgets(data);
      });
    }
  };
});
