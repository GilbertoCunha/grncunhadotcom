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
		}),
	],
});
