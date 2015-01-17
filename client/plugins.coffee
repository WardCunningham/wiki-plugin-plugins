
expand = (text)->
  text
    .replace /&/g, '&amp;'
    .replace /</g, '&lt;'
    .replace />/g, '&gt;'

report = (regex, done) ->
  $.getJSON "http:/system/plugins.json", (plugins) ->
    links = []
    for plugin in plugins
      links.push wiki.resolveLinks "[[about #{plugin} plugin]]" if plugin.match regex
    done links.join "<br>"

emit = ($item, item) ->

  display = (html) ->
    $item.append """
      <p style="background-color:#eee;padding:15px;">
        #{html}
      </p>
    """

  try
    regex = new RegExp item.text
  catch e
    display "<span class=error>#{expand e.message}</span>"
    return

  report regex, display

bind = ($item, item) ->
  $item.dblclick -> wiki.textEditor $item, item

window.plugins.plugins = {emit, bind} if window?
module.exports = {expand} if module?

