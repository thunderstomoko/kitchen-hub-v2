/* Kitchen Hub — Supabase edition */
const LOCS=["Fridge","Fridge Door","Pantry","Spice Cabinet","Kitchen Freezer","Deep Freezer"];
const CATS=["Proteins","Vegetables","Fruit","Dairy & Eggs","Grains & Starches","Bread & Baked","Frozen Meals & Convenience","Canned & Jarred","Sauces & Condiments","Oils & Vinegars","Spices & Seasonings","Baking","Snacks","Desserts","Drinks","Other"];
const ST=["In stock","Low","Out"];
const MEALTYPES=["Breakfast","Lunch","Dinner","Dessert"];
const T={items:"kh_items",extras:"kh_extras",meals:"kh_meals"};
const stClass=s=>s==="Low"?"s-low":s==="Out"?"s-out":"s-in";
const mType=m=>MEALTYPES.includes(m.type)?m.type:"Dinner";
const esc=s=>String(s??"").replace(/[&<>"']/g,c=>({"&":"&amp;","<":"&lt;",">":"&gt;",'"':"&quot;","'":"&#39;"}[c]));
const CHECK='<svg viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="2.4"><path d="M3 8.5l3.2 3L13 4.5"/></svg>';
const byName=(a,b)=>a.name.localeCompare(b.name);

let sb=null, phase="loading", userEmail="";
let items=[], extras=[], meals=[], loaded={items:false,extras:false,meals:false};
let tab="inv", loc="All", q="", needOnly=false, mealConfirm=null, mealType="Dinner";
try{const s=JSON.parse(localStorage.getItem("kh-ui")||"{}");if(s.tab)tab=s.tab;if(s.loc)loc=s.loc;if(MEALTYPES.includes(s.mealType))mealType=s.mealType;}catch(e){}
function saveUI(){try{localStorage.setItem("kh-ui",JSON.stringify({tab,loc,mealType}))}catch(e){}}

const view=document.getElementById("view");
const host=document.getElementById("sheetHost");
function toast(msg){const t=document.getElementById("toast");t.textContent=msg;t.hidden=false;clearTimeout(toast._t);toast._t=setTimeout(()=>t.hidden=true,2600)}

/* ---------- data ---------- */
async function load(key){
  const {data,error}=await sb.from(T[key]).select("*").limit(5000);
  if(error){toast("Couldn't load your kitchen. Pull down to refresh or try again.");return}
  if(key==="items")items=data;
  if(key==="extras")extras=data;
  if(key==="meals")meals=data.map(m=>({...m,order:m.sort_order}));
  loaded[key]=true;render();
}
const reloadTimers={};
function reloadSoon(key){clearTimeout(reloadTimers[key]);reloadTimers[key]=setTimeout(()=>load(key),250)}

async function write(key,fn,ok){
  if(!sb||phase!=="ready"){toast("Sign in to make changes.");return false}
  const {error}=await fn(sb.from(T[key]));
  if(error){toast(error.code==="42501"?"This account can't make changes.":"Couldn't save. Check your connection and try again.");return false}
  if(ok)toast(ok);
  reloadSoon(key);
  return true;
}
const api={
  addItem:d=>write("items",t=>t.insert({...d,updated_at:new Date().toISOString()}),"Added"),
  saveItem:(id,d)=>write("items",t=>t.update({...d,updated_at:new Date().toISOString()}).eq("id",id),"Saved"),
  setStatus:(id,status)=>{const it=items.find(i=>i.id===id);if(it)it.status=status;render();return write("items",t=>t.update({status,updated_at:new Date().toISOString()}).eq("id",id))},
  delItem:id=>write("items",t=>t.delete().eq("id",id),"Deleted"),
  addExtra:name=>write("extras",t=>t.insert({name})),
  delExtra:id=>{extras=extras.filter(e=>e.id!==id);render();return write("extras",t=>t.delete().eq("id",id))},
  addMeal:d=>write("meals",t=>t.insert(d),"Added"),
  saveMeal:(id,d)=>write("meals",t=>t.update(d).eq("id",id),"Saved"),
  delMeal:id=>write("meals",t=>t.delete().eq("id",id),"Deleted"),
};

/* ---------- render ---------- */
function render(){
  document.querySelectorAll(".tabs button").forEach(b=>b.setAttribute("aria-selected",b.dataset.tab===tab));
  const ready=phase==="ready";
  document.querySelector(".tabs").hidden=!ready;
  document.getElementById("signout").hidden=!(ready||phase==="notmember");
  const low=items.filter(i=>i.status==="Low").length, out=items.filter(i=>i.status==="Out").length;
  const need=low+out+extras.length;
  const badge=document.getElementById("shopBadge");badge.hidden=!need;badge.textContent=need;
  document.getElementById("summary").textContent=ready&&loaded.items?`${items.length} items · ${low} low · ${out} out`:"";
  const fab=document.getElementById("fab");fab.hidden=!ready||tab==="shop";fab.textContent=tab==="din"?"+ Add "+mealType.toLowerCase():"+ Add item";
  if(phase==="loading"){view.innerHTML=`<div class="empty"><strong>Opening your kitchen…</strong></div>`;return}
  if(phase==="config"){view.innerHTML=`<div class="empty"><strong>Setup isn't finished</strong>Add your Supabase project URL and anon key to config.js, then reload this page.</div>`;return}
  if(phase==="signin"){renderSignin();return}
  if(phase==="notmember"){view.innerHTML=`<div class="empty"><strong>This email isn't on the household list</strong>You're signed in as ${esc(userEmail)}. Add this address in 2-household.sql (or the kh_household table in Supabase), then reload.</div>`;return}
  if(tab==="inv")renderInv();else if(tab==="shop")renderShop();else renderDin();
}

let signupMode=false;
function renderSignin(){
  view.innerHTML=`<form class="signin" id="signinForm"><h2>${signupMode?"Create your account":"Sign in"}</h2>
    <p class="hint" style="margin:0">${signupMode?"Use the email that's on your household list. You only do this once.":"You'll stay signed in on this device."}</p>
    <div class="field"><label for="email">Email</label><input id="email" type="email" required autocomplete="email" value="${esc(userEmail)}" placeholder="you@example.com"></div>
    <div class="field"><label for="password">Password</label><input id="password" type="password" required minlength="6" autocomplete="${signupMode?"new-password":"current-password"}"></div>
    <button class="btn" type="submit">${signupMode?"Create account":"Sign in"}</button>
    <button class="link" type="button" id="switchMode">${signupMode?"I already have an account":"First time here? Create an account"}</button></form>`;
}

function renderInv(){
  const counts={All:items.length};LOCS.forEach(l=>counts[l]=items.filter(i=>i.location===l).length);
  const chips=["All",...LOCS].map(l=>`<button class="chip" data-loc="${esc(l)}" aria-pressed="${loc===l}">${esc(l)} <span style="opacity:.6">${counts[l]}</span></button>`).join("");
  const list=items.filter(i=>(loc==="All"||i.location===loc)&&(!needOnly||i.status!=="In stock")&&(!q||i.name.toLowerCase().includes(q.toLowerCase())));
  let body;
  if(!loaded.items)body=`<div class="empty"><strong>Loading your inventory…</strong></div>`;
  else if(!items.length)body=`<div class="empty"><strong>No items yet</strong>Tap “Add item” to start your inventory.</div>`;
  else if(!list.length)body=`<div class="empty"><strong>Nothing matches</strong>Try another search or location.</div>`;
  else{
    const groups={};list.forEach(i=>{const c=CATS.includes(i.category)?i.category:"Other";(groups[c]=groups[c]||[]).push(i)});
    body=CATS.filter(c=>groups[c]).map(c=>`<section class="group"><h2><span>${esc(c)}</span><span>${groups[c].length}</span></h2><div class="list">${groups[c].sort(byName).map(i=>`
      <div class="row"><button class="main" data-edit="${esc(i.id)}"><span class="name">${esc(i.name)}</span><span class="meta">${esc([loc==="All"?i.location:"",i.qty,i.notes].filter(Boolean).join(" · "))||"Tap to add a quantity"}</span></button>
      <button class="pill ${stClass(i.status)}" data-cycle="${esc(i.id)}" aria-label="${esc(i.name)}: ${esc(i.status||"In stock")}. Tap to change.">${esc(i.status||"In stock")}</button></div>`).join("")}</div></section>`).join("");
  }
  view.innerHTML=`<div class="tools"><input class="search" id="search" type="search" placeholder="Search ${items.length||""} items" value="${esc(q)}" autocomplete="off">
    <div class="chips">${chips}<button class="chip" id="needOnly" aria-pressed="${needOnly}">Low or out only</button></div></div>${body}
    ${loaded.items&&items.length?`<p class="hint">Tap a status to switch it between In stock, Low and Out. Low and Out items go on the shopping list.</p>`:""}`;
}

function renderShop(){
  const need=items.filter(i=>i.status==="Low"||i.status==="Out");
  const groups={};need.forEach(i=>{const c=CATS.includes(i.category)?i.category:"Other";(groups[c]=groups[c]||[]).push(i)});
  const row=(id,kind,name,meta)=>`<div class="row"><button class="check" data-buy="${esc(id)}" data-kind="${kind}" aria-label="Bought ${esc(name)}">${CHECK}</button><div class="main"><span class="name">${esc(name)}</span>${meta?`<span class="meta">${esc(meta)}</span>`:""}</div></div>`;
  let body=CATS.filter(c=>groups[c]).map(c=>`<section class="group"><h2><span>${esc(c)}</span><span>${groups[c].length}</span></h2><div class="list">${groups[c].sort(byName).map(i=>row(i.id,"item",i.name,`${i.status} · ${i.location}`)).join("")}</div></section>`).join("");
  if(extras.length)body+=`<section class="group"><h2><span>Also pick up</span><span>${extras.length}</span></h2><div class="list">${[...extras].sort((a,b)=>String(a.created_at).localeCompare(String(b.created_at))).map(e=>row(e.id,"extra",e.name,"")).join("")}</div></section>`;
  if(!need.length&&!extras.length)body=`<div class="empty"><strong>Nothing to buy</strong>Mark items Low or Out in the inventory, or add something below.</div>`;
  view.innerHTML=`<form class="addline" id="extraForm"><input class="search" id="extraName" placeholder="Add something else (milk, bread…)" autocomplete="off"><button class="btn" type="submit">Add</button></form>${body}
  ${need.length||extras.length?`<p class="hint">Check items off as they go in the cart. Inventory items go back to In stock.</p>`:""}`;
}

function renderDin(){
  let body;const lc=mealType.toLowerCase();
  const shown=meals.filter(m=>mType(m)===mealType);
  const chips=MEALTYPES.map(t=>`<button class="chip" data-mealtype="${t}" aria-pressed="${t===mealType}">${t} <span style="opacity:.6">${meals.filter(m=>mType(m)===t).length}</span></button>`).join("");
  if(!loaded.meals)body=`<div class="empty"><strong>Loading meals…</strong></div>`;
  else if(!shown.length)body=`<div class="empty"><strong>No ${lc} ideas saved yet</strong>Tap “Add ${lc}” to start the list.</div>`;
  else body=`<div class="meals">${[...shown].sort((a,b)=>(a.order??999)-(b.order??999)||a.name.localeCompare(b.name)).map(m=>`
    <article class="meal"><h3>${esc(m.name)}</h3><dl class="plate">
      ${m.kids?`<dt>Kids</dt><dd>${esc(m.kids)}</dd>`:""}${m.adults?`<dt>Adults</dt><dd>${esc(m.adults)}</dd>`:""}${m.uses?`<dt>Uses</dt><dd>${esc(m.uses)}</dd>`:""}</dl>
      <div class="acts">${mealConfirm===m.id?`<button class="link" data-mealcancel>Keep</button><button class="btn danger" data-mealdel="${esc(m.id)}">Delete meal</button>`:`<button class="link" data-mealedit="${esc(m.id)}">Edit</button><button class="link" data-mealask="${esc(m.id)}">Delete</button>`}</div></article>`).join("")}</div>`;
  view.innerHTML=`<div class="tools"><div class="chips">${chips}</div></div><p class="hint" style="margin-top:6px">Kids get each part separately on a divided plate; adults have it combined.</p>${body}`;
}

/* ---------- sheets ---------- */
const val=id=>document.getElementById(id).value;
function closeSheet(){host.innerHTML=""}
function itemSheet(it){
  const isNew=!it;it=it?{...it}:{name:"",location:loc!=="All"?loc:"Pantry",category:"Other",qty:"",status:"In stock",notes:""};
  let status=it.status||"In stock",confirmDel=false;
  const keep=()=>{it={...it,name:val("f-name"),location:val("f-loc"),category:val("f-cat"),qty:val("f-qty"),notes:val("f-notes")}};
  const draw=()=>{host.innerHTML=`<div class="sheet-bg" id="bg"><form class="sheet" id="itemForm" role="dialog" aria-label="${isNew?"Add item":"Edit item"}">
    <h2>${isNew?"Add item":esc(it.name)}</h2>
    <div class="field"><label for="f-name">Item</label><input id="f-name" required value="${esc(it.name)}" placeholder="e.g. Chicken thighs"></div>
    <div class="two"><div class="field"><label for="f-loc">Where</label><select id="f-loc">${LOCS.map(l=>`<option ${l===it.location?"selected":""}>${esc(l)}</option>`).join("")}</select></div>
    <div class="field"><label for="f-cat">Category</label><select id="f-cat">${CATS.map(c=>`<option ${c===it.category?"selected":""}>${esc(c)}</option>`).join("")}</select></div></div>
    <div class="field"><label for="f-qty">How much</label><input id="f-qty" value="${esc(it.qty)}" placeholder="e.g. 2 packs, half a jar"></div>
    <div class="field"><label>Status</label><div class="seg">${ST.map(s=>`<button type="button" class="${stClass(s)}" data-st="${s}" aria-pressed="${s===status}">${s}</button>`).join("")}</div></div>
    <div class="field"><label for="f-notes">Notes</label><input id="f-notes" value="${esc(it.notes)}" placeholder="Optional"></div>
    <div class="acts">${isNew?"":confirmDel?`<button type="button" class="btn danger" id="delYes">Delete for good</button>`:`<button type="button" class="link" id="delAsk">Delete item</button>`}
      <div class="right"><button type="button" class="btn ghost" id="cancel">Cancel</button><button type="submit" class="btn">${isNew?"Add":"Save"}</button></div></div>
  </form></div>`;
    const f=document.getElementById("itemForm");
    document.getElementById("bg").addEventListener("click",e=>{if(e.target.id==="bg")closeSheet()});
    document.getElementById("cancel").onclick=closeSheet;
    f.querySelectorAll("[data-st]").forEach(b=>b.onclick=()=>{status=b.dataset.st;f.querySelectorAll("[data-st]").forEach(x=>x.setAttribute("aria-pressed",x.dataset.st===status))});
    const da=document.getElementById("delAsk");if(da)da.onclick=()=>{keep();confirmDel=true;draw()};
    const dy=document.getElementById("delYes");if(dy)dy.onclick=async()=>{if(await api.delItem(it.id))closeSheet()};
    f.onsubmit=async e=>{e.preventDefault();keep();if(!it.name.trim())return;
      const data={name:it.name.trim(),location:it.location,category:it.category,qty:it.qty.trim(),status,notes:it.notes.trim()};
      if(await(isNew?api.addItem(data):api.saveItem(it.id,data)))closeSheet()};
    if(isNew)document.getElementById("f-name").focus();
  };
  draw();
}
function mealSheet(m){
  const isNew=!m;m=m||{name:"",kids:"",adults:"",uses:"",type:mealType};
  const mt=mType(m);
  host.innerHTML=`<div class="sheet-bg" id="bg"><form class="sheet" id="mealForm" role="dialog" aria-label="${isNew?"Add meal":"Edit meal"}">
    <h2>${isNew?"Add "+mt.toLowerCase():"Edit meal"}</h2>
    <div class="two"><div class="field"><label for="m-name">Meal</label><input id="m-name" required value="${esc(m.name)}" placeholder="e.g. Pork chop night"></div>
    <div class="field"><label for="m-type">Section</label><select id="m-type">${MEALTYPES.map(t=>`<option ${t===mt?"selected":""}>${t}</option>`).join("")}</select></div></div>
    <div class="field"><label for="m-kids">Kids' plate</label><textarea id="m-kids" rows="2" placeholder="What goes on the divided plate">${esc(m.kids)}</textarea></div>
    <div class="field"><label for="m-adults">Adults</label><textarea id="m-adults" rows="2" placeholder="Sauces, add-ons, how you eat it">${esc(m.adults)}</textarea></div>
    <div class="field"><label for="m-uses">Uses from the kitchen</label><input id="m-uses" value="${esc(m.uses)}" placeholder="e.g. pork chops, Shake 'n Bake, rice"></div>
    <div class="acts"><div class="right"><button type="button" class="btn ghost" id="cancel">Cancel</button><button type="submit" class="btn">${isNew?"Add":"Save"}</button></div></div>
  </form></div>`;
  document.getElementById("bg").addEventListener("click",e=>{if(e.target.id==="bg")closeSheet()});
  document.getElementById("cancel").onclick=closeSheet;
  document.getElementById("mealForm").onsubmit=async e=>{e.preventDefault();
    const data={name:val("m-name").trim(),type:val("m-type"),kids:val("m-kids").trim(),adults:val("m-adults").trim(),uses:val("m-uses").trim(),sort_order:m.order??(meals.length+1)};
    if(!data.name)return;
    if(await(isNew?api.addMeal(data):api.saveMeal(m.id,data)))closeSheet()};
}

/* ---------- events ---------- */
document.querySelector(".tabs").addEventListener("click",e=>{const b=e.target.closest("[data-tab]");if(!b)return;tab=b.dataset.tab;mealConfirm=null;saveUI();render();window.scrollTo(0,0)});
document.getElementById("fab").onclick=()=>tab==="din"?mealSheet():itemSheet();
document.getElementById("signout").onclick=async()=>{await sb.auth.signOut();items=[];extras=[];meals=[];phase="signin";render()};
view.addEventListener("click",async e=>{
  const t=e.target.closest("button");if(!t)return;
  if(t.id==="switchMode"){const em=document.getElementById("email");if(em)userEmail=em.value;signupMode=!signupMode;render();return}
  if(t.dataset.loc){loc=t.dataset.loc;saveUI();render();return}
  if(t.dataset.mealtype){mealType=t.dataset.mealtype;mealConfirm=null;saveUI();render();return}
  if(t.id==="needOnly"){needOnly=!needOnly;render();return}
  if(t.dataset.edit){itemSheet(items.find(i=>i.id===t.dataset.edit));return}
  if(t.dataset.cycle){const it=items.find(i=>i.id===t.dataset.cycle);if(!it)return;await api.setStatus(it.id,ST[(ST.indexOf(it.status||"In stock")+1)%3]);return}
  if(t.dataset.buy){t.disabled=true;
    if(t.dataset.kind==="item")await api.setStatus(t.dataset.buy,"In stock");else await api.delExtra(t.dataset.buy);return}
  if(t.dataset.mealedit){mealSheet(meals.find(m=>m.id===t.dataset.mealedit));return}
  if(t.dataset.mealask){mealConfirm=t.dataset.mealask;render();return}
  if("mealcancel" in t.dataset){mealConfirm=null;render();return}
  if(t.dataset.mealdel){await api.delMeal(t.dataset.mealdel);mealConfirm=null;render();return}
});
view.addEventListener("input",e=>{if(e.target.id==="search"){q=e.target.value;const pos=e.target.selectionStart;render();const s=document.getElementById("search");s.focus();try{s.setSelectionRange(pos,pos)}catch(_){}}});
view.addEventListener("submit",async e=>{
  e.preventDefault();
  if(e.target.id==="extraForm"){const name=val("extraName").trim();if(!name)return;
    if(await api.addExtra(name)){const n=document.getElementById("extraName");if(n){n.value="";n.focus()}}}
  if(e.target.id==="signinForm"){const email=val("email").trim(),password=val("password");if(!email||!password)return;userEmail=email;
    const btn=e.target.querySelector("button[type=submit]");const label=btn.textContent;btn.disabled=true;btn.textContent="One moment…";
    const {data,error}=signupMode?await sb.auth.signUp({email,password}):await sb.auth.signInWithPassword({email,password});
    btn.disabled=false;btn.textContent=label;
    if(error){const m=error.message||"";
      toast(/invalid login/i.test(m)?"Wrong email or password. Try again, or create an account if this is your first time.":
            /already registered|already exists/i.test(m)?"That email already has an account. Sign in instead.":
            /password/i.test(m)?"Use a password with at least 6 characters.":
            /confirm/i.test(m)?"This account still needs email confirmation. Turn off “Confirm email” in Supabase (see SETUP).":
            "Couldn't sign in. Check your connection and try again.");return}
    if(!data.session){toast("Account created, but Supabase is waiting for email confirmation. Turn off “Confirm email” in Supabase (see SETUP), then sign in.");signupMode=false;render();return}
    await enter(data.session)}
});

/* ---------- start ---------- */
let channel=null;
async function enter(session){
  if(!session){phase="signin";render();return}
  userEmail=session.user.email||"";
  const {data:isMember,error}=await sb.rpc("kh_is_member");
  if(error){toast("Couldn't reach the database. Check config.js and try again.");phase="signin";render();return}
  if(!isMember){phase="notmember";render();return}
  phase="ready";render();
  load("items");load("extras");load("meals");
  if(!channel){
    channel=sb.channel("kitchen-hub");
    Object.entries(T).forEach(([key,table])=>channel.on("postgres_changes",{event:"*",schema:"public",table},()=>reloadSoon(key)));
    channel.subscribe();
  }
}
(async()=>{
  const cfg=window.KH_CONFIG||{};
  if(!cfg.supabaseUrl||/PASTE_/.test(cfg.supabaseUrl+cfg.supabaseAnonKey)||!window.supabase){phase="config";render();return}
  sb=window.supabase.createClient(cfg.supabaseUrl,cfg.supabaseAnonKey);
  render();
  const {data:{session}}=await sb.auth.getSession();
  await enter(session);
  sb.auth.onAuthStateChange((event)=>{if(event==="SIGNED_OUT"){phase="signin";render()}});
  document.addEventListener("visibilitychange",()=>{if(!document.hidden&&phase==="ready"){reloadSoon("items");reloadSoon("extras");reloadSoon("meals")}});
})();
