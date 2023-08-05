function _typeof(obj) { if (typeof Symbol === "function" && typeof Symbol.iterator === "symbol") { _typeof = function _typeof(obj) { return typeof obj; }; } else { _typeof = function _typeof(obj) { return obj && typeof Symbol === "function" && obj.constructor === Symbol && obj !== Symbol.prototype ? "symbol" : typeof obj; }; } return _typeof(obj); }

/*!
 * imagesLoaded PACKAGED v4.1.4
 * JavaScript is all like "You images are done yet or what?"
 * MIT License
 */

/**
 * EvEmitter v1.1.0
 * Lil' event emitter
 * MIT License
 */

/* jshint unused: true, undef: true, strict: true */
(function (global, factory) {
  // universal module definition

  /* jshint strict: false */

  /* globals define, module, window */
  if (typeof define == 'function' && define.amd) {
    // AMD - RequireJS
    define('ev-emitter/ev-emitter', factory);
  } else if ((typeof module === "undefined" ? "undefined" : _typeof(module)) == 'object' && module.exports) {
    // CommonJS - Browserify, Webpack
    module.exports = factory();
  } else {
    // Browser globals
    global.EvEmitter = factory();
  }
})(typeof window != 'undefined' ? window : this, function () {
  function EvEmitter() {}

  var proto = EvEmitter.prototype;

  proto.on = function (eventName, listener) {
    if (!eventName || !listener) {
      return;
    } // set events hash


    var events = this._events = this._events || {}; // set listeners array

    var listeners = events[eventName] = events[eventName] || []; // only add once

    if (listeners.indexOf(listener) == -1) {
      listeners.push(listener);
    }

    return this;
  };

  proto.once = function (eventName, listener) {
    if (!eventName || !listener) {
      return;
    } // add event


    this.on(eventName, listener); // set once flag
    // set onceEvents hash

    var onceEvents = this._onceEvents = this._onceEvents || {}; // set onceListeners object

    var onceListeners = onceEvents[eventName] = onceEvents[eventName] || {}; // set flag

    onceListeners[listener] = true;
    return this;
  };

  proto.off = function (eventName, listener) {
    var listeners = this._events && this._events[eventName];

    if (!listeners || !listeners.length) {
      return;
    }

    var index = listeners.indexOf(listener);

    if (index != -1) {
      listeners.splice(index, 1);
    }

    return this;
  };

  proto.emitEvent = function (eventName, args) {
    var listeners = this._events && this._events[eventName];

    if (!listeners || !listeners.length) {
      return;
    } // copy over to avoid interference if .off() in listener


    listeners = listeners.slice(0);
    args = args || []; // once stuff

    var onceListeners = this._onceEvents && this._onceEvents[eventName];

    for (var i = 0; i < listeners.length; i++) {
      var listener = listeners[i];
      var isOnce = onceListeners && onceListeners[listener];

      if (isOnce) {
        // remove listener
        // remove before trigger to prevent recursion
        this.off(eventName, listener); // unset once flag

        delete onceListeners[listener];
      } // trigger listener


      listener.apply(this, args);
    }

    return this;
  };

  proto.allOff = function () {
    delete this._events;
    delete this._onceEvents;
  };

  return EvEmitter;
});
/*!
 * imagesLoaded v4.1.4
 * JavaScript is all like "You images are done yet or what?"
 * MIT License
 */


