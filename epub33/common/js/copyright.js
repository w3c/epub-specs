function modifyCopyright(utils, content, url) {
	// find the place to put the current year
    return content.replace("%thisyear%", (new Date()).getFullYear());
}

// 1999-2022
