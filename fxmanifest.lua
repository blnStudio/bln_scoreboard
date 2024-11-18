fx_version "adamant"
games {"rdr3"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
lua54 'yes'

version '1.0.0'
author 'BLN Studio <bln.tebex.io>'

client_scripts {
    'client/*.lua'
}

shared_scripts {
    'shared/*.lua'
}

server_scripts {
    'server/*.lua'
}

ui_page('ui/index.html')

files({
	"ui/vendor/vue.js",
	"ui/assets/js/*.js",
	"ui/assets/css/*.css",
	"ui/assets/imgs/*.png",
	"ui/assets/imgs/*.svg",
	"ui/assets/fonts/crock.ttf",
	"ui/assets/fonts/rdrlino-regular-webfont.woff",
	"ui/index.html",
})

dependencies {
	'bln_lib',
}