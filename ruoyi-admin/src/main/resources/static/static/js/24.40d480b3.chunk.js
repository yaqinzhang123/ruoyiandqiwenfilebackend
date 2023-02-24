(this["webpackJsonpcesium-demo"]=this["webpackJsonpcesium-demo"]||[]).push([[24],{1041:function(e,i,t){"use strict";window.Cesium.FirstPersonCameraController=function(){var e=window.Cesium.Cartesian3,i=88,t=-55;function n(e){this._enabled=!1,this._cesiumViewer=e.cesiumViewer,this._canvas=this._cesiumViewer.canvas,this._camera=this._cesiumViewer.camera,this.Gravity=!1,this.speed=.1}n.prototype._connectEventHandlers=function(){var e=this._cesiumViewer.canvas;this._screenSpaceEventHandler=new window.Cesium.ScreenSpaceEventHandler(this._canvas),this._screenSpaceEventHandler.setInputAction(this._onMouseLButtonClicked.bind(this),window.Cesium.ScreenSpaceEventType.LEFT_DOWN),this._screenSpaceEventHandler.setInputAction(this._onMouseUp.bind(this),window.Cesium.ScreenSpaceEventType.LEFT_UP),this._screenSpaceEventHandler.setInputAction(this._onMouseMove.bind(this),window.Cesium.ScreenSpaceEventType.MOUSE_MOVE),this._screenSpaceEventHandler.setInputAction(this._onMouseLButtonDoubleClicked.bind(this),window.Cesium.ScreenSpaceEventType.LEFT_DOUBLE_CLICK),e.setAttribute("tabindex","0"),e.onclick=function(){e.focus()},e.addEventListener("keydown",this._onKeyDown.bind(this)),e.addEventListener("keyup",this._onKeyUp.bind(this)),this._disconectOnClockTick=this._cesiumViewer.clock.onTick.addEventListener(n.prototype._onClockTick,this)},n.prototype._onMouseLButtonClicked=function(i){this._looking=!0,this._startMousePosition=e.clone(i.position),this.currentHeadingInDegree=window.Cesium.Math.toDegrees(this._camera.heading),this.currentPitchInDegree=window.Cesium.Math.toDegrees(this._camera.pitch)},n.prototype._onMouseLButtonDoubleClicked=function(i){this._looking=!0,this._mousePosition=this._startMousePosition=e.clone(i.position)},n.prototype._onMouseUp=function(e){this._looking=!1},n.prototype._onMouseMove=function(e){this._mousePosition=e.endPosition,this._looking&&this._changeHeadingPitchTest()},n.prototype._changeHeadingPitchTest=function(){var e=this._canvas.clientWidth,n=this._canvas.clientHeight,o=(this._mousePosition.x-this._startMousePosition.x)/e,r=-(this._mousePosition.y-this._startMousePosition.y)/n,s=o*t,a=this.currentHeadingInDegree+s,c=r*t,h=this.currentPitchInDegree+c;h>176&&h<272?h=272:h>i&&h<272&&(h=i),this._camera.setView({orientation:{heading:window.Cesium.Math.toRadians(a),pitch:window.Cesium.Math.toRadians(h),roll:this._camera.roll}})},n.prototype.ChangeHeight=function(e){if((0===this._direction||1===this._direction||2===this._direction||3===this._direction)&&this.Gravity){var i=this._cesiumViewer.scene.clampToHeight(e,this._cesiumViewer.entities.values);if(i){var t=this._cesiumViewer.scene.globe.ellipsoid.cartesianToCartographic(i);r=t.height}else r=this._cesiumViewer.scene.globe.getHeight(d)}};var o=[];n.prototype._onKeyDown=function(e){switch(e.keyCode){case"W".charCodeAt(0):return this._direction=0,void(-1==o.indexOf("w")&&o.push("w"));case"S".charCodeAt(0):return this._direction=1,void(-1==o.indexOf("s")&&o.push("s"));case"D".charCodeAt(0):return this._direction=3,void(-1==o.indexOf("d")&&o.push("d"));case"A".charCodeAt(0):return this._direction=2,void(-1==o.indexOf("a")&&o.push("a"));case"Q".charCodeAt(0):return this._direction=4,void(-1==o.indexOf("q")&&o.push("q"));case"E".charCodeAt(0):return this._direction=5,void(-1==o.indexOf("e")&&o.push("e"));case 90:default:return}},n.prototype.changedir=function(e){if(0==(o=o.filter((function(i){return i!=e}))).length)this._direction=-1;else switch(o[0]){case"w":return void(this._direction=0);case"s".charCodeAt(0):return void(this._direction=1);case"d".charCodeAt(0):return void(this._direction=3);case"a".charCodeAt(0):return void(this._direction=2);case"q".charCodeAt(0):return void(this._direction=4);case"e".charCodeAt(0):return void(this._direction=5)}},n.prototype._onKeyUp=function(e){switch(e.keyCode){case"W".charCodeAt(0):return void this.changedir("w");case"S".charCodeAt(0):return void this.changedir("s");case"D".charCodeAt(0):return void this.changedir("d");case"A".charCodeAt(0):return void this.changedir("a");case"Q".charCodeAt(0):return void this.changedir("q");case"E".charCodeAt(0):return void this.changedir("e");case 90:default:return}},n.prototype._changeHeadingPitch=function(){var e=this._canvas.clientWidth,n=this._canvas.clientHeight,o=(this._mousePosition.x-this._startMousePosition.x)/e,r=-(this._mousePosition.y-this._startMousePosition.y)/n,s=window.Cesium.Math.toDegrees(this._camera.heading)+o*t,a=window.Cesium.Math.toDegrees(this._camera.pitch)+r*t;a>176&&a<272?a=272:a>i&&a<272&&(a=i),this._camera.setView({orientation:{heading:window.Cesium.Math.toRadians(s),pitch:window.Cesium.Math.toRadians(a),roll:this._camera.roll}})};var r,s=new e,a=new e,c=new e,h=new e,d=new window.Cesium.Cartographic;return n.prototype._onClockTick=function(i){if(this._enabled){var t=i._clockStep;if(-1!==this._direction){var n=this.speed*t;0===this._direction?e.multiplyByScalar(this._camera.direction,1,s):1===this._direction?e.multiplyByScalar(this._camera.direction,-1,s):2===this._direction?e.multiplyByScalar(this._camera.right,-1,s):3===this._direction?e.multiplyByScalar(this._camera.right,1,s):4===this._direction?(e.multiplyByScalar(this._camera.right,0,s),r-=.1*this.speed):5===this._direction&&(e.multiplyByScalar(this._camera.right,0,s),r+=.1*this.speed),e.multiplyByScalar(s,n,a);var o=this._camera.position;e.add(o,a,c);var u=this._cesiumViewer.scene.globe.ellipsoid;u.cartesianToCartographic(c,d),this.ChangeHeight(c),void 0!==r?(r<0&&console.warn("height is negative!"),d.height=r+1.65,u.cartographicToCartesian(d,h),this._camera.setView({destination:h,orientation:new window.Cesium.HeadingPitchRoll(this._camera.heading,this._camera.pitch,this._camera.roll),endTransform:window.Cesium.Matrix4.IDENTITY})):console.warn("height is undefined!")}}},n.prototype._enableDefaultScreenSpaceCameraController=function(e){var i=this._cesiumViewer.scene;i.screenSpaceCameraController.enableRotate=e,i.screenSpaceCameraController.enableTranslate=e,i.screenSpaceCameraController.enableZoom=e,i.screenSpaceCameraController.enableTilt=e,i.screenSpaceCameraController.enableLook=e},n.prototype.start=function(){this._enabled=!0,this._enableDefaultScreenSpaceCameraController(!1);var i=this._camera.position,t=new window.Cesium.Cartographic,n=this._cesiumViewer.scene.globe;n.ellipsoid.cartesianToCartographic(i,t);var o=this._cesiumViewer.scene.clampToHeight(i,this._cesiumViewer.entities.values);if(o){var s=n.ellipsoid.cartesianToCartographic(o);r=s.height}else r=n.getHeight(t);if(void 0===r)return!1;r<0&&console.warn("height is negative"),t.height=r+1.65;var a=new e;n.ellipsoid.cartographicToCartesian(t,a);var c=this._camera.heading;return this._heading=c,this._camera.flyTo({destination:a,orientation:{heading:c,pitch:window.Cesium.Math.toRadians(0),roll:0}}),this._connectEventHandlers(),!0},n.prototype.stop=function(){this._enabled=!1,this._enableDefaultScreenSpaceCameraController(!0),this._screenSpaceEventHandler.removeInputAction(window.Cesium.ScreenSpaceEventType.LEFT_DOWN),this._screenSpaceEventHandler.removeInputAction(window.Cesium.ScreenSpaceEventType.LEFT_UP),this._screenSpaceEventHandler.removeInputAction(window.Cesium.ScreenSpaceEventType.MOUSE_MOVE),this._screenSpaceEventHandler.removeInputAction(window.Cesium.ScreenSpaceEventType.LEFT_DOUBLE_CLICK),this._cesiumViewer.clock.onTick.removeEventListener(n.prototype._onClockTick,this)},n}()},398:function(e,i,t){"use strict";t.r(i),t.d(i,"default",(function(){return a}));var n=t(49),o=t(50),r=(t(1041),null),s=null,a=function(){function e(i,t,o){var a=this;Object(n.a)(this,e),this.setGravity=function(e){null!=a.firstPersonCameraController&&(a.firstPersonCameraController.Gravity=e)},this.setSpeed=function(e){null!=a.firstPersonCameraController&&(a.firstPersonCameraController.speed=e)},r=i,s=t,this.firstPersonCameraController=null}return Object(o.a)(e,[{key:"load",value:function(){return""!=r.ActiveComponent&&r.modes[r.ActiveComponent].unload(),r.ActiveComponent="FirstPersonCamera",null==this.firstPersonCameraController&&(this.firstPersonCameraController=new window.Cesium.FirstPersonCameraController({cesiumViewer:r})),r.screenSpaceEventHandler.setInputAction((function(){}),s.ScreenSpaceEventType.LEFT_CLICK),r.screenSpaceEventHandler.setInputAction((function(){}),s.ScreenSpaceEventType.MOUSE_MOVE),this.firstPersonCameraController.start(),!0}},{key:"unload",value:function(){return this.firstPersonCameraController.stop(),r.ActiveComponent="",r.modes.CustomPropertyPanel.load(),!0}}]),e}()}}]);