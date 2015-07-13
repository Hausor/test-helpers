@renderTemplate = (templateName, data, done) ->
  div = document.createElement("div")
  Template[templateName].rendered = -> done()
  Blaze.renderWithData(Template[templateName], data , div)
  $(div)