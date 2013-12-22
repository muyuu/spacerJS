( ($)->
  $.fn.spacer = (options) ->

    ele = @
    defaults =
      offset: 20
      speed: 10

    ele.downshift = false
    ele.downctrl = false

    ele.init = ()=>
      ###
        - Get Windows Height?
        - Get Header Height
        - Calc Scroll Volume
      ###

      # option
      ele.opts = $.extend({}, defaults, options)

      ele.windowheight = $(window).height()
      ele.headerheight = ele.height()
      ele.scrollsize = ele.windowheight - ele.headerheight - ele.opts.offset

    ele.space = (e)->
      ###
        - when push space or Shift Space
        - Kill Default event
        - get current scrolltop
        - move scroll
      ###
      e.preventDefault()

      posY = $(window).scrollTop()

      if ele.downshift
        target = posY - ele.scrollsize
      else
        target = posY + ele.scrollsize

      $('html, body').animate scrollTop:target, ele.opts.speed

      return


    $(document).keydown (e)->
      switch e.keyCode
        when 16 then ele.downshift = true
        when 17 then ele.downctrl = true
        when 32 then ele.space e


    $(document).keyup (e)->
      switch e.keyCode
        when 16 then ele.downshift = false
        when 17 then ele.downctrl = false

    $(window).resize (e)->
      ele.init()

    ele.init()

    return ele
  return
) jQuery



