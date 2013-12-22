(function() {
  $('.fixedNav').spacer();
  return $("#toggleclass").bind("click", function() {
    return $('.fixedNav').spacer({
      off: true
    });
  });
})();
