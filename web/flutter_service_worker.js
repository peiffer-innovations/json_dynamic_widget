'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "index.html": "9e655c2a10bad2d6247703c1a29199e5",
"/": "9e655c2a10bad2d6247703c1a29199e5",
"main.dart.js": "732dc465e165bf19e5a633bb74de39b4",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "15f73b7e8a8209c2206210b3ac8dea1b",
"assets/AssetManifest.json": "522bce206e3dc904e2ad7a30e548f023",
"assets/NOTICES": "126779e16ca6d7b8b7db6c64cc2f611e",
"assets/FontManifest.json": "b7320a7ef5ad634fc22b163a16c8a309",
"assets/fonts/MaterialIcons-Regular.otf": "a68d2a28c526b3b070aefca4bac93d25",
"assets/assets/images/visa.svg": "45180370eb48dfdbdf59b3be4a3c0b59",
"assets/assets/images/image8.jpg": "143b8d86b86c4e9a9d534a2571644c9c",
"assets/assets/images/image9.jpg": "d4bca3468f462344ec7848569d428f6f",
"assets/assets/images/image14.jpg": "1cabc1330ae62e177103c9afe088277a",
"assets/assets/images/image15.jpg": "62265d6c8a5c180b5f8d8fd38778d4dd",
"assets/assets/images/image17.jpg": "9a5ceb6a65fc25de9b997bb2d9e12013",
"assets/assets/images/image16.jpg": "2453145aa04982321678b360448a7224",
"assets/assets/images/image12.jpg": "fc5f5ce6cc1839caceba61dea24dfd97",
"assets/assets/images/image13.jpg": "447faeebf8c418128e7837f0c7771aa3",
"assets/assets/images/image11.jpg": "7cc720ee31b70b43b17bc85c8925ba78",
"assets/assets/images/image10.jpg": "182da97ea5d0f162c77919451e1adc34",
"assets/assets/images/profile.jpg": "0a07fd15b5f822a326230c211451f611",
"assets/assets/images/image7.jpg": "e17532bdf7cfbb7c7def0aa13732d1d7",
"assets/assets/images/image6.jpg": "35041a1b17ba4dc6e39be43a192068db",
"assets/assets/images/image4.jpg": "534ce2f5ff5e40e97adee7e8b64d1f49",
"assets/assets/images/image5.jpg": "8d9babc0336b7855a0e32ddb04974793",
"assets/assets/images/image1.jpg": "c746344e7d2dccea6d4b7138de5317f3",
"assets/assets/images/image2.jpg": "359677aebb7126b359c557a38a45f2df",
"assets/assets/images/image3.jpg": "c82a612fb7053c3036dfb31160a69d44",
"assets/assets/fonts/MetalMania-Regular.ttf": "925d9f3005602e32f9ad6ccbabb730a1",
"assets/assets/fonts/Lato-Regular.ttf": "2d36b1a925432bae7f3c53a340868c6e",
"assets/assets/pages/switch.json": "769aeaf2027194176f82e5c4b973903d",
"assets/assets/pages/aspect_ratio.json": "1a48ae48bf258aaf4d0fbfb21d9a67f8",
"assets/assets/pages/conditional.json": "f9ce65ff0a4aab6dab91d0dcf36b9c9c",
"assets/assets/pages/opacity.json": "03db9231df110e1534e83cd0759cbc94",
"assets/assets/pages/animated_theme.json": "adb0f9ea1f196a0b683fcda6776b3aa8",
"assets/assets/pages/theme.json": "86a29ed2e2a50ed5d9b39bcc2a5384c3",
"assets/assets/pages/animated_size.json": "ce28354b96fd51d1d3beaeefc1f03917",
"assets/assets/pages/issue_12.json": "dbeb3dfda2da7418710ae5b6af35e66c",
"assets/assets/pages/simple_page.json": "218a96e4287cb0ac7b31fc5769013697",
"assets/assets/pages/indexed_stack.json": "2ecc71bf0d7222826abd018119a64428",
"assets/assets/pages/decorated_box.json": "bc51bd8f7facba4ee026d88a9e19af75",
"assets/assets/pages/animated_physical_model.json": "efbee6f0e3f91cecca4b60079e00b1d6",
"assets/assets/pages/align.json": "b485f4a4f73d9326d3c001ecd391febe",
"assets/assets/pages/animated_positioned.json": "2d45ba8a0001a14c2380f56c6a5ec420",
"assets/assets/pages/animated_align.json": "b62c4603f5dc3e644c212133c8e7c690",
"assets/assets/pages/images.json": "a1d2f8925f0a6b26dbe1478deaee9eca",
"assets/assets/pages/circular_progress_indicator.json": "4f696c1ada9aae3eef306dca0274a0dd",
"assets/assets/pages/cupertino_switch.json": "6b66e7e2e55beefb09d9929406ee5db1",
"assets/assets/pages/checkbox.json": "178ec66d1d4f5af1dcca14da46a1e3f4",
"assets/assets/pages/issue_10.json": "3f94f674fa3036ee3ad561edca56f4fb",
"assets/assets/pages/animated_default_text_style.json": "291bcccd308f88621717cc3337874710",
"assets/assets/pages/bank_example.json": "115d08071a934c2e118ca367bbb19e5c",
"assets/assets/pages/baseline.json": "3fe9abf09a5af2695fd73c3692113a22",
"assets/assets/pages/tween_animation.json": "4b0e7efb6c633c58e9177d9a513d4618",
"assets/assets/pages/card.json": "bcc0bdee15e86e0b3db7536fc6ef2336",
"assets/assets/pages/directionality.json": "6835c8e2dd7c38f2851732b53e51c6ec",
"assets/assets/pages/animated_switcher.json": "9e08303fe8f252f217e06c41b79d723a",
"assets/assets/pages/clips.json": "6475dfb17f85b218e76183a83a293069",
"assets/assets/pages/radio.json": "2eb9a65fcc9b8de02a9a048828b3bd30",
"assets/assets/pages/issue_11.json": "314308857d863065aed0aebb2907e4e8",
"assets/assets/pages/asset_images.json": "0eb4d64685fea3898fb8208b8af82279",
"assets/assets/pages/animated_opacity.json": "a58012c2c8269ab8c7a94744efde4747",
"assets/assets/pages/animated_positioned_directional.json": "67559e78bf9eebed7b317b330ac8f56c",
"assets/assets/pages/animated_container.json": "873f183537c011e2fff2390d88cfb65b",
"assets/assets/pages/animated_padding.json": "570130d1d57adc8ac3fa4bcb37e246fb",
"assets/assets/pages/linear_progress_indicator.json": "aa27d81870d32a4170afcf0143d841d5",
"assets/assets/pages/image_page.json": "72142c752c014a6c0ef5f241ab3f80f2",
"assets/assets/pages/animated_cross_fade.json": "bd47018b8ca3f4cd5d48695c0e86cc32",
"assets/assets/pages/form.json": "5cec2875b2162e52ade426b73de3f8b1",
"assets/assets/pages/list_view.json": "ffc64a252307dd45c79d9c9c6bb61eaa",
"assets/assets/pages/fitted_box.json": "99c069d207b4253f3193e5365b8d32ed",
"assets/assets/pages/gestures.json": "3323d8abcf022fc28584227db8cbb937",
"assets/assets/pages/input_error.json": "0c2394bf170ae3e93fd44a7bf1975d4b",
"assets/assets/pages/center.json": "b9fae0ffc52b196ed2a8107113d2e794"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      // Provide a 'reload' param to ensure the latest version is downloaded.
      return cache.addAll(CORE.map((value) => new Request(value, {'cache': 'reload'})));
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
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#')) {
    key = '/';
  }
  // If the URL is not the RESOURCE list, skip the cache.
  if (!RESOURCES[key]) {
    return event.respondWith(fetch(event.request));
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache. Ensure the resources are not cached
        // by the browser for longer than the service worker expects.
        var modifiedRequest = new Request(event.request, {'cache': 'reload'});
        return response || fetch(modifiedRequest).then((response) => {
          cache.put(event.request, response.clone());
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
    return self.skipWaiting();
  }

  if (event.message === 'downloadOffline') {
    downloadOffline();
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
  for (var resourceKey in Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
