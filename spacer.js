(function($) {
  $.fn.spacer = function(options) {
    var defaults, ele,
      _this = this;
    ele = this;
    defaults = {
      offset: 20,
      speed: 10
    };
    ele.downshift = false;
    ele.downctrl = false;
    ele.init = function() {
      /*
        - Get Windows Height?
        - Get Header Height
        - Calc Scroll Volume
      */

      ele.opts = $.extend({}, defaults, options);
      ele.windowheight = $(window).height();
      ele.headerheight = ele.height();
      return ele.scrollsize = ele.windowheight - ele.headerheight - ele.opts.offset;
    };
    ele.space = function(e) {
      /*
        - when push space or Shift Space
        - Kill Default event
        - get current scrolltop
        - move scroll
      */

      var posY, target;
      e.preventDefault();
      posY = $(window).scrollTop();
      if (ele.downshift) {
        target = posY - ele.scrollsize;
      } else {
        target = posY + ele.scrollsize;
      }
      $('html, body').animate({
        scrollTop: target
      }, ele.opts.speed);
    };
    $(document).keydown(function(e) {
      switch (e.keyCode) {
        case 16:
          return ele.downshift = true;
        case 17:
          return ele.downctrl = true;
        case 32:
          return ele.space(e);
      }
    });
    $(document).keyup(function(e) {
      switch (e.keyCode) {
        case 16:
          return ele.downshift = false;
        case 17:
          return ele.downctrl = false;
      }
    });
    $(window).resize(function(e) {
      return ele.init();
    });
    ele.init();
    return ele;
  };
})(jQuery);
