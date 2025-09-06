'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "623ed991f5b6a8f705c69eea6ebdf84b",
"assets/AssetManifest.bin.json": "60a37d69effeac533ca00a9aff06ac7b",
"assets/AssetManifest.json": "ba7f8f928d296cdb64b2c094ce703d4c",
"assets/assets/images/absolut.png": "b5c6ae7456adeca31c9fd93142f1cfa2",
"assets/assets/images/aperolSpritz.jpg": "890764e7c203a6d96a4ef392ad661776",
"assets/assets/images/b52.jpg": "579b2231d3f5558fe353a01246347492",
"assets/assets/images/BacardiRazzMojito.jpg": "e8c3d8a540b66a27d4607f1c20cf4714",
"assets/assets/images/belvedere.png": "9e93d76c4323b5ab9bac4f7c37396614",
"assets/assets/images/bluSky.jpg": "3d2d838984a241e0a1b06f9e30397625",
"assets/assets/images/bombay.png": "af3156396f7eb531ee3f4460f872b6aa",
"assets/assets/images/chivasRegal.png": "c1ca731a0f98f59a57cab6dfb605a464",
"assets/assets/images/classic_menu.jpg": "840256973f6a316586fb52a657ab00ed",
"assets/assets/images/cStrong.png": "22a015e397b063e27b15ebc4d8ddec7f",
"assets/assets/images/CubaLibre.png": "6efcfa6aa65f58e5d2f7a72f8032b7f0",
"assets/assets/images/dance.jpg": "e4869995993106af59de4781f72e0795",
"assets/assets/images/erdbeereLimes.jpg": "3c96d41e6f7b4c276fe0baf8652221fd",
"assets/assets/images/fancyDrink.png": "fa3bbea1a418e1440bbec98f0a46dadf",
"assets/assets/images/fickenShooter.jpg": "8e7bd028d17b76f1c13daafdf9cbb9d1",
"assets/assets/images/Ginmule.png": "0a9f83a07d661635b84de6b3edf06a8f",
"assets/assets/images/ginSour.png": "0fffba539743f34c316c5044e3665b9c",
"assets/assets/images/greyGoose.png": "185301c5936a6b9baa09783e6ff21c1f",
"assets/assets/images/havana.png": "232ccbbff40b9f09ecde018fc4fe6c67",
"assets/assets/images/hendricks.png": "d40e3520de547c95df2a7653c5917cf8",
"assets/assets/images/hennessy.png": "c7b16d465a6e6814b50fac609e712db1",
"assets/assets/images/high_balls_menu.png": "08afd1dfe88d5770913d327fa14d0eb8",
"assets/assets/images/hugo.png": "df9dc21728e871504718a7a8a0d4338f",
"assets/assets/images/hugoAlkoFrei.jpg": "89df6da76a71dd90d52cf24f1e4c3b03",
"assets/assets/images/illetAlkoFrei.jpg": "b7f8355b9406c7251c3a39f76c477aeb",
"assets/assets/images/jackDaniels.png": "b9a756831e958a9daebcf327ee2a503d",
"assets/assets/images/jaegermeister.png": "8f322c2e24cc3c34bc413debdc1e770a",
"assets/assets/images/jaegerShooter.jpg": "39436a72684e0e21c0b7b2eefb67ff82",
"assets/assets/images/Logo.png": "bc6e62a31b5362efac20bb20c6104acf",
"assets/assets/images/longDrink.png": "ce3b8453d4c807c7e440778ff61763d0",
"assets/assets/images/long_island_iced_tea.png": "648fa505fb7e6598f18377fbe788df44",
"assets/assets/images/lwb.png": "94906e9cac54dce6140823c620bf1861",
"assets/assets/images/mai_tai.jpg": "0e5a06e207681620bc612b14a0f679fb",
"assets/assets/images/malibu.png": "db856c6d1b3f3bf58d057b43a6d9e7ce",
"assets/assets/images/Mojito.jpg": "ca93e773bf3062a81eea2edcab70f1c5",
"assets/assets/images/MoscowMule.png": "55d8671cf8176862ef43cf04e5de5ae1",
"assets/assets/images/orgasmus.jpg": "a21b3a745e7afbf72c3a917f87d479b7",
"assets/assets/images/PinaColada.png": "975022723142246373103e73afdc2941",
"assets/assets/images/raki.png": "493c441e6e631049624ba10d700c4227",
"assets/assets/images/rakiShooter.jpg": "799d9438b31c1bfe4785b7ed710c72ef",
"assets/assets/images/sambucaShooter.jpg": "0e337e0fc9030cce89fca60a3133c66f",
"assets/assets/images/SexOnTheBeach.jpg": "53b71716ee7eb5e193c9da4c1260a535",
"assets/assets/images/shooters.png": "557e694c6e37fdedb27c57e82bc1f355",
"assets/assets/images/sour.png": "4d1fa2d2e4fc9209fd33e3e2c019fb8e",
"assets/assets/images/StrawberryColada.jpg": "53b71716ee7eb5e193c9da4c1260a535",
"assets/assets/images/SwimmingPool.png": "744223b04351e08aa3b67c6d0255e7d2",
"assets/assets/images/TequilaSunRises.png": "4f2cf81aadd4ecabe098fac59419385c",
"assets/assets/images/Touchdown.jpg": "53b71716ee7eb5e193c9da4c1260a535",
"assets/assets/images/Tropical.png": "648fa505fb7e6598f18377fbe788df44",
"assets/assets/images/vodkaShooter.jpg": "0a4a8fb89c3aabab7276af79082776aa",
"assets/assets/images/vodkaSour.png": "80994e723ad3733be5a7a562e124cb5b",
"assets/assets/images/whiskeySour.png": "80994e723ad3733be5a7a562e124cb5b",
"assets/assets/images/zombi.png": "bb3123d72f5858945769b249ff43cf9a",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "fbe558b982e1861479cd027d1910643c",
"assets/NOTICES": "2c20caf7fbeafb20c3d48b4c4ceb907c",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"flutter_bootstrap.js": "81813d74ee9f6a251240c920e4418a1c",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "d41d8cd98f00b204e9800998ecf8427e",
"icons/Icon-maskable-192.png": "d41d8cd98f00b204e9800998ecf8427e",
"icons/Icon-maskable-512.png": "d41d8cd98f00b204e9800998ecf8427e",
"index.html": "2ebc77835fbf79fbc3770fb50035338b",
"/": "2ebc77835fbf79fbc3770fb50035338b",
"main.dart.js": "0d64ce962f469320fbe6e2d11fcc02e2",
"manifest.json": "5068e58ede97c5ef053255c09169bb04",
"version.json": "7e9cfd112d49b43ad155c9c26b73c3e3"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
