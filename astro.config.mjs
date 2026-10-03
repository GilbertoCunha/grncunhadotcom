// @ts-check
import { defineConfig } from 'astro/config';
import starlight from '@astrojs/starlight';

// https://astro.build/config
export default defineConfig({
	site: 'https://grncunha.com',
	base: '/',
	integrations: [
		starlight({
			title: 'grncunha.com',
			social: [
				{
					icon: 'github',
					label: 'GitHub',
					href: 'https://github.com/GilbertoCunha',
				},
			],
			customCss: ['./src/styles/custom.css'],
			components: { PageTitle: './src/components/PageTitle.astro' },
			head: [
				// iOS asks for this when a page is saved to the home screen, and 404s without it
				{ tag: 'link', attrs: { rel: 'apple-touch-icon', href: '/apple-touch-icon.png' } },
				// Links to other sites open in a new tab. One script covers every kind of link
				// (Markdown, cards, buttons, the header's social icons), which have no shared
				// place to set this otherwise.
				{
					tag: 'script',
					content: `document.addEventListener('DOMContentLoaded', () => {
	for (const a of document.querySelectorAll('a[href]')) {
		if (a.host && a.host !== location.host) {
			a.target = '_blank';
			a.rel = 'noopener noreferrer';
		}
	}
});`,
				},
			],
			sidebar: [
				{ label: 'Projects', items: [{ autogenerate: { directory: 'projects' } }] },
				{
					label: 'Blog',
					items: [
						// One nested group per series, so its parts read as one unit
						{
							label: 'System Design: beyond the design',
							items: [{ autogenerate: { directory: 'blog/system-design-beyond-the-design' } }],
						},
					],
				},
			],
		}),
	],
});
