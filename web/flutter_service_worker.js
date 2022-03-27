'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/assets/pages/fitted_box.json": "99c069d207b4253f3193e5365b8d32ed",
"assets/assets/pages/set_default_value.json": "e5259302d609c3f0094a8200b224ff27",
"assets/assets/pages/tween_animation.json": "f607e2fc43ea7e17faed41b851477b35",
"assets/assets/pages/align.json": "b485f4a4f73d9326d3c001ecd391febe",
"assets/assets/pages/directionality.json": "6835c8e2dd7c38f2851732b53e51c6ec",
"assets/assets/pages/overflow_box.json": "fb08fc868d15965009f4820335484c44",
"assets/assets/pages/issue_11.json": "a86bf0efda298ebab66eede6aae5a194",
"assets/assets/pages/clips.json": "0bee4001678ab24b0bb75547a09a5f2d",
"assets/assets/pages/issue_30.json": "2bdc5acb23999bd114d68f73705e53aa",
"assets/assets/pages/issue_10.json": "b5e0fb1b7f8fb188b07a0d8b1bcaeb7b",
"assets/assets/pages/simple_page.json": "218a96e4287cb0ac7b31fc5769013697",
"assets/assets/pages/card.json": "667ce67b6dfd0297cb5b04319782d4fe",
"assets/assets/pages/form.json": "9d65178057de829b06556b1255c3d9db",
"assets/assets/pages/image_page.json": "5dd6feec0c8b1a1fbe806be7f3756359",
"assets/assets/pages/animated_physical_model.json": "3a89321215726549a663210e4d01553f",
"assets/assets/pages/layout_builder.json": "354471899ff55b0e081aebbb0a887722",
"assets/assets/pages/gestures.json": "d2a8c816a2521435ec13591967065304",
"assets/assets/pages/checkbox.json": "178ec66d1d4f5af1dcca14da46a1e3f4",
"assets/assets/pages/variables.json": "665093244aff4b4fc2bfac3b10bc2efc",
"assets/assets/pages/animated_positioned_directional.json": "2afbb17361ec58e56de8c53708f7c064",
"assets/assets/pages/scroll_view.json": "beb92fadd56fb09f01a7006e45efdb74",
"assets/assets/pages/asset_images.json": "bd2336b614a4c7f22027eeb9977e389d",
"assets/assets/pages/animated_theme.json": "4b27a23a9c0afa60f87156c937c637bc",
"assets/assets/pages/linear_progress_indicator.json": "aa27d81870d32a4170afcf0143d841d5",
"assets/assets/pages/animated_default_text_style.json": "7096ba5824a216e4d701366de654a812",
"assets/assets/pages/popup_menu_button.json": "c4f44e40fdaa3e956be5cff9b4df15df",
"assets/assets/pages/animated_opacity.json": "871ea2083b2a93964117b5b20b960e4e",
"assets/assets/pages/dynamic.json": "c0cd1af8998745ea5bd9dc7f70192f93",
"assets/assets/pages/baseline.json": "3fe9abf09a5af2695fd73c3692113a22",
"assets/assets/pages/limited_box.json": "d789904eeeb04a93ddd1f916b8e6cfcf",
"assets/assets/pages/issue_20_single.json": "1da8461b2eaa0586a6a3be1e55353ec5",
"assets/assets/pages/grid_view.json": "ebcb86f090bd472a805fdc13d6a23576",
"assets/assets/pages/indexed_stack.json": "c690dc8a4f2dbf07458a7cbbda2f75de",
"assets/assets/pages/semantics.json": "6d91632099bc6fdaf64b33f69e6635f1",
"assets/assets/pages/interactive_viewer.json": "14e65ff967c97908bb9ee30130c6e078",
"assets/assets/pages/switch.json": "769aeaf2027194176f82e5c4b973903d",
"assets/assets/pages/animated_container.json": "0921eaca4fd4295fb937b4da4c1d21df",
"assets/assets/pages/issue_12.json": "9cd9ffd4ddd4a9f8a9a75bc1d1b70cb1",
"assets/assets/pages/animated_switcher.json": "6ca5f6b26ed1a7367aa849a980f8e6f9",
"assets/assets/pages/theme.json": "f7eb22057c71511f182abb7b1bc9aa11",
"assets/assets/pages/intrinsic_height.json": "f6e229391d38e265d97c50590a361a5c",
"assets/assets/pages/fractional_translation.json": "bd3b6afe62d8f9ce632ced50c5a4e52c",
"assets/assets/pages/images.json": "a1d2f8925f0a6b26dbe1478deaee9eca",
"assets/assets/pages/wrap.json": "795d0fd007cdeba1c76d5581a1e52525",
"assets/assets/pages/intrinsic_width.json": "077eeeed1da01cc3a540c624d00272a2",
"assets/assets/pages/cupertino_switch.json": "6b66e7e2e55beefb09d9929406ee5db1",
"assets/assets/pages/decorated_box.json": "bc51bd8f7facba4ee026d88a9e19af75",
"assets/assets/pages/fractionally_sized_box.json": "ac4c7ae9ff95d797918016e57515d595",
"assets/assets/pages/issue_20_list.json": "ec2e3499036c1342ccf467ec15e23f6f",
"assets/assets/pages/animated_size.json": "283047cfac763cfe41c794c3cbe3eebe",
"assets/assets/pages/offstage.json": "a60fe265c03ed1cfa8de64d8c8c42046",
"assets/assets/pages/length.json": "9f85a8899adef8de3dff7a52379dba5d",
"assets/assets/pages/list_view.json": "ffc64a252307dd45c79d9c9c6bb61eaa",
"assets/assets/pages/animated_positioned.json": "46db627cfa06bc7dd89058111b0a4c0d",
"assets/assets/pages/circular_progress_indicator.json": "4f696c1ada9aae3eef306dca0274a0dd",
"assets/assets/pages/for_each.json": "505991298708ae7866ba74b30dd02d5b",
"assets/assets/pages/bank_example.json": "9313907e6bc1954bdc118358f8ba0607",
"assets/assets/pages/slivers.json": "efaf68bed22ab4e6d558dc7a66d68075",
"assets/assets/pages/conditional.json": "0c1ae1934b9906413faa297f718579cc",
"assets/assets/pages/center.json": "b9fae0ffc52b196ed2a8107113d2e794",
"assets/assets/pages/placeholder.json": "f67a99ad454a1d0a7d34be9496e36781",
"assets/assets/pages/animated_align.json": "0e1cc608882e1e2f5eea0a5e859af86c",
"assets/assets/pages/opacity.json": "03db9231df110e1534e83cd0759cbc94",
"assets/assets/pages/input_error.json": "7a450488f371f48c83212c1c0f3b93a9",
"assets/assets/pages/buttons.json": "123e358ce3967af392ee6b0b2d53a8b8",
"assets/assets/pages/animated_cross_fade.json": "686068f255ab0b28ff1410e3a609baf6",
"assets/assets/pages/tooltip.json": "202ac79237a2da9c91f44fe5020d929e",
"assets/assets/pages/animated_padding.json": "102ecbf739afdd48ce9bfd4e73e006d1",
"assets/assets/pages/measured.json": "e172c20252bdd2075a57ce7c0ba6d958",
"assets/assets/pages/aspect_ratio.json": "1a48ae48bf258aaf4d0fbfb21d9a67f8",
"assets/assets/images/image6.jpg": "35041a1b17ba4dc6e39be43a192068db",
"assets/assets/images/visa.svg": "45180370eb48dfdbdf59b3be4a3c0b59",
"assets/assets/images/image17.jpg": "9a5ceb6a65fc25de9b997bb2d9e12013",
"assets/assets/images/image1.jpg": "c746344e7d2dccea6d4b7138de5317f3",
"assets/assets/images/image16.jpg": "2453145aa04982321678b360448a7224",
"assets/assets/images/image7.jpg": "e17532bdf7cfbb7c7def0aa13732d1d7",
"assets/assets/images/image8.jpg": "143b8d86b86c4e9a9d534a2571644c9c",
"assets/assets/images/profile.jpg": "0a07fd15b5f822a326230c211451f611",
"assets/assets/images/image2.jpg": "359677aebb7126b359c557a38a45f2df",
"assets/assets/images/image15.jpg": "62265d6c8a5c180b5f8d8fd38778d4dd",
"assets/assets/images/image10.jpg": "182da97ea5d0f162c77919451e1adc34",
"assets/assets/images/image12.jpg": "fc5f5ce6cc1839caceba61dea24dfd97",
"assets/assets/images/image4.jpg": "534ce2f5ff5e40e97adee7e8b64d1f49",
"assets/assets/images/image14.jpg": "1cabc1330ae62e177103c9afe088277a",
"assets/assets/images/image3.jpg": "c82a612fb7053c3036dfb31160a69d44",
"assets/assets/images/image9.jpg": "d4bca3468f462344ec7848569d428f6f",
"assets/assets/images/image11.jpg": "7cc720ee31b70b43b17bc85c8925ba78",
"assets/assets/images/image13.jpg": "447faeebf8c418128e7837f0c7771aa3",
"assets/assets/images/image5.jpg": "8d9babc0336b7855a0e32ddb04974793",
"assets/assets/widgets/issue_24.json": "77bf723a8ec7a8b5314f0833fab4e74a",
"assets/assets/fonts/MetalMania-Regular.ttf": "925d9f3005602e32f9ad6ccbabb730a1",
"assets/assets/fonts/Lato-Regular.ttf": "2d36b1a925432bae7f3c53a340868c6e",
"assets/FontManifest.json": "b7320a7ef5ad634fc22b163a16c8a309",
"assets/AssetManifest.json": "7bfacaa05531933270ee9d77489b9f8b",
"assets/NOTICES": "a5b938ea0f2a833ef69f3a2a708610ba",
"assets/fonts/MaterialIcons-Regular.otf": "7e7a6cccddf6d7b20012a548461d5d81",
"index.html": "57f908a900893c134e594674e7721333",
"/": "57f908a900893c134e594674e7721333",
"version.json": "ff966ab969ba381b900e61629bfb9789",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"main.dart.js": "e2b65c73a38da8dc912d8ba67e013f03",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"manifest.json": "15f73b7e8a8209c2206210b3ac8dea1b",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba"
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
