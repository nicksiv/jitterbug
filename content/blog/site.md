# Web site
> 20240106

Probably <https://indict.us> if domain is kept and <https://zesty-jelly-086ff0.netlify.app/>

## Notes on sections
* About (meta, about me, uses this, now)
* Logs (films, places photolog, journal/blog)
* Music [?] (albums, mymusic)
* Tech (software, OS, videogames)
* Visual Arts [?] (films, drawings, photography, videogames)

## Todo
* [x] Add blog entries from 2017 to 2021 (at least one)
* [x] Clear CSS file 
* [x] Add vim function to insert yaml front matter including public tag and lastmod
* [x] Update blogroll, fewer items and move from other folder
* [x] CSS mobile site modifications
* [x] Remove all content folders and images that are not part of the site anymore
* [x] Convert updateblog alias to a script for further development (make sure you get a list of public md that will be copied)
* [x] CSS: Minimize all css to the absolute necessary
* [x] Create a blog deploy alias
* [x] Fix/Customize hugo's sitemap and resubmit to google console?
* Fix markdown links to hugo links when copying content
* [x] CSS: Fix mobile images (narrower)
* [ ] CSS: Style images with border, round corners or polaroid like 
* CSS: Add styling for table of contents (link in blog page). Add specific HTML tag in md files (HTML is removed. why?)
* Automate image reduction to 640 width (imagemagick)
  `convert -resize 640 ~/indictus/zk24/images/private/artworks/art01-unique04.jpg ~/indictus/zk24/images/art01-06.jpg`
* Galleries: consider using https://hugocodex.org/add-ons/image-gallery/
* Consider adding config files to git and insert links to site
* CSS: Maybe use custom TW svg icons for lists of posts (icon to be used taken from page's yaml)
* Consider using some kind of database for movies/albums
* Bash script to add backlinks list to each page

## Pages Actions
* [x] Films: Make a private page with all films. In the public pages list 3-5 movies for each year
* [x] Films: Add info & images for the best film of each year (hugo sees: ../../images/file.xxx) 640x272
* [x] about: move to zk/blog folder as meta w/ sections: about, meta, uses
* [x] Artworks: Add existing images in a gallery style page
* [ ] Home: List last 5 by modification date (latest changes)
* [ ] Home: List all tags after applying at least one tag except #pub to every page
* Tag page: Style and make better (_default/list.html)
* about: Add a selfie photo as profile picture
* about: consider this as a template https://justinmiller.io/about/
* Software page: Add links to some software entries (tw, tmux) and make new pages for them
* My music: Create at least 2 tracks (minimal synth) to have such a page. Later maybe add older tracks
* Artworks: Later scan more artworks
* Artworks: Begin creating new series: Songs drawings
* Photolog page: Add gallery style photos from trips
* Now page: Create and link from about

## Emacs
* Macro to insert markdown image
* Maybe try to use org-download to get images?
* Macro for YAML insertion, or create directly md file with default YAML

## References
* <https://search.google.com/search-console/sitemaps?resource_id=sc-domain%3Aindict.us>
