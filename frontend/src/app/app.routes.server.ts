import { RenderMode, ServerRoute } from '@angular/ssr';

export const serverRoutes: ServerRoute[] = [
  { path: 'home', renderMode: RenderMode.Prerender },

  // Decks Routes
  {
    path: 'decks/list-decks',
    renderMode: RenderMode.Prerender,
  },
  {
    path: 'decks/create-deck',
    renderMode: RenderMode.Prerender,
  },
  {
    path: 'login',
    renderMode: RenderMode.Prerender,
  },
  {
    path: 'rooms-list',
    renderMode: RenderMode.Prerender,
  },
  {
    path: 'room/:roomId',
    renderMode: RenderMode.Server,
  },
  {
    path: 'rooms-list',
    renderMode: RenderMode.Server,
  },
  {
    path: 'home',
    renderMode: RenderMode.Server,
  },
  {
    path: 'login',
    renderMode: RenderMode.Server,
  },
  {
    path: '**',
    renderMode: RenderMode.Server,
  },
  {
    path: '',
    renderMode: RenderMode.Prerender,
  },
];
