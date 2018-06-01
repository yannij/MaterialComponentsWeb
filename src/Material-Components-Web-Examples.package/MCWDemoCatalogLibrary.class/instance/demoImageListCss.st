uploaded
demoImageListCss

	^'
/* hero */

.mdc-image-list.hero-image-list {
    width: 300px;
    margin: 0;
}

.hero-image-list .mdc-image-list__image {
    background-color: #000;
}

.mdc-image-list.hero-image-list .mdc-image-list__item {
    width: calc(100% / 5 - 4.2px);
    margin: 2px;
}

/* Standard */

.mdc-image-list.standard-image-list .mdc-image-list__item {
    width: calc(100% / 5 - 4.2px);
    margin: 2px;
}

.mdc-image-list.standard-image-list .mdc-image-list__image-aspect-container {
    padding-bottom: calc(100% / 1.5);
}

.mdc-image-list.standard-image-list {
    max-width: 1000px;
}

/* Masonary */

.mdc-image-list.masonry-image-list {
    -webkit-column-count: 5;
    column-count: 5;
    -webkit-column-gap: 16px;
    column-gap: 16px;
    max-width: 1000px;
}

.mdc-image-list.masonry-image-list .mdc-image-list__item {
    margin-bottom: 16px;
}
'