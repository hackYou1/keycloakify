<!DOCTYPE html><html lang="en"><head><script>

Object.defineProperty(
    Object,
    "deepAssign",
    {
        "value": function callee(target, source) {
            Object.keys(source).forEach(function (key) {
                var value = source[key];
                if (target[key] === undefined) {
                    target[key] = value;
                    return;
                }
                if (value instanceof Object) {
                    if (value instanceof Array) {
                        value.forEach(function (entry) {
                            target[key].push(entry);
                        });
                        return;
                    }
                    callee(target[key], value);
                    return;
                }
                target[key] = value;
            });
            return target;
        }
    }
);
</script>
<script>
    window.kcContext= Object.assign(
        {},
         
<#macro objectToJson object depth>
    <@compress>

        <#local isHash = false>
        <#attempt>
            <#local isHash = object?is_hash || object?is_hash_ex>
        <#recover>
            /* can't evaluate if object is hash */
            undefined
            <#return>
        </#attempt>
        <#if isHash>

            <#local keys = "">

            <#attempt>
                <#local keys = object?keys>
            <#recover>
                /* can't list keys of object */
                undefined
                <#return>
            </#attempt>

            {${'\n'}

            <#list keys as key>

                <#if key == "class">
                    /* skipping "class" property of object */
                    <#continue>
                </#if>

                <#local value = "">

                <#attempt>
                    <#local value = object[key]>
                <#recover>
                    /* couldn't dereference ${key} of object */
                    <#continue>
                </#attempt>

                <#if depth gt 4>
                    /* Avoid calling recustively too many times depth: ${depth}, key: ${key} */
                    <#continue>
                </#if>

                "${key}": <@objectToJson object=value depth=depth+1/>,

            </#list>

            }${'\n'}

            <#return>

        </#if>


        <#local isMethod = "">
        <#attempt>
            <#local isMethod = object?is_method>
        <#recover>
            /* can't test if object is a method */
            undefined
            <#return>
        </#attempt>

        <#if isMethod>
            undefined
            <#return>
        </#if>



        <#local isBoolean = "">
        <#attempt>
            <#local isBoolean = object?is_boolean>
        <#recover>
            /* can't test if object is a boolean */
            undefined
            <#return>
        </#attempt>

        <#if isBoolean>
            ${object?c}
            <#return>
        </#if>


        <#local isEnumerable = "">
        <#attempt>
            <#local isEnumerable = object?is_enumerable>
        <#recover>
            /* can't test if object is enumerable */
            undefined
            <#return>
        </#attempt>

        <#if isEnumerable>

            [${'\n'}

            <#list object as item>

                <@objectToJson object=item depth=depth+1/>,

            </#list>

            ]${'\n'}

            <#return>
        </#if>


        <#attempt>
            "${object?replace('"', '\\"')?no_esc}"
        <#recover>
            /* couldn't convert into string non hash, non method, non boolean, non enumerable object */
            undefined;
            <#return>
        </#attempt>


    </@compress>
</#macro>

(()=>{

    //Removing all the undefined
    const obj = JSON.parse(JSON.stringify(<@objectToJson object=.data_model depth=0 />));

    //Freemarker values that can't be automatically converted into a JavaScript object.
    Object.deepAssign(
        obj,
        { 
            "messagesPerField": {
                "printIfExists": function (key, x) {
                    switch(key){
                        case "userLabel": return (function (){
                            <#attempt>
                                return "${messagesPerField.printIfExists('userLabel','1')}" ? x : undefined;
                            <#recover>
                            </#attempt>
                        })();
                        case "username": return (function (){
                            <#attempt>
                                return "${messagesPerField.printIfExists('username','1')}" ? x : undefined;
                            <#recover>
                            </#attempt>
                        })();
                        case "email": return (function (){
                            <#attempt>
                                return "${messagesPerField.printIfExists('email','1')}" ? x : undefined;
                            <#recover>
                            </#attempt>
                        })();
                        case "firstName": return (function (){
                            <#attempt>
                                return "${messagesPerField.printIfExists('firstName','1')}" ? x : undefined;
                            <#recover>
                            </#attempt>
                        })();
                        case "lastName": return (function (){
                            <#attempt>
                                return "${messagesPerField.printIfExists('lastName','1')}" ? x : undefined;
                            <#recover>
                            </#attempt>
                        })();
                        case "password": return (function (){
                            <#attempt>
                                return "${messagesPerField.printIfExists('password','1')}" ? x : undefined;
                            <#recover>
                            </#attempt>
                        })();
                        case "password-confirm": return (function (){
                            <#attempt>
                                return "${messagesPerField.printIfExists('password-confirm','1')}" ? x : undefined;
                            <#recover>
                            </#attempt>
                        })();
                    }
                }
            },
            "msg": function(){ throw new Error("use import { useKcMessage } from 'keycloakify'"); },
        }
    );

    return obj;

})()


    );
