(this["webpackJsonpcesium-demo"]=this["webpackJsonpcesium-demo"]||[]).push([[19],{1131:function(e,t,n){},1132:function(e,t,n){},405:function(e,t,n){"use strict";n.r(t),n.d(t,"default",(function(){return ie}));var i=n(49),a=n(50),s=n(10),o=n(123),r=n.n(o),l=n(195),c=n.n(l),u=n(52),d=n(51),h=(n(1020),n(1023)),p=n(534),b=(n(1021),n(1025)),f=(n(1028),n(1024)),v=(n(491),n(1131),n(21)),g=n(422),m=n(431),y=n(420),j=n.n(y),O=n(540),C=n(1139);function x(e){var t=e.className,n=e.direction,i=e.index,a=e.marginDirection,o=e.children,r=e.split,l=e.wrap,c=s.useContext(k),u=c.horizontalSize,d=c.verticalSize,h=c.latestIndex,p={};return"vertical"===n?i<h&&(p={marginBottom:u/(r?2:1)}):p=Object(v.a)(Object(v.a)({},i<h&&Object(g.a)({},a,u/(r?2:1))),l&&{paddingBottom:d}),null===o||void 0===o?null:s.createElement(s.Fragment,null,s.createElement("div",{className:t,style:p},o),i<h&&r&&s.createElement("span",{className:"".concat(t,"-split"),style:p},r))}var w=function(e,t){var n={};for(var i in e)Object.prototype.hasOwnProperty.call(e,i)&&t.indexOf(i)<0&&(n[i]=e[i]);if(null!=e&&"function"===typeof Object.getOwnPropertySymbols){var a=0;for(i=Object.getOwnPropertySymbols(e);a<i.length;a++)t.indexOf(i[a])<0&&Object.prototype.propertyIsEnumerable.call(e,i[a])&&(n[i[a]]=e[i[a]])}return n},k=s.createContext({latestIndex:0,horizontalSize:0,verticalSize:0}),S={small:8,middle:16,large:24};var $=function(e){var t,n=s.useContext(C.b),i=n.getPrefixCls,a=n.space,o=n.direction,r=e.size,l=void 0===r?(null===a||void 0===a?void 0:a.size)||"small":r,c=e.align,u=e.className,d=e.children,h=e.direction,p=void 0===h?"horizontal":h,b=e.prefixCls,f=e.split,y=e.style,$=e.wrap,z=void 0!==$&&$,M=w(e,["size","align","className","children","direction","prefixCls","split","style","wrap"]),P=s.useMemo((function(){return(Array.isArray(l)?l:[l,l]).map((function(e){return function(e){return"string"===typeof e?S[e]:e||0}(e)}))}),[l]),E=Object(m.a)(P,2),F=E[0],I=E[1],N=Object(O.a)(d,{keepEmpty:!0});if(0===N.length)return null;var X=void 0===c&&"horizontal"===p?"center":c,Y=i("space",b),D=j()(Y,"".concat(Y,"-").concat(p),(t={},Object(g.a)(t,"".concat(Y,"-rtl"),"rtl"===o),Object(g.a)(t,"".concat(Y,"-align-").concat(X),X),t),u),R="".concat(Y,"-item"),L="rtl"===o?"marginLeft":"marginRight",K=0,V=N.map((function(e,t){return null!==e&&void 0!==e&&(K=t),s.createElement(x,{className:R,key:"".concat(R,"-").concat(t),direction:p,index:t,marginDirection:L,split:f,wrap:z},e)}));return s.createElement("div",Object(v.a)({className:D,style:Object(v.a)(Object(v.a)({},z&&{flexWrap:"wrap",marginBottom:-I}),y)},M),s.createElement(k.Provider,{value:{horizontalSize:F,verticalSize:I,latestIndex:K}},V))},z=(n(1132),n(671)),M=n(511),P=s.createContext(null),E=P.Provider,F=P,I=n(538),N=function(e,t){var n={};for(var i in e)Object.prototype.hasOwnProperty.call(e,i)&&t.indexOf(i)<0&&(n[i]=e[i]);if(null!=e&&"function"===typeof Object.getOwnPropertySymbols){var a=0;for(i=Object.getOwnPropertySymbols(e);a<i.length;a++)t.indexOf(i[a])<0&&Object.prototype.propertyIsEnumerable.call(e,i[a])&&(n[i[a]]=e[i[a]])}return n},X=function(e,t){var n,i=s.useContext(F),a=s.useContext(C.b),o=a.getPrefixCls,r=a.direction,l=s.useRef(),c=Object(M.a)(t,l);s.useEffect((function(){Object(I.a)(!("optionType"in e),"Radio","`optionType` is only support in Radio.Group.")}),[]);var u=e.prefixCls,d=e.className,h=e.children,p=e.style,b=N(e,["prefixCls","className","children","style"]),f=o("radio",u),m=Object(v.a)({},b);i&&(m.name=i.name,m.onChange=function(t){var n,a;null===(n=e.onChange)||void 0===n||n.call(e,t),null===(a=null===i||void 0===i?void 0:i.onChange)||void 0===a||a.call(i,t)},m.checked=e.value===i.value,m.disabled=e.disabled||i.disabled);var y=j()("".concat(f,"-wrapper"),(n={},Object(g.a)(n,"".concat(f,"-wrapper-checked"),m.checked),Object(g.a)(n,"".concat(f,"-wrapper-disabled"),m.disabled),Object(g.a)(n,"".concat(f,"-wrapper-rtl"),"rtl"===r),n),d);return s.createElement("label",{className:y,style:p,onMouseEnter:e.onMouseEnter,onMouseLeave:e.onMouseLeave},s.createElement(z.default,Object(v.a)({},m,{prefixCls:f,ref:c})),void 0!==h?s.createElement("span",null,h):null)},Y=s.forwardRef(X);Y.displayName="Radio",Y.defaultProps={type:"radio"};var D=Y,R=n(578),L=n(579),K=s.forwardRef((function(e,t){var n=s.useContext(C.b),i=n.getPrefixCls,a=n.direction,o=s.useContext(L.a),r=Object(R.a)(e.defaultValue,{value:e.value}),l=Object(m.a)(r,2),c=l[0],u=l[1];return s.createElement(E,{value:{onChange:function(t){var n=c,i=t.target.value;"value"in e||u(i);var a=e.onChange;a&&i!==n&&a(t)},value:c,disabled:e.disabled,name:e.name}},function(){var n,r=e.prefixCls,l=e.className,u=void 0===l?"":l,d=e.options,h=e.optionType,p=e.buttonStyle,b=void 0===p?"outline":p,f=e.disabled,v=e.children,m=e.size,y=e.style,O=e.id,C=e.onMouseEnter,x=e.onMouseLeave,w=i("radio",r),k="".concat(w,"-group"),S=v;if(d&&d.length>0){var $="button"===h?"".concat(w,"-button"):w;S=d.map((function(e){return"string"===typeof e?s.createElement(D,{key:e,prefixCls:$,disabled:f,value:e,checked:c===e},e):s.createElement(D,{key:"radio-group-value-options-".concat(e.value),prefixCls:$,disabled:e.disabled||f,value:e.value,checked:c===e.value,style:e.style},e.label)}))}var z=m||o,M=j()(k,"".concat(k,"-").concat(b),(n={},Object(g.a)(n,"".concat(k,"-").concat(z),z),Object(g.a)(n,"".concat(k,"-rtl"),"rtl"===a),n),u);return s.createElement("div",{className:M,style:y,onMouseEnter:C,onMouseLeave:x,id:O,ref:t},S)}())})),V=s.memo(K),B=function(e,t){var n={};for(var i in e)Object.prototype.hasOwnProperty.call(e,i)&&t.indexOf(i)<0&&(n[i]=e[i]);if(null!=e&&"function"===typeof Object.getOwnPropertySymbols){var a=0;for(i=Object.getOwnPropertySymbols(e);a<i.length;a++)t.indexOf(i[a])<0&&Object.prototype.propertyIsEnumerable.call(e,i[a])&&(n[i[a]]=e[i[a]])}return n},U=function(e,t){var n=s.useContext(F),i=s.useContext(C.b).getPrefixCls,a=e.prefixCls,o=B(e,["prefixCls"]),r=i("radio-button",a);return n&&(o.checked=e.value===n.value,o.disabled=e.disabled||n.disabled),s.createElement(D,Object(v.a)({prefixCls:r},o,{type:"radio",ref:t}))},T=s.forwardRef(U),H=D;H.Button=T,H.Group=V;var A=H,W=n(23),q=0,G=1,_=function(e){Object(u.a)(n,e);var t=Object(d.a)(n);function n(e){var a;return Object(i.a)(this,n),(a=t.call(this,e)).onChangeRadio=function(e){q=e.target.value,a.setState({styleValue:e.target.value});var t=a.getStyle(q,G);a.setStyle(t)},a.onChangeSlider=function(e){G=e,a.setState({pointSize:G});var t=a.getStyle(q,G);a.setStyle(t)},a.onClick=function(e){q=0,G=1,a.setState({styleValue:q,pointSize:G});var t=a.getStyle(q,G);a.setStyle(t)},a.getStyle=function(e,t){var n=null;switch(e){case 0:n={pointSize:t};break;case 1:n={color:{conditions:[["${Classification} === 0","rgb(184,134,11)"],["${Classification} === 1","rgb(50,205,20)"],["${Classification} === 2","rgb(255,193,193)"],["${Classification} === 3","rgb(255,25,0)"],["${Classification} === 4","rgb(202,255,112)"],["${Classification} === 5","rgb(0,191,255)"],["${Classification} === 6","rgb(132,112,255)"],["${Classification} === 7","rgb(255,222,173)"],["${Classification} === 8","rgb(255,0,30)"],["${Classification} === 9","rgb(71,60,139)"],["${Classification} === 10","rgb(50,191,255)"],["${Classification} === 11","rgb(31,1,0)"],["${Classification} === 12","rgb(1,64,1)"],["${Classification} === 13","rgb(231,30,100)"],["${Classification} === 14","rgb(32,4,1)"],["${Classification} === 15","rgb(32,2,6)"],["${Classification} === 16","rgb(32,5,200)"],["${Classification} === 17","rgb(32,6,0)"],["${Classification} === 18","rgb(32,55,60)"],["${Classification} === 19","rgb(32,11,0)"],["${Classification} === 20","rgb(10,1,0)"],["${Classification} === 21","rgb(21,36,0)"],["${Classification} === 22","rgb(22,5,4)"],["${Classification} === 23","rgb(23,84,0)"],["${Classification} === 24","rgb(24,135,0)"],["${Classification} === 25","rgb(25,4,0)"],["${Classification} === 26","rgb(26,0,0)"],["${Classification} === 27","rgb(27,5,0)"],["${Classification} === 28","rgb(28,0,0)"],["${Classification} === 29","rgb(29,0,0)"],["${Classification} === 30","rgb(30,0,0)"],["${Classification} === 31","rgb(31,0,0)"],["true","color('#FFFFFF', 1.0)"]]},pointSize:t};break;case 2:n={color:{conditions:[["${Intensity} < 0","color('#000099')"],["${Intensity} < 10","color('#00cc99', 1.0)"],["${Intensity} < 20","color('#66ff33', 0.5)"],["${Intensity} < 30","rgba(255, 255, 0, 0.1)"],["${Intensity} < 40","rgb(255, 128, 0)"],["${Intensity} < 50","color('red')"],["${Intensity} < 60","color('rgb(255, 102, 102)')"],["${Intensity} < 70","hsl(0.875, 1.0, 0.6)"],["${Intensity} < 80","hsla(0.83, 1.0, 0.5, 0.1)"],["true","color('#FFFFFF', 1.0)"]]},pointSize:t};break;case 3:var i=a.osgb.MinZ,s=a.osgb.MaxZ,o=(s-i)/9,r=2*o,l=3*o,c=4*o,u=5*o,d=6*o,h=7*o,p=8*o;n={color:{conditions:[["${z} < "+o.toString(),"color('#000099')"],["${z} < "+r.toString(),"color('#2e5be5')"],["${z} < "+l.toString(),"color('#66ff33')"],["${z} < "+c.toString(),"rgb(255, 255, 0)"],["${z} < "+u.toString(),"rgb(255, 128, 0)"],["${z} < "+d.toString(),"color('red')"],["${z} < "+h.toString(),"color('rgb(255, 102, 102)')"],["${z} < "+p.toString(),"hsl(0.875, 1.0, 0.6)"],["${z} < "+s.toString(),"hsla(0.83, 1.0, 0.5, 0.1)"],["true","color('#FFFFFF', 1.0)"]]},pointSize:t}}return new a.props.cesium.Cesium3DTileStyle(n)},a.setStyle=function(e){var t=a.primitiveHasLoaded();t&&(t.style=e)},a.primitiveHasLoaded=function(){if(a.props.viewer.scene.primitives)for(var e=0;e<a.props.viewer.scene.primitives.length;e++){var t=a.props.viewer.scene.primitives._primitives[e];if(t instanceof a.props.cesium.Cesium3DTileset&&t._url&&t._url===a.osgb.OsgbUrl)return t}},a.state={styleValue:q,pointSize:G},a.osgb=a.props.osgb,a}return Object(a.a)(n,[{key:"render",value:function(){var e={color:"white"};return Object(W.jsxs)(s.Fragment,{children:[Object(W.jsx)("div",{style:{position:"relative"},children:Object(W.jsx)(A.Group,{onChange:this.onChangeRadio,value:this.state.styleValue,children:Object(W.jsxs)($,{direction:"vertical",children:[Object(W.jsx)(A,{value:0,style:e,children:"\u9ed8\u8ba4"}),Object(W.jsx)(A,{value:1,style:e,children:"Classification"}),Object(W.jsx)(A,{value:2,style:e,children:"Intensity"}),Object(W.jsx)(A,{value:3,style:e,children:"\u9ad8\u5ea6"})]})})}),Object(W.jsxs)("div",{style:{position:"relative"},children:[Object(W.jsx)("label",{children:"\u70b9\u4e91\u5927\u5c0f"}),Object(W.jsx)(f.a,{value:this.state.pointSize,max:10,min:1,step:.1,onChange:this.onChangeSlider})]}),Object(W.jsx)("div",{style:{left:"53%",position:"relative"},children:Object(W.jsx)(b.a,{onClick:this.onClick,children:"\u6062\u590d\u9ed8\u8ba4"})})]})}}]),n}(s.Component),J={icon:{tag:"svg",attrs:{viewBox:"64 64 896 896",focusable:"false"},children:[{tag:"path",attrs:{d:"M904 512h-56c-4.4 0-8 3.6-8 8v320H184V184h320c4.4 0 8-3.6 8-8v-56c0-4.4-3.6-8-8-8H144c-17.7 0-32 14.3-32 32v736c0 17.7 14.3 32 32 32h736c17.7 0 32-14.3 32-32V520c0-4.4-3.6-8-8-8z"}},{tag:"path",attrs:{d:"M355.9 534.9L354 653.8c-.1 8.9 7.1 16.2 16 16.2h.4l118-2.9c2-.1 4-.9 5.4-2.3l415.9-415c3.1-3.1 3.1-8.2 0-11.3L785.4 114.3c-1.6-1.6-3.6-2.3-5.7-2.3s-4.1.8-5.7 2.3l-415.8 415a8.3 8.3 0 00-2.3 5.6zm63.5 23.6L779.7 199l45.2 45.1-360.5 359.7-45.7 1.1.7-46.4z"}}]},name:"form",theme:"outlined"},Z=n(463),Q=function(e,t){return s.createElement(Z.a,Object.assign({},e,{ref:t,icon:J}))};Q.displayName="FormOutlined";var ee=s.forwardRef(Q),te=h.a.TabPane,ne=function(e){Object(u.a)(n,e);var t=Object(d.a)(n);function n(){var e;Object(i.a)(this,n);for(var a=arguments.length,s=new Array(a),o=0;o<a;o++)s[o]=arguments[o];return(e=t.call.apply(t,[this].concat(s))).closePanel=function(){e.props.closePanel()},e}return Object(a.a)(n,[{key:"render",value:function(){return Object(W.jsx)(s.Fragment,{children:Object(W.jsx)("div",{className:"settings-panel",children:Object(W.jsx)(p.a,{content:Object(W.jsx)(h.a,{className:"settings-tabs",onChange:this.handelTabChange,defaultActiveKey:"1",style:{position:"absolute",left:"6%",right:"6%",height:"98%"},children:Object(W.jsx)(te,{tab:Object(W.jsxs)("span",{color:"white",children:["  ",Object(W.jsx)(ee,{color:"white"}),"\u70b9\u4e91\u8bbe\u7f6e"]}),children:Object(W.jsx)("div",{style:{top:"36",left:"10%",right:"10%",position:"absolute"},children:Object(W.jsx)(_,{viewer:this.props.viewer,cesium:this.props.cesium,osgb:this.props.osgb})})},"2")}),title:"\u8bbe\u7f6e",setVisible:this.closePanel,height:320,width:300})})})}}]),n}(s.Component),ie=function(){function e(t,n,a){Object(i.a)(this,e),this.viewer=t,this.cesium=n,this.osgb=a,this.panelId="PointCloudSetting",this.panelVisible=!1,this.showPanel=this.showPanel.bind(this)}return Object(a.a)(e,[{key:"showPanel",value:function(){if(this.panelVisible=!this.panelVisible,this.panelVisible){var e=c()("#cesiumContainer")[0],t="<div id=".concat(this.panelId,"></div>");c()(e).append(t),r.a.render(Object(W.jsx)(ne,{viewer:this.viewer,cesium:this.cesium,closePanel:this.showPanel,osgb:this.osgb}),document.getElementById(this.panelId))}else r.a.unmountComponentAtNode(document.getElementById(this.panelId)),c()("#"+this.panelId).remove()}}]),e}()},534:function(e,t,n){"use strict";n.d(t,"a",(function(){return u}));var i=n(49),a=n(50),s=n(71),o=n(52),r=n(51),l=n(10),c=(n(535),n(23)),u=function(e){Object(o.a)(n,e);var t=Object(r.a)(n);function n(e){var a;return Object(i.a)(this,n),(a=t.call(this,e)).state={translateX:0,translateY:0,height:a.props.height,width:a.props.width},a.moving=!1,a.resizemoving=!1,a.lastX=null,a.lastY=null,a.onMouseUp=a.onMouseUp.bind(Object(s.a)(a)),a.onMouseMove=a.onMouseMove.bind(Object(s.a)(a)),window.addEventListener("mouseup",a.onMouseUp),window.addEventListener("mousemove",a.onMouseMove),a}return Object(a.a)(n,[{key:"onMouseDown",value:function(e){e.stopPropagation(),this.moving=!0}},{key:"onResizeMouseDown",value:function(e){e.stopPropagation(),this.resizemoving=!0}},{key:"onMouseUp",value:function(){this.moving=!1,this.resizemoving=!1,this.lastX=null,this.lastY=null}},{key:"onMouseMove",value:function(e){this.moving&&this.onMove(e),this.resizemoving&&this.onResizeMove(e)}},{key:"onResizeMove",value:function(e){if(this.lastX&&this.lastY&&this.lastY>3&&this.lastX>3&&this.lastY<window.innerHeight-10&&this.lastX<window.innerWidth-10){var t=e.clientX-this.lastX,n=e.clientY-this.lastY;this.setState({width:this.state.width+t,height:this.state.height+n})}this.lastX=e.clientX,this.lastY=e.clientY}},{key:"onMove",value:function(e){if(this.lastX&&this.lastY&&this.lastY>3&&this.lastX>3&&this.lastY<window.innerHeight-10&&this.lastX<window.innerWidth-10){var t=e.clientX-this.lastX,n=e.clientY-this.lastY;this.setState({translateX:this.state.translateX+t,translateY:this.state.translateY+n})}this.lastX=e.clientX,this.lastY=e.clientY}},{key:"render",value:function(){var e=this;return Object(c.jsxs)("div",{className:"bf-panel bf-has-title bf-sizable",id:"bf-basepanel",style:{transform:"translateX(".concat(this.state.translateX,"px)translateY(").concat(this.state.translateY,"px)"),left:"calc(50% - "+this.state.width/2+"px",top:"calc(50% - "+this.state.height/2+"px",minWidth:"200px",minHeight:"160px",width:this.state.width+"px",height:this.state.height+"px",overflow:"visible"},children:[Object(c.jsx)("div",{className:"bf-close",onClick:function(t){window.removeEventListener("mouseup",e.onMouseUp),window.removeEventListener("mousemove",e.onMouseMove),e.props.setVisible(!1)}}),Object(c.jsxs)("div",{className:"bf-title",onMouseDown:function(t){return e.onMouseDown(t)},style:{cursor:"move",userSelect:"none"},children:[" ",this.props.title]}),Object(c.jsx)("div",{className:"bf-panel-body",style:{paddingTop:"0px"},children:this.props.content}),Object(c.jsx)("div",{className:"bf-resize",onMouseDown:function(t){return e.onResizeMouseDown(t)}})]})}}]),n}(l.Component)},535:function(e,t,n){},671:function(e,t,n){"use strict";n.r(t);var i=n(21),a=n(422),s=n(441),o=n(425),r=n(434),l=n(435),c=n(436),u=n(438),d=n(10),h=n.n(d),p=n(420),b=n.n(p),f=function(e){Object(c.a)(n,e);var t=Object(u.a)(n);function n(e){var i;Object(r.a)(this,n),(i=t.call(this,e)).handleChange=function(e){var t=i.props,n=t.disabled,a=t.onChange;n||("checked"in i.props||i.setState({checked:e.target.checked}),a&&a({target:Object(o.a)(Object(o.a)({},i.props),{},{checked:e.target.checked}),stopPropagation:function(){e.stopPropagation()},preventDefault:function(){e.preventDefault()},nativeEvent:e.nativeEvent}))},i.saveInput=function(e){i.input=e};var a="checked"in e?e.checked:e.defaultChecked;return i.state={checked:a},i}return Object(l.a)(n,[{key:"focus",value:function(){this.input.focus()}},{key:"blur",value:function(){this.input.blur()}},{key:"render",value:function(){var e,t=this.props,n=t.prefixCls,o=t.className,r=t.style,l=t.name,c=t.id,u=t.type,d=t.disabled,p=t.readOnly,f=t.tabIndex,v=t.onClick,g=t.onFocus,m=t.onBlur,y=t.onKeyDown,j=t.onKeyPress,O=t.onKeyUp,C=t.autoFocus,x=t.value,w=t.required,k=Object(s.a)(t,["prefixCls","className","style","name","id","type","disabled","readOnly","tabIndex","onClick","onFocus","onBlur","onKeyDown","onKeyPress","onKeyUp","autoFocus","value","required"]),S=Object.keys(k).reduce((function(e,t){return"aria-"!==t.substr(0,5)&&"data-"!==t.substr(0,5)&&"role"!==t||(e[t]=k[t]),e}),{}),$=this.state.checked,z=b()(n,o,(e={},Object(a.a)(e,"".concat(n,"-checked"),$),Object(a.a)(e,"".concat(n,"-disabled"),d),e));return h.a.createElement("span",{className:z,style:r},h.a.createElement("input",Object(i.a)({name:l,id:c,type:u,required:w,readOnly:p,disabled:d,tabIndex:f,className:"".concat(n,"-input"),checked:!!$,onClick:v,onFocus:g,onBlur:m,onKeyUp:O,onKeyDown:y,onKeyPress:j,onChange:this.handleChange,autoFocus:C,ref:this.saveInput,value:x},S)),h.a.createElement("span",{className:"".concat(n,"-inner")}))}}],[{key:"getDerivedStateFromProps",value:function(e,t){return"checked"in e?Object(o.a)(Object(o.a)({},t),{},{checked:e.checked}):null}}]),n}(d.Component);f.defaultProps={prefixCls:"rc-checkbox",className:"",style:{},type:"checkbox",defaultChecked:!1,onFocus:function(){},onBlur:function(){},onChange:function(){},onKeyDown:function(){},onKeyPress:function(){},onKeyUp:function(){}},t.default=f}}]);