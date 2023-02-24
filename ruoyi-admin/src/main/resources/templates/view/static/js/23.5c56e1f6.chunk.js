(this["webpackJsonpcesium-demo"]=this["webpackJsonpcesium-demo"]||[]).push([[23],{407:function(t,e,n){"use strict";n.r(e),n.d(e,"default",(function(){return V}));var s=n(49),i=n(50),a=n(10),o=n.n(a),l=n(123),r=n.n(l),c=n(195),h=n.n(c),u=n(52),d=n(51),v={icon:{tag:"svg",attrs:{viewBox:"64 64 896 896",focusable:"false"},children:[{tag:"path",attrs:{d:"M924.8 625.7l-65.5-56c3.1-19 4.7-38.4 4.7-57.8s-1.6-38.8-4.7-57.8l65.5-56a32.03 32.03 0 009.3-35.2l-.9-2.6a443.74 443.74 0 00-79.7-137.9l-1.8-2.1a32.12 32.12 0 00-35.1-9.5l-81.3 28.9c-30-24.6-63.5-44-99.7-57.6l-15.7-85a32.05 32.05 0 00-25.8-25.7l-2.7-.5c-52.1-9.4-106.9-9.4-159 0l-2.7.5a32.05 32.05 0 00-25.8 25.7l-15.8 85.4a351.86 351.86 0 00-99 57.4l-81.9-29.1a32 32 0 00-35.1 9.5l-1.8 2.1a446.02 446.02 0 00-79.7 137.9l-.9 2.6c-4.5 12.5-.8 26.5 9.3 35.2l66.3 56.6c-3.1 18.8-4.6 38-4.6 57.1 0 19.2 1.5 38.4 4.6 57.1L99 625.5a32.03 32.03 0 00-9.3 35.2l.9 2.6c18.1 50.4 44.9 96.9 79.7 137.9l1.8 2.1a32.12 32.12 0 0035.1 9.5l81.9-29.1c29.8 24.5 63.1 43.9 99 57.4l15.8 85.4a32.05 32.05 0 0025.8 25.7l2.7.5a449.4 449.4 0 00159 0l2.7-.5a32.05 32.05 0 0025.8-25.7l15.7-85a350 350 0 0099.7-57.6l81.3 28.9a32 32 0 0035.1-9.5l1.8-2.1c34.8-41.1 61.6-87.5 79.7-137.9l.9-2.6c4.5-12.3.8-26.3-9.3-35zM788.3 465.9c2.5 15.1 3.8 30.6 3.8 46.1s-1.3 31-3.8 46.1l-6.6 40.1 74.7 63.9a370.03 370.03 0 01-42.6 73.6L721 702.8l-31.4 25.8c-23.9 19.6-50.5 35-79.3 45.8l-38.1 14.3-17.9 97a377.5 377.5 0 01-85 0l-17.9-97.2-37.8-14.5c-28.5-10.8-55-26.2-78.7-45.7l-31.4-25.9-93.4 33.2c-17-22.9-31.2-47.6-42.6-73.6l75.5-64.5-6.5-40c-2.4-14.9-3.7-30.3-3.7-45.5 0-15.3 1.2-30.6 3.7-45.5l6.5-40-75.5-64.5c11.3-26.1 25.6-50.7 42.6-73.6l93.4 33.2 31.4-25.9c23.7-19.5 50.2-34.9 78.7-45.7l37.9-14.3 17.9-97.2c28.1-3.2 56.8-3.2 85 0l17.9 97 38.1 14.3c28.7 10.8 55.4 26.2 79.3 45.8l31.4 25.8 92.8-32.9c17 22.9 31.2 47.6 42.6 73.6L781.8 426l6.5 39.9zM512 326c-97.2 0-176 78.8-176 176s78.8 176 176 176 176-78.8 176-176-78.8-176-176-176zm79.2 255.2A111.6 111.6 0 01512 614c-29.9 0-58-11.7-79.2-32.8A111.6 111.6 0 01400 502c0-29.9 11.7-58 32.8-79.2C454 401.6 482.1 390 512 390c29.9 0 58 11.6 79.2 32.8A111.6 111.6 0 01624 502c0 29.9-11.7 58-32.8 79.2z"}}]},name:"setting",theme:"outlined"},b=n(463),g=function(t,e){return a.createElement(b.a,Object.assign({},t,{ref:e,icon:v}))};g.displayName="SettingOutlined";var f=a.forwardRef(g),p=n(23),m=function(t){Object(u.a)(n,t);var e=Object(d.a)(n);function n(){return Object(s.a)(this,n),e.apply(this,arguments)}return Object(i.a)(n,[{key:"render",value:function(){return Object(p.jsx)(a.Fragment,{children:Object(p.jsx)("button",{className:"cesium-button cesium-toolbar-button custom-tool-bar-btn",style:{fontSize:"26px"},onClick:this.props.showPanel,children:Object(p.jsx)(f,{style:{verticalAlign:"text-top"}})})})}}]),n}(a.Component),j=(n(1020),n(1023)),O=n(534),w=(n(1021),n(1025)),x=(n(1028),n(1024)),C=n(71),y=n(73),M=n.n(y),S=n(94),k=function(){function t(){Object(s.a)(this,t)}return Object(i.a)(t,null,[{key:"init",value:function(t){return t.scene.postProcessStages.add(new Cesium.PostProcessStage({fragmentShader:"uniform sampler2D colorTexture; \nvarying vec2 v_textureCoordinates; \nuniform float _Brightness; \nuniform float _Saturation; \nuniform float _Contrast; \nvoid main(void) \n{ \nvec4 renderTex=texture2D(colorTexture, v_textureCoordinates); \n    vec3 finalColor=renderTex.rgb*_Brightness;\n    float luminance = 0.2125 * renderTex.r + 0.7154 * renderTex.g + 0.0721 * renderTex.b;\n    vec3 luminanceColor = vec3(luminance, luminance, luminance);\n    finalColor = mix(luminanceColor, finalColor, _Saturation);\n    vec3 avgColor = vec3(0.5, 0.5, 0.5);\n    finalColor = mix(avgColor, finalColor, _Contrast);    gl_FragColor = vec4(finalColor, renderTex.a); \n} \n",uniforms:{_Brightness:1,_Saturation:1,_Contrast:1}}))}},{key:"set",value:function(){var t=Object(S.a)(M.a.mark((function t(e,n){return M.a.wrap((function(t){for(;;)switch(t.prev=t.next){case 0:null==this.stage&&(this.stage=this.init(e)),null!=n.brightness&&(this.stage.uniforms._Brightness=n.brightness),null!=n.saturation&&(this.stage.uniforms._Saturation=n.saturation),null!=n.contrast&&(this.stage.uniforms._Contrast=n.contrast);case 4:case"end":return t.stop()}}),t,this)})));return function(e,n){return t.apply(this,arguments)}}()}]),t}();k.stage=void 0;var X=1,Y=1,z=1,P=function(t){Object(u.a)(n,t);var e=Object(d.a)(n);function n(t){var i;return Object(s.a)(this,n),(i=e.call(this,t)).onSaturationChange=function(t){Y=t,i.setState({sat:t}),console.log("saturation="+Y),console.log("state-sat="+i.state.sat);var e=i.getOptions();k.set(i.props.viewer,e)},i.state={bri:X,sat:Y,con:z},i.onBrightnessChange=i.onBrightnessChange.bind(Object(C.a)(i)),i.onSaturationChange=i.onSaturationChange.bind(Object(C.a)(i)),i.onContrastChange=i.onContrastChange.bind(Object(C.a)(i)),i.setDefault=i.setDefault.bind(Object(C.a)(i)),i.getOptions=i.getOptions.bind(Object(C.a)(i)),i}return Object(i.a)(n,[{key:"getOptions",value:function(){var t=new N;return t.brightness=X,t.saturation=Y,t.contrast=z,t}},{key:"onBrightnessChange",value:function(t){X=t,this.setState({bri:X}),console.log("brightness="+X),console.log("state-bri="+this.state.bri);var e=this.getOptions();k.set(this.props.viewer,e)}},{key:"onContrastChange",value:function(t){z=t,this.setState({con:t}),console.log("contrast="+z),console.log("state-con="+this.state.con);var e=this.getOptions();k.set(this.props.viewer,e)}},{key:"setDefault",value:function(){console.log("set default"),this.onBrightnessChange(1),this.onSaturationChange(1),this.onContrastChange(1)}},{key:"render",value:function(){var t=this;return Object(p.jsxs)(a.Fragment,{children:[Object(p.jsxs)("div",{children:[Object(p.jsx)("label",{className:"changeLabel",style:{color:"white"},children:"\u4eae\u5ea6"}),Object(p.jsx)(x.a,{defaultValue:this.state.bri,value:this.state.bri,max:3,min:.1,step:.1,onChange:function(e){t.onBrightnessChange(e)}}),Object(p.jsx)("label",{className:"changeLabel",style:{color:"white"},children:"\u9971\u548c\u5ea6"}),Object(p.jsx)(x.a,{defaultValue:this.state.sat,value:this.state.sat,max:3,min:.1,step:.1,onChange:function(e){t.onSaturationChange(e)}}),Object(p.jsx)("label",{className:"changeLabel",style:{color:"white"},children:"\u5bf9\u6bd4\u5ea6"}),Object(p.jsx)(x.a,{defaultValue:this.state.con,value:this.state.con,max:3,min:.1,step:.1,onChange:function(e){t.onContrastChange(e)}})]}),Object(p.jsx)("div",{style:{right:"5%",position:"absolute",top:"105%"},children:Object(p.jsx)(w.a,{onClick:this.setDefault,children:"\u6062\u590d\u9ed8\u8ba4"})})]})}}]),n}(o.a.Component),N=function t(){Object(s.a)(this,t)},B={icon:{tag:"svg",attrs:{viewBox:"64 64 896 896",focusable:"false"},children:[{tag:"path",attrs:{d:"M952 792H72c-4.4 0-8 3.6-8 8v56c0 4.4 3.6 8 8 8h880c4.4 0 8-3.6 8-8v-56c0-4.4-3.6-8-8-8zm0-632H72c-4.4 0-8 3.6-8 8v56c0 4.4 3.6 8 8 8h880c4.4 0 8-3.6 8-8v-56c0-4.4-3.6-8-8-8zM848 660c8.8 0 16-7.2 16-16V380c0-8.8-7.2-16-16-16H176c-8.8 0-16 7.2-16 16v264c0 8.8 7.2 16 16 16h672zM232 436h560v152H232V436z"}}]},name:"pic-center",theme:"outlined"},_=function(t,e){return a.createElement(b.a,Object.assign({},t,{ref:e,icon:B}))};_.displayName="PicCenterOutlined";var D=a.forwardRef(_),I=j.a.TabPane,T=function(t){Object(u.a)(n,t);var e=Object(d.a)(n);function n(){var t;Object(s.a)(this,n);for(var i=arguments.length,a=new Array(i),o=0;o<i;o++)a[o]=arguments[o];return(t=e.call.apply(e,[this].concat(a))).deactivate=function(){t.props.closePanel()},t}return Object(i.a)(n,[{key:"render",value:function(){return Object(p.jsx)(a.Fragment,{children:Object(p.jsx)("div",{className:"settings-panel",children:Object(p.jsx)(O.a,{content:Object(p.jsx)(j.a,{className:"settings-tabs",onChange:this.handelTabChange,defaultActiveKey:"1",style:{position:"absolute",left:"6%",right:"6%",height:"98%"},children:Object(p.jsx)(I,{tab:Object(p.jsxs)("span",{children:[Object(p.jsx)(D,{}),"\u663e\u793a\u8bbe\u7f6e"]}),children:Object(p.jsx)("div",{style:{top:"17%",left:"10%",right:"10%",position:"absolute"},children:Object(p.jsx)(P,{viewer:this.props.viewer})})},"1")}),title:"\u8bbe\u7f6e",setVisible:this.deactivate,height:320,width:300})})})}}]),n}(a.Component),V=function(){function t(e,n,i){Object(s.a)(this,t),this.viewer=e,this.cesium=n,this.btnId="ScreenSettingsBtn",this.panelId="ScreenSettingsPanel",this.extensionName="ScreenSettings",this.panelVisible=!1,this.showPanel=this.showPanel.bind(this)}return Object(i.a)(t,[{key:"showPanel",value:function(){if(this.panelVisible=!this.panelVisible,this.panelVisible){var t=h()("#cesiumContainer")[0],e="<div id=".concat(this.panelId,"></div>");h()(t).append(e),r.a.render(Object(p.jsx)(T,{viewer:this.viewer,cesium:this.cesium,closePanel:this.showPanel,panelName:"ScreenAdjust"}),document.getElementById(this.panelId))}else r.a.unmountComponentAtNode(document.getElementById(this.panelId)),h()("#"+this.panelId).remove()}},{key:"load",value:function(){var t=h()(".cesium-viewer-toolbar")[0],e="<div id=".concat(this.btnId,' style="display:inline-block"></div>');h()(t).append(e),r.a.render(Object(p.jsx)(m,{viewer:this.viewer,showPanel:this.showPanel}),document.getElementById(this.btnId))}}]),t}()},534:function(t,e,n){"use strict";n.d(e,"a",(function(){return h}));var s=n(49),i=n(50),a=n(71),o=n(52),l=n(51),r=n(10),c=(n(535),n(23)),h=function(t){Object(o.a)(n,t);var e=Object(l.a)(n);function n(t){var i;return Object(s.a)(this,n),(i=e.call(this,t)).state={translateX:0,translateY:0,height:i.props.height,width:i.props.width},i.moving=!1,i.resizemoving=!1,i.lastX=null,i.lastY=null,i.onMouseUp=i.onMouseUp.bind(Object(a.a)(i)),i.onMouseMove=i.onMouseMove.bind(Object(a.a)(i)),window.addEventListener("mouseup",i.onMouseUp),window.addEventListener("mousemove",i.onMouseMove),i}return Object(i.a)(n,[{key:"onMouseDown",value:function(t){t.stopPropagation(),this.moving=!0}},{key:"onResizeMouseDown",value:function(t){t.stopPropagation(),this.resizemoving=!0}},{key:"onMouseUp",value:function(){this.moving=!1,this.resizemoving=!1,this.lastX=null,this.lastY=null}},{key:"onMouseMove",value:function(t){this.moving&&this.onMove(t),this.resizemoving&&this.onResizeMove(t)}},{key:"onResizeMove",value:function(t){if(this.lastX&&this.lastY&&this.lastY>3&&this.lastX>3&&this.lastY<window.innerHeight-10&&this.lastX<window.innerWidth-10){var e=t.clientX-this.lastX,n=t.clientY-this.lastY;this.setState({width:this.state.width+e,height:this.state.height+n})}this.lastX=t.clientX,this.lastY=t.clientY}},{key:"onMove",value:function(t){if(this.lastX&&this.lastY&&this.lastY>3&&this.lastX>3&&this.lastY<window.innerHeight-10&&this.lastX<window.innerWidth-10){var e=t.clientX-this.lastX,n=t.clientY-this.lastY;this.setState({translateX:this.state.translateX+e,translateY:this.state.translateY+n})}this.lastX=t.clientX,this.lastY=t.clientY}},{key:"render",value:function(){var t=this;return Object(c.jsxs)("div",{className:"bf-panel bf-has-title bf-sizable",id:"bf-basepanel",style:{transform:"translateX(".concat(this.state.translateX,"px)translateY(").concat(this.state.translateY,"px)"),left:"calc(50% - "+this.state.width/2+"px",top:"calc(50% - "+this.state.height/2+"px",minWidth:"200px",minHeight:"160px",width:this.state.width+"px",height:this.state.height+"px",overflow:"visible"},children:[Object(c.jsx)("div",{className:"bf-close",onClick:function(e){window.removeEventListener("mouseup",t.onMouseUp),window.removeEventListener("mousemove",t.onMouseMove),t.props.setVisible(!1)}}),Object(c.jsxs)("div",{className:"bf-title",onMouseDown:function(e){return t.onMouseDown(e)},style:{cursor:"move",userSelect:"none"},children:[" ",this.props.title]}),Object(c.jsx)("div",{className:"bf-panel-body",style:{paddingTop:"0px"},children:this.props.content}),Object(c.jsx)("div",{className:"bf-resize",onMouseDown:function(e){return t.onResizeMouseDown(e)}})]})}}]),n}(r.Component)},535:function(t,e,n){}}]);