(function (window, factory) {
  'use strict'; // universal module definition

  /*global define: false, module: false, require: false */

  if (typeof define == 'function' && define.amd) {
    // AMD
    define(['ev-emitter/ev-emitter'], function (EvEmitter) {
      return factory(window, EvEmitter);
    });
  } else if ((typeof module === "undefined" ? "undefined" : _typeof(module)) == 'object' && module.exports) {
    // CommonJS
    module.exports = factory(window, require('ev-emitter'));
  } else {
    // browser global
    window.imagesLoaded = factory(window, window.EvEmitter);
  }
})(typeof window !== 'undefined' ? window : this, // --------------------------  factory -------------------------- //
function factory(window, EvEmitter) {
  var $ = window.jQuery;
  var console = window.console; // -------------------------- helpers -------------------------- //
  // extend objects

  function extend(a, b) {
    for (var prop in b) {
      a[prop] = b[prop];
    }

    return a;
  }

  var arraySlice = Array.prototype.slice; // turn element or nodeList into an array

  function makeArray(obj) {
    if (Array.isArray(obj)) {
      // use object if already an array
      return obj;
    }

    var isArrayLike = _typeof(obj) == 'object' && typeof obj.length == 'number';

    if (isArrayLike) {
      // convert nodeList to array
      return arraySlice.call(obj);
    } // array of single index


    return [obj];
  } // -------------------------- imagesLoaded -------------------------- //

  /**
   * @param {Array, Element, NodeList, String} elem
   * @param {Object or Function} options - if function, use as callback
   * @param {Function} onAlways - callback function
   */


  function ImagesLoaded(elem, options, onAlways) {
    // coerce ImagesLoaded() without new, to be new ImagesLoaded()
    if (!(this instanceof ImagesLoaded)) {
      return new ImagesLoaded(elem, options, onAlways);
    } // use elem as selector string


    var queryElem = elem;

    if (typeof elem == 'string') {
      queryElem = document.querySelectorAll(elem);
    } // bail if bad element


    if (!queryElem) {
      console.error('Bad element for imagesLoaded ' + (queryElem || elem));
      return;
    }

    this.elements = makeArray(queryElem);
    this.options = extend({}, this.options); // shift arguments if no options set

    if (typeof options == 'function') {
      onAlways = options;
    } else {
      extend(this.options, options);
    }

    if (onAlways) {
      this.on('always', onAlways);
    }

    this.getImages();

    if ($) {
      // add jQuery Deferred object
      this.jqDeferred = new $.Deferred();
    } // HACK check async to allow time to bind listeners


    setTimeout(this.check.bind(this));
  }

  ImagesLoaded.prototype = Object.create(EvEmitter.prototype);
  ImagesLoaded.prototype.options = {};

  ImagesLoaded.prototype.getImages = function () {
    this.images = []; // filter & find items if we have an item selector

    this.elements.forEach(this.addElementImages, this);
  };
  /**
   * @param {Node} element
   */


  ImagesLoaded.prototype.addElementImages = function (elem) {
    // filter siblings
    if (elem.nodeName == 'IMG') {
      this.addImage(elem);
    } // get background image on element


    if (this.options.background === true) {
      this.addElementBackgroundImages(elem);
    } // find children
    // no non-element nodes, #143


    var nodeType = elem.nodeType;

    if (!nodeType || !elementNodeTypes[nodeType]) {
      return;
    }

    var childImgs = elem.querySelectorAll('img'); // concat childElems to filterFound array

    for (var i = 0; i < childImgs.length; i++) {
      var img = childImgs[i];
      this.addImage(img);
    } // get child background images


    if (typeof this.options.background == 'string') {
      var children = elem.querySelectorAll(this.options.background);

      for (i = 0; i < children.length; i++) {
        var child = children[i];
        this.addElementBackgroundImages(child);
      }
    }
  };

  var elementNodeTypes = {
    1: true,
    9: true,
    11: true
  };

  ImagesLoaded.prototype.addElementBackgroundImages = function (elem) {
    var style = getComputedStyle(elem);

    if (!style) {
      // Firefox returns null if in a hidden iframe https://bugzil.la/548397
      return;
    } // get url inside url("...")


    var reURL = /url\((['"])?(.*?)\1\)/gi;
    var matches = reURL.exec(style.backgroundImage);

    while (matches !== null) {
      var url = matches && matches[2];

      if (url) {
        this.addBackground(url, elem);
      }

      matches = reURL.exec(style.backgroundImage);
    }
  };
  /**
   * @param {Image} img
   */


  ImagesLoaded.prototype.addImage = function (img) {
    var loadingImage = new LoadingImage(img);
    this.images.push(loadingImage);
  };

  ImagesLoaded.prototype.addBackground = function (url, elem) {
    var background = new Background(url, elem);
    this.images.push(background);
  };

  ImagesLoaded.prototype.check = function () {
    var _this = this;

    this.progressedCount = 0;
    this.hasAnyBroken = false; // complete if no images

    if (!this.images.length) {
      this.complete();
      return;
    }

    function onProgress(image, elem, message) {
      // HACK - Chrome triggers event before object properties have changed. #83
      setTimeout(function () {
        _this.progress(image, elem, message);
      });
    }

    this.images.forEach(function (loadingImage) {
      loadingImage.once('progress', onProgress);
      loadingImage.check();
    });
  };

  ImagesLoaded.prototype.progress = function (image, elem, message) {
    this.progressedCount++;
    this.hasAnyBroken = this.hasAnyBroken || !image.isLoaded; // progress event

    this.emitEvent('progress', [this, image, elem]);

    if (this.jqDeferred && this.jqDeferred.notify) {
      this.jqDeferred.notify(this, image);
    } // check if completed


    if (this.progressedCount == this.images.length) {
      this.complete();
    }

    if (this.options.debug && console) {
      console.log('progress: ' + message, image, elem);
    }
  };

  ImagesLoaded.prototype.complete = function () {
    var eventName = this.hasAnyBroken ? 'fail' : 'done';
    this.isComplete = true;
    this.emitEvent(eventName, [this]);
    this.emitEvent('always', [this]);

    if (this.jqDeferred) {
      var jqMethod = this.hasAnyBroken ? 'reject' : 'resolve';
      this.jqDeferred[jqMethod](this);
    }
  }; // --------------------------  -------------------------- //


  function LoadingImage(img) {
    this.img = img;
  }

  LoadingImage.prototype = Object.create(EvEmitter.prototype);

  LoadingImage.prototype.check = function () {
    // If complete is true and browser supports natural sizes,
    // try to check for image status manually.
    var isComplete = this.getIsImageComplete();

    if (isComplete) {
      // report based on naturalWidth
      this.confirm(this.img.naturalWidth !== 0, 'naturalWidth');
      return;
    } // If none of the checks above matched, simulate loading on detached element.


    this.proxyImage = new Image();
    this.proxyImage.addEventListener('load', this);
    this.proxyImage.addEventListener('error', this); // bind to image as well for Firefox. #191

    this.img.addEventListener('load', this);
    this.img.addEventListener('error', this);
    this.proxyImage.src = this.img.src;
  };

  LoadingImage.prototype.getIsImageComplete = function () {
    // check for non-zero, non-undefined naturalWidth
    // fixes Safari+InfiniteScroll+Masonry bug infinite-scroll#671
    return this.img.complete && this.img.naturalWidth;
  };

  LoadingImage.prototype.confirm = function (isLoaded, message) {
    this.isLoaded = isLoaded;
    this.emitEvent('progress', [this, this.img, message]);
  }; // ----- events ----- //
  // trigger specified handler for event type


  LoadingImage.prototype.handleEvent = function (event) {
    var method = 'on' + event.type;

    if (this[method]) {
      this[method](event);
    }
  };

  LoadingImage.prototype.onload = function () {
    this.confirm(true, 'onload');
    this.unbindEvents();
  };

  LoadingImage.prototype.onerror = function () {
    this.confirm(false, 'onerror');
    this.unbindEvents();
  };

  LoadingImage.prototype.unbindEvents = function () {
    this.proxyImage.removeEventListener('load', this);
    this.proxyImage.removeEventListener('error', this);
    this.img.removeEventListener('load', this);
    this.img.removeEventListener('error', this);
  }; // -------------------------- Background -------------------------- //


  function Background(url, element) {
    this.url = url;
    this.element = element;
    this.img = new Image();
  } // inherit LoadingImage prototype


  Background.prototype = Object.create(LoadingImage.prototype);

  Background.prototype.check = function () {
    this.img.addEventListener('load', this);
    this.img.addEventListener('error', this);
    this.img.src = this.url; // check if image is already complete

    var isComplete = this.getIsImageComplete();

    if (isComplete) {
      this.confirm(this.img.naturalWidth !== 0, 'naturalWidth');
      this.unbindEvents();
    }
  };

  Background.prototype.unbindEvents = function () {
    this.img.removeEventListener('load', this);
    this.img.removeEventListener('error', this);
  };

  Background.prototype.confirm = function (isLoaded, message) {
    this.isLoaded = isLoaded;
    this.emitEvent('progress', [this, this.element, message]);
  }; // -------------------------- jQuery -------------------------- //


  ImagesLoaded.makeJQueryPlugin = function (jQuery) {
    jQuery = jQuery || window.jQuery;

    if (!jQuery) {
      return;
    } // set local variable


    $ = jQuery; // $().imagesLoaded()

    $.fn.imagesLoaded = function (options, callback) {
      var instance = new ImagesLoaded(this, options, callback);
      return instance.jqDeferred.promise($(this));
    };
  }; // try making plugin


  ImagesLoaded.makeJQueryPlugin(); // --------------------------  -------------------------- //

  return ImagesLoaded;
});
/*!
 * VERSION: 1.9.1
 * DATE: 2018-05-21
 * UPDATES AND DOCS AT: http://greensock.com
 *
 * @license Copyright (c) 2008-2018, GreenSock. All rights reserved.
 * This work is subject to the terms at http://greensock.com/standard-license or for
 * Club GreenSock members, the software agreement that was issued with your membership.
 * 
 * @author: Jack Doyle, jack@greensock.com
 **/


var _gsScope = typeof module !== "undefined" && module.exports && typeof global !== "undefined" ? global : this || window; //helps ensure compatibility with AMD/RequireJS and CommonJS/Node


(_gsScope._gsQueue || (_gsScope._gsQueue = [])).push(function () {
  "use strict";

  var _doc = (_gsScope.document || {}).documentElement,
      _window = _gsScope,
      _max = function _max(element, axis) {
    var dim = axis === "x" ? "Width" : "Height",
        scroll = "scroll" + dim,
        client = "client" + dim,
        body = document.body;
    return element === _window || element === _doc || element === body ? Math.max(_doc[scroll], body[scroll]) - (_window["inner" + dim] || _doc[client] || body[client]) : element[scroll] - element["offset" + dim];
  },
      _unwrapElement = function _unwrapElement(value) {
    if (typeof value === "string") {
      value = TweenLite.selector(value);
    }

    if (value.length && value !== _window && value[0] && value[0].style && !value.nodeType) {
      value = value[0];
    }

    return value === _window || value.nodeType && value.style ? value : null;
  },
      _buildGetter = function _buildGetter(e, axis) {
    //pass in an element and an axis ("x" or "y") and it'll return a getter function for the scroll position of that element (like scrollTop or scrollLeft, although if the element is the window, it'll use the pageXOffset/pageYOffset or the documentElement's scrollTop/scrollLeft or document.body's. Basically this streamlines things and makes a very fast getter across browsers.
    var p = "scroll" + (axis === "x" ? "Left" : "Top");

    if (e === _window) {
      if (e.pageXOffset != null) {
        p = "page" + axis.toUpperCase() + "Offset";
      } else if (_doc[p] != null) {
        e = _doc;
      } else {
        e = document.body;
      }
    }

    return function () {
      return e[p];
    };
  },
      _getOffset = function _getOffset(element, container) {
    var rect = _unwrapElement(element).getBoundingClientRect(),
        b = document.body,
        isRoot = !container || container === _window || container === b,
        cRect = isRoot ? {
      top: _doc.clientTop - (window.pageYOffset || _doc.scrollTop || b.scrollTop || 0),
      left: _doc.clientLeft - (window.pageXOffset || _doc.scrollLeft || b.scrollLeft || 0)
    } : container.getBoundingClientRect(),
        offsets = {
      x: rect.left - cRect.left,
      y: rect.top - cRect.top
    };

    if (!isRoot && container) {
      //only add the current scroll position if it's not the window/body.
      offsets.x += _buildGetter(container, "x")();
      offsets.y += _buildGetter(container, "y")();
    }

    return offsets;
    /*	PREVIOUS
    var rect = _unwrapElement(element).getBoundingClientRect(),
    	isRoot = (!container || container === _window || container === document.body),
    	cRect = (isRoot ? _doc : container).getBoundingClientRect(),
    	offsets = {x: rect.left - cRect.left, y: rect.top - cRect.top};
    if (!isRoot && container) { //only add the current scroll position if it's not the window/body.
    	offsets.x += _buildGetter(container, "x")();
    	offsets.y += _buildGetter(container, "y")();
    }
    return offsets;
    */
  },
      _parseVal = function _parseVal(value, target, axis) {
    var type = _typeof(value);

    return !isNaN(value) ? parseFloat(value) : type === "number" || type === "string" && value.charAt(1) === "=" ? value : value === "max" ? _max(target, axis) : Math.min(_max(target, axis), _getOffset(value, target)[axis]);
  },
      ScrollToPlugin = _gsScope._gsDefine.plugin({
    propName: "scrollTo",
    API: 2,
    global: true,
    version: "1.9.1",
    //called when the tween renders for the first time. This is where initial values should be recorded and any setup routines should run.
    init: function init(target, value, tween) {
      this._wdw = target === _window;
      this._target = target;
      this._tween = tween;

      if (_typeof(value) !== "object") {
        value = {
          y: value
        }; //if we don't receive an object as the parameter, assume the user intends "y".

        if (typeof value.y === "string" && value.y !== "max" && value.y.charAt(1) !== "=") {
          value.x = value.y;
        }
      } else if (value.nodeType) {
        value = {
          y: value,
          x: value
        };
      }

      this.vars = value;
      this._autoKill = value.autoKill !== false;
      this.getX = _buildGetter(target, "x");
      this.getY = _buildGetter(target, "y");
      this.x = this.xPrev = this.getX();
      this.y = this.yPrev = this.getY();

      if (value.x != null) {
        this._addTween(this, "x", this.x, _parseVal(value.x, target, "x") - (value.offsetX || 0), "scrollTo_x", true);

        this._overwriteProps.push("scrollTo_x");
      } else {
        this.skipX = true;
      }

      if (value.y != null) {
        this._addTween(this, "y", this.y, _parseVal(value.y, target, "y") - (value.offsetY || 0), "scrollTo_y", true);

        this._overwriteProps.push("scrollTo_y");
      } else {
        this.skipY = true;
      }

      return true;
    },
    //called each time the values should be updated, and the ratio gets passed as the only parameter (typically it's a value between 0 and 1, but it can exceed those when using an ease like Elastic.easeOut or Back.easeOut, etc.)
    set: function set(v) {
      this._super.setRatio.call(this, v);

      var x = this._wdw || !this.skipX ? this.getX() : this.xPrev,
          y = this._wdw || !this.skipY ? this.getY() : this.yPrev,
          yDif = y - this.yPrev,
          xDif = x - this.xPrev,
          threshold = ScrollToPlugin.autoKillThreshold;

      if (this.x < 0) {
        //can't scroll to a position less than 0! Might happen if someone uses a Back.easeOut or Elastic.easeOut when scrolling back to the top of the page (for example)
        this.x = 0;
      }

      if (this.y < 0) {
        this.y = 0;
      }

      if (this._autoKill) {
        //note: iOS has a bug that throws off the scroll by several pixels, so we need to check if it's within 7 pixels of the previous one that we set instead of just looking for an exact match.
        if (!this.skipX && (xDif > threshold || xDif < -threshold) && x < _max(this._target, "x")) {
          this.skipX = true; //if the user scrolls separately, we should stop tweening!
        }

        if (!this.skipY && (yDif > threshold || yDif < -threshold) && y < _max(this._target, "y")) {
          this.skipY = true; //if the user scrolls separately, we should stop tweening!
        }

        if (this.skipX && this.skipY) {
          this._tween.kill();

          if (this.vars.onAutoKill) {
            this.vars.onAutoKill.apply(this.vars.onAutoKillScope || this._tween, this.vars.onAutoKillParams || []);
          }
        }
      }

      if (this._wdw) {
        _window.scrollTo(!this.skipX ? this.x : x, !this.skipY ? this.y : y);
      } else {
        if (!this.skipY) {
          this._target.scrollTop = this.y;
        }

        if (!this.skipX) {
          this._target.scrollLeft = this.x;
        }
      }

      this.xPrev = this.x;
      this.yPrev = this.y;
    }
  }),
      p = ScrollToPlugin.prototype;

  ScrollToPlugin.max = _max;
  ScrollToPlugin.getOffset = _getOffset;
  ScrollToPlugin.buildGetter = _buildGetter;
  ScrollToPlugin.autoKillThreshold = 7;

  p._kill = function (lookup) {
    if (lookup.scrollTo_x) {
      this.skipX = true;
    }

    if (lookup.scrollTo_y) {
      this.skipY = true;
    }

    return this._super._kill.call(this, lookup);
  };
});

if (_gsScope._gsDefine) {
  _gsScope._gsQueue.pop()();
} //export to AMD/RequireJS and CommonJS/Node (precursor to full modular build system coming at a later date)


(function (name) {
  "use strict";

  var getGlobal = function getGlobal() {
    return (_gsScope.GreenSockGlobals || _gsScope)[name];
  };

  if (typeof module !== "undefined" && module.exports) {
    //node
    require("../TweenLite.js");

    module.exports = getGlobal();
  } else if (typeof define === "function" && define.amd) {
    //AMD
    define(["TweenLite"], getGlobal);
  }
})("ScrollToPlugin");