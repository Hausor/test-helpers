renderTemplate = (templateName, data_or_done, done = null) ->
  if done
    data = data_or_done
  else
    done = data_or_done
    data = {}
  div = document.createElement("div")
  Template[templateName].rendered = -> done()
  Blaze.renderWithData(Template[templateName], data , div)
  $(div)