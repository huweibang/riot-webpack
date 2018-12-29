var languageTemp = 'kr'

function i18n(lang){
    languageTemp = lang
    $.i18n.properties({
        name:'lang', 
        path:'/assets', 
        mode:'both',
        language:lang,
        async: true,
        callback: translateAction
    })
}
var translateAction = function(){
    Interface.UI.language = languageTemp
    riot.update()
    $('[data-translate]').each(function(){
        $(this).text($.i18n.map[this.dataset.translate])
    })
    Interface.UI.trigger('translateAssiant')
    riot.update()
}

module.exports = {
    i18n
}