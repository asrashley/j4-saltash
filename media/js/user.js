Joomla = window.Joomla || {};

(function (Joomla, document) {
    'use strict';
    function parentsUntil(elt, classRe) {
        var p = elt.parentNode;

        console.log(p);
        while (p) {
            if (classRe.test(p.className)) {
                break;
            }
            p = p.parentNode;
            console.log(p);
        }
        console.log(p);
        return p;
    }

    function addBackgroundImages() {
        document.querySelectorAll('img.background').forEach(function (elt) {
            var src, blog;

            src = elt.getAttribute("src");
            console.log(src);
            blog = parentsUntil(elt, /ev_td_right|blog-item/);
            if (!blog) {
                return;
            }
            blog.style.backgroundColor = 'white';
            blog.style.backgroundImage = 'url(' + src + ')';
            blog.style.backgroundRepeat = 'none';
            blog.style.backgroundSize = '100% 100%';
            blog.className += ' has-background';
            elt.parentNode.removeChild(elt);
        });
    }
    console.log('loaded user.js');
    addBackgroundImages();
    setTimeout(addBackgroundImages, 500);
    document.addEventListener('joomla:updated', addBackgroundImages);

})(Joomla, document);
