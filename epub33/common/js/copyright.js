function modifyCopyright() {
    // This is where the copyright statement resides...
    const p = document.querySelector("p.copyright");

    // get the years out of the text, because that can change...
    const index = p.textContent.search(/[0-9]{4}-[0-9]{4}/)
    const years = p.textContent.slice(index,index+9);

    // Replacement text
    p.innerHTML = `
    <a href="https://www.w3.org/Consortium/Legal/ipr-notice#Copyright">Copyright</a> © ${years}
    <a href="https://www.idpf.org">International Digital Publishing Forum</a> 
	and
    <a href="https://www.w3.org/">World Wide Web Consortium</a>.
    <abbr title="World Wide Web Consortium">W3C</abbr><sup>®</sup>
    <a href="https://www.w3.org/Consortium/Legal/ipr-notice#Legal_Disclaimer">liability</a>,
    <a href="https://www.w3.org/Consortium/Legal/ipr-notice#W3C_Trademarks">trademark</a> and
    <a rel="license" href="https://www.w3.org/Consortium/Legal/2015/copyright-software-and-document" title="W3C Software and Document Notice and License">permissive document license</a> rules apply.   
    `
}

// 1999-2022
