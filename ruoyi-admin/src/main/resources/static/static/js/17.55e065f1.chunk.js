(this["webpackJsonpcesium-demo"]=this["webpackJsonpcesium-demo"]||[]).push([[17],{412:function(e,t,i){"use strict";i.r(t),i.d(t,"default",(function(){return b}));var n=i(49),s=i(50),r=i(10),o=i.n(r),a=i(123),c=i.n(a),u=i(195),l=i.n(u),p=i(52),h=i(51),m=i(486),d=i(488),v=(i(490),i(508)),g=i(456),f=i(23),C=function(e){Object(p.a)(i,e);var t=Object(h.a)(i);function i(e){var s;return Object(n.a)(this,i),(s=t.call(this,e))._trianglesEntity=void 0,s._tempLineEntity=void 0,s._tempLineEntity2=void 0,s._tempPoints=void 0,s._tempPoints2=void 0,s.positions=void 0,s.markPointsEntity=void 0,s.stateChange=void 0,s._handlers=void 0,s.state={tagText:null,_lineLabel:null,_lineLabelPoint:null,_heightLabel:null,_heightLabelPoint:null,_distanceLabel:null,_distanceLabelPoint:null,showTag:!0},s._getHeading=function(e,t){if(!e&&!t)return 0;if(Cesium.Cartesian3.equals(e,t))return 0;var i=Cesium.Cartographic.fromCartesian(e),n=Cesium.Cartographic.fromCartesian(t);return parseFloat((n.height-i.height).toFixed(2))},s._computesHorizontalLine=function(e){var t=Cesium.Cartographic.fromCartesian(e[0]),i=Cesium.Cartographic.fromCartesian(e[1]);return Cesium.Cartesian3.fromDegrees(Cesium.Math.toDegrees(t.longitude),Cesium.Math.toDegrees(t.latitude),i.height)},s.positions=[],s.markPointsEntity=[],s._tempPoints=[],s._tempPoints2=[],s._trianglesEntity=new Cesium.Entity,s._tempLineEntity=new Cesium.Entity,s._tempLineEntity2=new Cesium.Entity,s._handlers=new Cesium.ScreenSpaceEventHandler(s.props.viewer.scene.canvas),s.stateChange=new Cesium.Event,s}return Object(s.a)(i,[{key:"componentDidMount",value:function(){var e=this;this.setState({tagText:"\u5de6\u5355\u51fb-\u5f00\u59cb\u7ed8\u5236"}),this._handlers.setInputAction((function(t){var i=Object(v.a)(e.props.viewer,t.position);if(!i)return!1;0==e.positions.length?(e.positions.push(i.clone()),e.positions.push(i.clone()),e._tempPoints.push(i.clone()),e._tempPoints.push(i.clone()),e.markPointsEntity.push(Object(g.d)(e.props.viewer,i)),e.setState({tagText:"\u79fb\u52a8\u9f20\u6807-\u8fdb\u884c\u6d4b\u91cf \u5de6\u5355\u51fb-\u505c\u6b62"})):(e._handlers.destroy(),e.setState({showTag:!1}),e.stateChange.raiseEvent(!1))}),Cesium.ScreenSpaceEventType.LEFT_CLICK),this._handlers.setInputAction((function(t){if(0!=e.positions.length){var i=Object(v.a)(e.props.viewer,t.endPosition);if(i){e.positions.pop(),e.positions.push(i.clone());var n=e._computesHorizontalLine(e.positions);e._tempPoints.pop(),e._tempPoints.push(n.clone()),e._tempPoints2.pop(),e._tempPoints2.pop(),e._tempPoints2.push(i.clone()),e._tempPoints2.push(n.clone());var s="\u6c34\u5e73\u8ddd\u79bb:"+Object(v.d)(Object(v.f)(e._tempPoints2))+"\u7c73\n",r="\u76f4\u7ebf:"+Object(v.d)(Object(v.f)(e.positions))+"\u7c73\n",o="\u9ad8\u5ea6:"+e._getHeading(e._tempPoints[0],e._tempPoints[1])+"\u7c73",a=Object(v.c)(e.props.viewer,e.positions[0],e.positions[1]),c=Object(v.c)(e.props.viewer,e._tempPoints[0],e._tempPoints[1]),u=Object(v.c)(e.props.viewer,e._tempPoints2[0],e._tempPoints2[1]);e.setState({_lineLabel:r,_lineLabelPoint:a,_distanceLabelPoint:u,_heightLabelPoint:c,_heightLabel:o,_distanceLabel:s})}}}),Cesium.ScreenSpaceEventType.MOUSE_MOVE),this._trianglesEntity.polyline=new Cesium.PolylineGraphics({positions:new Cesium.CallbackProperty((function(){return e.positions}),!1),width:3,material:Cesium.Color.BLUE.withAlpha(.5)}),this._trianglesEntity.point=new Cesium.PointGraphics({pixelSize:5,outlineColor:Cesium.Color.BLUE,outlineWidth:5}),this._tempLineEntity.polyline=new Cesium.PolylineGraphics({positions:new Cesium.CallbackProperty((function(){return e._tempPoints}),!1),width:3,material:Cesium.Color.BLUE.withAlpha(.5)}),this._tempLineEntity.point=new Cesium.PointGraphics({pixelSize:5,outlineColor:Cesium.Color.BLUE,outlineWidth:5}),this._tempLineEntity2.polyline=new Cesium.PolylineGraphics({positions:new Cesium.CallbackProperty((function(){return e._tempPoints2}),!1)}),this.props.viewer.entities.add(this._tempLineEntity2),this.props.viewer.entities.add(this._tempLineEntity),this.props.viewer.entities.add(this._trianglesEntity)}},{key:"componentWillUnmount",value:function(){var e=this;this.props.viewer.entities.remove(this._tempLineEntity2),this.props.viewer.entities.remove(this._tempLineEntity),this.props.viewer.entities.remove(this._trianglesEntity),this.markPointsEntity.forEach((function(t){return e.props.viewer.entities.remove(t)}))}},{key:"render",value:function(){var e=this.state,t=(e.tagText,e.showTag);return Object(f.jsxs)(o.a.Fragment,{children:[t?Object(f.jsx)(m.a,{viewer:this.props.viewer,trackCursor:!0,alignX:"left",alignY:"center",children:Object(f.jsx)(d.a,{text:this.state.tagText})}):null,this.state._lineLabelPoint?Object(f.jsx)(m.a,{viewer:this.props.viewer,trackPos:this.state._lineLabelPoint,alignX:"left",alignY:"center",children:Object(f.jsx)(d.a,{text:this.state._lineLabel})}):Object(f.jsx)(f.Fragment,{}),this.state._distanceLabelPoint?Object(f.jsx)(m.a,{viewer:this.props.viewer,trackPos:this.state._distanceLabelPoint,alignX:"left",alignY:"center",children:Object(f.jsx)(d.a,{text:this.state._distanceLabel})}):Object(f.jsx)(f.Fragment,{}),this.state._heightLabelPoint?Object(f.jsx)(m.a,{viewer:this.props.viewer,trackPos:this.state._heightLabelPoint,alignX:"left",alignY:"center",children:Object(f.jsx)(d.a,{text:this.state._heightLabel})}):Object(f.jsx)(f.Fragment,{})]})}}]),i}(o.a.Component),b=function(){function e(t,i,s){Object(n.a)(this,e),this.viewer=t,this.cesium=i,this.extensionName="Measurement/measureTools/TriAngle",this.ids=[],this.coms=[],this.options=s,this.isRunning=!0}return Object(s.a)(e,[{key:"getGuid",value:function(){var e=arguments.length>0&&void 0!==arguments[0]?arguments[0]:"xxxxxxxxxx",t=(new Date).getTime(),i=e.replace(/[xy]/g,(function(e){var i=(t+16*Math.random())%16|0;return t=Math.floor(t/16),("x"==e?i:7&i|8).toString(16)}));return i}},{key:"create",value:function(){var e=this,t=l()("#cesiumContainer")[0],i=this.getGuid(),n="<div id=".concat(i,"></div>");l()(t).append(n);var s=c.a.render(Object(f.jsx)(C,{viewer:this.viewer,options:this.options}),document.getElementById(i));s.stateChange.addEventListener((function(t){e.isRunning=t})),this.ids.push(i),this.coms.push(s)}},{key:"load",value:function(){return!0}},{key:"unload",value:function(){return this.ids.forEach((function(e){c.a.unmountComponentAtNode(document.getElementById(e)),l()("#"+e).remove()})),this.viewer.modes[this.extensionName]=null,!0}}]),e}()},456:function(e,t,i){"use strict";i.d(t,"c",(function(){return n})),i.d(t,"b",(function(){return s})),i.d(t,"d",(function(){return a})),i.d(t,"a",(function(){return c}));var n,s,r=i(49),o=i(50);function a(e,t){return e.entities.add({position:t,point:{pixelSize:5,color:Cesium.Color.WHITE,outlineColor:Cesium.Color.DEEPPINK,outlineWidth:2,disableDepthTestDistance:Number.POSITIVE_INFINITY}})}!function(e){e.POINT="\u70b9\u6d4b\u91cf",e.LINE="\u7ebf\u6bb5\u6d4b\u91cf",e.VOLUME="\u4f53\u79ef\u6d4b\u91cf",e.AREA="\u9762\u79ef\u6d4b\u91cf"}(n||(n={})),function(e){e.WAITING="\u7b49\u5f85\u4e2d",e.SAMPLING="\u91c7\u6837\u4e2d",e.COMPUING="\u8ba1\u7b97\u4e2d",e.FINISHED="\u6d4b\u91cf\u7ed3\u675f"}(s||(s={}));var c=function(){function e(t){var i=this;Object(r.a)(this,e),this.type=void 0,this.currentMeasure=void 0,this.handler=void 0,this._beActived=!1,this.viewer=void 0,this.addSamplePoint=function(e){var t=function(e,t){var i=e.camera.getPickRay(t),n=e.scene.pickFromRay(i,[]);return n&&null!=n.position?e.scene.clampToHeight(n.position):null}(i.viewer,e);return null!=t?{ins:a(i.viewer,t),pos:t}:null},this.active=function(){i.beActived=!0,i.onStateChange.raiseEvent(i.beActived)},this.onSampleChange=new Cesium.Event,this.onStateChange=new Cesium.Event,this.onEndMeasure=new Cesium.Event,this.viewer=t,this.createEventHandler()}return Object(o.a)(e,[{key:"beActived",get:function(){return this._beActived},set:function(e){this._beActived=e,this.onStateChange.raiseEvent(e)}},{key:"disActive",value:function(){this.beActived=!1,this.onStateChange.raiseEvent(this.beActived),this.currentMeasure.dispose(this.viewer),this.currentMeasure=void 0}}]),e}()},486:function(e,t,i){"use strict";i.d(t,"a",(function(){return p}));var n=i(514),s=i(49),r=i(50),o=i(52),a=i(51),c=i(10),u=i.n(c),l=(i(487),i(23)),p=function(e){Object(o.a)(i,e);var t=Object(a.a)(i);function i(e){var n;(Object(s.a)(this,i),(n=t.call(this,e)).element=void 0,n.mousePos=void 0,n.onUpdate=function(){if(null!=n.element){var e;if(n.props.trackCursor)e=n.mousePos;else if(n.props.trackEntity){var t=n.props.trackEntity.position.getValue(Cesium.JulianDate.now());e=Cesium.SceneTransforms.wgs84ToWindowCoordinates(n.props.viewer.scene,t)}else n.props.trackPos&&(e=Cesium.SceneTransforms.wgs84ToWindowCoordinates(n.props.viewer.scene,n.props.trackPos));if(e){switch(n.element.style.display="",n.props.alignX){case"left":n.element.style.left=e.x+"px";break;case"center":n.element.style.left=e.x+.5*n.element.clientWidth+"px";break;case"right":default:n.element.style.left=e.x-.5*n.element.clientWidth+"px"}switch(n.props.alignY){case"top":n.element.style.top=e.y-n.element.clientHeight+"px";break;case"bottom":n.element.style.top=e.y+"px";break;case"center":default:n.element.style.top=e.y-.5*n.element.clientHeight+"px"}}else n.element.style.display="none"}},e.trackCursor)&&(new Cesium.ScreenSpaceEventHandler).setInputAction((function(e){var t=n.props.viewer.container.getBoundingClientRect();n.mousePos=Cesium.Cartesian2.subtract(e.endPosition,new Cesium.Cartesian2(t.left,t.top),new Cesium.Cartesian2)}),Cesium.ScreenSpaceEventType.MOUSE_MOVE);return n}return Object(r.a)(i,[{key:"componentDidMount",value:function(){this.props.viewer.scene.preUpdate.addEventListener(this.onUpdate)}},{key:"componentWillUnmount",value:function(){this.props.viewer&&!this.props.viewer.isDestroyed()&&this.props.viewer.scene.preUpdate.removeEventListener(this.onUpdate)}},{key:"render",value:function(){var e=this;return Object(l.jsxs)("div",{className:"cesium-tag",ref:function(t){return e.element=t},style:Object(n.a)({},this.props.textCss),children:[this.props.text,this.props.children]})}}]),i}(u.a.Component)},487:function(e,t,i){},488:function(e,t,i){"use strict";i.d(t,"a",(function(){return p}));var n,s=i(49),r=i(50),o=i(52),a=i(51),c=i(10),u=i.n(c),l=(i(489),i(23));!function(e){e.LEFT="left",e.BOTTOM="bottom"}(n||(n={}));var p=function(e){Object(o.a)(i,e);var t=Object(a.a)(i);function i(){return Object(s.a)(this,i),t.apply(this,arguments)}return Object(r.a)(i,[{key:"render",value:function(){var e;return Object(l.jsx)("div",{className:"chat-frame ".concat(null!==(e=this.props.location)&&void 0!==e?e:"left"),children:Object(l.jsx)("span",{children:this.props.text})})}}]),i}(u.a.Component)},489:function(e,t,i){},490:function(e,t,i){},508:function(e,t,i){"use strict";i.d(t,"e",(function(){return s})),i.d(t,"a",(function(){return r})),i.d(t,"f",(function(){return o})),i.d(t,"d",(function(){return c})),i.d(t,"b",(function(){return u})),i.d(t,"c",(function(){return l}));i(509);var n=i(537);function s(e){var t=[];e.map((function(e){t.push([e.lng,e.lat])}));var i=n.polygon([t]);return n.area(i)}function r(e,t){if(e&&t){var i=e.scene.camera.getPickRay(t),n=e.scene.globe.pick(i,e.scene);if(void 0==e.scene.pick(t)&&n){var s=Cesium.Ellipsoid.WGS84.cartesianToCartographic(n),r=Cesium.Math.toDegrees(s.longitude),o=Cesium.Math.toDegrees(s.latitude),a=e.scene.globe.getHeight(s),c=parseFloat(a.toFixed(2));return Cesium.Cartesian3.fromDegrees(r,o,c)}var u=e.scene.pickPosition(t);return Cesium.defined(u)?u:null}}function o(e){return e?e.map((function(e){return function(e){var t=Cesium.Ellipsoid.WGS84.cartesianToCartographic(e);return{lng:Cesium.Math.toDegrees(t.longitude),lat:Cesium.Math.toDegrees(t.latitude),alt:t.height}}(e)})):[]}function a(e){return e?Cesium.Cartographic.fromDegrees(e.lng,e.lat,e.alt):Cesium.Cartographic.ZERO}function c(e){for(var t=0,i=0;i<e.length-1;i++){var n=a(e[i]),s=a(e[i+1]),r=new Cesium.EllipsoidGeodesic;r.setEndPoints(n,s);var o=r.surfaceDistance;t+=o=Math.sqrt(Math.pow(o,2)+Math.pow(s.height-n.height,2))}return parseFloat(t.toFixed(3))}function u(e,t){if(e&&t){var i=e.scene.camera.getPickRay(t),n=e.scene.globe.pick(i,e.scene);if(void 0==e.scene.pick(t)&&n){var s=Cesium.Ellipsoid.WGS84.cartesianToCartographic(n),r=Cesium.Math.toDegrees(s.longitude),o=Cesium.Math.toDegrees(s.latitude),a=e.scene.globe.getHeight(s);return{degree:{lng:r,lat:o,alt:u=a||0},cartesian3:Cesium.Cartesian3.fromDegrees(r,o,u)}}var c=e.scene.pickPosition(t);if(Cesium.defined(c)){var u,l=Cesium.Cartographic.fromCartesian(c);return{degree:{lng:r=Cesium.Math.toDegrees(l.longitude),lat:o=Cesium.Math.toDegrees(l.latitude),alt:u=l.height},cartesian3:Cesium.Cartesian3.fromDegrees(r,o,u)}}}return null}function l(e,t,i){return new Cesium.Cartesian3((t.x+i.x)/2,(t.y+i.y)/2,(t.z+i.z)/2)}}}]);