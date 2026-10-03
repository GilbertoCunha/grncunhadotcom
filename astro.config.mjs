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
			// iOS asks for this when a page is saved to the home screen, and 404s without it
			head: [{ tag: 'link', attrs: { rel: 'apple-touch-icon', href: '/apple-touch-icon.png' } }],
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
