;; build-site.el --- Org-publish configuration for pdelfino.com.br -*- lexical-binding: t; -*-

(require 'package)
(setq package-user-dir (expand-file-name "./.packages"))
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                          ("elpa" . "https://elpa.gnu.org/packages/")))

;; Initialize the package system
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Install htmlize for syntax highlighting in code blocks
(package-install 'htmlize)

(require 'ox-publish)

;; Customize HTML output for Tufte CSS compatibility
(setq org-html-validation-link nil
      org-html-head-include-scripts nil
      org-html-head-include-default-style nil
      org-html-doctype "html5"
      org-html-html5-fancy t)

;; Use <article> as content wrapper and <section> as container element
;; so Tufte CSS selectors (article, section > p, etc.) work without CSS changes
(setq org-html-divs '((preamble "div" "preamble")
                       (content "article" "content")
                       (postamble "div" "postamble")))
(setq org-html-container-element "section")

;; Define the publishing project
(setq org-publish-project-alist
      (list
       (list "blog-content"
             :base-directory "./"
             :base-extension "org"
             :publishing-directory "./public/"
             :publishing-function 'org-html-publish-to-html
             :recursive t
             :exclude "rascunhos-org\\|rascunhos-markdown\\|resenhas\\|my-lisp-journey\\|vetustup\\|lugares-que-mergulhei\\|nomade/day-[1-9]\\|nomade/PAQ\\|nomade/places-to-surf"
             :with-author nil
             :with-creator nil
             :with-toc nil
             :section-numbers nil
             :time-stamp-file nil

             :html-head "<link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css\" crossorigin=\"anonymous\">
<link rel=\"stylesheet\" href=\"/tufte.css\" />
<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">
<style>
  article > p, article > footer, article > table { width: 55%; }
  article > dl, article > ol, article > ul { width: 50%; -webkit-padding-start: 5%; }
  #preamble { text-align: left; }
  @media (max-width: 760px) {
    article > p, article > footer, article > table { width: 90%; }
    article > dl, article > ol, article > ul { width: 90%; }
    .topnav { width: 90%; }
  }
</style>
<script async src=\"https://www.googletagmanager.com/gtag/js?id=G-H65WQEW9TH\"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'G-H65WQEW9TH');
</script>
<link rel=\"icon\" href=\"/img/favicon.svg\" type=\"image/svg+xml\" />"

             :html-preamble "<div style=\"padding-top: 1.5rem;\">
  <a href=\"https://www.pdelfino.com.br\" style=\"font-family: et-book, Palatino, serif; font-size: 1.4rem; text-decoration: none;\">Home</a>
</div>"

             :html-postamble "<form class=\"newsletter-form\" action=\"https://tinyletter.com/pdelfino\"
      method=\"post\" target=\"popupwindow\"
      onsubmit=\"window.open('https://tinyletter.com/pdelfino', 'popupwindow', 'scrollbars=yes,width=800,height=600');return true\">
  <p><label for=\"tlemail\"><i>Newsletter</i></label></p>
  <p><input type=\"email\" name=\"email\" id=\"tlemail\" /></p>
  <input type=\"hidden\" value=\"1\" name=\"embed\" />
  <button type=\"submit\"><span class=\"fa fa-paper-plane\"> Assinar</span></button>
</form>")

       (list "blog-static"
             :base-directory "./"
             :base-extension "css\\|js\\|png\\|jpg\\|jpeg\\|gif\\|svg\\|woff\\|woff2\\|ttf\\|eot"
             :publishing-directory "./public/"
             :recursive t
             :exclude "rascunhos-org\\|rascunhos-markdown\\|resenhas\\|\\.packages\\|public"
             :publishing-function 'org-publish-attachment)

       (list "blog" :components '("blog-content" "blog-static"))))

;; Generate the site output
(org-publish-all t)

(message "Build complete!")
