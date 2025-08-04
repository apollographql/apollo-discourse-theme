import { apiInitializer } from "discourse/lib/api";

export default apiInitializer("1.8.0", (api) => {
   console.log("hello world from api initializer!");

   api.replaceIcon('bars', 'apollo-menu');
   api.replaceIcon('d-chat', 'apollo-message-circle');
   api.replaceIcon('d-liked', 'apollo-heart');
   api.replaceIcon('user', 'apollo-user');
   api.replaceIcon('magnifying-glass', 'apollo-search');
   api.replaceIcon('layer-group', 'apollo-hash');
   api.replaceIcon('list-check', 'apollo-hash');
   api.replaceIcon('wrench', 'apollo-sliders');
   api.replaceIcon('ellipsis-vertical', 'apollo-more-vertical');
   api.replaceIcon('ellipsis', 'apollo-more-horizontal');

   api.replaceIcon('paper-plane', 'apollo-user-plus');
   api.replaceIcon('inbox', 'apollo-inbox');
   api.replaceIcon('lock', 'apollo-lock');
   api.replaceIcon('flag', 'apollo-flag');
   api.replaceIcon('sidebar.all_categories', 'apollo-list');
   api.replaceIcon('thumbtack', 'apollo-bookmark');
   api.replaceIcon('tag', 'apollo-tag');
   api.replaceIcon('link', 'apollo-link');
   api.replaceIcon('check', 'apollo-check');
   api.replaceIcon('plus', 'apollo-plus');
   api.replaceIcon('minus', 'apollo-minus');
   api.replaceIcon('pen', 'apollo-pen');
   api.replaceIcon('spinner', 'apollo-loader');
   api.replaceIcon('thumbs-up', 'apollo-thumbs-up');
   api.replaceIcon('thumbs-down', 'apollo-thumbs-down');
   api.replaceIcon('d-drop-collapsed', 'apollo-chevron-right');
   api.replaceIcon('d-drop-expanded', 'apollo-chevron-down');

   api.replaceIcon('chevron-left', 'apollo-chevron-left');
   api.replaceIcon('chevron-right', 'apollo-chevron-right');
   api.replaceIcon('chevron-up', 'apollo-chevron-up');
   api.replaceIcon('chevron-down', 'apollo-chevron-down');

   api.replaceIcon('caret-left', 'apollo-chevron-left');
   api.replaceIcon('caret-right', 'apollo-chevron-right');
   api.replaceIcon('caret-up', 'apollo-chevron-up');
   api.replaceIcon('caret-down', 'apollo-chevron-down');


   api.replaceIcon('d-topic-share', 'apollo-link');
   api.replaceIcon('envelope', 'apollo-mail');
   api.replaceIcon('pencil', 'apollo-edit-3');
   api.replaceIcon('folder', 'apollo-folder');
   api.replaceIcon('bookmark', 'apollo-bookmark');
   api.replaceIcon('reply', 'apollo-corner-up-left');
   //api.replaceIcon('d-watching', 'apollo-bell');
});
