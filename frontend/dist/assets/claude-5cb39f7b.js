import{u as e,Q as s,r as a,j as t,I as n,U as o,B as i,V as r,W as l,X as c}from"./index-8bf8489d.js";import{u as d,d as m,o as h,P as u,D as x,T as j,S as p}from"./ShareModal-20b6362a.js";import{a as y}from"./accountService-0801bb34.js";import{u as f,a as k,b as w,c as S,C as g,E as T,B as C,S as K,R as N,A as I}from"./AccountModal-0f37a6a5.js";import{F as v}from"./index-83bdf3a0.js";import{T as V,E as z}from"./index-57131342.js";import{u as F}from"./useQuery-e775fa21.js";import{R as L,C as W}from"./row-b45105b9.js";function b(){const[b]=v.useForm(),{t:A}=e(),E=f(),O=k(),_=w(),q=S(),B=d(),G=s(),[M,Q]=a.useState(-1),[R,Y]=a.useState(-1),D=v.useWatch("email",b),[P,U]=a.useState({formValue:{email:"",accountType:"claude",password:"",refreshToken:""},title:"New",show:!1,onOk:(e,s)=>{e.id?O.mutate(e,{onSuccess:()=>{U((e=>({...e,show:!1})))},onSettled:()=>s(!1)}):E.mutate(e,{onSuccess:()=>{U((e=>({...e,show:!1})))},onSettled:()=>s(!1)})},onCancel:()=>{U((e=>({...e,show:!1})))}}),[X,$]=a.useState({formValue:{...m,shareType:"claude"},title:"New",show:!1,onOk:(e,s)=>{s(!0),B.mutate(e,{onSuccess:()=>{$((e=>({...e,show:!1})))},onSettled:()=>{s(!1)}})},onCancel:()=>{$((e=>({...e,show:!1})))}}),H=[{title:A("token.email"),dataIndex:"email",ellipsis:!0,align:"center",render:e=>t.jsx(V.Text,{style:{maxWidth:200},ellipsis:!0,children:e})},{title:A("token.password"),dataIndex:"password",align:"center",ellipsis:!0,render:e=>t.jsx(V.Text,{style:{maxWidth:200},ellipsis:!0,children:e})},{title:"Session Key",dataIndex:"sessionKey",align:"center",width:150,render:(e,s)=>s.sessionKey?t.jsx(n,{value:s.sessionKey,onClick:e=>h(s.sessionKey,A,e),readOnly:!0}):t.jsx(o,{color:"error",children:"Empty"})},{title:A("token.shareStatus"),dataIndex:"shared",align:"center",width:100,render:(e,s)=>1==s.shared?t.jsx(g,{twoToneColor:"#52c41a"}):t.jsx(T,{twoToneColor:"#fa8c16"})},{title:A("token.updateTime"),dataIndex:"updateTime",align:"center",width:200},{title:A("token.share"),key:"share",align:"center",render:(e,s)=>t.jsxs(i.Group,{children:[t.jsx(C,{count:s.shareList?.length,style:{zIndex:9},children:t.jsx(i,{icon:t.jsx(K,{}),onClick:()=>G({pathname:"/admin/share/claude",search:`?email=${s.email}`}),children:A("token.shareList")})}),t.jsx(i,{icon:t.jsx(r,{}),onClick:()=>Z(s)})]})},{title:A("token.action"),key:"operation",align:"center",render:(e,s)=>t.jsxs(i.Group,{children:[t.jsx(u,{title:A("common.refreshConfirm"),okText:"Yes",cancelText:"No",placement:"left",onConfirm:()=>{Y(s.id),q.mutate(s.id,{onSettled:()=>Y(void 0)})},children:t.jsx(i,{icon:t.jsx(N,{}),type:"primary",loading:R===s.id,children:A("common.refresh")},s.id)}),t.jsx(i,{onClick:()=>ee(s),icon:t.jsx(z,{}),type:"primary"}),t.jsx(u,{title:A("common.deleteConfirm"),okText:"Yes",cancelText:"No",placement:"left",onConfirm:()=>{Q(s.id),_.mutate(s.id,{onSuccess:()=>Q(void 0)})},children:t.jsx(i,{icon:t.jsx(x,{}),type:"primary",loading:M===s.id,danger:!0})})]})}],{data:J}=F({queryKey:["accounts","claude",D],queryFn:()=>y.searchAccountList(D,"claude")}),Z=e=>{$((s=>({...s,show:!0,title:A("token.share"),formValue:{...m,accountId:e.id,shareType:"claude"}})))},ee=e=>{U((s=>({...s,show:!0,title:A("token.edit"),formValue:{...s.formValue,id:e.id,email:e.email,password:e.password,shared:e.shared,sessionKey:e.sessionKey}})))};return t.jsxs(l,{direction:"vertical",size:"large",className:"w-full",children:[t.jsx(c,{children:t.jsx(v,{form:b,children:t.jsxs(L,{gutter:[16,16],children:[t.jsx(W,{span:6,lg:6,children:t.jsx(v.Item,{label:A("token.email"),name:"email",className:"!mb-0",children:t.jsx(n,{})})}),t.jsx(W,{span:18,lg:18,children:t.jsxs("div",{className:"flex justify-end",children:[t.jsx(i,{onClick:()=>{b.resetFields()},children:A("token.reset")}),t.jsx(i,{type:"primary",className:"ml-4",children:A("token.search")})]})})]})})}),t.jsx(c,{title:A("token.accountList"),extra:t.jsx(l,{children:t.jsx(i,{type:"primary",onClick:()=>{U((e=>({...e,show:!0,title:A("token.createNew"),formValue:{id:void 0,email:"",password:"",sessionKey:"",accountType:"claude",shared:0,custom_type:"refresh_token",custom_token:""}})))},children:A("token.createNew")})}),children:t.jsx(j,{rowKey:"id",size:"small",scroll:{x:"max-content"},pagination:{pageSize:10},columns:H,dataSource:J})}),t.jsx(I,{...P}),t.jsx(p,{...X})]})}export{b as default};
