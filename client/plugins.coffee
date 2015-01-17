
expand = (text)->
  text
    .replace /&/g, '&amp;'
    .replace /</g, '&lt;'
    .replace />/g, '&gt;'
    .replace /\*(.+?)\*/g, '<i>$1</i>'

report = (done) ->
  $.getJSON "http:/system/plugins.json", (plugins) ->
    links = (wiki.resolveLinks "[[about #{plugin} plugin]]" for plugin in plugins)
    done links.join "<br>"

emit = ($item, item) ->
  report (html) ->
    $item.append """
      <p style="background-color:#eee;padding:15px;">
        #{html}
      </p>
    """

bind = ($item, item) ->
  $item.dblclick -> wiki.textEditor $item, item

window.plugins.plugins = {emit, bind} if window?
module.exports = {expand} if module?

