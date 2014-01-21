function js_audioPlayer(file,location) {
    jQuery("#jquery_jplayer_" + location).jPlayer( {
        ready: function () {
          jQuery(this).jPlayer("setMedia", {
        mp3: file
          });
        },
        cssSelectorAncestor: "#jp_interface_" + location,
    });
        return;
}