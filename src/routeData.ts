import { defineRouteMiddleware } from '@astrojs/starlight/route-data';
import { hasComments } from './comments';

// "On this page" only lists the post's own headings, so the comments under it
// get an entry of their own
export const onRequest = defineRouteMiddleware(({ locals }) => {
	const { toc, entry } = locals.starlightRoute;
	if (toc && hasComments(entry)) {
		toc.items.push({ depth: 2, slug: 'comments', text: 'Comments', children: [] });
	}
});
