import{ab as t}from"./index-7b122661.js";const a={getOneApiChannelList:()=>t.post({url:"/account/oneapi/channels"}),getAccountList:()=>t.get({url:"/account/list"}).then((t=>(t.forEach((t=>{t.shareList&&(t.shareList=JSON.parse(t.shareList))})),t))),searchAccountList:(a,c)=>t.post({url:"/account/search",data:{email:a,accountType:c}}).then((t=>(t.forEach((t=>{t.shareList&&(t.shareList=JSON.parse(t.shareList))})),t))),addAccount:a=>t.post({url:"/account/add",data:a}),updateAccount:a=>t.post({url:"/account/update",data:a}),deleteAccount:a=>t.post({url:"/account/delete",data:{id:a}}),refreshAccount:a=>t.post({url:"/account/refresh",data:{id:a}}),getShareAccountList:()=>t.post({url:"/share_accounts"}),loginFreeAccount:a=>t.post({url:"/login_free_account",data:a})};export{a};
