$(document).ready(function () {
  $(document).on('click', '.sort_option', function () {
    params = {}
    if ($(this).next().find('.sort').is(':visible')) {
      var element = $(this).next().find('.sort');
      var classList = element.attr('class').split(/\s+/);
      if (classList.length == 1) {
        element.addClass('fa fa-caret-down')
        params["sort"] = 'desc'
      } else if (element.hasClass('fa-caret-up')) {
        element.removeClass('fa-caret-up').addClass('fa-caret-down');
        params["sort"] = 'desc'
      } else if (element.hasClass('fa-caret-down')) {
        element.removeClass('fa-caret-down').addClass('fa-caret-up');
        params["sort"] = 'asc'
      }
    }
    $('.sort').hide();
    $(this).next().find('.sort').show();
    params["field"] = $(this).text();
    var path = $('input[name="sort_path"]').data('path');
    $.get(path, params, null, 'script');
  });

  $('form.search-global').on('keyup keypress', function(e) {
    var keyCode = e.keyCode || e.which;
    if (keyCode === 13) {
      $('form.search-global').submit();
    }
  });
});