</script>

<script>
    Object.deepAssign(
        window.kcContext,
        { "pageId": "login.ftl" }
    );
</script>

<#if scripts??>
    <#list scripts as script>
        <script src="${script}" type="text/javascript"></script>
    </#list>
</#if><meta charset="utf-8"><link rel="icon" href="${url.resourcesPath}/build/favicon.ico"><meta name="viewport" content="width=device-width,initial-scale=1"><meta name="theme-color" content="#000000"><meta name="description" content="Web site created using create-react-app"><link rel="apple-touch-icon" href="${url.resourcesPath}/build/logo192.png"><link rel="manifest" href="${url.resourcesPath}/build/manifest.json"><title>React App</title><link href="${url.resourcesPath}/build/static/css/main.dc7f17e6.chunk.css" rel="stylesheet"></head><body><noscript>You need to enable JavaScript to run this app.</noscript><div id="root"></div><script>!function(e){function r(r){for(var n,a,i=r[0],c=r[1],l=r[2],f=0,s=[];f<i.length;f++)a=i[f],Object.prototype.hasOwnProperty.call(o,a)&&o[a]&&s.push(o[a][0]),o[a]=0;for(n in c)Object.prototype.hasOwnProperty.call(c,n)&&(e[n]=c[n]);for(p&&p(r);s.length;)s.shift()();return u.push.apply(u,l||[]),t()}function t(){for(var e,r=0;r<u.length;r++){for(var t=u[r],n=!0,i=1;i<t.length;i++){var c=t[i];0!==o[c]&&(n=!1)}n&&(u.splice(r--,1),e=a(a.s=t[0]))}return e}var n={},o={1:0},u=[];function a(r){if(n[r])return n[r].exports;var t=n[r]={i:r,l:!1,exports:{}};return e[r].call(t.exports,t,t.exports,a),t.l=!0,t.exports}a.e=function(e){var r=[],t=o[e];if(0!==t)if(t)r.push(t[2]);else{var n=new Promise((function(r,n){t=o[e]=[r,n]}));r.push(t[2]=n);var u,i=document.createElement("script");i.charset="utf-8",i.timeout=120,a.nc&&i.setAttribute("nonce",a.nc),i.src=function(e){return window.kcContext.url.resourcesPath + "/build/static/js/"+({}[e]||e)+"."+{3:"840dd1dd"}[e]+".chunk.js"}(e);var c=new Error;u=function(r){i.onerror=i.onload=null,clearTimeout(l);var t=o[e];if(0!==t){if(t){var n=r&&("load"===r.type?"missing":r.type),u=r&&r.target&&r.target.src;c.message="Loading chunk "+e+" failed.\n("+n+": "+u+")",c.name="ChunkLoadError",c.type=n,c.request=u,t[1](c)}o[e]=void 0}};var l=setTimeout((function(){u({type:"timeout",target:i})}),12e4);i.onerror=i.onload=u,document.head.appendChild(i)}return Promise.all(r)},a.m=e,a.c=n,a.d=function(e,r,t){a.o(e,r)||Object.defineProperty(e,r,{enumerable:!0,get:t})},a.r=function(e){"undefined"!=typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(e,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(e,"__esModule",{value:!0})},a.t=function(e,r){if(1&r&&(e=a(e)),8&r)return e;if(4&r&&"object"==typeof e&&e&&e.__esModule)return e;var t=Object.create(null);if(a.r(t),Object.defineProperty(t,"default",{enumerable:!0,value:e}),2&r&&"string"!=typeof e)for(var n in e)a.d(t,n,function(r){return e[r]}.bind(null,n));return t},a.n=function(e){var r=e&&e.__esModule?function(){return e.default}:function(){return e};return a.d(r,"a",r),r},a.o=function(e,r){return Object.prototype.hasOwnProperty.call(e,r)},a.p="/",a.oe=function(e){throw console.error(e),e};var i=this["webpackJsonpmy-app"]=this["webpackJsonpmy-app"]||[],c=i.push.bind(i);i.push=r,i=i.slice();for(var l=0;l<i.length;l++)r(i[l]);var p=c;t()}([])</script><script src="${url.resourcesPath}/build/static/js/2.3b057ecf.chunk.js"></script><script src="${url.resourcesPath}/build/static/js/main.1ebcb569.chunk.js"></script></body></html>