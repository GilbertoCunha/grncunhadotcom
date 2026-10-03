import { defineCollection } from 'astro:content';
import { z } from 'astro/zod';
import { docsLoader } from '@astrojs/starlight/loaders';
import { docsSchema } from '@astrojs/starlight/schema';

export const collections = {
	docs: defineCollection({
		loader: docsLoader(),
		schema: docsSchema({
			extend: z.object({
				// A button shown beside the page title (see src/components/PageTitle.astro)
				titleLink: z.object({ text: z.string(), href: z.string() }).optional(),
			}),
		}),
	}),
};
