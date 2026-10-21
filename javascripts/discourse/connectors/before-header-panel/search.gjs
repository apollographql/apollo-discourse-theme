import { modifier } from "ember-modifier";

// Algolia libs are loaded from a CDN in desktop/header.html — not available on mobile.
const algoliaSearch = modifier((element) => {
  const autocompleteJs = window["@algolia/autocomplete-js"];
  const algolia = window["algoliasearch"];
  if (!autocompleteJs || !algolia) {
    return;
  }

  const { autocomplete, getAlgoliaResults } = autocompleteJs;
  const searchClient = algolia.algoliasearch(
    "Q0CJ63JM7B",
    "e6996c1be6825141605220623fb10646"
  );

  const search = autocomplete({
    // Pinned so the generated input id stays `autocomplete-0-input` across
    // re-renders — scss/algolia_autocomplete.scss styles that id.
    id: "autocomplete-0",
    container: element,
    panelContainer: "#autocomplete-panel-container",
    debug: false,
    openOnFocus: true,
    placeholder: "Search Apollo documentation, definitions, tutorials and more",
    insights: true,
    detachedMediaQuery: "none",
    defaultActiveItemId: 0,
    getSources({ query }) {
      return [
        {
          sourceId: "discourse",
          getItems() {
            return getAlgoliaResults({
              searchClient,
              queries: [
                {
                  indexName: "discourse",
                  query,
                  params: {
                    hitsPerPage: 6,
                    attributesToSnippet: ["cooked:25"],
                    snippetEllipsisText: "…",
                  },
                },
              ],
            });
          },
          templates: {
            header({ html }) {
              return html`<h2>Discourse Topics</h2>`;
            },
            item({ item, components, html }) {
              const url = `https://community.apollographql.com/t/${item.topic_slug}`;
              return html`<a href="${url}" class="aa-item">
                <h3>
                  ${components.Highlight({
                    hit: item,
                    attribute: "topicTitle",
                  })}
                </h3>
                <p>${components.Snippet({ hit: item, attribute: "cooked" })}</p>
              </a>`;
            },
          },
          getItemUrl({ item }) {
            return `https://community.apollographql.com/t/${item.topic_slug}`;
          },
        },
        {
          sourceId: "docs",
          getItems() {
            return getAlgoliaResults({
              searchClient,
              queries: [
                {
                  indexName: "docs",
                  query,
                  params: {
                    hitsPerPage: 3,
                    attributesToSnippet: ["text:25"],
                    snippetEllipsisText: "…",
                  },
                },
              ],
            });
          },
          templates: {
            header({ html }) {
              return html`<h2>Documentation</h2>`;
            },
            item({ item, components, html }) {
              return html`<a href="${item.url}" target="_blank" class="aa-item">
                <h3>${components.Highlight({
                  hit: item,
                  attribute: "title",
                })}</h3>
                <p>${components.Snippet({ hit: item, attribute: "text" })}</p>
              </a>`;
            },
            noResults() {
              return "Sorry, we couldn't find any result for your search.";
            },
          },
          getItemUrl({ item }) {
            return item.url;
          },
        },
        {
          sourceId: "apollopedia",
          getItems() {
            return getAlgoliaResults({
              searchClient,
              queries: [
                {
                  indexName: "apollopedia",
                  query,
                  params: {
                    hitsPerPage: 2,
                    filters: "internalOnly:false",
                  },
                },
              ],
            });
          },
          templates: {
            header({ html }) {
              return html`<h2>Definitions</h2>`;
            },
            item({ item, components, html }) {
              return html`<a href="${item.url}" target="_blank" class="aa-item">
                <h3>${components.Highlight({
                  hit: item,
                  attribute: "term",
                })}</h3>
                <p>${components.Snippet({ hit: item, attribute: "text" })}</p>
              </a>`;
            },
          },
          getItemUrl({ item }) {
            return item.url;
          },
        },
      ];
    },
  });

  return () => search.destroy();
});

<template>
  <div id="autocomplete" {{algoliaSearch}}></div>
  <div id="autocomplete-panel-container"></div>
</template>
