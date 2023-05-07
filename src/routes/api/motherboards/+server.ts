import { json, type RequestHandler } from '@sveltejs/kit';

export const GET = (async ({ locals }) => {
  const motherboards = await locals.prisma.motherboard.findMany();
  return json(motherboards, { status: 200 });
}) satisfies RequestHandler;

export const POST = (async ({ locals, request }) => {
  const data = await request.json();

  const result = await locals.prisma.motherboard.create({
    data,
  });

  return json(result, { status: 201 });
}) satisfies RequestHandler;
