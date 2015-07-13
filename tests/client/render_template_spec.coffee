describe 'renderTemplate', ->
  describe 'with context data as {}', ->
    beforeEach (done) ->
      @div = renderTemplate("testTemplate", {}, done)

    it 'renders template', ->
      expect(@div.text()).to.contain "test template"

  describe 'with context data ommited', ->
    beforeEach (done) ->
      @div = renderTemplate("testTemplate", done)

    it 'renders template', ->
      expect(@div.text()).to.contain "test template"

      
  describe 'with context data', ->
    beforeEach (done) ->
      @div = renderTemplate("testTemplate", {contextVar: "print this"}, done)

    it 'renders template with context data', ->
      expect(@div.text()).to.contain "print this"