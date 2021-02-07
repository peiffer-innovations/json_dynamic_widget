'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "4b6db237b3514a88107a422469adfb0f",
"index.html": "88beff0d5152d00f8744018fe8ae9a3f",
"/": "88beff0d5152d00f8744018fe8ae9a3f",
"main.dart.js": "289423d7819b5cb3de739374c96624d5",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "15f73b7e8a8209c2206210b3ac8dea1b",
"assets/AssetManifest.json": "74a70c85b5fbdacc295770b7118c21f5",
"assets/NOTICES": "bbcef09747921daa33d7023f4d346896",
"assets/FontManifest.json": "b7320a7ef5ad634fc22b163a16c8a309",
"assets/fonts/MaterialIcons-Regular.otf": "1288c9e28052e028aba623321f7826ac",
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
"assets/assets/pages/interactive_viewer.json": "14e65ff967c97908bb9ee30130c6e078",
"assets/assets/pages/opacity.json": "03db9231df110e1534e83cd0759cbc94",
"assets/assets/pages/animated_theme.json": "adb0f9ea1f196a0b683fcda6776b3aa8",
"assets/assets/pages/intrinsic_width.json": "b2bd3074dd64f3840eee72211a6476cf",
"assets/assets/pages/theme.json": "c82c608548c26d7ca149b7808f1005b2",
"assets/assets/pages/animated_size.json": "ce28354b96fd51d1d3beaeefc1f03917",
"assets/assets/pages/issue_12.json": "dbeb3dfda2da7418710ae5b6af35e66c",
"assets/assets/pages/simple_page.json": "218a96e4287cb0ac7b31fc5769013697",
"assets/assets/pages/indexed_stack.json": "2ecc71bf0d7222826abd018119a64428",
"assets/assets/pages/decorated_box.json": "bc51bd8f7facba4ee026d88a9e19af75",
"assets/assets/pages/animated_physical_model.json": "efbee6f0e3f91cecca4b60079e00b1d6",
"assets/assets/pages/align.json": "b485f4a4f73d9326d3c001ecd391febe",
"assets/assets/pages/animated_positioned.json": "2d45ba8a0001a14c2380f56c6a5ec420",
"assets/assets/pages/limited_box.json": "d789904eeeb04a93ddd1f916b8e6cfcf",
"assets/assets/pages/fractional_translation.json": "bd3b6afe62d8f9ce632ced50c5a4e52c",
"assets/assets/pages/animated_align.json": "b62c4603f5dc3e644c212133c8e7c690",
"assets/assets/pages/fractionally_sized_box.json": "ac4c7ae9ff95d797918016e57515d595",
"assets/assets/pages/images.json": "a1d2f8925f0a6b26dbe1478deaee9eca",
"assets/assets/pages/circular_progress_indicator.json": "4f696c1ada9aae3eef306dca0274a0dd",
"assets/assets/pages/cupertino_switch.json": "6b66e7e2e55beefb09d9929406ee5db1",
"assets/assets/pages/checkbox.json": "178ec66d1d4f5af1dcca14da46a1e3f4",
"assets/assets/pages/placeholder.json": "17c389915fdc7caf0a565a7176dae1d9",
"assets/assets/pages/issue_10.json": "3f94f674fa3036ee3ad561edca56f4fb",
"assets/assets/pages/animated_default_text_style.json": "291bcccd308f88621717cc3337874710",
"assets/assets/pages/bank_example.json": "115d08071a934c2e118ca367bbb19e5c",
"assets/assets/pages/baseline.json": "3fe9abf09a5af2695fd73c3692113a22",
"assets/assets/pages/tween_animation.json": "4b0e7efb6c633c58e9177d9a513d4618",
"assets/assets/pages/card.json": "bcc0bdee15e86e0b3db7536fc6ef2336",
"assets/assets/pages/intrinsic_height.json": "ec2247d1c677996d7c2b77c71135c404",
"assets/assets/pages/directionality.json": "6835c8e2dd7c38f2851732b53e51c6ec",
"assets/assets/pages/animated_switcher.json": "9e08303fe8f252f217e06c41b79d723a",
"assets/assets/pages/clips.json": "6475dfb17f85b218e76183a83a293069",
"assets/assets/pages/issue_20_single.json": "31d96ed15fca633d7aa220197c102060",
"assets/assets/pages/issue_11.json": "314308857d863065aed0aebb2907e4e8",
"assets/assets/pages/asset_images.json": "39a8f965d7439e229de7731893dc54de",
"assets/assets/pages/animated_opacity.json": "a58012c2c8269ab8c7a94744efde4747",
"assets/assets/pages/animated_positioned_directional.json": "67559e78bf9eebed7b317b330ac8f56c",
"assets/assets/pages/offstage.json": "98f245ed0cb1a3f861a9b96d65a6ba24",
"assets/assets/pages/overflow_box.json": "fb08fc868d15965009f4820335484c44",
"assets/assets/pages/issue_20_list.json": "a3dad9cf46904eb0f4d7a7a5abbe3367",
"assets/assets/pages/animated_container.json": "873f183537c011e2fff2390d88cfb65b",
"assets/assets/pages/animated_padding.json": "570130d1d57adc8ac3fa4bcb37e246fb",
"assets/assets/pages/linear_progress_indicator.json": "aa27d81870d32a4170afcf0143d841d5",
"assets/assets/pages/image_page.json": "72142c752c014a6c0ef5f241ab3f80f2",
"assets/assets/pages/animated_cross_fade.json": "bd47018b8ca3f4cd5d48695c0e86cc32",
"assets/assets/pages/form.json": "5cec2875b2162e52ade426b73de3f8b1",
"assets/assets/pages/list_view.json": "ffc64a252307dd45c79d9c9c6bb61eaa",
"assets/assets/pages/buttons.json": "c1ce198ea60bd01341f8fc1a9263230f",
"assets/assets/pages/fitted_box.json": "99c069d207b4253f3193e5365b8d32ed",
"assets/assets/pages/gestures.json": "3323d8abcf022fc28584227db8cbb937",
"assets/assets/pages/input_error.json": "0c2394bf170ae3e93fd44a7bf1975d4b",
"assets/assets/pages/center.json": "b9fae0ffc52b196ed2a8107113d2e794",
"assets/assets/pages/popup_menu_button.json": "12a875f9c7aa3569e1bb2b1f515d6cb1",
"assets/assets/widgets/issue_24.json": "ce819747a12097fcf29f1d6545ae5a61"
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
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value + '?revision=' + RESOURCES[value], {'cache': 'reload'})));
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
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
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
