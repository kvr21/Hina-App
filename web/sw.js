const CACHE_NAME = 'hina-pwa-v1';
const urlsToCache = [
  '/',
  '/manifest.json',
  '/index.html',
  '/assets/AssetManifest.json'
];

self.addEventListener('install', event => {
  event.waitUntil(
    caches.open(CACHE_NAME)
      .then(cache => cache.addAll(urlsToCache))
  );
});

self.addEventListener('fetch', event => {
  event.respondWith(
    caches.match(event.request)
      .then(response => response || fetch(event.request))
  );
});
