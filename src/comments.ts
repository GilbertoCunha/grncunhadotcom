import type { StarlightRouteData } from '@astrojs/starlight/route-data';

// Whether a page shows giscus comments: blog posts do, unless the page sets
// `comments` in its frontmatter (see src/components/Footer.astro)
export const hasComments = ({ id, data }: StarlightRouteData['entry']) => data.comments ?? id.startsWith('blog/');
