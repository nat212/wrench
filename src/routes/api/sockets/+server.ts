import { type RequestHandler, json } from '@sveltejs/kit';

export const GET = (async ({ locals }) => {
  const result = await locals.prisma.processorSocket.findMany();
  return json(result, { status: 200 });
}) satisfies RequestHandler;

export const POST = (async ({ locals, request }) => {
  const data = await request.json();
  console.debug('[Socket] Received Data: ', data);

  const result = await locals.prisma.processorSocket.create({
    data,
  });
  console.debug('[Socket] Created Data: ', result);
  return json(result, { status: 201 });
}) satisfies RequestHandler;
