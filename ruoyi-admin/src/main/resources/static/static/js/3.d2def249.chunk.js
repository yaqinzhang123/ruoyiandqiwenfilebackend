(this["webpackJsonpcesium-demo"]=this["webpackJsonpcesium-demo"]||[]).push([[3],{451:function(e,t,n){"use strict";n.d(t,"a",(function(){return o}));var r=n(681);var a=n(677),c=n(676);function o(e){return function(e){if(Array.isArray(e))return Object(r.a)(e)}(e)||Object(a.a)(e)||Object(c.a)(e)||function(){throw new TypeError("Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")}()}},540:function(e,t,n){"use strict";n.d(t,"a",(function(){return o}));var r=n(10),a=n.n(r),c=n(125);function o(e){var t=arguments.length>1&&void 0!==arguments[1]?arguments[1]:{},n=[];return a.a.Children.forEach(e,(function(e){(void 0!==e&&null!==e||t.keepEmpty)&&(Array.isArray(e)?n=n.concat(o(e)):Object(c.isFragment)(e)&&e.props?n=n.concat(o(e.props.children,t)):n.push(e))})),n}},575:function(e,t,n){"use strict";n.d(t,"a",(function(){return re}));var r=n(422),a=n(425),c=n(431),o=n(445),i=n(10),u=n(581),s=n(511),f=n(420),v=n.n(f),l=n(580);function b(e,t){var n={};return n[e.toLowerCase()]=t.toLowerCase(),n["Webkit".concat(e)]="webkit".concat(t),n["Moz".concat(e)]="moz".concat(t),n["ms".concat(e)]="MS".concat(t),n["O".concat(e)]="o".concat(t.toLowerCase()),n}var d=function(e,t){var n={animationend:b("Animation","AnimationEnd"),transitionend:b("Transition","TransitionEnd")};return e&&("AnimationEvent"in t||delete n.animationend.animation,"TransitionEvent"in t||delete n.transitionend.transition),n}(Object(l.a)(),"undefined"!==typeof window?window:{}),O={};if(Object(l.a)()){var j=document.createElement("div");O=j.style}var p={};function m(e){if(p[e])return p[e];var t=d[e];if(t)for(var n=Object.keys(t),r=n.length,a=0;a<r;a+=1){var c=n[a];if(Object.prototype.hasOwnProperty.call(t,c)&&c in O)return p[e]=t[c],p[e]}return""}var y=m("animationend"),E=m("transitionend"),h=!(!y||!E),k=y||"animationend",A=E||"transitionend";function L(e,t){return e?"object"===Object(o.a)(e)?e[t.replace(/-\w/g,(function(e){return e[1].toUpperCase()}))]:"".concat(e,"-").concat(t):null}var g="none",C="appear",S="enter",w="leave",R="none",P="prepare",N="start",T="active",M="end";function D(e){var t=Object(i.useRef)(!1),n=Object(i.useState)(e),r=Object(c.a)(n,2),a=r[0],o=r[1];return Object(i.useEffect)((function(){return function(){t.current=!0}}),[]),[a,function(e){t.current||o(e)}]}var I=Object(l.a)()?i.useLayoutEffect:i.useEffect,V=n(475),F=[P,N,T,M];function z(e){return e===T||e===M}var J=function(e,t){var n=i.useState(R),r=Object(c.a)(n,2),a=r[0],o=r[1],u=function(){var e=i.useRef(null);function t(){V.a.cancel(e.current)}return i.useEffect((function(){return function(){t()}}),[]),[function n(r){var a=arguments.length>1&&void 0!==arguments[1]?arguments[1]:2;t();var c=Object(V.a)((function(){a<=1?r({isCanceled:function(){return c!==e.current}}):n(r,a-1)}));e.current=c},t]}(),s=Object(c.a)(u,2),f=s[0],v=s[1];return I((function(){if(a!==R&&a!==M){var e=F.indexOf(a),n=F[e+1],r=t(a);false===r?o(n):f((function(e){function t(){e.isCanceled()||o(n)}!0===r?t():Promise.resolve(r).then(t)}))}}),[e,a]),i.useEffect((function(){return function(){v()}}),[]),[function(){o(P)},a]};function K(e,t,n,o){var u=o.motionEnter,s=void 0===u||u,f=o.motionAppear,v=void 0===f||f,l=o.motionLeave,b=void 0===l||l,d=o.motionDeadline,O=o.motionLeaveImmediately,j=o.onAppearPrepare,p=o.onEnterPrepare,m=o.onLeavePrepare,y=o.onAppearStart,E=o.onEnterStart,h=o.onLeaveStart,L=o.onAppearActive,R=o.onEnterActive,M=o.onLeaveActive,V=o.onAppearEnd,F=o.onEnterEnd,K=o.onLeaveEnd,x=o.onVisibleChanged,H=D(),U=Object(c.a)(H,2),W=U[0],q=U[1],B=D(g),G=Object(c.a)(B,2),Q=G[0],X=G[1],Y=D(null),Z=Object(c.a)(Y,2),$=Z[0],_=Z[1],ee=Object(i.useRef)(!1),te=Object(i.useRef)(null),ne=Object(i.useRef)(!1),re=Object(i.useRef)(null);function ae(){return n()||re.current}var ce=Object(i.useRef)(!1);function oe(e){var t,n=ae();e&&!e.deadline&&e.target!==n||(Q===C&&ce.current?t=null===V||void 0===V?void 0:V(n,e):Q===S&&ce.current?t=null===F||void 0===F?void 0:F(n,e):Q===w&&ce.current&&(t=null===K||void 0===K?void 0:K(n,e)),!1===t||ne.current||(X(g),_(null)))}var ie=function(e){var t=Object(i.useRef)(),n=Object(i.useRef)(e);n.current=e;var r=i.useCallback((function(e){n.current(e)}),[]);function a(e){e&&(e.removeEventListener(A,r),e.removeEventListener(k,r))}return i.useEffect((function(){return function(){a(t.current)}}),[]),[function(e){t.current&&t.current!==e&&a(t.current),e&&e!==t.current&&(e.addEventListener(A,r),e.addEventListener(k,r),t.current=e)},a]}(oe),ue=Object(c.a)(ie,1)[0],se=i.useMemo((function(){var e,t,n;switch(Q){case"appear":return e={},Object(r.a)(e,P,j),Object(r.a)(e,N,y),Object(r.a)(e,T,L),e;case"enter":return t={},Object(r.a)(t,P,p),Object(r.a)(t,N,E),Object(r.a)(t,T,R),t;case"leave":return n={},Object(r.a)(n,P,m),Object(r.a)(n,N,h),Object(r.a)(n,T,M),n;default:return{}}}),[Q]),fe=J(Q,(function(e){if(e===P){var t=se.prepare;return!!t&&t(ae())}var n;be in se&&_((null===(n=se[be])||void 0===n?void 0:n.call(se,ae(),null))||null);return be===T&&(ue(ae()),d>0&&(clearTimeout(te.current),te.current=setTimeout((function(){oe({deadline:!0})}),d))),true})),ve=Object(c.a)(fe,2),le=ve[0],be=ve[1],de=z(be);ce.current=de,I((function(){q(t);var n,r=ee.current;(ee.current=!0,e)&&(!r&&t&&v&&(n=C),r&&t&&s&&(n=S),(r&&!t&&b||!r&&O&&!t&&b)&&(n=w),n&&(X(n),le()))}),[t]),Object(i.useEffect)((function(){(Q===C&&!v||Q===S&&!s||Q===w&&!b)&&X(g)}),[v,s,b]),Object(i.useEffect)((function(){return function(){clearTimeout(te.current),ne.current=!0}}),[]),Object(i.useEffect)((function(){void 0!==W&&Q===g&&(null===x||void 0===x||x(W))}),[W,Q]);var Oe=$;return se.prepare&&be===N&&(Oe=Object(a.a)({transition:"none"},Oe)),[Q,be,Oe,null!==W&&void 0!==W?W:t]}var x=n(434),H=n(435),U=n(436),W=n(438),q=function(e){Object(U.a)(n,e);var t=Object(W.a)(n);function n(){return Object(x.a)(this,n),t.apply(this,arguments)}return Object(H.a)(n,[{key:"render",value:function(){return this.props.children}}]),n}(i.Component);var B=function(e){var t=e;function n(e){return!(!e.motionName||!t)}"object"===Object(o.a)(e)&&(t=e.transitionSupport);var f=i.forwardRef((function(e,t){var o=e.visible,f=void 0===o||o,l=e.removeOnLeave,b=void 0===l||l,d=e.forceRender,O=e.children,j=e.motionName,p=e.leavedClassName,m=e.eventProps,y=n(e),E=Object(i.useRef)(),h=Object(i.useRef)();var k=K(y,f,(function(){try{return Object(u.a)(E.current||h.current)}catch(e){return null}}),e),A=Object(c.a)(k,4),C=A[0],S=A[1],w=A[2],R=A[3],T=i.useRef(R);R&&(T.current=!0);var M=Object(i.useRef)(t);M.current=t;var D,I=i.useCallback((function(e){E.current=e,Object(s.b)(M.current,e)}),[]),V=Object(a.a)(Object(a.a)({},m),{},{visible:f});if(O)if(C!==g&&n(e)){var F,J;S===P?J="prepare":z(S)?J="active":S===N&&(J="start"),D=O(Object(a.a)(Object(a.a)({},V),{},{className:v()(L(j,C),(F={},Object(r.a)(F,L(j,"".concat(C,"-").concat(J)),J),Object(r.a)(F,j,"string"===typeof j),F)),style:w}),I)}else D=R?O(Object(a.a)({},V),I):!b&&T.current?O(Object(a.a)(Object(a.a)({},V),{},{className:p}),I):d?O(Object(a.a)(Object(a.a)({},V),{},{style:{display:"none"}}),I):null;else D=null;return i.createElement(q,{ref:h},D)}));return f.displayName="CSSMotion",f}(h),G=n(21),Q=n(441),X="add",Y="keep",Z="remove",$="removed";function _(e){var t;return t=e&&"object"===Object(o.a)(e)&&"key"in e?e:{key:e},Object(a.a)(Object(a.a)({},t),{},{key:String(t.key)})}function ee(){var e=arguments.length>0&&void 0!==arguments[0]?arguments[0]:[];return e.map(_)}function te(){var e=arguments.length>0&&void 0!==arguments[0]?arguments[0]:[],t=arguments.length>1&&void 0!==arguments[1]?arguments[1]:[],n=[],r=0,c=t.length,o=ee(e),i=ee(t);o.forEach((function(e){for(var t=!1,o=r;o<c;o+=1){var u=i[o];if(u.key===e.key){r<o&&(n=n.concat(i.slice(r,o).map((function(e){return Object(a.a)(Object(a.a)({},e),{},{status:X})}))),r=o),n.push(Object(a.a)(Object(a.a)({},u),{},{status:Y})),r+=1,t=!0;break}}t||n.push(Object(a.a)(Object(a.a)({},e),{},{status:Z}))})),r<c&&(n=n.concat(i.slice(r).map((function(e){return Object(a.a)(Object(a.a)({},e),{},{status:X})}))));var u={};n.forEach((function(e){var t=e.key;u[t]=(u[t]||0)+1}));var s=Object.keys(u).filter((function(e){return u[e]>1}));return s.forEach((function(e){(n=n.filter((function(t){var n=t.key,r=t.status;return n!==e||r!==Z}))).forEach((function(t){t.key===e&&(t.status=Y)}))})),n}var ne=["eventProps","visible","children","motionName","motionAppear","motionEnter","motionLeave","motionLeaveImmediately","motionDeadline","removeOnLeave","leavedClassName","onAppearStart","onAppearActive","onAppearEnd","onEnterStart","onEnterActive","onEnterEnd","onLeaveStart","onLeaveActive","onLeaveEnd"];var re=function(e){var t=arguments.length>1&&void 0!==arguments[1]?arguments[1]:B,n=function(e){Object(U.a)(r,e);var n=Object(W.a)(r);function r(){var e;return Object(x.a)(this,r),(e=n.apply(this,arguments)).state={keyEntities:[]},e.removeKey=function(t){e.setState((function(e){return{keyEntities:e.keyEntities.map((function(e){return e.key!==t?e:Object(a.a)(Object(a.a)({},e),{},{status:$})}))}}))},e}return Object(H.a)(r,[{key:"render",value:function(){var e=this,n=this.state.keyEntities,r=this.props,a=r.component,c=r.children,o=r.onVisibleChanged,u=Object(Q.a)(r,["component","children","onVisibleChanged"]),s=a||i.Fragment,f={};return ne.forEach((function(e){f[e]=u[e],delete u[e]})),delete u.keys,i.createElement(s,u,n.map((function(n){var r=n.status,a=Object(Q.a)(n,["status"]),u=r===X||r===Y;return i.createElement(t,Object(G.a)({},f,{key:a.key,visible:u,eventProps:a,onVisibleChanged:function(t){null===o||void 0===o||o(t,{key:a.key}),t||e.removeKey(a.key)}}),c)})))}}],[{key:"getDerivedStateFromProps",value:function(e,t){var n=e.keys,r=t.keyEntities,a=ee(n);return{keyEntities:te(r,a).filter((function(e){var t=r.find((function(t){var n=t.key;return e.key===n}));return!t||t.status!==$||e.status!==Z}))}}}]),r}(i.Component);return n.defaultProps={component:"div"},n}(h);t.b=B},581:function(e,t,n){"use strict";n.d(t,"a",(function(){return c}));var r=n(123),a=n.n(r);function c(e){return e instanceof HTMLElement?e:a.a.findDOMNode(e)}},677:function(e,t,n){"use strict";function r(e){if("undefined"!==typeof Symbol&&Symbol.iterator in Object(e))return Array.from(e)}n.d(t,"a",(function(){return r}))}}]);