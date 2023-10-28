'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"main.dart.js": "7382e19c4829bc00afb8b8cbb4cf1c52",
"assets/AssetManifest.json": "017ba48b4c3446d6f15f228d1c41a122",
"assets/assets/fonts/MetalMania-Regular.ttf": "925d9f3005602e32f9ad6ccbabb730a1",
"assets/assets/fonts/Lato-Regular.ttf": "2d36b1a925432bae7f3c53a340868c6e",
"assets/assets/widgets/issue_24.json": "2eb6583967287684e788533f5ca89634",
"assets/assets/pages/issue_20_list.json": "d40af957a1dc3d9e004a82a1eadea1aa",
"assets/assets/pages/dynamic.json": "4c176e47958853eebb65a9d2cf43b68f",
"assets/assets/pages/simple_page.json": "57a1f5f0153c49e6c871e6a3b079c3af",
"assets/assets/pages/clips.json": "5b56d3b8c9eed32752b1d64239806471",
"assets/assets/pages/issue_20_single.json": "77e44cd0cf829a5e09783d999dcd7944",
"assets/assets/pages/align.json": "08bfde49f014abbbeece279bbb090840",
"assets/assets/pages/animated_size.json": "d971fe52031a45d9a393ceba4b3235ba",
"assets/assets/pages/tooltip.json": "5d5b8cc0f5178e168fb6e8185c8bd757",
"assets/assets/pages/intrinsic_height.json": "5eb1f181744ec3503f3b7fcfe540502d",
"assets/assets/pages/variables.json": "56d71c5b7041d21b38cbae60cb3e4112",
"assets/assets/pages/grid_view.json": "95f671a9f0db65c1bc35157c82e3e7f0",
"assets/assets/pages/for_each.json": "91eb17f1bb2030bba1b4dd54f1d83337",
"assets/assets/pages/interactive_viewer.json": "6a63b98e9cdce15b2bc6fc503e26449f",
"assets/assets/pages/null_value_passing.json": "ff557f8bced1cd671dc7d3dbb2ae238a",
"assets/assets/pages/card.json": "0ff481186ea3da532d7e9f8848ca5ef5",
"assets/assets/pages/asset_images.json": "571abd923bb5cfacb7d4252988bd853e",
"assets/assets/pages/images.json": "36331822a92e456f680c49d9d39e7bbf",
"assets/assets/pages/issue_109.json": "93d554e1b4554d4c9947ee0b9cde2378",
"assets/assets/pages/measured.json": "ae0493829c52c2e04dc76b605c9f024f",
"assets/assets/pages/length.json": "8aa525de6a845d05340d33ee6fc8af5d",
"assets/assets/pages/animated_physical_model.json": "a8b6538ee200b62ec769d1447b94c1bd",
"assets/assets/pages/buttons.json": "da172f8ea5f08361e2ac122069b74819",
"assets/assets/pages/animated_positioned_directional.json": "4731fb9cf921196482a6a13df02d3748",
"assets/assets/pages/issue_12.json": "a7b6ceab94d564300f6e71984e60f2cd",
"assets/assets/pages/image_page.json": "d2bfcc1a4989e09487577b833268aa7b",
"assets/assets/pages/decorated_box.json": "81732452d18523a70a4333b3bc743b4f",
"assets/assets/pages/placeholder.json": "e638d3b9c0be52e78644db04bc44c2a8",
"assets/assets/pages/animated_theme.json": "1eb27e43d7c8a6d13ea8f1f0c611b09e",
"assets/assets/pages/animated_default_text_style.json": "52d88ddb0a7dd3b3c831fff5ffa971de",
"assets/assets/pages/tween_animation.json": "c9a01589bf9a51fdac2e3011ff66e81f",
"assets/assets/pages/intrinsic_width.json": "3d1b0dc97526fc31edbca7e2d0904dd8",
"assets/assets/pages/input_error.json": "dac5ffa016d6c7a551758f5ed8a275b7",
"assets/assets/pages/popup_menu_button.json": "c4f44e40fdaa3e956be5cff9b4df15df",
"assets/assets/pages/animated_cross_fade.json": "0137d1daaf1977780f621bc2e00cbcc0",
"assets/assets/pages/animated_align.json": "81740eea57062d61f3a0e4bc38322fff",
"assets/assets/pages/issue_30.json": "2bdc5acb23999bd114d68f73705e53aa",
"assets/assets/pages/overflow_box.json": "bbcf224f50300322a2f2f40e2b2f9bd5",
"assets/assets/pages/opacity.json": "7fac17b353511effd69ddb958a0e96ba",
"assets/assets/pages/center.json": "91b2a2e9b74ce66ff310f2f467ef780e",
"assets/assets/pages/switch.json": "54c0f804625ded4c39b934566ed5b86d",
"assets/assets/pages/animated_opacity.json": "83611e11a4a3e27c6f71247710a016be",
"assets/assets/pages/semantics.json": "5e4faa4f693e3862a3053a1841e7f352",
"assets/assets/pages/issue_11.json": "ca977078fcd3a4bca2a062afb47ab4ca",
"assets/assets/pages/fractionally_sized_box.json": "4fab280a90f6669b5b0f3f00fffdaeaa",
"assets/assets/pages/scroll_view.json": "2328fcf19ae8ab2e9dc14361192918fa",
"assets/assets/pages/radio.json": "5c2031437f182c674674ffdb7ddb7026",
"assets/assets/pages/theme.json": "9ddaf26c0559b244b704025c49cd2356",
"assets/assets/pages/limited_box.json": "24250c05b93e88deb4e09371ee5a87d8",
"assets/assets/pages/directionality.json": "da378a21ace52a57b72c84ced5075227",
"assets/assets/pages/offstage.json": "fc459c184ab75257eac574db0c554ce7",
"assets/assets/pages/slivers.json": "0000377ee71bda23dfb5aa297dd7441b",
"assets/assets/pages/circular_progress_indicator.json": "9e5c8bd2dad36d68a7bb19a03afa8182",
"assets/assets/pages/animated_padding.json": "951173aa2bfd1f85939b10dda63230ab",
"assets/assets/pages/list_view.json": "2387889b6e140ddee1f04ef78e59acbb",
"assets/assets/pages/checkbox.json": "27a0ac939a71d09c8a84f0a1e9a94c21",
"assets/assets/pages/animated_positioned.json": "b955633ea31c0d1b0daec482e3b99955",
"assets/assets/pages/linear_progress_indicator.json": "ea2740996508e64c2723d787c892f8b6",
"assets/assets/pages/cupertino_switch.yaml": "505e98d04d04261e49c853431fe4ef15",
"assets/assets/pages/animated_switcher.json": "d24be4fa4076ae23f70a57d7a26104f1",
"assets/assets/pages/rich_text.json": "f8e77f6bfa9a037644aa8fc5266635ef",
"assets/assets/pages/wrap.json": "001b737618074671f403ab1b2d6e7577",
"assets/assets/pages/baseline.json": "886b50b1b559ec51057994b1fe3afad9",
"assets/assets/pages/gestures.json": "114c4ed3b2b428b7526f25651ef8ece5",
"assets/assets/pages/indexed_stack.json": "20e7fe368d6039e6dd05ee6f89dea371",
"assets/assets/pages/fitted_box.json": "353dd5781d74ebcd59ae060a92c545f7",
"assets/assets/pages/fractional_translation.json": "fc40712de7c0d2b5277fe1f28d1657e9",
"assets/assets/pages/layout_builder.json": "bdc32d1af15d25ba89c536087e22646e",
"assets/assets/pages/issue_10.json": "b39997e460fb758601189385c77d7cba",
"assets/assets/pages/bank_example.json": "985ae618c8b7afda3c66b4afb7a2496c",
"assets/assets/pages/aspect_ratio.json": "1876401f10ffbaa21633e5210f754d5a",
"assets/assets/pages/conditional.json": "14f743238ed9abd70f69664409d8d677",
"assets/assets/pages/form.json": "576a166f8629adc84be2e58fa0412113",
"assets/assets/pages/animated_container.json": "1d9df4f2f5eb599106bdcaef26069a06",
"assets/assets/pages/set_default_value.json": "790ed77a3dd3c01ab1ca0a2023b6d720",
"assets/assets/images/image9.jpg": "d4bca3468f462344ec7848569d428f6f",
"assets/assets/images/image14.jpg": "1cabc1330ae62e177103c9afe088277a",
"assets/assets/images/image11.jpg": "7cc720ee31b70b43b17bc85c8925ba78",
"assets/assets/images/image13.jpg": "447faeebf8c418128e7837f0c7771aa3",
"assets/assets/images/image3.jpg": "c82a612fb7053c3036dfb31160a69d44",
"assets/assets/images/image5.jpg": "8d9babc0336b7855a0e32ddb04974793",
"assets/assets/images/image2.jpg": "359677aebb7126b359c557a38a45f2df",
"assets/assets/images/image12.jpg": "fc5f5ce6cc1839caceba61dea24dfd97",
"assets/assets/images/image7.jpg": "e17532bdf7cfbb7c7def0aa13732d1d7",
"assets/assets/images/image10.jpg": "182da97ea5d0f162c77919451e1adc34",
"assets/assets/images/image1.jpg": "c746344e7d2dccea6d4b7138de5317f3",
"assets/assets/images/profile.jpg": "0a07fd15b5f822a326230c211451f611",
"assets/assets/images/image15.jpg": "62265d6c8a5c180b5f8d8fd38778d4dd",
"assets/assets/images/image4.jpg": "534ce2f5ff5e40e97adee7e8b64d1f49",
"assets/assets/images/visa.svg": "45180370eb48dfdbdf59b3be4a3c0b59",
"assets/assets/images/image16.jpg": "2453145aa04982321678b360448a7224",
"assets/assets/images/image6.jpg": "35041a1b17ba4dc6e39be43a192068db",
"assets/assets/images/image17.jpg": "9a5ceb6a65fc25de9b997bb2d9e12013",
"assets/assets/images/image8.jpg": "143b8d86b86c4e9a9d534a2571644c9c",
"assets/AssetManifest.bin": "029a4c4f377d10774f9c921c4217a66d",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/FontManifest.json": "b7320a7ef5ad634fc22b163a16c8a309",
"assets/NOTICES": "640eba6147802e1341cd2d6b7e34df27",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"manifest.json": "15f73b7e8a8209c2206210b3ac8dea1b",
"index.html": "95c1cf462acadb9683d02bd2eb7e8b8e",
"/": "95c1cf462acadb9683d02bd2eb7e8b8e",
"icons/Icon-maskable-512.png": "4387a4ae70489a2ba2d8d361bc0adfac",
"icons/Icon-512.png": "4387a4ae70489a2ba2d8d361bc0adfac",
"icons/Icon-192.png": "1f36ad884a84edadf7fc291583733ca6",
"icons/Icon-maskable-192.png": "1f36ad884a84edadf7fc291583733ca6",
"favicon.png": "0ed3078186d3fa4e8257777838727366",
"version.json": "81399d27d9764dd5bf80701a7f3bcff4",
"canvaskit/canvaskit.wasm": "42df12e09ecc0d5a4a34a69d7ee44314",
"canvaskit/skwasm.worker.js": "51253d3321b11ddb8d73fa8aa87d3b15",
"canvaskit/chromium/canvaskit.wasm": "be0e3b33510f5b7b0cc76cc4d3e50048",
"canvaskit/chromium/canvaskit.js": "96ae916cd2d1b7320fff853ee22aebb0",
"canvaskit/skwasm.wasm": "1a074e8452fe5e0d02b112e22cdcf455",
"canvaskit/canvaskit.js": "bbf39143dfd758d8d847453b120c8ebb",
"canvaskit/skwasm.js": "95f16c6690f955a45b2317496983dbe9",
"flutter.js": "6fef97aeca90b426343ba6c5c9dc5d4a"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
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
