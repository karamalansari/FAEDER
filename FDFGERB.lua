--[[

•   𝐓𝐡𝐢𝐬 𝐢𝐬 𝐭𝐡𝐞 𝐄𝐫𝐢𝐜 𝐒𝐨𝐮𝐫𝐜𝐞 @EE3WW .   •
•                -𝐄𝐫𝐢𝐜 𝐒𝐨𝐮𝐫𝐜𝐞-                 •
•        • https://t.me/LDD7D •         •
•]]
URL     = require("./libs/url")
JSON    = require("./libs/dkjson")
serpent = require("libs/serpent")
json = require('libs/json')
Redis = require('libs/redis').connect('127.0.0.1', 6379)
http  = require("socket.http")
https   = require("ssl.https")
local Methods = io.open("./luatele.lua","r")
if Methods then
URL.tdlua_CallBack()
end
SshId = io.popen("echo $SSH_CLIENT ︙ awk '{ print $1}'"):read('*a')
luatele = require 'luatele'
local FileInformation = io.open("./Information.lua","r")
if not FileInformation then
if not Redis:get(SshId.."Info:Redis:Token") then
io.write('\27[1;31mارسل لي توكن البوت الان \nSend Me a Bot Token Now ↡\n\27[0;39;49m')
local TokenBot = io.read()
if TokenBot and TokenBot:match('(%d+):(.*)') then
local url , res = https.request('https://api.telegram.org/bot'..TokenBot..'/getMe')
local Json_Info = JSON.decode(url)
if res ~= 200 then
print('\27[1;34mعذرا توكن البوت خطأ تحقق منه وارسله مره اخره \nBot Token is Wrong\n')
else
io.write('\27[1;34mتم حفظ التوكن بنجاح \nThe token been saved successfully \n\27[0;39;49m')
TheTokenBot = TokenBot:match("(%d+)")
os.execute('sudo rm -fr .CallBack-Bot/'..TheTokenBot)
Redis:set(SshId.."Info:Redis:Token",TokenBot)
Redis:set(SshId.."Info:Redis:Token:User",Json_Info.result.username)
end 
else
print('\27[1;34mلم يتم حفظ التوكن جرب مره اخره \nToken not saved, try again')
end 
os.execute('lua FDFGERB.lua')
end
if not Redis:get(SshId.."Info:Redis:User") then
io.write('\27[1;31mارسل معرف المطور الاساسي الان \nDeveloper UserName saved ↡\n\27[0;39;49m')
local UserSudo = io.read():gsub('@','')
if UserSudo ~= '' then
io.write('\n\27[1;34mتم حفظ معرف المطور \nDeveloper UserName saved \n\n\27[0;39;49m')
Redis:set(SshId.."Info:Redis:User",UserSudo)
else
print('\n\27[1;34mلم يتم حفظ معرف المطور الاساسي \nDeveloper UserName not saved\n')
end 
os.execute('lua FDFGERB.lua')
end
if not Redis:get(SshId.."Info:Redis:User:ID") then
io.write('\27[1;31mارسل ايدي المطور الاساسي الان \nDeveloper ID saved ↡\n\27[0;39;49m')
local UserId = io.read()
if UserId and UserId:match('(%d+)') then
io.write('\n\27[1;34mتم حفظ ايدي المطور \nDeveloper ID saved \n\n\27[0;39;49m')
Redis:set(SshId.."Info:Redis:User:ID",UserId)
else
print('\n\27[1;34mلم يتم حفظ ايدي المطور الاساسي \nDeveloper ID not saved\n')
end 
os.execute('lua FDFGERB.lua')
end
local Informationlua = io.open("Information.lua", 'w')
Informationlua:write([[
return {
Token = "]]..Redis:get(SshId.."Info:Redis:Token")..[[",
UserBot = "]]..Redis:get(SshId.."Info:Redis:Token:User")..[[",
UserSudo = "]]..Redis:get(SshId.."Info:Redis:User")..[[",
SudoId = ]]..Redis:get(SshId.."Info:Redis:User:ID")..[[
}
]])
Informationlua:close()
local FDFGERB = io.open("FDFGERB", 'w')
FDFGERB:write([[
cd $(cd $(dirname $0); pwd)
while(true) do
lua5.3 FDFGERB.lua
done
]])
FDFGERB:close()
Redis:del(SshId.."Info:Redis:User:ID");Redis:del(SshId.."Info:Redis:User");Redis:del(SshId.."Info:Redis:Token:User");Redis:del(SshId.."Info:Redis:Token")
os.execute('chmod +x FDFGERB;chmod +x Run;./Run')
end
Information = dofile('./Information.lua')
Sudo_Id = Information.SudoId
UserSudo = Information.UserSudo
Token = Information.Token
UserBot = Information.UserBot
FDFGERB = Token:match("(%d+)")
os.execute('sudo rm -fr .CallBack-Bot/'..FDFGERB)
LuaTele = luatele.set_config{api_id=1846213,api_hash='c545c613b78f18a30744970910124d53',session_name=FDFGERB,token=Token}
function var(value)
print(serpent.block(value, {comment=false}))   
end 
function chat_type(ChatId)
if ChatId then
local id = tostring(ChatId)
if id:match("-100(%d+)") then
Chat_Type = 'GroupBot' 
elseif id:match("^(%d+)") then
Chat_Type = 'UserBot' 
else
Chat_Type = 'GroupBot' 
end
end
return Chat_Type
end
function s_api(web) 
local info, res = https.request(web) 
local req = json:decode(info) 
if res ~= 200 then 
return false 
end 
if not req.ok then 
return false end 
return req 
end 
function sendText(chat_id, text, reply_to_message_id, markdown) 
send_api = "https://api.telegram.org/bot"..Token 
local url = send_api.."/sendMessage?chat_id=" .. chat_id .. "&text=" .. URL.escape(text) 
if reply_to_message_id ~= 0 then 
url = url .. "&reply_to_message_id=" .. reply_to_message_id 
end 
if markdown == "md" or markdown == "markdown" then 
url = url.."&parse_mode=Markdown" 
elseif markdown == "html" then 
url = url.."&parse_mode=HTML" 
end 
return s_api(url) 
end
function getbio(User)
local var = "لايوجد"
local url , res = https.request("https://api.telegram.org/bot"..Token.."/getchat?chat_id="..User);
data = json:decode(url)
if data.result.bio then
var = data.result.bio
end
return var
end
function The_ControllerAll(UserId)
ControllerAll = false
local ListSudos ={Sudo_Id,373906612}  
for k, v in pairs(ListSudos) do
if tonumber(UserId) == tonumber(v) then
ControllerAll = true
end
end
return ControllerAll
end
function Controllerbanall(ChatId,UserId)
Status = 0
DevelopersQ = Redis:sismember(FDFGERB.."FDFGERB:DevelopersQ:Groups",UserId) 
if UserId == 5271603990 then
Status = true
elseif UserId == 5128375412 then
Status = true
elseif UserId == Sudo_Id then  
Status = true
elseif UserId == FDFGERB then
Status = true
elseif DevelopersQ then
Status = true
else
Status = false
end
return Status
end
function Controller(ChatId,UserId)
Status = 0
Developers = Redis:sismember(FDFGERB.."FDFGERB:Developers:Groups",UserId) 
DevelopersQ = Redis:sismember(FDFGERB.."FDFGERB:DevelopersQ:Groups",UserId) 
TheBasics = Redis:sismember(FDFGERB.."FDFGERB:TheBasics:Group"..ChatId,UserId) 
Originators = Redis:sismember(FDFGERB.."FDFGERB:Originators:Group"..ChatId,UserId)
Managers = Redis:sismember(FDFGERB.."FDFGERB:Managers:Group"..ChatId,UserId)
Addictive = Redis:sismember(FDFGERB.."FDFGERB:Addictive:Group"..ChatId,UserId)
Distinguished = Redis:sismember(FDFGERB.."FDFGERB:Distinguished:Group"..ChatId,UserId)
StatusMember = LuaTele.getChatMember(ChatId,UserId).status.luatele
if UserId == 5128375412 then
Status = 'Master🎖'
elseif UserId == 5271603990 then
Status = ' Crown🎖'
elseif UserId == Sudo_Id then  
Status = 'Dev🎖️  '
elseif UserId == FDFGERB then
Status = 'البوت'
elseif DevelopersQ then
Status = 'Myth🎖'
elseif Developers then
Status = Redis:get(FDFGERB.."FDFGERB:Developer:Bot:Reply"..ChatId) or 'Myth'
elseif TheBasics then
Status = Redis:get(FDFGERB.."FDFGERB:President:Group:Reply"..ChatId) or 'المالك الاساسي'
elseif Originators then
Status = Redis:get(FDFGERB.."FDFGERB:Constructor:Group:Reply"..ChatId) or 'مالك'
elseif Managers then
Status = Redis:get(FDFGERB.."FDFGERB:Manager:Group:Reply"..ChatId) or 'المدير'
elseif Addictive then
Status = Redis:get(FDFGERB.."FDFGERB:Admin:Group:Reply"..ChatId) or 'الادمن'
elseif Distinguished then
Status = Redis:get(FDFGERB.."FDFGERB:Vip:Group:Reply"..ChatId) or 'المميز'
else
Status = Redis:get(FDFGERB.."FDFGERB:Mempar:Group:Reply"..ChatId) or 'العضو'
end  
return Status
end 
function Controller_Num(Num)
Status = 0
if tonumber(Num) == 1 then  
Status = 'Dev🎖️  '
elseif tonumber(Num) == 2 then  
Status = 'Myth🎖'
elseif tonumber(Num) == 3 then  
Status = 'Myth'
elseif tonumber(Num) == 4 then  
Status = 'المالك الاساسي'
elseif tonumber(Num) == 5 then  
Status = 'مالك'
elseif tonumber(Num) == 6 then  
Status = 'المدير'
elseif tonumber(Num) == 7 then  
Status = 'الادمن'
else
Status = 'المميز'
end  
return Status
end 
function GetAdminsSlahe(ChatId,UserId,user2,MsgId,t1,t2,t3,t4,t5,t6)
local GetMemberStatus = LuaTele.getChatMember(ChatId,user2).status
if GetMemberStatus.can_change_info then
change_info = '❬ نعم ❭' else change_info = '❬ لا ❭'
end
if GetMemberStatus.can_delete_messages then
delete_messages = '❬ نعم ❭' else delete_messages = '❬ لا ❭'
end
if GetMemberStatus.can_invite_users then
invite_users = '❬ نعم ❭' else invite_users = '❬ لا ❭'
end
if GetMemberStatus.can_pin_messages then
pin_messages = '❬ نعم ❭' else pin_messages = '❬ لا ❭'
end
if GetMemberStatus.can_restrict_members then
restrict_members = '❬ نعم ❭' else restrict_members = '❬ لا ❭'
end
if GetMemberStatus.can_promote_members then
promote = '❬ نعم ❭' else promote = '❬ لا ❭'
end
local reply_markupp = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- تغيير معلومات المجموعه : '..(t1 or change_info), data = UserId..'/groupNum1//'..user2}, 
},
{
{text = '- تثبيت الرسائل : '..(t2 or pin_messages), data = UserId..'/groupNum2//'..user2}, 
},
{
{text = '- حظر المستخدمين : '..(t3 or restrict_members), data = UserId..'/groupNum3//'..user2}, 
},
{
{text = '- دعوة المستخدمين : '..(t4 or invite_users), data = UserId..'/groupNum4//'..user2}, 
},
{
{text = '- حذف الرسائل : '..(t5 or delete_messages), data = UserId..'/groupNum5//'..user2}, 
},
{
{text = '- اضافة مشرفين : '..(t6 or promote), data = UserId..'/groupNum6//'..user2}, 
},
}
}
LuaTele.editMessageText(ChatId,MsgId,"• صلاحيات الادمن • ", 'md', false, false, reply_markupp)
end
function oger(Message)
year = math.floor(Message / 31536000)
byear = Message % 31536000 
month = math.floor(byear / 2592000)
bmonth = byear % 2592000 
day = math.floor(bmonth / 86400)
bday = bmonth % 86400 
hours = math.floor( bday / 3600)
bhours = bday % 3600 
minx = math.floor(bhours / 60)
sec = math.floor(bhours % 3600) % 60
return string.format("%02d:%02d", minx, sec)
end
function GetAdminsNum(ChatId,UserId)
local GetMemberStatus = LuaTele.getChatMember(ChatId,UserId).status
if GetMemberStatus.can_change_info then
change_info = 1 else change_info = 0
end
if GetMemberStatus.can_delete_messages then
delete_messages = 1 else delete_messages = 0
end
if GetMemberStatus.can_invite_users then
invite_users = 1 else invite_users = 0
end
if GetMemberStatus.can_pin_messages then
pin_messages = 1 else pin_messages = 0
end
if GetMemberStatus.can_restrict_members then
restrict_members = 1 else restrict_members = 0
end
if GetMemberStatus.can_promote_members then
promote = 1 else promote = 0
end
return{
promote = promote,
restrict_members = restrict_members,
invite_users = invite_users,
pin_messages = pin_messages,
delete_messages = delete_messages,
change_info = change_info
}
end
function GetSetieng(ChatId)
if Redis:get(FDFGERB.."FDFGERB:lockpin"..ChatId) then    
lock_pin = "نعم"
else 
lock_pin = "لا"    
end
if Redis:get(FDFGERB.."FDFGERB:Lock:tagservr"..ChatId) then    
lock_tagservr = "نعم"
else 
lock_tagservr = "لا"
end
if Redis:get(FDFGERB.."FDFGERB:Lock:text"..ChatId) then    
lock_text = "نعم"
else 
lock_text = "لا "    
end
if Redis:get(FDFGERB.."FDFGERB:Lock:AddMempar"..ChatId) == "kick" then
lock_add = "نعم"
else 
lock_add = "لا "    
end    
if Redis:get(FDFGERB.."FDFGERB:Lock:Join"..ChatId) == "kick" then
lock_join = "نعم"
else 
lock_join = "لا "    
end    
if Redis:get(FDFGERB.."FDFGERB:Lock:edit"..ChatId) then    
lock_edit = "نعم"
else 
lock_edit = "لا "    
end
if Redis:get(FDFGERB.."FDFGERB:Chek:Welcome"..ChatId) then
welcome = "نعم"
else 
welcome = "لا "    
end
if Redis:hget(FDFGERB.."FDFGERB:Spam:Group:User"..ChatId, "Spam:User") == "kick" then     
flood = "بالطرد "     
elseif Redis:hget(FDFGERB.."FDFGERB:Spam:Group:User"..ChatId,"Spam:User") == "keed" then     
flood = "بالتقيد "     
elseif Redis:hget(FDFGERB.."FDFGERB:Spam:Group:User"..ChatId,"Spam:User") == "mute" then     
flood = "بالكتم "           
elseif Redis:hget(FDFGERB.."FDFGERB:Spam:Group:User"..ChatId,"Spam:User") == "del" then     
flood = "نعم"
else     
flood = "لا "     
end
if Redis:get(FDFGERB.."FDFGERB:Lock:Photo"..ChatId) == "del" then
lock_photo = "نعم" 
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Photo"..ChatId) == "ked" then 
lock_photo = "بالتقيد "   
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Photo"..ChatId) == "ktm" then 
lock_photo = "بالكتم "    
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Photo"..ChatId) == "kick" then 
lock_photo = "بالطرد "   
else
lock_photo = "لا "   
end    
if Redis:get(FDFGERB.."FDFGERB:Lock:Contact"..ChatId) == "del" then
lock_phon = "نعم" 
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Contact"..ChatId) == "ked" then 
lock_phon = "بالتقيد "    
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Contact"..ChatId) == "ktm" then 
lock_phon = "بالكتم "    
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Contact"..ChatId) == "kick" then 
lock_phon = "بالطرد "    
else
lock_phon = "لا "    
end    
if Redis:get(FDFGERB.."FDFGERB:Lock:Link"..ChatId) == "del" then
lock_links = "نعم"
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Link"..ChatId) == "ked" then
lock_links = "بالتقيد "    
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Link"..ChatId) == "ktm" then
lock_links = "بالكتم "    
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Link"..ChatId) == "kick" then
lock_links = "بالطرد "    
else
lock_links = "لا "    
end
if Redis:get(FDFGERB.."FDFGERB:Lock:Cmd"..ChatId) == "del" then
lock_cmds = "نعم"
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Cmd"..ChatId) == "ked" then
lock_cmds = "بالتقيد "    
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Cmd"..ChatId) == "ktm" then
lock_cmds = "بالكتم "   
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Cmd"..ChatId) == "kick" then
lock_cmds = "بالطرد "    
else
lock_cmds = "لا "    
end
if Redis:get(FDFGERB.."FDFGERB:Lock:User:Name"..ChatId) == "del" then
lock_user = "نعم"
elseif Redis:get(FDFGERB.."FDFGERB:Lock:User:Name"..ChatId) == "ked" then
lock_user = "بالتقيد "    
elseif Redis:get(FDFGERB.."FDFGERB:Lock:User:Name"..ChatId) == "ktm" then
lock_user = "بالكتم "    
elseif Redis:get(FDFGERB.."FDFGERB:Lock:User:Name"..ChatId) == "kick" then
lock_user = "بالطرد "    
else
lock_user = "لا "    
end
if Redis:get(FDFGERB.."FDFGERB:Lock:hashtak"..ChatId) == "del" then
lock_hash = "نعم"
elseif Redis:get(FDFGERB.."FDFGERB:Lock:hashtak"..ChatId) == "ked" then 
lock_hash = "بالتقيد "    
elseif Redis:get(FDFGERB.."FDFGERB:Lock:hashtak"..ChatId) == "ktm" then 
lock_hash = "بالكتم "    
elseif Redis:get(FDFGERB.."FDFGERB:Lock:hashtak"..ChatId) == "kick" then 
lock_hash = "بالطرد "    
else
lock_hash = "لا "    
end
if Redis:get(FDFGERB.."FDFGERB:Lock:vico"..ChatId) == "del" then
lock_muse = "نعم"
elseif Redis:get(FDFGERB.."FDFGERB:Lock:vico"..ChatId) == "ked" then 
lock_muse = "بالتقيد "    
elseif Redis:get(FDFGERB.."FDFGERB:Lock:vico"..ChatId) == "ktm" then 
lock_muse = "بالكتم "    
elseif Redis:get(FDFGERB.."FDFGERB:Lock:vico"..ChatId) == "kick" then 
lock_muse = "بالطرد "    
else
lock_muse = "لا "    
end 
if Redis:get(FDFGERB.."FDFGERB:Lock:Video"..ChatId) == "del" then
lock_ved = "نعم"
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Video"..ChatId) == "ked" then 
lock_ved = "بالتقيد "    
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Video"..ChatId) == "ktm" then 
lock_ved = "بالكتم "    
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Video"..ChatId) == "kick" then 
lock_ved = "بالطرد "    
else
lock_ved = "لا "    
end
if Redis:get(FDFGERB.."FDFGERB:Lock:Animation"..ChatId) == "del" then
lock_gif = "نعم"
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Animation"..ChatId) == "ked" then 
lock_gif = "بالتقيد "    
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Animation"..ChatId) == "ktm" then 
lock_gif = "بالكتم "    
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Animation"..ChatId) == "kick" then 
lock_gif = "بالطرد "    
else
lock_gif = "لا "    
end
if Redis:get(FDFGERB.."FDFGERB:Lock:Sticker"..ChatId) == "del" then
lock_ste = "نعم"
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Sticker"..ChatId) == "ked" then 
lock_ste = "بالتقيد "    
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Sticker"..ChatId) == "ktm" then 
lock_ste = "بالكتم "    
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Sticker"..ChatId) == "kick" then 
lock_ste = "بالطرد "    
else
lock_ste = "لا "    
end
if Redis:get(FDFGERB.."FDFGERB:Lock:geam"..ChatId) == "del" then
lock_geam = "نعم"
elseif Redis:get(FDFGERB.."FDFGERB:Lock:geam"..ChatId) == "ked" then 
lock_geam = "بالتقيد "    
elseif Redis:get(FDFGERB.."FDFGERB:Lock:geam"..ChatId) == "ktm" then 
lock_geam = "بالكتم "    
elseif Redis:get(FDFGERB.."FDFGERB:Lock:geam"..ChatId) == "kick" then 
lock_geam = "بالطرد "    
else
lock_geam = "لا "    
end    
if Redis:get(FDFGERB.."FDFGERB:Lock:vico"..ChatId) == "del" then
lock_vico = "نعم"
elseif Redis:get(FDFGERB.."FDFGERB:Lock:vico"..ChatId) == "ked" then 
lock_vico = "بالتقيد "    
elseif Redis:get(FDFGERB.."FDFGERB:Lock:vico"..ChatId) == "ktm" then 
lock_vico = "بالكتم "    
elseif Redis:get(FDFGERB.."FDFGERB:Lock:vico"..ChatId) == "kick" then 
lock_vico = "بالطرد "    
else
lock_vico = "لا "    
end    
if Redis:get(FDFGERB.."FDFGERB:Lock:Keyboard"..ChatId) == "del" then
lock_inlin = "نعم"
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Keyboard"..ChatId) == "ked" then 
lock_inlin = "بالتقيد "
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Keyboard"..ChatId) == "ktm" then 
lock_inlin = "بالكتم "    
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Keyboard"..ChatId) == "kick" then 
lock_inlin = "بالطرد "
else
lock_inlin = "لا "
end
if Redis:get(FDFGERB.."FDFGERB:Lock:forward"..ChatId) == "del" then
lock_fwd = "نعم"
elseif Redis:get(FDFGERB.."FDFGERB:Lock:forward"..ChatId) == "ked" then 
lock_fwd = "بالتقيد "    
elseif Redis:get(FDFGERB.."FDFGERB:Lock:forward"..ChatId) == "ktm" then 
lock_fwd = "بالكتم "    
elseif Redis:get(FDFGERB.."FDFGERB:Lock:forward"..ChatId) == "kick" then 
lock_fwd = "بالطرد "    
else
lock_fwd = "لا "    
end    
if Redis:get(FDFGERB.."FDFGERB:Lock:Document"..ChatId) == "del" then
lock_file = "نعم"
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Document"..ChatId) == "ked" then 
lock_file = "بالتقيد "    
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Document"..ChatId) == "ktm" then 
lock_file = "بالكتم "    
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Document"..ChatId) == "kick" then 
lock_file = "بالطرد "    
else
lock_file = "لا "    
end    
if Redis:get(FDFGERB.."FDFGERB:Lock:Unsupported"..ChatId) == "del" then
lock_self = "نعم"
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Unsupported"..ChatId) == "ked" then 
lock_self = "بالتقيد "    
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Unsupported"..ChatId) == "ktm" then 
lock_self = "بالكتم "    
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Unsupported"..ChatId) == "kick" then 
lock_self = "بالطرد "    
else
lock_self = "لا "    
end
if Redis:get(FDFGERB.."FDFGERB:Lock:Bot:kick"..ChatId) == "del" then
lock_bots = "نعم"
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Bot:kick"..ChatId) == "ked" then
lock_bots = "بالتقيد "   
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Bot:kick"..ChatId) == "kick" then
lock_bots = "بالطرد "    
else
lock_bots = "لا "    
end
if Redis:get(FDFGERB.."FDFGERB:Lock:Markdaun"..ChatId) == "del" then
lock_mark = "نعم"
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Markdaun"..ChatId) == "ked" then 
lock_mark = "بالتقيد "    
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Markdaun"..ChatId) == "ktm" then 
lock_mark = "بالكتم "    
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Markdaun"..ChatId) == "kick" then 
lock_mark = "بالطرد "    
else
lock_mark = "لا "    
end
if Redis:get(FDFGERB.."FDFGERB:Lock:Spam"..ChatId) == "del" then    
lock_spam = "نعم"
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Spam"..ChatId) == "ked" then 
lock_spam = "بالتقيد "    
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Spam"..ChatId) == "ktm" then 
lock_spam = "بالكتم "    
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Spam"..ChatId) == "kick" then 
lock_spam = "بالطرد "    
else
lock_spam = "لا "    
end        
return{
lock_pin = lock_pin,
lock_tagservr = lock_tagservr,
lock_text = lock_text,
lock_add = lock_add,
lock_join = lock_join,
lock_edit = lock_edit,
flood = flood,
lock_photo = lock_photo,
lock_phon = lock_phon,
lock_links = lock_links,
lock_cmds = lock_cmds,
lock_mark = lock_mark,
lock_user = lock_user,
lock_hash = lock_hash,
lock_muse = lock_muse,
lock_ved = lock_ved,
lock_gif = lock_gif,
lock_ste = lock_ste,
lock_geam = lock_geam,
lock_vico = lock_vico,
lock_inlin = lock_inlin,
lock_fwd = lock_fwd,
lock_file = lock_file,
lock_self = lock_self,
lock_bots = lock_bots,
lock_spam = lock_spam
}
end
function Total_message(Message)  
local MsgText = ''  
if tonumber(Message) < 100 then 
MsgText = 'تفاعل محلو 😤' 
elseif tonumber(Message) < 200 then 
MsgText = 'تفاعلك ضعيف ليش'
elseif tonumber(Message) < 400 then 
MsgText = 'عفيه اتفاعل 😽' 
elseif tonumber(Message) < 700 then 
MsgText = 'شكد تحجي😒' 
elseif tonumber(Message) < 1200 then 
MsgText = 'ملك التفاعل 😼' 
elseif tonumber(Message) < 2000 then 
MsgText = 'موش تفاعل غنبله' 
elseif tonumber(Message) < 3500 then 
MsgText = 'اساس لتفاعل ياب'  
elseif tonumber(Message) < 4000 then 
MsgText = 'عوف لجواهر وتفاعل بزودك' 
elseif tonumber(Message) < 4500 then 
MsgText = 'قمة التفاعل' 
elseif tonumber(Message) < 5500 then 
MsgText = 'شهلتفاعل استمر يكيك' 
elseif tonumber(Message) < 7000 then 
MsgText = 'غنبله وربي 🌟' 
elseif tonumber(Message) < 9500 then 
MsgText = 'حلغوم مال تفاعل' 
elseif tonumber(Message) < 10000000000 then 
MsgText = 'تفاعل نار وشرار'  
end 
return MsgText 
end

function Getpermissions(ChatId)
local Get_Chat = LuaTele.getChat(ChatId)
if Get_Chat.permissions.can_add_web_page_previews then
web = true else web = false
end
if Get_Chat.permissions.can_change_info then
info = true else info = false
end
if Get_Chat.permissions.can_invite_users then
invite = true else invite = false
end
if Get_Chat.permissions.can_pin_messages then
pin = true else pin = false
end
if Get_Chat.permissions.can_send_media_messages then
media = true else media = false
end
if Get_Chat.permissions.can_send_messages then
messges = true else messges = false
end
if Get_Chat.permissions.can_send_other_messages then
other = true else other = false
end
if Get_Chat.permissions.can_send_polls then
polls = true else polls = false
end

return{
web = web,
info = info,
invite = invite,
pin = pin,
media = media,
messges = messges,
other = other,
polls = polls
}
end
function Get_permissions(ChatId,UserId,MsgId)
local Get_Chat = LuaTele.getChat(ChatId)
if Get_Chat.permissions.can_add_web_page_previews then
web = '❬ نعم ❭' else web = '❬ لا ❭'
end
if Get_Chat.permissions.can_change_info then
info = '❬ نعم ❭' else info = '❬ لا ❭'
end
if Get_Chat.permissions.can_invite_users then
invite = '❬ نعم ❭' else invite = '❬ لا ❭'
end
if Get_Chat.permissions.can_pin_messages then
pin = '❬ نعم ❭' else pin = '❬ لا ❭'
end
if Get_Chat.permissions.can_send_media_messages then
media = '❬ نعم ❭' else media = '❬ لا ❭'
end
if Get_Chat.permissions.can_send_messages then
messges = '❬ نعم ❭' else messges = '❬ لا ❭'
end
if Get_Chat.permissions.can_send_other_messages then
other = '❬ نعم ❭' else other = '❬ لا ❭'
end
if Get_Chat.permissions.can_send_polls then
polls = '❬ نعم ❭' else polls = '❬ لا ❭'
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- ارسال الويب : '..web, data = UserId..'/web'}, 
},
{
{text = '- تغيير معلومات المجموعه : '..info, data = UserId.. '/info'}, 
},
{
{text = '- اضافه مستخدمين : '..invite, data = UserId.. '/invite'}, 
},
{
{text = '- تثبيت الرسائل : '..pin, data = UserId.. '/pin'}, 
},
{
{text = '- ارسال الميديا : '..media, data = UserId.. '/media'}, 
},
{
{text = '- ارسال الرسائل : .'..messges, data = UserId.. '/messges'}, 
},
{
{text = '- اضافه البوتات : '..other, data = UserId.. '/other'}, 
},
{
{text = '- ارسال استفتاء : '..polls, data = UserId.. '/polls'}, 
},
{
{text = '- اخفاء الامر ', data =IdUser..'/'.. '/delAmr'}
},
}
}
LuaTele.editMessageText(ChatId,MsgId,"• صلاحيات المجموعه • ", 'md', false, false, reply_markup)
end
function Statusrestricted(ChatId,UserId)
return{
kkytmAll = Redis:sismember(FDFGERB.."FDFGERB:kkytmAll:Groups",UserId) ,
BanAll = Redis:sismember(FDFGERB.."FDFGERB:BanAll:Groups",UserId) ,
BanGroup = Redis:sismember(FDFGERB.."FDFGERB:BanGroup:Group"..ChatId,UserId) ,
SilentGroup = Redis:sismember(FDFGERB.."FDFGERB:SilentGroup:Group"..ChatId,UserId)
}
end
function Reply_Status(UserId,TextMsg)
local UserInfo = LuaTele.getUser(UserId)
for Name_User in string.gmatch(UserInfo.first_name, "[^%s]+" ) do
UserInfo.first_name = Name_User
break
end
if UserInfo.username then
UserInfousername = '[' ..UserInfo.first_name..'](t.me/'..UserInfo.username..')'
else
UserInfousername = '[' ..UserInfo.first_name..'](tg://user?id='..UserId..')'
end
return {
Lock     = "\n" ..TextMsg..' \n• بواسطة ⇠ 「 '..UserInfousername..'  」',
unLock   = "\n" ..TextMsg..' \n• بواسطة ⇠ 「 '..UserInfousername..'  」',
lockKtm  = "\n" ..TextMsg..' \n• بواسطة ⇠ 「 '..UserInfousername..'  」',
lockKid  = "\n" ..TextMsg..' \n• بواسطة ⇠ 「 '..UserInfousername..'  」',
lockKick = "\n" ..TextMsg..' \n• بواسطة ⇠ 「 '..UserInfousername..'  」',
Reply    = "\n" ..TextMsg..' \n• المستخدم ⇠ 「 '..UserInfousername..'  」',
}
end
function StatusCanOrNotCan(ChatId,UserId)
Status = nil
DevelopersQ = Redis:sismember(FDFGERB.."FDFGERB:DevelopersQ:Groups",UserId) 
Developers = Redis:sismember(FDFGERB.."FDFGERB:Developers:Groups",UserId) 
TheBasics = Redis:sismember(FDFGERB.."FDFGERB:TheBasics:Group"..ChatId,UserId) 
Originators = Redis:sismember(FDFGERB.."FDFGERB:Originators:Group"..ChatId,UserId)
Managers = Redis:sismember(FDFGERB.."FDFGERB:Managers:Group"..ChatId,UserId)
Addictive = Redis:sismember(FDFGERB.."FDFGERB:Addictive:Group"..ChatId,UserId)
Distinguished = Redis:sismember(FDFGERB.."FDFGERB:Distinguished:Group"..ChatId,UserId)
StatusMember = LuaTele.getChatMember(ChatId,UserId).status.luatele
if UserId == 5271603990 then
Status = true
elseif UserId == 5128375412 then
Status = true
elseif UserId == Sudo_Id then  
Status = true
elseif UserId == FDFGERB then
Status = true
elseif DevelopersQ then
Status = true
elseif Developers then
Status = true
elseif TheBasics then
Status = true
elseif Originators then
Status = true
elseif Managers then
Status = true
elseif Addictive then
Status = true
elseif StatusMember == "chatMemberStatusCreator" then
Status = true
elseif StatusMember == "chatMemberStatusAdministrator" then
Status = true
else
Status = false
end  
return Status
end 
function StatusSilent(ChatId,UserId,UserId_Info)
Status = nil
DevelopersQ = Redis:sismember(FDFGERB.."FDFGERB:DevelopersQ:Groups",UserId) 
Developers = Redis:sismember(FDFGERB.."FDFGERB:Developers:Groups",UserId) 
TheBasics = Redis:sismember(FDFGERB.."FDFGERB:TheBasics:Group"..ChatId,UserId) 
Originators = Redis:sismember(FDFGERB.."FDFGERB:Originators:Group"..ChatId,UserId)
Managers = Redis:sismember(FDFGERB.."FDFGERB:Managers:Group"..ChatId,UserId)
Addictive = Redis:sismember(FDFGERB.."FDFGERB:Addictive:Group"..ChatId,UserId)
channelis = Redis:sismember(FDFGERB.."FDFGERB:Managers:Group"..ChatId,UserId)
Distinguished = Redis:sismember(FDFGERB.."FDFGERB:Distinguished:Group"..ChatId,UserId)
StatusMember = LuaTele.getChatMember(ChatId,UserId).status.luatele
if UserId == 5128375412 then
Status = true
elseif UserId == 5271603990 then
Status = true
elseif UserId == Sudo_Id then    
Status = true
elseif UserId == FDFGERB then
Status = true
elseif DevelopersQ then
Status = true
elseif Developers then
Status = true
elseif TheBasics then
Status = true
elseif Originators then
Status = true
elseif Managers then
Status = true
elseif Addictive then
Status = true
elseif StatusMember == "chatMemberStatusCreator" then
Status = true
else
Status = false
end  
return Status
end 
function GetInfoBot(msg)
local GetMemberStatus = LuaTele.getChatMember(msg.chat_id,FDFGERB).status
if GetMemberStatus.can_change_info then
change_info = true else change_info = false
end
if GetMemberStatus.can_delete_messages then
delete_messages = true else delete_messages = false
end
if GetMemberStatus.can_invite_users then
invite_users = true else invite_users = false
end
if GetMemberStatus.can_pin_messages then
pin_messages = true else pin_messages = false
end
if GetMemberStatus.can_restrict_members then
restrict_members = true else restrict_members = false
end
if GetMemberStatus.can_promote_members then
promote = true else promote = false
end
return{
SetAdmin = promote,
BanUser = restrict_members,
Invite = invite_users,
PinMsg = pin_messages,
DelMsg = delete_messages,
Info = change_info
}
end
function download(url,name)
if not name then
name = url:match('([^/]+)$')
end
if string.find(url,'https') then
data,res = https.request(url)
elseif string.find(url,'http') then
data,res = http.request(url)
else
return 'The link format is incorrect.'
end
if res ~= 200 then
return 'check url , error code : '..res
else
file = io.open(name,'wb')
file:write(data)
file:close()
print('Downloaded :> '..name)
return './'..name
end
end
local function Info_Video(x)
local f=io.popen(x)
if f then
local s=f:read"a"
f:close()
if s == 'a' then
end
return s
end
end
function ChannelJoin(msg)
JoinChannel = true
local Channel = Redis:get(FDFGERB..'FDFGERB:Channel:Join')
if Channel then
local url , res = https.request('https://api.telegram.org/bot'..Token..'/getchatmember?chat_id=@'..Channel..'&user_id='..msg.sender_id.user_id)
local ChannelJoin = JSON.decode(url)
if ChannelJoin.result.status == "left" then
JoinChannel = false
end
end
return JoinChannel
end
function File_Bot_Run(msg,data)  
local msg_chat_id = msg.chat_id
local msg_reply_id = msg.reply_to_message_id
local msg_user_send_id = msg.sender_id.user_id
local msg_id = msg.id
if data.sender_id.luatele == "messageSenderChat" and Redis:get(FDFGERB.."Lock:channell"..msg_chat_id) and not msg.channelis then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
return false
end
Redis:incr(FDFGERB..'FDFGERB:Num:Message:User'..msg.chat_id..':'..msg.sender_id.user_id) 
if msg.date and msg.date < tonumber(os.time() - 15) then
print("->> Old Message End <<-")
return false
end
if data.content.text then
text = data.content.text.text
else 
text = nil
end
if tonumber(msg.sender_id.user_id) == tonumber(FDFGERB) then
print('This is reply for Bot')
return false
end
if Statusrestricted(msg.chat_id,msg.sender_id.user_id).BanAll == true then
return LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id}),LuaTele.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
elseif Statusrestricted(msg.chat_id,msg.sender_id.user_id).kkytmAll == true then 
return LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Statusrestricted(msg.chat_id,msg.sender_id.user_id).BanGroup == true then
return LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id}),LuaTele.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
elseif Statusrestricted(msg.chat_id,msg.sender_id.user_id).SilentGroup == true then
return LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
end
if tonumber(msg.sender_id.user_id) == 5271603990 then
msg.Name_Controller = ' Crown🎖 '
msg.The_Controller = 1
elseif tonumber(msg.sender_id.user_id) == 5128375412 then
msg.Name_Controller = 'Master🎖'
msg.The_Controller = 1
elseif The_ControllerAll(msg.sender_id.user_id) == true then  
msg.The_Controller = 1
msg.Name_Controller = 'Dev🎖️  '
elseif Redis:sismember(FDFGERB.."FDFGERB:DevelopersQ:Groups",msg.sender_id.user_id) == true then
msg.The_Controller = 2
msg.Name_Controller = 'Myth🎖'
elseif Redis:sismember(FDFGERB.."FDFGERB:Developers:Groups",msg.sender_id.user_id) == true then
msg.The_Controller = 3
msg.Name_Controller = Redis:get(FDFGERB.."FDFGERB:Developer:Bot:Reply"..msg.chat_id) or 'Myth'
elseif Redis:sismember(FDFGERB.."FDFGERB:TheBasics:Group"..msg.chat_id,msg.sender_id.user_id) == true then
msg.The_Controller = 4
msg.Name_Controller = Redis:get(FDFGERB.."FDFGERB:President:Group:Reply"..msg.chat_id) or 'المالك الاساسي'
elseif Redis:sismember(FDFGERB.."FDFGERB:Originators:Group"..msg.chat_id,msg.sender_id.user_id) == true then
msg.The_Controller = 5
msg.Name_Controller = Redis:get(FDFGERB.."FDFGERB:Constructor:Group:Reply"..msg.chat_id) or 'مالك '
elseif Redis:sismember(FDFGERB.."FDFGERB:Managers:Group"..msg.chat_id,msg.sender_id.user_id) == true then
msg.The_Controller = 6
msg.Name_Controller = Redis:get(FDFGERB.."FDFGERB:Manager:Group:Reply"..msg.chat_id) or 'المدير '
elseif Redis:sismember(FDFGERB.."FDFGERB:Addictive:Group"..msg.chat_id,msg.sender_id.user_id) == true then
msg.The_Controller = 7
msg.Name_Controller = Redis:get(FDFGERB.."FDFGERB:Admin:Group:Reply"..msg.chat_id) or 'الادمن '
elseif Redis:sismember(FDFGERB.."FDFGERB:Distinguished:Group"..msg.chat_id,msg.sender_id.user_id) == true then
msg.The_Controller = 8
msg.Name_Controller = Redis:get(FDFGERB.."FDFGERB:Vip:Group:Reply"..msg.chat_id) or 'المميز '
elseif tonumber(msg.sender_id.user_id) == tonumber(FDFGERB) then
msg.The_Controller = 9
else
msg.The_Controller = 10
msg.Name_Controller = Redis:get(FDFGERB.."FDFGERB:Mempar:Group:Reply"..msg.chat_id) or 'العضو '
end  
if msg.The_Controller == 1 then  
msg.ControllerBot = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 then
msg.DevelopersQ = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 or msg.The_Controller == 3 then
msg.Developers = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 4 or msg.The_Controller == 9 then
msg.TheBasics = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 4 or msg.The_Controller == 5 or msg.The_Controller == 9 then
msg.Originators = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 4 or msg.The_Controller == 5 or msg.The_Controller == 6 or msg.The_Controller == 9 then
msg.Managers = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 4 or msg.The_Controller == 5 or msg.The_Controller == 6 or msg.The_Controller == 7 or msg.The_Controller == 9 then
msg.Addictive = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 4 or msg.The_Controller == 5 or msg.The_Controller == 6 or msg.The_Controller == 7 or msg.The_Controller == 8 or msg.The_Controller == 9 then
msg.Distinguished = true
end
if Redis:get(FDFGERB.."FDFGERB:Lock:text"..msg_chat_id) and not msg.Distinguished then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
return false
end 
if msg.content.luatele == "messageChatJoinByLink" then
if Redis:get(FDFGERB.."FDFGERB:Status:Welcome"..msg_chat_id) then
local UserInfo = LuaTele.getUser(msg.sender_id.user_id)
local Get_Chat = LuaTele.getChat(msg_chat_id)
local date =  "\n ساعة دخول : "..os.date("%Y/%m/%d")
local time = "\n وقت دخول : "..os.date("%I:%M%p")
local Welcome = Redis:get(FDFGERB.."FDFGERB:Welcome:Group"..msg_chat_id)
if Welcome then 
if UserInfo.username then
UserInfousername = '@'..UserInfo.username
else
UserInfousername = 'لا يوجد '
end
Welcome = Welcome:gsub('{الاسم}',UserInfo.first_name) 
Welcome = Welcome:gsub('{البايو}',Bio)
Welcome = Welcome:gsub('{القوانين}',Redis:get(FDFGERB.."FDFGERB:Group:Rules"..msg_chat_id) or "• اهلين عيني القوانين كالاتي: \n• ممنوع نشر الروابط \n• ممنوع التكلم او نشر صور اباحيه \n• ممنوع  اعاده توجيه\n• ممنوع العنصرية بكل انواعها \n• الرجاء احترام المدراء والادمنيه \n ")
Welcome = Welcome:gsub('{الرتبه}',RinkBot)
Welcome = Welcome:gsub('{التاريخ}',os.date('%d/%m/%Y'))
Welcome = Welcome:gsub('{الوقت}',os.date('%I:%M:%S'))
Welcome = Welcome:gsub('{اليوزر}',UserInfousername) 
Welcome = Welcome:gsub('{المجموعه}',Get_Chat.title) 
return LuaTele.sendText(msg_chat_id,msg_id,Welcome,"md")  
else
return LuaTele.sendText(msg_chat_id,msg_id,'- منور \nاسمك : '..UserInfo.first_name..'\nيوزرك : '..UserInfousername..'\n'..time..'\n'..date..'',"md")  
end
end
end
if not msg.Distinguished and msg.content.luatele ~= "messageChatAddMembers" and Redis:hget(FDFGERB.."FDFGERB:Spam:Group:User"..msg_chat_id,"Spam:User") then 
if tonumber(msg.sender_id.user_id) == tonumber(FDFGERB) then
return false
end
local floods = Redis:hget(FDFGERB.."FDFGERB:Spam:Group:User"..msg_chat_id,"Spam:User") or "nil"
local Num_Msg_Max = Redis:hget(FDFGERB.."FDFGERB:Spam:Group:User"..msg_chat_id,"Num:Spam") or 5
local post_count = tonumber(Redis:get(FDFGERB.."FDFGERB:Spam:Cont"..msg.sender_id.user_id..":"..msg_chat_id) or 0)
if post_count >= tonumber(Redis:hget(FDFGERB.."FDFGERB:Spam:Group:User"..msg_chat_id,"Num:Spam") or 5) then 
local type = Redis:hget(FDFGERB.."FDFGERB:Spam:Group:User"..msg_chat_id,"Spam:User") 
if type == "kick" then 
return LuaTele.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0), LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• قام بالتكرار في المجموعه وتم طرده").Reply,"md",true)
end
if type == "del" then 
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
end
if type == "keed" then
return LuaTele.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0}), LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• قام بالتكرار في المجموعه وتم تقييده").Reply,"md",true)  
end
if type == "mute" then
Redis:sadd(FDFGERB.."FDFGERB:SilentGroup:Group"..msg.chat_id,msg.sender_id.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• قام بالتكرار في المجموعه وتم كتمه").Reply,"md",true)  
end
end
Redis:setex(FDFGERB.."FDFGERB:Spam:Cont"..msg.sender_id.user_id..":"..msg_chat_id, tonumber(5), post_count+1) 
local edit_id = data.text_ or "nil"  
Num_Msg_Max = 5
if Redis:hget(FDFGERB.."FDFGERB:Spam:Group:User"..msg_chat_id,"Num:Spam") then
Num_Msg_Max = Redis:hget(FDFGERB.."FDFGERB:Spam:Group:User"..msg_chat_id,"Num:Spam") 
end
end 
if text and not msg.Distinguished then
local _nl, ctrl_ = string.gsub(text, "%c", "")  
local _nl, real_ = string.gsub(text, "%d", "")   
sens = 400  
if Redis:get(FDFGERB.."FDFGERB:Lock:Spam"..msg.chat_id) == "del" and string.len(text) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Spam"..msg.chat_id) == "ked" and string.len(text) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Spam"..msg.chat_id) == "kick" and string.len(text) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Redis:get(FDFGERB.."FDFGERB:Lock:Spam"..msg.chat_id) == "ktm" and string.len(text) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
Redis:sadd(FDFGERB.."FDFGERB:SilentGroup:Group"..msg.chat_id,msg.sender_id.user_id) 
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
end
end
if text and Redis:sismember("banserver",msg.sender_id.user_id) then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
if text and Redis:get(FDFGERB..'FDFGERB:lock:Fshar'..msg.chat_id) and not msg.TheBasics then
list = {"كسي","كسمك","كسختك","عير","طيزختك","طيز","مص","زبي","ديد","انيك","انيكك","عير","مصي","مصزبي"}
for k,v in pairs(list) do
if string.find(text,v) ~= nil then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
return false
end
end
end
if text and Redis:get(FDFGERB..'FDFGERB:lock:Persian'..msg.chat_id) and not msg.TheBasics then
list = {"که","پی","خسته","برم","راحتی","بیام","بپوشم","كرمه","چه","ڬ","ڿ","ڀ","ڎ","ژ","ڟ","ݜ","ڸ","پ","۴","زدن","دخترا","دیوث","مک","زدن"}
for k,v in pairs(list) do
if string.find(text,v) ~= nil then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
return false
end
end
end
if msg.forward_info and not msg.Distinguished then -- التوجيه
local Fwd_Group = Redis:get(FDFGERB.."FDFGERB:Lock:forward"..msg_chat_id)
if Fwd_Group == "del" then 
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Fwd_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Fwd_Group == "ktm" then
Redis:sadd(FDFGERB.."FDFGERB:SilentGroup:Group"..msg.chat_id,msg.sender_id.user_id) 
elseif Fwd_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
print('This is forward')
return false
end 

if msg.reply_markup and msg.reply_markup.luatele == "replyMarkupInlineKeyboard" then
if not msg.Distinguished then  -- الكيبورد
local Keyboard_Group = Redis:get(FDFGERB.."FDFGERB:Lock:Keyboard"..msg_chat_id)
if Keyboard_Group == "del" then
var(LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id}))
elseif Keyboard_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Keyboard_Group == "ktm" then
Redis:sadd(FDFGERB.."FDFGERB:SilentGroup:Group"..msg.chat_id,msg.sender_id.user_id) 
elseif Keyboard_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
end
print('This is reply_markup')
end 

if msg.content.location and not msg.Distinguished then  -- الموقع
if location then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
end
print('This is location')
end 

if msg.content.entities and msg..content.entities[0] and msg.content.entities[0].type.luatele == "textEntityTypeUrl" and not msg.Distinguished then  -- الماركداون
local Markduan_Gtoup = Redis:get(FDFGERB.."FDFGERB:Lock:Markdaun"..msg_chat_id)
if Markduan_Gtoup == "del" then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Markduan_Gtoup == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Markduan_Gtoup == "ktm" then
Redis:sadd(FDFGERB.."FDFGERB:SilentGroup:Group"..msg.chat_id,msg.sender_id.user_id) 
elseif Markduan_Gtoup == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
print('This is textEntityTypeUrl')
end 

if msg.content.game and not msg.Distinguished then  -- الالعاب
local Games_Group = Redis:get(FDFGERB.."FDFGERB:Lock:geam"..msg_chat_id)
if Games_Group == "del" then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Games_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Games_Group == "ktm" then
Redis:sadd(FDFGERB.."FDFGERB:SilentGroup:Group"..msg.chat_id,msg.sender_id.user_id) 
elseif Games_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
print('This is games')
end 
if msg.content.luatele == "messagePinMessage" then -- رساله التثبيت
local Pin_Msg = Redis:get(FDFGERB.."FDFGERB:lockpin"..msg_chat_id)
if Pin_Msg and not msg.Managers then
if Pin_Msg:match("(%d+)") then 
local PinMsg = LuaTele.pinChatMessage(msg_chat_id,Pin_Msg,true)
if PinMsg.luatele~= "ok" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• لا استطيع تثبيت الرسائل ليست لديه صلاحيه","md",true)
end
end
local UnPin = LuaTele.unpinChatMessage(msg_chat_id) 
if UnPin.luatele ~= "ok" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• لا استطيع الغاء تثبيت الرسائل ليست لديه صلاحيه","md",true)
end
return LuaTele.sendText(msg_chat_id,msg_id,"\n• التثبيت معطل من قبل المدراء ","md",true)
end
print('This is message Pin')
end 

if msg.content.luatele == "messageChatJoinByLink" then
if Redis:get(FDFGERB.."FDFGERB:Lock:Join"..msg.chat_id) == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
return false
end
end
if msg.content.luatele == "messagePinMessage" then -- رساله التثبيت
local Pin_Msg = Redis:get(FDFGERB.."lockpin"..msg_chat_id)
if Pin_Msg and not msg.Manger then
if Pin_Msg:match("(%d+)") then 
local PinMsg = LuaTele.pinChatMessage(msg_chat_id,Pin_Msg,true)
if PinMsg.luatele~= "ok" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n⋆ لا استطيع تثبيت الرسائل ليست لديه صلاحيه","md",true)
end
end
local UnPin = LuaTele.unpinChatMessage(msg_chat_id) 
if UnPin.luatele ~= "ok" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n⋆ لا استطيع الغاء تثبيت الرسائل ليست لديه صلاحيه","md",true)
end
return LuaTele.sendText(msg_chat_id,msg_id,"\n⋆ التثبيت معطل من قبل المدراء ","md",true)
end
print('This is message Pin')
end 
if msg.content.luatele == "messageChatJoinByLink" then
if Redis:get(FDFGERB.."FDFGERB:Lock:Join"..msg.chat_id) == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
return false
end
end
if msg.content.luatele == "messageChatAddMembers" then -- اضافه اشخاص
print('This is Add Membeers ')
Redis:incr(FDFGERB.."FDFGERB:Num:Add:Memp"..msg_chat_id..":"..msg.sender_id.user_id) 
local AddMembrs = Redis:get(FDFGERB.."FDFGERB:Lock:AddMempar"..msg_chat_id) 
local Lock_Bots = Redis:get(FDFGERB.."FDFGERB:Lock:Bot:kick"..msg_chat_id)
for k,v in pairs(msg.content.member_user_ids) do
local Info_User = LuaTele.getUser(v) 
print(v)
if v == tonumber(FDFGERB) then
local loner = (Redis:get(FDFGERB.."FDFGERB:Name:Bot") or "اريك")
photo = LuaTele.getUserProfilePhotos(FDFGERB)
local TextBot = '• انا بوت اسمي '..loner..'\n• وظيفتي حمايه المجموعة من السبام والتفليش الخ..\n• لتفعيل البوت البوت اكتب تفعيل\n'
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '- Source loner', url = 't.me/LDD7D'},}}
local rep = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id="..msg.chat_id.."&reply_to_message_id="..rep.."&photo="..photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id.."&caption="..URL.escape(TextBot).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
Redis:set(FDFGERB.."Who:Added:Me"..msg_chat_id..":"..v,msg.sender_id.user_id)
if Info_User.type.luatele == "userTypeBot" then
if Lock_Bots == "del" and not msg.ControllerBot then
LuaTele.setChatMemberStatus(msg.chat_id,v,'banned',0)
elseif Lock_Bots == "kick" and not msg.ControllerBot then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
LuaTele.setChatMemberStatus(msg.chat_id,v,'banned',0)
end
elseif Info_User.type.luatele == "userTypeRegular" then
Redis:incr(FDFGERB.."FDFGERB:Num:Add:Memp"..msg.chat_id..":"..msg.sender_id.user_id) 
if AddMembrs == "kick" and not msg.ControllerBot then
LuaTele.setChatMemberStatus(msg.chat_id,v,'banned',0)
end
end
end
end 

if msg then
local UserInfo = LuaTele.getUser(msg.sender_id.user_id)
if UserInfo.first_name then
NameLUser = UserInfo.first_name
NameLUser = NameLUser:gsub("]","")
NameLUser = NameLUser:gsub("[[]","")
local data = LuaTele.getChat(msg.chat_id)
Redis:set(FDFGERB..':toob:Name:'..msg.sender_id.user_id,NameLUser)
end
end
if msg.content.luatele == "messageContact" and not msg.Distinguished then  -- الجهات
local Contact_Group = Redis:get(FDFGERB.."FDFGERB:Lock:Contact"..msg_chat_id)
if Contact_Group == "del" then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Contact_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Contact_Group == "ktm" then
Redis:sadd(FDFGERB.."FDFGERB:SilentGroup:Group"..msg.chat_id,msg.sender_id.user_id) 
elseif Contact_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
print('This is Contact')
end 

if msg.content.luatele == "messageVideoNote" and not msg.Distinguished then  -- بصمه الفيديو
local Videonote_Group = Redis:get(FDFGERB.."FDFGERB:Lock:Unsupported"..msg_chat_id)
if Videonote_Group == "del" then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Videonote_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Videonote_Group == "ktm" then
Redis:sadd(FDFGERB.."FDFGERB:SilentGroup:Group"..msg.chat_id,msg.sender_id.user_id) 
elseif Videonote_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
print('This is video Note')
end 

if msg.content.luatele == "messageDocument" and not msg.Distinguished then  -- الملفات
local Document_Group = Redis:get(FDFGERB.."FDFGERB:Lock:Document"..msg_chat_id)
if Document_Group == "del" then  
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Document_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Document_Group == "ktm" then
Redis:sadd(FDFGERB.."FDFGERB:SilentGroup:Group"..msg.chat_id,msg.sender_id.user_id) 
elseif Document_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
print('This is Document')
end 

if msg.content.luatele == "messageAudio" and not msg.Distinguished then  -- الملفات الصوتيه
local Audio_Group = Redis:get(FDFGERB.."FDFGERB:Lock:Audio"..msg_chat_id)
if Audio_Group == "del" then 
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Audio_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Audio_Group == "ktm" then
Redis:sadd(FDFGERB.."FDFGERB:SilentGroup:Group"..msg.chat_id,msg.sender_id.user_id) 
elseif Audio_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
print('This is Audio')
end 

if msg.content.luatele == "messageVideo" and not msg.Distinguished then  -- الفيديو
local Video_Grouo = Redis:get(FDFGERB.."FDFGERB:Lock:Video"..msg_chat_id)
if Video_Grouo == "del" then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Video_Grouo == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Video_Grouo == "ktm" then
Redis:sadd(FDFGERB.."FDFGERB:SilentGroup:Group"..msg.chat_id,msg.sender_id.user_id) 
elseif Video_Grouo == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
print('This is Video')
end 

if msg.content.luatele == "messageVoiceNote" and not msg.Distinguished then  -- البصمات
local Voice_Group = Redis:get(FDFGERB.."FDFGERB:Lock:vico"..msg_chat_id)
if Voice_Group == "del" then  
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Voice_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Voice_Group == "ktm" then
Redis:sadd(FDFGERB.."FDFGERB:SilentGroup:Group"..msg.chat_id,msg.sender_id.user_id) 
elseif Voice_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
print('This is Voice')
end 

if msg.content.luatele == "messageSticker" and not msg.Distinguished then  -- الملصقات
local Sticker_Group = Redis:get(FDFGERB.."FDFGERB:Lock:Sticker"..msg_chat_id)
if Sticker_Group == "del" then  
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Sticker_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Sticker_Group == "ktm" then
Redis:sadd(FDFGERB.."FDFGERB:SilentGroup:Group"..msg.chat_id,msg.sender_id.user_id) 
elseif Sticker_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
print('This is Sticker')
end 

if msg.via_bot_user_id ~= 0 and not msg.Distinguished then  -- انلاين
local Inlen_Group = Redis:get(FDFGERB.."FDFGERB:Lock:Inlen"..msg_chat_id)
if Inlen_Group == "del" then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Inlen_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Inlen_Group == "ktm" then
Redis:sadd(FDFGERB.."FDFGERB:SilentGroup:Group"..msg.chat_id,msg.sender_id.user_id) 
elseif Inlen_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
print('This is viabot')
end

if msg.content.luatele == "messageAnimation" and not msg.Distinguished then  -- المتحركات
local Gif_group = Redis:get(FDFGERB.."FDFGERB:Lock:Animation"..msg_chat_id)
if Gif_group == "del" then 
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Gif_group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Gif_group == "ktm" then
Redis:sadd(FDFGERB.."FDFGERB:SilentGroup:Group"..msg.chat_id,msg.sender_id.user_id) 
elseif Gif_group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
print('This is Animation')
end 

if msg.content.luatele == "messagePhoto" and not msg.Distinguished then  -- الصور
local Photo_Group = Redis:get(FDFGERB.."FDFGERB:Lock:Photo"..msg_chat_id)
if Photo_Group == "del" then  
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Photo_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Photo_Group == "ktm" then
Redis:sadd(FDFGERB.."FDFGERB:SilentGroup:Group"..msg.chat_id,msg.sender_id.user_id) 
elseif Photo_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
print('This is Photo delete')
end
if msg.content.photo and Redis:get(FDFGERB.."FDFGERB:Chat:Photo"..msg_chat_id..":"..msg.sender_id.user_id) then
local ChatPhoto = LuaTele.setChatPhoto(msg_chat_id,msg.content.photo.sizes[2].photo.remote.id)
if (ChatPhoto.luatele == "error") then
Redis:del(FDFGERB.."FDFGERB:Chat:Photo"..msg_chat_id..":"..msg.sender_id.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,"• لا استطيع تغيير صوره المجموعه لاني لست ادمن او ليست لديه الصلاحيه ","md",true)    
end
Redis:del(FDFGERB.."FDFGERB:Chat:Photo"..msg_chat_id..":"..msg.sender_id.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تغيير صوره المجموعه المجموعه الى ","md",true)    
end
if (text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") 
or text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") 
or text and text:match("[Tt].[Mm][Ee]/") 
or text and text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") 
or text and text:match(".[Pp][Ee]") 
or text and text:match("[Hh][Tt][Tt][Pp][Ss]://") 
or text and text:match("[Hh][Tt][Tt][Pp]://") 
or text and text:match("[Ww][Ww][Ww].") 
or text and text:match(".[Cc][Oo][Mm]")) or text and text:match("[Hh][Tt][Tt][Pp][Ss]://") or text and text:match("[Hh][Tt][Tt][Pp]://") or text and text:match("[Ww][Ww][Ww].") or text and text:match(".[Cc][Oo][Mm]") or text and text:match(".[Tt][Kk]") or text and text:match(".[Mm][Ll]") or text and text:match(".[Oo][Rr][Gg]") then 
local link_Group = Redis:get(FDFGERB.."FDFGERB:Lock:Link"..msg_chat_id)  
if not msg.Distinguished then
if link_Group == "del" then 
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif link_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif link_Group == "ktm" then
Redis:sadd(FDFGERB.."FDFGERB:SilentGroup:Group"..msg.chat_id,msg.sender_id.user_id) 
elseif link_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
print('This is link ')
return false
end
end
if text and text:match("@[%a%d_]+") and not msg.Distinguished then 
local UserName_Group = Redis:get(FDFGERB.."FDFGERB:Lock:User:Name"..msg_chat_id)
if UserName_Group == "del" then  
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif UserName_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif UserName_Group == "ktm" then
Redis:sadd(FDFGERB.."FDFGERB:SilentGroup:Group"..msg.chat_id,msg.sender_id.user_id) 
elseif UserName_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
print('This is username ')
end
if text and text:match("#[%a%d_]+") and not msg.Distinguished then 
local Hashtak_Group = Redis:get(FDFGERB.."FDFGERB:Lock:hashtak"..msg_chat_id)
if Hashtak_Group == "del" then 
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Hashtak_Group == "ked" then
return LuaTele.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Hashtak_Group == "ktm" then
Redis:sadd(FDFGERB.."FDFGERB:SilentGroup:Group"..msg.chat_id,msg.sender_id.user_id) 
elseif Hashtak_Group == "kick" then
return LuaTele.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
print('This is hashtak ')
end
if text and text:match("/[%a%d_]+") and not msg.Distinguished then 
local comd_Group = Redis:get(FDFGERB.."FDFGERB:Lock:Cmd"..msg_chat_id)
if comd_Group == "del" then
return LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif comd_Group == "ked" then
return LuaTele.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif comd_Group == "ktm" then
Redis:sadd(FDFGERB.."FDFGERB:SilentGroup:Group"..msg.chat_id,msg.sender_id.user_id) 
elseif comd_Group == "kick" then
return LuaTele.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
end
if (Redis:get(FDFGERB..'FDFGERB:FilterText'..msg_chat_id..':'..msg.sender_id.user_id) == 'true') then
if text or msg.content.photo or msg.content.animation or msg.content.sticker  or msg.content.Distinguished then
if msg.content.photo then
Filters = 'صوره'
Redis:sadd(FDFGERB.."FDFGERB:List:Filter"..msg_chat_id,'photo:'..msg.content.photo.sizes[1].photo.id)  
Redis:set(FDFGERB.."FDFGERB:Filter:Text"..msg.sender_id.user_id..':'..msg_chat_id, msg.content.photo.sizes[1].photo.id)  
elseif msg.content.animation then
Filters = 'متحركه'
Redis:sadd(FDFGERB.."FDFGERB:List:Filter"..msg_chat_id,'animation:'..msg.content.animation.animation.id)  
Redis:set(FDFGERB.."FDFGERB:Filter:Text"..msg.sender_id.user_id..':'..msg_chat_id, msg.content.animation.animation.id)  
elseif msg.content.sticker then
Filters = 'ملصق'
Redis:sadd(FDFGERB.."FDFGERB:List:Filter"..msg_chat_id,'sticker:'..msg.content.sticker.sticker.id)  
Redis:set(FDFGERB.."FDFGERB:Filter:Text"..msg.sender_id.user_id..':'..msg_chat_id, msg.content.sticker.sticker.id)  
elseif msg.content.Distinguished then
Filters = 'ملصق متحرك'
Redis:sadd(FDFGERB.."FDFGERB:List:Filter"..msg_chat_id,'Distinguished:'..msg.content.Distinguished.Distinguished.id)  
Redis:set(FDFGERB.."FDFGERB:Filter:Text"..msg.sender_id.user_id..':'..msg_chat_id, msg.content.Distinguished.Distinguished.id) 
elseif text then
Redis:set(FDFGERB.."FDFGERB:Filter:Text"..msg.sender_id.user_id..':'..msg_chat_id, text)  
Redis:sadd(FDFGERB.."FDFGERB:List:Filter"..msg_chat_id,'text:'..text)  
Filters = 'نص'
end
Redis:set(FDFGERB..'FDFGERB:FilterText'..msg_chat_id..':'..msg.sender_id.user_id,'true1')
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ارسل تحذير ( "..Filters.." ) عند ارساله","md",true)  
end
end
if text and (Redis:get(FDFGERB..'FDFGERB:FilterText'..msg_chat_id..':'..msg.sender_id.user_id) == 'true1') then
local Text_Filter = Redis:get(FDFGERB.."FDFGERB:Filter:Text"..msg.sender_id.user_id..':'..msg_chat_id)  
if Text_Filter then   
Redis:set(FDFGERB.."FDFGERB:Filter:Group:"..Text_Filter..msg_chat_id,text)  
end  
Redis:del(FDFGERB.."FDFGERB:Filter:Text"..msg.sender_id.user_id..':'..msg_chat_id)  
Redis:del(FDFGERB..'FDFGERB:FilterText'..msg_chat_id..':'..msg.sender_id.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,"\n• تم اضافه رد التحذير","md",true)  
end
if text and (Redis:get(FDFGERB..'FDFGERB:FilterText'..msg_chat_id..':'..msg.sender_id.user_id) == 'DelFilter') then   
if text or msg.content.photo or msg.content.animation or msg.content.sticker then
if msg.content.photo then
Filters = 'الصوره'
Redis:srem(FDFGERB.."FDFGERB:List:Filter"..msg_chat_id,'photo:'..msg.content.photo.sizes[1].photo.id)  
Redis:del(FDFGERB.."FDFGERB:Filter:Group:"..msg.content.photo.sizes[1].photo.id..msg_chat_id)  
elseif msg.content.animation then
Filters = 'المتحركه'
Redis:srem(FDFGERB.."FDFGERB:List:Filter"..msg_chat_id,'animation:'..msg.content.animation.animation.id)  
Redis:del(FDFGERB.."FDFGERB:Filter:Group:"..msg.content.animation.animation.id..msg_chat_id)  
elseif msg.content.sticker then
Filters = 'الملصق'
Redis:srem(FDFGERB.."FDFGERB:List:Filter"..msg_chat_id,'sticker:'..msg.content.sticker.sticker.id)  
Redis:del(FDFGERB.."FDFGERB:Filter:Group:"..msg.content.sticker.sticker.id..msg_chat_id)  
elseif text then
Redis:srem(FDFGERB.."FDFGERB:List:Filter"..msg_chat_id,'text:'..text)  
Redis:del(FDFGERB.."FDFGERB:Filter:Group:"..text..msg_chat_id)  
Filters = 'النص'
end
Redis:del(FDFGERB..'FDFGERB:FilterText'..msg_chat_id..':'..msg.sender_id.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,"• تم الغاء منع ("..Filters..")","md",true)  
end
end
if text or msg.content.photo or msg.content.animation or msg.content.sticker then
if msg.content.photo then
DelFilters = msg.content.photo.sizes[1].photo.id
statusfilter = 'الصوره'
elseif msg.content.animation then
DelFilters = msg.content.animation.animation.id
statusfilter = 'المتحركه'
elseif msg.content.sticker then
DelFilters = msg.content.sticker.sticker.id
statusfilter = 'الملصق'
elseif text then
DelFilters = text
statusfilter = 'الرساله'
end
local ReplyFilters = Redis:get(FDFGERB.."FDFGERB:Filter:Group:"..DelFilters..msg_chat_id)
if ReplyFilters and not msg.Distinguished then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
return LuaTele.sendText(msg_chat_id,msg_id,"• لقد تم منع هذه ( "..statusfilter.." ) هنا\n• "..ReplyFilters,"md",true)   
end
end
if text and Redis:get(FDFGERB.."FDFGERB:Command:Reids:Group:Del"..msg_chat_id..":"..msg.sender_id.user_id) == "true" then
local NewCmmd = Redis:get(FDFGERB.."FDFGERB:Get:Reides:Commands:Group"..msg_chat_id..":"..text)
if NewCmmd then
Redis:del(FDFGERB.."FDFGERB:Get:Reides:Commands:Group"..msg_chat_id..":"..text)
Redis:del(FDFGERB.."FDFGERB:Command:Reids:Group:New"..msg_chat_id)
Redis:srem(FDFGERB.."FDFGERB:Command:List:Group"..msg_chat_id,text)
LuaTele.sendText(msg_chat_id,msg_id,"• تم ازالة هاذا :  "..text.." ","md",true)
else
LuaTele.sendText(msg_chat_id,msg_id,"• لا يوجد امر بهاذا الاسم","md",true)
end
Redis:del(FDFGERB.."FDFGERB:Command:Reids:Group:Del"..msg_chat_id..":"..msg.sender_id.user_id)
return false
end
if text and Redis:get(FDFGERB.."FDFGERB:Command:Reids:Group"..msg_chat_id..":"..msg.sender_id.user_id) == "true" then
Redis:set(FDFGERB.."FDFGERB:Command:Reids:Group:New"..msg_chat_id,text)
Redis:del(FDFGERB.."FDFGERB:Command:Reids:Group"..msg_chat_id..":"..msg.sender_id.user_id)
Redis:set(FDFGERB.."FDFGERB:Command:Reids:Group:End"..msg_chat_id..":"..msg.sender_id.user_id,"true1") 
return LuaTele.sendText(msg_chat_id,msg_id,"• ارسل الامر الجديد ليتم وضعه مكان القديم","md",true)  
end
if text and Redis:get(FDFGERB.."FDFGERB:Command:Reids:Group:End"..msg_chat_id..":"..msg.sender_id.user_id) == "true1" then
local NewCmd = Redis:get(FDFGERB.."FDFGERB:Command:Reids:Group:New"..msg_chat_id)
Redis:set(FDFGERB.."FDFGERB:Get:Reides:Commands:Group"..msg_chat_id..":"..text,NewCmd)
Redis:sadd(FDFGERB.."FDFGERB:Command:List:Group"..msg_chat_id,text)
Redis:del(FDFGERB.."FDFGERB:Command:Reids:Group:End"..msg_chat_id..":"..msg.sender_id.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,"• تم حفظ الامر باسم •  "..text..' ',"md",true)
end
if Redis:get(FDFGERB.."FDFGERB:Set:Link"..msg_chat_id..""..msg.sender_id.user_id) then
if text == "الغاء" then
Redis:del(FDFGERB.."FDFGERB:Set:Link"..msg_chat_id..""..msg.sender_id.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"•  تم الغاء حفظ الرابط","md",true) 
end
Redis:set(FDFGERB.."FDFGERB:Group:Link"..msg_chat_id,text)
Redis:del(FDFGERB.."FDFGERB:Set:Link"..msg_chat_id..""..msg.sender_id.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"•  تم حفظ الرابط بنجاح","md",true) 
end 
if Redis:get(FDFGERB.."Tshake:Welcome:Group" .. msg_chat_id .. "" .. msg.sender_id.user_id) then 
if text == "الغاء" then 
Redis:del(FDFGERB.."Tshake:Welcome:Group" .. msg_chat_id .. "" .. msg.sender_id.user_id)  
return LuaTele.sendText(msg_chat_id,msg_id,"• تم الغاء حفظ الترحيب","md",true)   
end 
Redis:del(FDFGERB.."Tshake:Welcome:Group" .. msg_chat_id .. "" .. msg.sender_id.user_id)  
Redis:set(FDFGERB.."FDFGERB:Welcome:Group"..msg_chat_id,text) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم حفظ ترحيب المجموعه","md",true)     
end
if Redis:get(FDFGERB.."FDFGERB:Set:Rules:" .. msg_chat_id .. ":" .. msg.sender_id.user_id) then 
if text == "الغاء" then 
Redis:del(FDFGERB.."FDFGERB:Set:Rules:" .. msg_chat_id .. ":" .. msg.sender_id.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,"• تم الغاء حفظ القوانين","md",true)   
end 
Redis:set(FDFGERB.."FDFGERB:Group:Rules" .. msg_chat_id,text) 
Redis:del(FDFGERB.."FDFGERB:Set:Rules:" .. msg_chat_id .. ":" .. msg.sender_id.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,"• تم حفظ قوانين المجموعه","md",true)  
end  
if Redis:get(FDFGERB.."FDFGERB:Set:Description:" .. msg_chat_id .. ":" .. msg.sender_id.user_id) then 
if text == "الغاء" then 
Redis:del(FDFGERB.."FDFGERB:Set:Description:" .. msg_chat_id .. ":" .. msg.sender_id.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,"• تم الغاء حفظ وصف المجموعه","md",true)   
end 
LuaTele.setChatDescription(msg_chat_id,text) 
Redis:del(FDFGERB.."FDFGERB:Set:Description:" .. msg_chat_id .. ":" .. msg.sender_id.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,"• تم حفظ وصف المجموعه","md",true)  
end  
if text == "الغاء" then 
Redis:del(FDFGERB.."Set:Manager:rd:inline"..msg.sender_id.user_id..":"..msg_chat_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,"• حسناً , تم الغاء كل شي","md",true)   
end
if text == "الغاء" then 
Redis:del(FDFGERB.."FDFGERB:Set:Manager:rd"..msg.sender_id.user_id..":"..msg_chat_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,"• حسناً , تم الغاء كل شي","md",true)   
end
if text or msg.content.video_note or msg.content.document or msg.content.audio or msg.content.video or msg.content.voice_note or msg.content.sticker or msg.content.animation or msg.content.photo then
local test = Redis:get(FDFGERB.."FDFGERB:Text:Manager"..msg.sender_id.user_id..":"..msg_chat_id.."")
if Redis:get(FDFGERB.."FDFGERB:Set:Manager:rd"..msg.sender_id.user_id..":"..msg_chat_id) == "true1" then
Redis:del(FDFGERB.."FDFGERB:Set:Manager:rd"..msg.sender_id.user_id..":"..msg_chat_id)
if msg.content.sticker then   
Redis:set(FDFGERB.."FDFGERB:Add:Rd:Manager:Stekrs"..test..msg_chat_id, msg.content.sticker.sticker.remote.id)  
end   
if msg.content.voice_note then  
Redis:set(FDFGERB.."FDFGERB:Add:Rd:Manager:Vico"..test..msg_chat_id, msg.content.voice_note.voice.remote.id)  
end   
if msg.content.text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("","") 
Redis:set(FDFGERB.."FDFGERB:Add:Rd:Manager:Text"..test..msg_chat_id, text)  
end  
if msg.content.audio then
Redis:set(FDFGERB.."FDFGERB:Add:Rd:Manager:Audio"..test..msg_chat_id, msg.content.audio.audio.remote.id)  
end
if msg.content.document then
Redis:set(FDFGERB.."FDFGERB:Add:Rd:Manager:File"..test..msg_chat_id, msg.content.document.document.remote.id)  
end
if msg.content.animation then
Redis:set(FDFGERB.."FDFGERB:Add:Rd:Manager:Gif"..test..msg_chat_id, msg.content.animation.animation.remote.id)  
end
if msg.content.video_note then
Redis:set(FDFGERB.."FDFGERB:Add:Rd:Manager:video_note"..test..msg_chat_id, msg.content.video_note.video.remote.id)  
end
if msg.content.video then
Redis:set(FDFGERB.."FDFGERB:Add:Rd:Manager:Video"..test..msg_chat_id, msg.content.video.video.remote.id)  
end
if msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
print(idPhoto)
Redis:set(FDFGERB.."FDFGERB:Add:Rd:Manager:Photo"..test..msg_chat_id, idPhoto)  
end
return LuaTele.sendText(msg_chat_id,msg_id,"• اضفت الرد  \n• ارسل ( "..test.." ) لتشوف الرد","md",true)  
end  
end
if text and text:match("^(.*)$") then
if Redis:get(FDFGERB.."FDFGERB:Set:Manager:rd"..msg.sender_id.user_id..":"..msg_chat_id) == "true" then
Redis:set(FDFGERB.."FDFGERB:Set:Manager:rd"..msg.sender_id.user_id..":"..msg_chat_id,"true1")
Redis:set(FDFGERB.."FDFGERB:Text:Manager"..msg.sender_id.user_id..":"..msg_chat_id, text)
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Manager:Gif"..text..msg_chat_id)   
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Manager:Vico"..text..msg_chat_id)   
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Manager:Stekrs"..text..msg_chat_id)     
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Manager:Text"..text..msg_chat_id)   
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Manager:Photo"..text..msg_chat_id)
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Manager:Video"..text..msg_chat_id)
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Manager:File"..text..msg_chat_id)
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Manager:video_note"..text..msg_chat_id)
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Manager:Audio"..text..msg_chat_id)
Redis:sadd(FDFGERB.."FDFGERB:List:Manager"..msg_chat_id.."", text)
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- تغيير الرد', data = msg.sender_id.user_id..'/chengreplyg'},
},
{
{text = '- الغاء الامر', data = msg.sender_id.user_id..'/delamrredis'},
},
}
}
LuaTele.sendText(msg_chat_id,msg_id,[[
• ارسل لي الرد سواء كان 
❨ ملف • ملصق • متحركه • صوره
 • فيديو • بصمه الفيديو • بصمه • صوت • رساله ❩
]],"md",true, false, false, false, reply_markup)
return false
end
end
if text and text:match("^(.*)$") then
if Redis:get(FDFGERB.."FDFGERB:Set:Manager:rd"..msg.sender_id.user_id..":"..msg_chat_id.."") == "true2" then
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Manager:Gif"..text..msg_chat_id)   
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Manager:Vico"..text..msg_chat_id)   
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Manager:Stekrs"..text..msg_chat_id)     
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Manager:Text"..text..msg_chat_id)   
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Manager:Photo"..text..msg_chat_id)
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Manager:Video"..text..msg_chat_id)
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Manager:File"..text..msg_chat_id)
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Manager:Audio"..text..msg_chat_id)
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Manager:video_note"..text..msg_chat_id)
Redis:del(FDFGERB.."FDFGERB:Set:Manager:rd"..msg.sender_id.user_id..":"..msg_chat_id)
Redis:srem(FDFGERB.."FDFGERB:List:Manager"..msg_chat_id.."", text)
LuaTele.sendText(msg_chat_id,msg_id,"• تم حذف الرد من الردود ","md",true)  
return false
end
end
if text and Redis:get(FDFGERB.."FDFGERB:Status:ReplySudo"..msg_chat_id) then
local anemi = Redis:get(FDFGERB.."FDFGERB:Add:Rd:Sudo:Gif"..text)   
local veico = Redis:get(FDFGERB.."FDFGERB:Add:Rd:Sudo:vico"..text)   
local stekr = Redis:get(FDFGERB.."FDFGERB:Add:Rd:Sudo:stekr"..text)     
local Text = Redis:get(FDFGERB.."FDFGERB:Add:Rd:Sudo:Text"..text)   
local photo = Redis:get(FDFGERB.."FDFGERB:Add:Rd:Sudo:Photo"..text)
local video = Redis:get(FDFGERB.."FDFGERB:Add:Rd:Sudo:Video"..text)
local document = Redis:get(FDFGERB.."FDFGERB:Add:Rd:Sudo:File"..text)
local audio = Redis:get(FDFGERB.."FDFGERB:Add:Rd:Sudo:Audio"..text)
local video_note = Redis:get(FDFGERB.."FDFGERB:Add:Rd:Sudo:video_note"..text)
if Text then 
local UserInfo = LuaTele.getUser(msg.sender_id.user_id)
local NumMsg = Redis:get(FDFGERB..'FDFGERB:Num:Message:User'..msg_chat_id..':'..msg.sender_id.user_id) or 0
local TotalMsg = Total_message(NumMsg)
local Status_Gps = msg.Name_Controller
local NumMessageEdit = Redis:get(FDFGERB..'FDFGERB:Num:Message:Edit'..msg_chat_id..msg.sender_id.user_id) or 0
local Text = Text:gsub('#username',(UserInfo.username or 'لا يوجد')) 
local Text = Text:gsub('#name',UserInfo.first_name)
local Text = Text:gsub('#id',msg.sender_id.user_id)
local Text = Text:gsub('#edit',NumMessageEdit)
local Text = Text:gsub('#msgs',NumMsg)
local Text = Text:gsub('#stast',Status_Gps)
LuaTele.sendText(msg_chat_id,msg_id,'['..Text..']',"md",false, false, false, false, reply_markup)  
end
if video_note then
LuaTele.sendVideoNote(msg_chat_id, msg.id, video_note)
end
if photo then
LuaTele.sendPhoto(msg.chat_id, msg.id, photo,'')
end  
if stekr then 
LuaTele.sendSticker(msg_chat_id, msg.id, stekr)
end
if veico then 
LuaTele.sendVoiceNote(msg_chat_id, msg.id, veico, '', 'md')
end
if video then 
LuaTele.sendVideo(msg_chat_id, msg.id, video, '', "md")
end
if anemi then 
LuaTele.sendAnimation(msg_chat_id,msg.id, anemi, '', 'md')
end
if document then
LuaTele.sendDocument(msg_chat_id, msg.id, document, '', 'md')
end  
if audio then
LuaTele.sendAudio(msg_chat_id, msg.id, audio, '', "md") 
end
end
if text and Redis:get(FDFGERB.."FDFGERB:Status:Reply"..msg_chat_id) then
local anemi = Redis:get(FDFGERB.."FDFGERB:Add:Rd:Manager:Gif"..text..msg_chat_id)   
local veico = Redis:get(FDFGERB.."FDFGERB:Add:Rd:Manager:Vico"..text..msg_chat_id)   
local stekr = Redis:get(FDFGERB.."FDFGERB:Add:Rd:Manager:Stekrs"..text..msg_chat_id)     
local Texingt = Redis:get(FDFGERB.."FDFGERB:Add:Rd:Manager:Text"..text..msg_chat_id)   
local photo = Redis:get(FDFGERB.."FDFGERB:Add:Rd:Manager:Photo"..text..msg_chat_id)
local video = Redis:get(FDFGERB.."FDFGERB:Add:Rd:Manager:Video"..text..msg_chat_id)
local document = Redis:get(FDFGERB.."FDFGERB:Add:Rd:Manager:File"..text..msg_chat_id)
local audio = Redis:get(FDFGERB.."FDFGERB:Add:Rd:Manager:Audio"..text..msg_chat_id)
local video_note = Redis:get(FDFGERB.."FDFGERB:Add:Rd:Manager:video_note"..text..msg_chat_id)
if Texingt then 
local UserInfo = LuaTele.getUser(msg.sender_id.user_id)
local NumMsg = Redis:get(FDFGERB..'FDFGERB:Num:Message:User'..msg_chat_id..':'..msg.sender_id.user_id) or 0
local TotalMsg = Total_message(NumMsg) 
local Status_Gps = msg.Name_Controller
local NumMessageEdit = Redis:get(FDFGERB..'FDFGERB:Num:Message:Edit'..msg_chat_id..msg.sender_id.user_id) or 0
local Texingt = Texingt:gsub('#username',(UserInfo.username or 'لا يوجد')) 
local Texingt = Texingt:gsub('#name',UserInfo.first_name)
local Texingt = Texingt:gsub('#id',msg.sender_id.user_id)
local Texingt = Texingt:gsub('#edit',NumMessageEdit)
local Texingt = Texingt:gsub('#msgs',NumMsg)
local Texingt = Texingt:gsub('#stast',Status_Gps)
LuaTele.sendText(msg_chat_id,msg_id,'['..Texingt..']',"md",false, false, false, false, reply_markup)  
end
if video_note then
LuaTele.sendVideoNote(msg_chat_id, msg.id, video_note)
end
if photo then
LuaTele.sendPhoto(msg.chat_id, msg.id, photo,'')
end  
if stekr then 
LuaTele.sendSticker(msg_chat_id, msg.id, stekr)
end
if veico then 
LuaTele.sendVoiceNote(msg_chat_id, msg.id, veico, '', 'md')
end
if video then 
LuaTele.sendVideo(msg_chat_id, msg.id, video, '', "md")
end
if anemi then 
LuaTele.sendAnimation(msg_chat_id,msg.id, anemi, '', 'md')
end
if document then
LuaTele.sendDocument(msg_chat_id, msg.id, document, '', 'md')
end  
if audio then
LuaTele.sendAudio(msg_chat_id, msg.id, audio, '', "md") 
end
end
if text or msg.content.video_note or msg.content.document or msg.content.audio or msg.content.video or msg.content.voice_note or msg.content.sticker or msg.content.animation or msg.content.photo then
local test = Redis:get(FDFGERB.."FDFGERB:Text:Sudo:Bot"..msg.sender_id.user_id..":"..msg_chat_id)
if Redis:get(FDFGERB.."FDFGERB:Set:Rd"..msg.sender_id.user_id..":"..msg_chat_id) == "true1" then
Redis:del(FDFGERB.."FDFGERB:Set:Rd"..msg.sender_id.user_id..":"..msg_chat_id)
if msg.content.sticker then   
Redis:set(FDFGERB.."FDFGERB:Add:Rd:Sudo:stekr"..test, msg.content.sticker.sticker.remote.id)  
end   
if msg.content.voice_note then  
Redis:set(FDFGERB.."FDFGERB:Add:Rd:Sudo:vico"..test, msg.content.voice_note.voice.remote.id)  
end   
if msg.content.animation then   
Redis:set(FDFGERB.."FDFGERB:Add:Rd:Sudo:Gif"..test, msg.content.animation.animation.remote.id)  
end  
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("","") 
Redis:set(FDFGERB.."FDFGERB:Add:Rd:Sudo:Text"..test, text)  
end  
if msg.content.audio then
Redis:set(FDFGERB.."FDFGERB:Add:Rd:Sudo:Audio"..test, msg.content.audio.audio.remote.id)  
end
if msg.content.document then
Redis:set(FDFGERB.."FDFGERB:Add:Rd:Sudo:File"..test, msg.content.document.document.remote.id)  
end
if msg.content.video then
Redis:set(FDFGERB.."FDFGERB:Add:Rd:Sudo:Video"..test, msg.content.video.video.remote.id)  
end
if msg.content.video_note then
Redis:set(FDFGERB.."FDFGERB:Add:Rd:Sudo:video_note"..test..msg_chat_id, msg.content.video_note.video.remote.id)  
end
if msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
Redis:set(FDFGERB.."FDFGERB:Add:Rd:Sudo:Photo"..test, idPhoto)  
end
LuaTele.sendText(msg_chat_id,msg_id,"• تم حفظ رد عام \n• ارسل ( "..test.." ) لرئية الرد","md",true)  
return false
end  
end
if text and text:match("^(.*)$") then
if Redis:get(FDFGERB.."FDFGERB:Set:Rd"..msg.sender_id.user_id..":"..msg_chat_id) == "true" then
Redis:set(FDFGERB.."FDFGERB:Set:Rd"..msg.sender_id.user_id..":"..msg_chat_id, "true1")
Redis:set(FDFGERB.."FDFGERB:Text:Sudo:Bot"..msg.sender_id.user_id..":"..msg_chat_id, text)
Redis:sadd(FDFGERB.."FDFGERB:List:Rd:Sudo", text)
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- تغيير الرد', data = msg.sender_id.user_id..'/chengreplys'},
},
{
{text = '- الغاء الامر', data = msg.sender_id.user_id..'/delamrredis'},
},
}
}
LuaTele.sendText(msg_chat_id,msg_id,[[
• ارسل لي الرد سواء كان 
❨ ملف • ملصق • متحركه • صوره
 • فيديو • بصمه الفيديو • بصمه • صوت • رساله ❩
]],"md",true, false, false, false, reply_markup)
return false
end
end
if text and text:match("^(.*)$") then
if Redis:get(FDFGERB.."FDFGERB:Set:On"..msg.sender_id.user_id..":"..msg_chat_id) == "true" then
list = {"Add:Rd:Sudo:video_note","Add:Rd:Sudo:Audio","Add:Rd:Sudo:File","Add:Rd:Sudo:Video","Add:Rd:Sudo:Photo","Add:Rd:Sudo:Text","Add:Rd:Sudo:stekr","Add:Rd:Sudo:vico","Add:Rd:Sudo:Gif"}
for k,v in pairs(list) do
Redis:del(FDFGERB..'FDFGERB:'..v..text)
end
Redis:del(FDFGERB.."FDFGERB:Set:On"..msg.sender_id.user_id..":"..msg_chat_id)
Redis:srem(FDFGERB.."FDFGERB:List:Rd:Sudo", text)
return LuaTele.sendText(msg_chat_id,msg_id,"• تم حذف الرد من الردود العامه","md",true)  
end
end
if Redis:get(FDFGERB.."FDFGERB:Broadcasting:Groups:Pin" .. msg_chat_id .. ":" .. msg.sender_id.user_id) then 
if text == "الغاء" or text == 'الغاء الامر •' then   
Redis:del(FDFGERB.."FDFGERB:Broadcasting:Groups:Pin" .. msg_chat_id .. ":" .. msg.sender_id.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id, "\n• تم الغاء الاذاعه للمجموعات","md",true)  
end 
local list = Redis:smembers(FDFGERB.."FDFGERB:ChekBotAdd") 
if msg.content.video_note then
for k,v in pairs(list) do 
LuaTele.sendVideoNote(v, 0, msg.content.video_note.video.remote.id)
Redis:set(FDFGERB.."FDFGERB:PinMsegees:"..v,msg.content.video_note.video.remote.id)
end
elseif msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
for k,v in pairs(list) do 
LuaTele.sendPhoto(v, 0, idPhoto,'')
Redis:set(FDFGERB.."FDFGERB:PinMsegees:"..v,idPhoto)
end
elseif msg.content.sticker then 
for k,v in pairs(list) do 
LuaTele.sendSticker(v, 0, msg.content.sticker.sticker.remote.id)
Redis:set(FDFGERB.."FDFGERB:PinMsegees:"..v,msg.content.sticker.sticker.remote.id)
end
elseif msg.content.voice_note then 
for k,v in pairs(list) do 
LuaTele.sendVoiceNote(v, 0, msg.content.voice_note.voice.remote.id, '', 'md')
Redis:set(FDFGERB.."FDFGERB:PinMsegees:"..v,msg.content.voice_note.voice.remote.id)
end
elseif msg.content.video then 
for k,v in pairs(list) do 
LuaTele.sendVideo(v, 0, msg.content.video.video.remote.id, '', "md")
Redis:set(FDFGERB.."FDFGERB:PinMsegees:"..v,msg.content.video.video.remote.id)
end
elseif msg.content.animation then 
for k,v in pairs(list) do 
LuaTele.sendAnimation(v,0, msg.content.animation.animation.remote.id, '', 'md')
Redis:set(FDFGERB.."FDFGERB:PinMsegees:"..v,msg.content.animation.animation.remote.id)
end
elseif msg.content.document then
for k,v in pairs(list) do 
LuaTele.sendDocument(v, 0, msg.content.document.document.remote.id, '', 'md')
Redis:set(FDFGERB.."FDFGERB:PinMsegees:"..v,msg.content.document.document.remote.id)
end
elseif msg.content.audio then
for k,v in pairs(list) do 
LuaTele.sendAudio(v, 0, msg.content.audio.audio.remote.id, '', "md") 
Redis:set(FDFGERB.."FDFGERB:PinMsegees:"..v,msg.content.audio.audio.remote.id)
end
elseif text then
for k,v in pairs(list) do 
LuaTele.sendText(v,0,text,"md",true)
Redis:set(FDFGERB.."FDFGERB:PinMsegees:"..v,text)
end
end
LuaTele.sendText(msg_chat_id,msg_id,"• تمت الاذاعه الى *- "..#list.." * مجموعه في البوت ","md",true)      
Redis:del(FDFGERB.."FDFGERB:Broadcasting:Groups:Pin" .. msg_chat_id .. ":" .. msg.sender_id.user_id) 
return false
end
------------------------------------------------------------------------------------------------------------
if Redis:get(FDFGERB.."FDFGERB:Broadcasting:Users" .. msg_chat_id .. ":" .. msg.sender_id.user_id) then 
if text == "الغاء" or text == 'الغاء الامر •' then   
Redis:del(FDFGERB.."FDFGERB:Broadcasting:Users" .. msg_chat_id .. ":" .. msg.sender_id.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id, "\n• تم الغاء الاذاعه خاص","md",true)  
end 
local list = Redis:smembers(FDFGERB..'FDFGERB:Num:User:Pv')  
if msg.content.video_note then
for k,v in pairs(list) do 
LuaTele.sendVideoNote(v, 0, msg.content.video_note.video.remote.id)
end
elseif msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
for k,v in pairs(list) do 
LuaTele.sendPhoto(v, 0, idPhoto,'')
end
elseif msg.content.sticker then 
for k,v in pairs(list) do 
LuaTele.sendSticker(v, 0, msg.content.sticker.sticker.remote.id)
end
elseif msg.content.voice_note then 
for k,v in pairs(list) do 
LuaTele.sendVoiceNote(v, 0, msg.content.voice_note.voice.remote.id, '', 'md')
end
elseif msg.content.video then 
for k,v in pairs(list) do 
LuaTele.sendVideo(v, 0, msg.content.video.video.remote.id, '', "md")
end
elseif msg.content.animation then 
for k,v in pairs(list) do 
LuaTele.sendAnimation(v,0, msg.content.animation.animation.remote.id, '', 'md')
end
elseif msg.content.document then
for k,v in pairs(list) do 
LuaTele.sendDocument(v, 0, msg.content.document.document.remote.id, '', 'md')
end
elseif msg.content.audio then
for k,v in pairs(list) do 
LuaTele.sendAudio(v, 0, msg.content.audio.audio.remote.id, '', "md") 
end
elseif text then
for k,v in pairs(list) do 
LuaTele.sendText(v,0,text,"md",true)
end
end
LuaTele.sendText(msg_chat_id,msg_id,"• تمت الاذاعه الى *- "..#list.." * مشترك في البوت ","md",true)      
Redis:del(FDFGERB.."FDFGERB:Broadcasting:Users" .. msg_chat_id .. ":" .. msg.sender_id.user_id) 
return false
end
------------------------------------------------------------------------------------------------------------
if Redis:get(FDFGERB.."FDFGERB:Broadcasting:Groups" .. msg_chat_id .. ":" .. msg.sender_id.user_id) then 
if text == "الغاء" or text == 'الغاء الامر •' then   
Redis:del(FDFGERB.."FDFGERB:Broadcasting:Groups" .. msg_chat_id .. ":" .. msg.sender_id.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id, "\n• تم الغاء الاذاعه للمجموعات","md",true)  
end 
local list = Redis:smembers(FDFGERB.."FDFGERB:ChekBotAdd") 
if msg.content.video_note then
for k,v in pairs(list) do 
LuaTele.sendVideoNote(v, 0, msg.content.video_note.video.remote.id)
end
elseif msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
for k,v in pairs(list) do 
LuaTele.sendPhoto(v, 0, idPhoto,'')
end
elseif msg.content.sticker then 
for k,v in pairs(list) do 
LuaTele.sendSticker(v, 0, msg.content.sticker.sticker.remote.id)
end
elseif msg.content.voice_note then 
for k,v in pairs(list) do 
LuaTele.sendVoiceNote(v, 0, msg.content.voice_note.voice.remote.id, '', 'md')
end
elseif msg.content.video then 
for k,v in pairs(list) do 
LuaTele.sendVideo(v, 0, msg.content.video.video.remote.id, '', "md")
end
elseif msg.content.animation then 
for k,v in pairs(list) do 
LuaTele.sendAnimation(v,0, msg.content.animation.animation.remote.id, '', 'md')
end
elseif msg.content.document then
for k,v in pairs(list) do 
LuaTele.sendDocument(v, 0, msg.content.document.document.remote.id, '', 'md')
end
elseif msg.content.audio then
for k,v in pairs(list) do 
LuaTele.sendAudio(v, 0, msg.content.audio.audio.remote.id, '', "md") 
end
elseif text then
for k,v in pairs(list) do 
LuaTele.sendText(v,0,text,"md",true)
end
end
LuaTele.sendText(msg_chat_id,msg_id,"• تمت الاذاعه الى *- "..#list.." * مجموعه في البوت ","md",true)      
Redis:del(FDFGERB.."FDFGERB:Broadcasting:Groups" .. msg_chat_id .. ":" .. msg.sender_id.user_id) 
return false
end
------------------------------------------------------------------------------------------------------------
if Redis:get(FDFGERB.."FDFGERB:Broadcasting:Groups:Fwd" .. msg_chat_id .. ":" .. msg.sender_id.user_id) then 
if text == "الغاء" or text == 'الغاء الامر •' then   
Redis:del(FDFGERB.."FDFGERB:Broadcasting:Groups:Fwd" .. msg_chat_id .. ":" .. msg.sender_id.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id, "\n• تم الغاء الاذاعه بالتوجيه للمجموعات","md",true)    
end 
if msg.forward_info then 
local list = Redis:smembers(FDFGERB.."FDFGERB:ChekBotAdd")   
LuaTele.sendText(msg_chat_id,msg_id,"• تم التوجيه الى *- "..#list.." * مجموعه في البوت ","md",true)      
for k,v in pairs(list) do  
LuaTele.forwardMessages(v, msg_chat_id, msg_id,0,0,true,false,false)
end   
Redis:del(FDFGERB.."FDFGERB:Broadcasting:Groups:Fwd" .. msg_chat_id .. ":" .. msg.sender_id.user_id) 
end 
return false
end
------------------------------------------------------------------------------------------------------------
if Redis:get(FDFGERB.."FDFGERB:Broadcasting:Users:Fwd" .. msg_chat_id .. ":" .. msg.sender_id.user_id) then 
if text == "الغاء" or text == 'الغاء الامر •' then   
Redis:del(FDFGERB.."FDFGERB:Broadcasting:Users:Fwd" .. msg_chat_id .. ":" .. msg.sender_id.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id, "\n• تم الغاء الاذاعه بالتوجيه خاص","md",true)    
end 
if msg.forward_info then 
local list = Redis:smembers(FDFGERB.."FDFGERB:Num:User:Pv")   
LuaTele.sendText(msg_chat_id,msg_id,"• تم التوجيه الى *- "..#list.." * مجموعه في البوت ","md",true) 
for k,v in pairs(list) do  
LuaTele.forwardMessages(v, msg_chat_id, msg_id,0,1,msg.media_album_id,false,true)
end   
Redis:del(FDFGERB.."FDFGERB:Broadcasting:Users:Fwd" .. msg_chat_id .. ":" .. msg.sender_id.user_id) 
end 
return false
end
if text and Redis:get(FDFGERB..'FDFGERB:GetTexting:DevFDFGERB'..msg_chat_id..':'..msg.sender_id.user_id) then
if text == 'الغاء' or text == 'الغاء الامر •' then 
Redis:del(FDFGERB..'FDFGERB:GetTexting:DevFDFGERB'..msg_chat_id..':'..msg.sender_id.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,'• تم الغاء حفظ كليشة Dev🎖️  ')
end
Redis:set(FDFGERB..'FDFGERB:Texting:DevFDFGERB',text)
Redis:del(FDFGERB..'FDFGERB:GetTexting:DevFDFGERB'..msg_chat_id..':'..msg.sender_id.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,'• تم حفظ كليشة Dev🎖️  ')
end
if Redis:get(FDFGERB.."FDFGERB:Redis:Id:all"..msg.chat_id..""..msg.sender_id.user_id) then 
if text == 'الغاء' then 
LuaTele.sendText(msg_chat_id,msg_id, "\n• تم الغاء امر تعين الايدي عام","md",true)  
Redis:del(FDFGERB.."FDFGERB:Redis:Id:all"..msg.chat_id..""..msg.sender_id.user_id) 
return false  
end 
Redis:del(FDFGERB.."FDFGERB:Redis:Id:all"..msg.chat_id..""..msg.sender_id.user_id) 
Redis:set(FDFGERB.."FDFGERB:Set:Id:all",text:match("(.*)"))
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- تغيير الايدي عام', data = msg.sender_id.user_id..'/chenidam'},
},
{
{text = '- الغاء الامر', data = msg.sender_id.user_id..'/delamrredis'},
},
}
}
LuaTele.sendText(msg_chat_id,msg_id,'• تم تعين الايدي عام الجديد',"md",true, false, false, false, reply_markup)
end
if Redis:get(FDFGERB.."FDFGERB:Redis:Id:Group"..msg.chat_id..""..msg.sender_id.user_id) then 
if text == 'الغاء' then 
LuaTele.sendText(msg_chat_id,msg_id, "\n• تم الغاء امر تعين الايدي","md",true)  
Redis:del(FDFGERB.."FDFGERB:Redis:Id:Group"..msg.chat_id..""..msg.sender_id.user_id) 
return false  
end 
Redis:del(FDFGERB.."FDFGERB:Redis:Id:Group"..msg.chat_id..""..msg.sender_id.user_id) 
Redis:set(FDFGERB.."FDFGERB:Set:Id:Group"..msg.chat_id,text:match("(.*)"))
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- تغيير الايدي', data = msg.sender_id.user_id..'/chenid'},
},
{
{text = '- الغاء الامر', data = msg.sender_id.user_id..'/delamrredis'},
},
}
}
LuaTele.sendText(msg_chat_id,msg_id,'• تم تعين الايدي الجديد',"md",true, false, false, false, reply_markup)
end
if Redis:get(FDFGERB.."FDFGERB:Change:Name:Bot"..msg.sender_id.user_id) then 
if text == "الغاء" or text == 'الغاء الامر •' then   
Redis:del(FDFGERB.."FDFGERB:Change:Name:Bot"..msg.sender_id.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id, "\n• تم الغاء امر تغيير اسم البوت","md",true)  
end 
Redis:del(FDFGERB.."FDFGERB:Change:Name:Bot"..msg.sender_id.user_id) 
Redis:set(FDFGERB.."FDFGERB:Name:Bot",text) 
return LuaTele.sendText(msg_chat_id,msg_id, "• تم تغيير اسم البوت الى • "..text,"md",true)    
end 
if Redis:get(FDFGERB.."FDFGERB:Change:Start:Bot"..msg.sender_id.user_id) then 
if text == "الغاء" or text == 'الغاء الامر •' then   
Redis:del(FDFGERB.."FDFGERB:Change:Start:Bot"..msg.sender_id.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id, "\n• تم الغاء امر تغيير كليشه start","md",true)  
end 
Redis:del(FDFGERB.."FDFGERB:Change:Start:Bot"..msg.sender_id.user_id) 
Redis:set(FDFGERB.."FDFGERB:Start:Bot",text) 
return LuaTele.sendText(msg_chat_id,msg_id, "• تم تغيير كليشه start • "..text,"md",true)    
end 
if Redis:get(FDFGERB.."FDFGERB:Game:jhg"..msg.chat_id) then
if text == Redis:get(FDFGERB.."FDFGERB:Game:jhg"..msg.chat_id) then
local bain = LuaTele.getUser(msg.sender_id.user_id)
if bain.first_name then
bain = '['..bain.first_name..'](tg://user?id='..bain.id..')'
else
bain = 'لا يوجد'
end
local jjjo = math.random(100);
Redis:incrby(FDFGERB.."boob"..msg.sender_id.user_id , jjjo)
Redis:sadd(FDFGERB.."ttpppi",msg.sender_id.user_id) 
ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
Redis:del(FDFGERB.."FDFGERB:Game:jhg"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"• اجابتك صحيحة \n• اسمك ⇠ "..bain.." \n• لانك جاوبت صح اعطيتك ⇠ "..jjjo.." ريال 💸\n• صارت فلوسك ⇠ `"..ballancee.."` ريال 💸\n\n","md",true)  
end
end
if Redis:get(FDFGERB.."FDFGERB:Game:Englishlol"..msg.chat_id) then
if text == Redis:get(FDFGERB.."FDFGERB:Game:Englishlol"..msg.chat_id) then
local bain = LuaTele.getUser(msg.sender_id.user_id)
if bain.first_name then
bain = '['..bain.first_name..'](tg://user?id='..bain.id..')'
else
bain = 'لا يوجد'
end
local jjjo = math.random(100);
Redis:incrby(FDFGERB.."boob"..msg.sender_id.user_id , jjjo)
Redis:sadd(FDFGERB.."ttpppi",msg.sender_id.user_id) 
ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
Redis:del(FDFGERB.."FDFGERB:Game:Englishlol"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"• اجابتك صحيحة \n• اسمك ⇠ "..bain.." \n• لانك جاوبت صح اعطيتك ⇠ "..jjjo.." ريال 💸\n• صارت فلوسك ⇠ `"..ballancee.."` ريال 💸\n\n","md",true)  
end
end
if Redis:get(FDFGERB.."FDFGERB:Game:iui"..msg.chat_id) then
if text == Redis:get(FDFGERB.."FDFGERB:Game:iui"..msg.chat_id) then
local bain = LuaTele.getUser(msg.sender_id.user_id)
if bain.first_name then
bain = '['..bain.first_name..'](tg://user?id='..bain.id..')'
else
bain = 'لا يوجد'
end
local jjjo = math.random(100);
Redis:incrby(FDFGERB.."boob"..msg.sender_id.user_id , jjjo)
Redis:sadd(FDFGERB.."ttpppi",msg.sender_id.user_id)   
ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
Redis:del(FDFGERB.."FDFGERB:Game:iui"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"• اجابتك صحيحة \n• اسمك ⇠ "..bain.." \n• لانك جاوبت صح اعطيتك ⇠ "..jjjo.." ريال 💸\n• صارت فلوسك ⇠ `"..ballancee.."` ريال 💸\n\n","md",true)  
end
end
if Redis:get(FDFGERB.."FDFGERB:Game:doll"..msg.chat_id) then
if text == Redis:get(FDFGERB.."FDFGERB:Game:doll"..msg.chat_id) then
local bain = LuaTele.getUser(msg.sender_id.user_id)
if bain.first_name then
bain = '['..bain.first_name..'](tg://user?id='..bain.id..')'
else
bain = 'لا يوجد'
end
local jjjo = math.random(100);
Redis:incrby(FDFGERB.."boob"..msg.sender_id.user_id , jjjo)
Redis:sadd(FDFGERB.."ttpppi",msg.sender_id.user_id) 
ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
Redis:del(FDFGERB.."FDFGERB:Game:doll"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"• اجابتك صحيحة \n• اسمك ⇠ "..bain.." \n• لانك جاوبت صح اعطيتك ⇠ "..jjjo.." ريال 💸\n• صارت فلوسك ⇠ `"..ballancee.."` ريال 💸\n\n","md",true)  
end
end
if Redis:get(FDFGERB.."FDFGERB:Game:Monotonous"..msg.chat_id) then
if text == Redis:get(FDFGERB.."FDFGERB:Game:Monotonous"..msg.chat_id) then
Redis:del(FDFGERB.."FDFGERB:Game:Monotonous"..msg.chat_id)
local bain = LuaTele.getUser(msg.sender_id.user_id)
if bain.first_name then
bain = '['..bain.first_name..'](tg://user?id='..bain.id..')'
else
bain = 'لا يوجد'
end
local jjjo = math.random(100);
Redis:incrby(FDFGERB.."boob"..msg.sender_id.user_id , jjjo)
Redis:sadd(FDFGERB.."ttpppi",msg.sender_id.user_id) 
ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0   
return LuaTele.sendText(msg_chat_id,msg_id,"• اجابتك صحيحة \n• اسمك ⇠ "..bain.." \n• لانك جاوبت صح اعطيتك ⇠ "..jjjo.." ريال 💸\n• صارت فلوسك ⇠ `"..ballancee.."` ريال 💸\n\n","md",true)  
end
end 
if Redis:get(FDFGERB.."FDFGERB:Game:Math"..msg.chat_id) then
if text == Redis:get(FDFGERB.."FDFGERB:Game:Math"..msg.chat_id) then
Redis:del(FDFGERB.."FDFGERB:Game:Math"..msg.chat_id)
local bain = LuaTele.getUser(msg.sender_id.user_id)
if bain.first_name then
bain = '['..bain.first_name..'](tg://user?id='..bain.id..')'
else
bain = 'لا يوجد'
end
local jjjo = math.random(100);
Redis:incrby(FDFGERB.."boob"..msg.sender_id.user_id , jjjo)
Redis:sadd(FDFGERB.."ttpppi",msg.sender_id.user_id) 
ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
return LuaTele.sendText(msg_chat_id,msg_id,"• اجابتك صحيحة \n• اسمك ⇠ "..bain.." \n• لانك جاوبت صح اعطيتك ⇠ "..jjjo.." ريال 💸\n• صارت فلوسك ⇠ `"..ballancee.."` ريال 💸\n\n","md",true)  
end
end 
if Redis:get(FDFGERB.."FDFGERB:Game:gamsloner"..msg.chat_id) then
if text == Redis:get(FDFGERB.."FDFGERB:Game:gamsloner"..msg.chat_id) then
Redis:del(FDFGERB.."FDFGERB:Game:gamsloner"..msg.chat_id)
local bain = LuaTele.getUser(msg.sender_id.user_id)
if bain.first_name then
bain = '['..bain.first_name..'](tg://user?id='..bain.id..')'
else
bain = 'لا يوجد'
end
local jjjo = math.random(100);
Redis:incrby(FDFGERB.."boob"..msg.sender_id.user_id , jjjo)
Redis:sadd(FDFGERB.."ttpppi",msg.sender_id.user_id)   
ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
return LuaTele.sendText(msg_chat_id,msg_id,"• اجابتك صحيحة \n• اسمك ⇠ "..bain.." \n• لانك جاوبت صح اعطيتك ⇠ "..jjjo.." ريال 💸\n• صارت فلوسك ⇠ `"..ballancee.."` ريال 💸\n\n","md",true)    
end
end 
if Redis:get(FDFGERB.."FDFGERB:Game:karamece"..msg.chat_id) then
if text == Redis:get(FDFGERB.."FDFGERB:Game:karamece"..msg.chat_id) then
Redis:del(FDFGERB.."FDFGERB:Game:karamece"..msg.chat_id)
local bain = LuaTele.getUser(msg.sender_id.user_id)
if bain.first_name then
bain = '['..bain.first_name..'](tg://user?id='..bain.id..')'
else
bain = 'لا يوجد'
end
local jjjo = math.random(100);
Redis:incrby(FDFGERB.."boob"..msg.sender_id.user_id , jjjo)
Redis:sadd(FDFGERB.."ttpppi",msg.sender_id.user_id)  
ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
return LuaTele.sendText(msg_chat_id,msg_id,"• اجابتك صحيحة \n• اسمك ⇠ "..bain.." \n• لانك جاوبت صح اعطيتك ⇠ "..jjjo.." ريال 💸\n• صارت فلوسك ⇠ `"..ballancee.."` ريال 💸\n\n","md",true)   
end
end 
if Redis:get(FDFGERB.."FDFGERB:Game:ouo"..msg.chat_id) then
if text == Redis:get(FDFGERB.."FDFGERB:Game:ouo"..msg.chat_id) then
local bain = LuaTele.getUser(msg.sender_id.user_id)
if bain.first_name then
bain = '['..bain.first_name..'](tg://user?id='..bain.id..')'
else
bain = 'لا يوجد'
end
local jjjo = math.random(100);
Redis:incrby(FDFGERB.."boob"..msg.sender_id.user_id , jjjo)
Redis:sadd(FDFGERB.."ttpppi",msg.sender_id.user_id) 
ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
Redis:del(FDFGERB.."FDFGERB:Game:ouo"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"• اجابتك صحيحة \n• اسمك ⇠ "..bain.." \n• لانك جاوبت صح اعطيتك ⇠ "..jjjo.." ريال 💸\n• صارت فلوسك ⇠ `"..ballancee.."` ريال 💸\n\n","md",true)  
end
end
if Redis:get(FDFGERB.."FDFGERB:shhseat"..msg.chat_id) then
if text == Redis:get(FDFGERB.."FDFGERB:shhseat"..msg.chat_id) then
Redis:del(FDFGERB.."FDFGERB:shhseat"..msg.chat_id)
local bain = LuaTele.getUser(msg.sender_id.user_id)
if bain.first_name then
bain = '['..bain.first_name..'](tg://user?id='..bain.id..')'
else
bain = 'لا يوجد'
end
local jjjo = math.random(100);
Redis:incrby(FDFGERB.."boob"..msg.sender_id.user_id , jjjo)
Redis:sadd(FDFGERB.."ttpppi",msg.sender_id.user_id)  
ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
return LuaTele.sendText(msg_chat_id,msg_id,"• اجابتك صحيحة \n• اسمك ⇠ "..bain.." \n• لانك جاوبت صح اعطيتك ⇠ "..jjjo.." ريال 💸\n• صارت فلوسك ⇠ `"..ballancee.."` ريال 💸\n\n","md",true)  
end
end 
if Redis:get(FDFGERB.."FDFGERB:Game:Countrygof"..msg.chat_id) then
if text == Redis:get(FDFGERB.."FDFGERB:Game:Countrygof"..msg.chat_id) then
Redis:del(FDFGERB.."FDFGERB:Game:Countrygof"..msg.chat_id)
local bain = LuaTele.getUser(msg.sender_id.user_id)
if bain.first_name then
bain = '['..bain.first_name..'](tg://user?id='..bain.id..')'
else
bain = 'لا يوجد'
end
local jjjo = math.random(100);
Redis:incrby(FDFGERB.."boob"..msg.sender_id.user_id , jjjo)
Redis:sadd(FDFGERB.."ttpppi",msg.sender_id.user_id) 
ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
return LuaTele.sendText(msg_chat_id,msg_id,"• اجابتك صحيحة \n• اسمك ⇠ "..bain.." \n• لانك جاوبت صح اعطيتك ⇠ "..jjjo.." ريال 💸\n• صارت فلوسك ⇠ `"..ballancee.."` ريال 💸\n\n","md",true)    
end
end 
if Redis:get(FDFGERB.."FDFGERB:Game:TrueFalse"..msg.chat_id) then
if text == Redis:get(FDFGERB.."FDFGERB:Game:TrueFalse"..msg.chat_id) then
Redis:del(FDFGERB.."FDFGERB:Game:TrueFalse"..msg.chat_id)
local bain = LuaTele.getUser(msg.sender_id.user_id)
if bain.first_name then
bain = '['..bain.first_name..'](tg://user?id='..bain.id..')'
else
bain = 'لا يوجد'
end
local jjjo = math.random(100);
Redis:incrby(FDFGERB.."boob"..msg.sender_id.user_id , jjjo)
Redis:sadd(FDFGERB.."ttpppi",msg.sender_id.user_id)    
ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
return LuaTele.sendText(msg_chat_id,msg_id,"• اجابتك صحيحة \n• اسمك ⇠ "..bain.." \n• لانك جاوبت صح اعطيتك ⇠ "..jjjo.." ريال 💸\n• صارت فلوسك ⇠ `"..ballancee.."` ريال 💸\n\n","md",true)  
end
end 
if Redis:get(FDFGERB.."FDFGERB:Game:Riddles"..msg.chat_id) then
if text == Redis:get(FDFGERB.."FDFGERB:Game:Riddles"..msg.chat_id) then
local bain = LuaTele.getUser(msg.sender_id.user_id)
if bain.first_name then
bain = '['..bain.first_name..'](tg://user?id='..bain.id..')'
else
bain = 'لا يوجد'
end
local jjjo = math.random(100);
Redis:incrby(FDFGERB.."boob"..msg.sender_id.user_id , jjjo)
Redis:sadd(FDFGERB.."ttpppi",msg.sender_id.user_id) 
ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
Redis:del(FDFGERB.."FDFGERB:Game:Riddles"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"• اجابتك صحيحة \n• اسمك ⇠ "..bain.." \n• لانك جاوبت صح اعطيتك ⇠ "..jjjo.." ريال 💸\n• صارت فلوسك ⇠ `"..ballancee.."` ريال 💸\n\n","md",true)   
end
end
if Redis:get(FDFGERB.."FDFGERB:Game:Meaningof"..msg.chat_id) then
if text == Redis:get(FDFGERB.."FDFGERB:Game:Meaningof"..msg.chat_id) then
local bain = LuaTele.getUser(msg.sender_id.user_id)
if bain.first_name then
bain = '['..bain.first_name..'](tg://user?id='..bain.id..')'
else
bain = 'لا يوجد'
end
local jjjo = math.random(100);
Redis:incrby(FDFGERB.."boob"..msg.sender_id.user_id , jjjo)
Redis:sadd(FDFGERB.."ttpppi",msg.sender_id.user_id)    
ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
Redis:del(FDFGERB.."FDFGERB:Game:Meaningof"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"• اجابتك صحيحة \n• اسمك ⇠ "..bain.." \n• لانك جاوبت صح اعطيتك ⇠ "..jjjo.." ريال 💸\n• صارت فلوسك ⇠ `"..ballancee.."` ريال 💸\n\n","md",true)   
end
end
if Redis:get(FDFGERB.."FDFGERB:Game:Reflection"..msg.chat_id) then
if text == Redis:get(FDFGERB.."FDFGERB:Game:Reflection"..msg.chat_id) then
local bain = LuaTele.getUser(msg.sender_id.user_id)
if bain.first_name then
bain = '['..bain.first_name..'](tg://user?id='..bain.id..')'
else
bain = 'لا يوجد'
end
local jjjo = math.random(100);
Redis:incrby(FDFGERB.."boob"..msg.sender_id.user_id , jjjo)
Redis:sadd(FDFGERB.."ttpppi",msg.sender_id.user_id)   
ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
Redis:del(FDFGERB.."FDFGERB:Game:Reflection"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"• اجابتك صحيحة \n• اسمك ⇠ "..bain.." \n• لانك جاوبت صح اعطيتك ⇠ "..jjjo.." ريال 💸\n• صارت فلوسك ⇠ `"..ballancee.."` ريال 💸\n\n","md",true)   
end
end
if Redis:get(FDFGERB.."FDFGERB:Game:Difference"..msg.chat_id) then
if text == Redis:get(FDFGERB.."FDFGERB:Game:Difference"..msg.chat_id) then 
Redis:del(FDFGERB.."FDFGERB:Game:Difference"..msg.chat_id)
local bain = LuaTele.getUser(msg.sender_id.user_id)
if bain.first_name then
bain = '['..bain.first_name..'](tg://user?id='..bain.id..')'
else
bain = 'لا يوجد'
end
local jjjo = math.random(100);
Redis:incrby(FDFGERB.."boob"..msg.sender_id.user_id , jjjo)
Redis:sadd(FDFGERB.."ttpppi",msg.sender_id.user_id)  
ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
return LuaTele.sendText(msg_chat_id,msg_id,"• اجابتك صحيحة \n• اسمك ⇠ "..bain.." \n• لانك جاوبت صح اعطيتك ⇠ "..jjjo.." ريال 💸\n• صارت فلوسك ⇠ `"..ballancee.."` ريال 💸\n\n","md",true)     
else
Redis:del(FDFGERB.."FDFGERB:Game:Difference"..msg.chat_id)
ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
return LuaTele.sendText(msg_chat_id,msg_id,"• اجابتك صحيحة \n• اسمك ⇠ "..bain.." \n• لانك جاوبت صح اعطيتك ⇠ "..jjjo.." ريال 💸\n• صارت فلوسك ⇠ `"..ballancee.."` ريال 💸\n\n","md",true)   
end
end
if Redis:get(FDFGERB.."FDFGERB:Game:Example"..msg.chat_id) then
if text == Redis:get(FDFGERB.."FDFGERB:Game:Example"..msg.chat_id) then 
Redis:del(FDFGERB.."FDFGERB:Game:Example"..msg.chat_id)
local bain = LuaTele.getUser(msg.sender_id.user_id)
if bain.first_name then
bain = '['..bain.first_name..'](tg://user?id='..bain.id..')'
else
bain = 'لا يوجد'
end
local jjjo = math.random(100);
Redis:incrby(FDFGERB.."boob"..msg.sender_id.user_id , jjjo)
Redis:sadd(FDFGERB.."ttpppi",msg.sender_id.user_id) 
ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
return LuaTele.sendText(msg_chat_id,msg_id,"• اجابتك صحيحة \n• اسمك ⇠ "..bain.." \n• لانك جاوبت صح اعطيتك ⇠ "..jjjo.." ريال 💸\n• صارت فلوسك ⇠ `"..ballancee.."` ريال 💸\n\n","md",true)  
end
end
if Redis:get(FDFGERB.."Start_Ahkam"..msg.chat_id) then
if text == "انا" then
if Redis:sismember(FDFGERB..'List_Ahkam'..msg.chat_id,msg.sender_id.user_id) then
return LuaTele.sendText(msg.chat_id,msg.id,'• انت مضاف من قبل .',"md",true)
end
Redis:sadd(FDFGERB..'List_Ahkam'..msg.chat_id,msg.sender_id.user_id)
Redis:setex(FDFGERB.."Witting_StartGameh"..msg.chat_id,1400,true)
return LuaTele.sendText(msg.chat_id,msg.id,'• تم ضفتك للعبة \n• للانتهاء يرسل نعم اللي بدء اللعبة .',"md",true)
end
end

if Redis:get(FDFGERB.."Start_Ahkamm"..msg.chat_id) then
if text == "انا" then
if Redis:sismember(FDFGERB..'List_Ahkamm'..msg.chat_id,msg.sender_id.user_id) then
return LuaTele.sendText(msg.chat_id,msg.id,'• انت مضاف من قبل .',"md",true)
end
Redis:sadd(FDFGERB..'List_Ahkamm'..msg.chat_id,msg.sender_id.user_id)
Redis:setex(FDFGERB.."Witting_StartGamehh"..msg.chat_id,1400,true)
return LuaTele.sendText(msg.chat_id,msg.id,'• تم ضفتك للعبة \n• للانتهاء يرسل نعم اللي بدء اللعبة .',"md",true)
end
end
if text then
local NewCmmd = Redis:get(FDFGERB.."FDFGERB:Get:Reides:Commands:Group"..msg_chat_id..":"..text)
if NewCmmd then
text = (NewCmmd or text)
end
end



if text == 'رفع سورس اريك' and msg.reply_to_message_id ~= 0  then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
if Message_Reply.content.document then
local File_Id = Message_Reply.content.document.document.remote.id
local Name_File = Message_Reply.content.document.file_name
if Name_File ~= 'FDFGERB.lua' then
return LuaTele.sendText(msg_chat_id,msg_id,'• عذرا هذا الملف ليس سورسك')
end 
os.execute('rm -rf FDFGERB.lua')
local File = json:decode(https.request('https://api.telegram.org/bot'..Token..'/getfile?file_id='..File_Id)) 
local download_ = download('https://api.telegram.org/file/bot'..Token..'/'..File.result.file_path,''..Name_File) 
return LuaTele.sendText(msg_chat_id,msg_id,'• تم رفع سورس اريك اكتب تحديث')
end 
end

if text == 'رفع النسخه العامه' and msg.reply_to_message_id ~= 0 or text == 'رفع النسخه الاحتياطيه' and msg.reply_to_message_id ~= 0 then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
if Message_Reply.content.document then
local File_Id = Message_Reply.content.document.document.remote.id
local Name_File = Message_Reply.content.document.file_name
if Name_File ~= UserBot..'.json' then
return LuaTele.sendText(msg_chat_id,msg_id,' • عذرا هاذا الملف غير مطابق مع البوت يرجى جلب النسخه الحقيقيه')
end -- end Namefile
local File = json:decode(https.request('https://api.telegram.org/bot'..Token..'/getfile?file_id='..File_Id)) 
local download_ = download('https://api.telegram.org/file/bot'..Token..'/'..File.result.file_path,''..Name_File) 
local Get_Info = io.open(download_,"r"):read('*a')
local FilesJson = JSON.decode(Get_Info)
if tonumber(FDFGERB) ~= tonumber(FilesJson.BotId) then
return LuaTele.sendText(msg_chat_id,msg_id,' • عذرا هاذا الملف غير مطابق مع البوت يرجى جلب النسخه الحقيقيه')
end -- end botid
LuaTele.sendText(msg_chat_id,msg_id,' • جاري استرجاع المشتركين و القروبات ...')
Y = 0
for k,v in pairs(FilesJson.UsersBot) do
Y = Y + 1
Redis:sadd(FDFGERB..'FDFGERB:Num:User:Pv',v)  
end
X = 0
for GroupId,ListGroup in pairs(FilesJson.GroupsBot) do
X = X + 1
Redis:sadd(FDFGERB.."FDFGERB:ChekBotAdd",GroupId) 
if ListGroup.President then
for k,v in pairs(ListGroup.President) do
Redis:sadd(FDFGERB.."FDFGERB:TheBasics:Group"..GroupId,v)
end
end
if ListGroup.Constructor then
for k,v in pairs(ListGroup.Constructor) do
Redis:sadd(FDFGERB.."FDFGERB:Originators:Group"..GroupId,v)
end
end
if ListGroup.Manager then
for k,v in pairs(ListGroup.Manager) do
Redis:sadd(FDFGERB.."FDFGERB:Managers:Group"..GroupId,v)
end
end
if ListGroup.Admin then
for k,v in pairs(ListGroup.Admin) do
Redis:sadd(FDFGERB.."FDFGERB:Addictive:Group"..GroupId,v)
end
end
if ListGroup.Vips then
for k,v in pairs(ListGroup.Vips) do
Redis:sadd(FDFGERB.."FDFGERB:Distinguished:Group"..GroupId,v)
end
end 
end
return LuaTele.sendText(msg_chat_id,msg_id,' • تم استرجاع  ( '..X..' ) مجموعه \n • واسترجاع ( '..Y..' ) مشترك في البوت')
end
end
if text == 'رفع نسخه قديمه' and msg.reply_to_message_id ~= 0 then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
if Message_Reply.content.document then
local File_Id = Message_Reply.content.document.document.remote.id
local Name_File = Message_Reply.content.document.file_name
if tonumber(Name_File:match('(%d+)')) ~= tonumber(FDFGERB) then 
return LuaTele.sendText(msg_chat_id,msg_id,'• عذرا هاذا الملف غير مطابق مع البوت يرجى جلب النسخه الحقيقيه')
end -- end Namefile
local File = json:decode(https.request('https://api.telegram.org/bot'..Token..'/getfile?file_id='..File_Id)) 
local download_ = download('https://api.telegram.org/file/bot'..Token..'/'..File.result.file_path,''..Name_File) 
local Get_Info = io.open(download_,"r"):read('a')
local All_Groups = JSON.decode(Get_Info)
if All_Groups.GP_BOT then
for idg,v in pairs(All_Groups.GP_BOT) do
Redis:sadd(FDFGERB.."FDFGERB:ChekBotAdd",idg) 
if v.MNSH then
for k,idmsh in pairs(v.MNSH) do
Redis:sadd(FDFGERB.."FDFGERB:Originators:Group"..idg,idmsh)
end;end
if v.MDER then
for k,idmder in pairs(v.MDER) do
Redis:sadd(FDFGERB.."FDFGERB:Managers:Group"..idg,idmder)  
end;end
if v.MOD then
for k,idmod in pairs(v.MOD) do
Redis:sadd(FDFGERB.."FDFGERB:Addictive:Group"..idg,idmod)
end;end
if v.ASAS then
for k,idASAS in pairs(v.ASAS) do
Redis:sadd(FDFGERB.."FDFGERB:TheBasics:Group"..idg,idASAS)
end;end
end
return LuaTele.sendText(msg_chat_id,msg_id,'• تم استرجاع المجموعات من نسخه قديمه')
else
return LuaTele.sendText(msg_chat_id,msg_id,'• الملف لا يدعم هاذا البوت')
end
end
end
if (Redis:get(FDFGERB..'FDFGERB:Channel:Redis'..msg_chat_id..':'..msg.sender_id.user_id) == 'true') then
if text == 'الغاء' or text == 'الغاء الامر •' then 
Redis:del(FDFGERB..'FDFGERB:Channel:Redis'..msg_chat_id..':'..msg.sender_id.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,'• تم الغاء حفظ قناة الاشتراك')
end
Redis:del(FDFGERB..'FDFGERB:Channel:Redis'..msg_chat_id..':'..msg.sender_id.user_id)
if text and text:match("^@[%a%d_]+$") then
local UserId_Info = LuaTele.searchPublicChat(text)
if not UserId_Info.id then
Redis:del(FDFGERB..'FDFGERB:Channel:Redis'..msg_chat_id..':'..msg.sender_id.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,"\n• مافيه حساب بهذا اليوزر ","md",true)  
end
local ChannelUser = text:gsub('@','')
if UserId_Info.type.is_channel == true then
local StatusMember = LuaTele.getChatMember(UserId_Info.id,FDFGERB).status.luatele
if (StatusMember ~= "chatMemberStatusAdministrator") then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• البوت عضو في القناة يرجى رفع البوت ادمن واعادة وضع الاشتراك ","md",true)  
end
Redis:set(FDFGERB..'FDFGERB:Channel:Join',ChannelUser) 
Redis:set(FDFGERB..'FDFGERB:Channel:Join:Name',UserId_Info.title) 
return LuaTele.sendText(msg_chat_id,msg_id,"\n• تم تعيين الاشتراك الاجباري على قناة : [ @"..ChannelUser..' ]',"md",true)  
else
return LuaTele.sendText(msg_chat_id,msg_id,"\n• هاذا ليس معرف قناة يرجى ارسال معرف القناة الصحيح: [ @"..ChannelUser..' ]',"md",true)  
end
end
end
if text == 'تعطيل مغادره' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = 't.me/'..Redis:get(FDFGERB..'Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه ',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:LeftBot",true) 
return LuaTele.sendText(msg_chat_id,msg_id," • تم تعطيل مغادره  ","md",true)
end
if text == 'تفعيل مغادره' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = 't.me/'..Redis:get(FDFGERB..'Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n • يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:LeftBot",true) 
return LuaTele.sendText(msg_chat_id,msg_id," • تم تفعيل مغادره بوت للمطورين ","md",true)
end
if text == 'تفعيل الاشتراك الاجباري' or text == 'تفعيل الاشتراك الاجباري •' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
Redis:set(FDFGERB..'FDFGERB:Channel:Redis'..msg_chat_id..':'..msg.sender_id.user_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ارسل الي الان قناة الاشتراك ","md",true)  
end
if text == 'تعطيل الاشتراك الاجباري' or text == 'تعطيل الاشتراك الاجباري •' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
Redis:del(FDFGERB..'FDFGERB:Channel:Join')
return LuaTele.sendText(msg_chat_id,msg_id,"\n• تم تعطيل الاشتراك الاجباري","md",true)  
end
if text == 'تغيير الاشتراك الاجباري' or text == 'تغيير الاشتراك الاجباري •' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
Redis:set(FDFGERB..'FDFGERB:Channel:Redis'..msg_chat_id..':'..msg.sender_id.user_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ارسل الي الان قناة الاشتراك ","md",true)  
end
if text == 'الاشتراك الاجباري' or text == 'الاشتراك الاجباري •' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
local Channel = Redis:get(FDFGERB..'FDFGERB:Channel:Join')
if Channel then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• الاشتراك الاجباري مفعل على : [ @"..Channel..' ]',"md",true)  
else
return LuaTele.sendText(msg_chat_id,msg_id,"\n• لا توجد قناة في الاشتراك ارسل تغيير الاشتراك الاجباري","md",true)  
end
end
if text == 'تحديث السورس' or text == 'تحديث السورس •' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
os.execute('rm -rf FDFGERB.lua')
download('https://raw.githubusercontent.com/karamalansari/Ericsor/main/FDFGERB.lua','FDFGERB.lua')
return LuaTele.sendText(msg_chat_id,msg_id,'*\n تحديث السورس •*  ',"md",true)  
end
if text == "القروبات •" or text == "القروبات" then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
local G = "القروبات البوت :\n"
local list = Redis:smembers(FDFGERB..'FDFGERB:ChekBotAdd')  
for k,v in pairs(list) do  
local Get_Chat = LuaTele.getChat(v)
local Info_Chats = LuaTele.getSupergroupFullInfo(v)
if Info_Chats and Info_Chats.invite_link then
link = Info_Chats.invite_link.invite_link
else
link = "لا يوجد" 
end
if Get_Chat and Get_Chat.title then
title = Get_Chat.title
else 
title = "لا يوجد" 
end
G = G.."اسم القروب : "..title.."\n ايدي القروب : "..v.."\nرابط القروب : "..link.."\n\n"
end
local File = io.open('./'..UserBot..'.txt', "w")
File:write(G)
File:close()
LuaTele.sendDocument(msg_chat_id,msg_id,'./'..UserBot..'.txt', '• تم جلب القروبات\n', 'md')
end
if text == 'جلب النسخه الاحتياطيه •' or text == 'جلب نسخه احتياطيه' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
local Groups = Redis:smembers(FDFGERB..'FDFGERB:ChekBotAdd')  
local UsersBot = Redis:smembers(FDFGERB..'FDFGERB:Num:User:Pv')  
local Get_Json = '{"BotId": '..FDFGERB..','  
if #UsersBot ~= 0 then 
Get_Json = Get_Json..'"UsersBot":['  
for k,v in pairs(UsersBot) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"'
end
end   
Get_Json = Get_Json..']'
end
Get_Json = Get_Json..',"GroupsBot":{'
for k,v in pairs(Groups) do   
local President = Redis:smembers(FDFGERB.."FDFGERB:Supcreator:Group"..v)
local Constructor = Redis:smembers(FDFGERB.."FDFGERB:Creator:Group"..v)
local Manager = Redis:smembers(FDFGERB.."FDFGERB:Manger:Group"..v)
local Admin = Redis:smembers(FDFGERB.."FDFGERB:Admin:Group"..v)
local Vips = Redis:smembers(FDFGERB.."FDFGERB:Special:Group"..v)
if k == 1 then
Get_Json = Get_Json..'"'..v..'":{'
else
Get_Json = Get_Json..',"'..v..'":{'
end
if #President ~= 0 then 
Get_Json = Get_Json..'"President":['
for k,v in pairs(President) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"'
end
end   
Get_Json = Get_Json..'],'
end
if #Constructor ~= 0 then
Get_Json = Get_Json..'"Constructor":['
for k,v in pairs(Constructor) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"'
end
end   
Get_Json = Get_Json..'],'
end
if #Manager ~= 0 then
Get_Json = Get_Json..'"Manager":['
for k,v in pairs(Manager) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"'
end
end   
Get_Json = Get_Json..'],'
end
if #Admin ~= 0 then
Get_Json = Get_Json..'"Admin":['
for k,v in pairs(Admin) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"'
end
end   
Get_Json = Get_Json..'],'
end
if #Vips ~= 0 then
Get_Json = Get_Json..'"Vips":['
for k,v in pairs(Vips) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"'
end
end   
Get_Json = Get_Json..'],'
end
Get_Json = Get_Json..'"Dev":"EE3WW"}'
end
Get_Json = Get_Json..'}}'
local File = io.open('./'..UserBot..'.json', "w")
File:write(Get_Json)
File:close()
return LuaTele.sendDocument(msg_chat_id,msg_id,'./'..UserBot..'.json', '• تم جلب النسخه الاحتياطيه\n•تحتوي على {'..#Groups..'} مجموعات \n•وتحتوي على {'..#UsersBot..'} مشترك \n', 'md')
end
if text == 'جلب نسخه الردود' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
local Get_Json = '{"BotId": '..FDFGERB..','  
Get_Json = Get_Json..'"GroupsBotreply":{'
local Groups = Redis:smembers(FDFGERB..'FDFGERB:ChekBotAdd')  
for k,ide in pairs(Groups) do   
listrep = Redis:smembers(FDFGERB.."FDFGERB:List:Manager"..ide.."")
if k == 1 then
Get_Json = Get_Json..'"'..ide..'":{'
else
Get_Json = Get_Json..',"'..ide..'":{'
end
if #listrep >= 5 then
for k,v in pairs(listrep) do
if Redis:get(FDFGERB.."FDFGERB:Add:Rd:Manager:Gif"..v..ide) then
db = "gif@"..Redis:get(FDFGERB.."FDFGERB:Add:Rd:Manager:Gif"..v..ide)
elseif Redis:get(FDFGERB.."FDFGERB:Add:Rd:Manager:Vico"..v..ide) then
db = "Vico@"..Redis:get(FDFGERB.."FDFGERB:Add:Rd:Manager:Vico"..v..ide)
elseif Redis:get(FDFGERB.."FDFGERB:Add:Rd:Manager:Stekrs"..v..ide) then
db = "Stekrs@"..Redis:get(FDFGERB.."FDFGERB:Add:Rd:Manager:Stekrs"..v..ide)
elseif Redis:get(FDFGERB.."FDFGERB:Add:Rd:Manager:Text"..v..ide) then
db = "Text@"..Redis:get(FDFGERB.."FDFGERB:Add:Rd:Manager:Text"..v..ide)
db = string.gsub(db,'"','')
db = string.gsub(db,"'",'')
db = string.gsub(db,'','')
db = string.gsub(db,'`','')
db = string.gsub(db,'{','')
db = string.gsub(db,'}','')
db = string.gsub(db,'\n',' ')
elseif Redis:get(FDFGERB.."FDFGERB:Add:Rd:Manager:Photo"..v..ide) then
db = "Photo@"..Redis:get(FDFGERB.."FDFGERB:Add:Rd:Manager:Photo"..v..ide) 
elseif Redis:get(FDFGERB.."FDFGERB:Add:Rd:Manager:Video"..v..ide) then
db = "Video@"..Redis:get(FDFGERB.."FDFGERB:Add:Rd:Manager:Video"..v..ide)
elseif Redis:get(FDFGERB.."FDFGERB:Add:Rd:Manager:File"..v..ide) then
db = "File@"..Redis:get(FDFGERB.."FDFGERB:Add:Rd:Manager:File"..v..ide)
elseif Redis:get(FDFGERB.."FDFGERB:Add:Rd:Manager:Audio"..v..ide) then
db = "Audio@"..Redis:get(FDFGERB.."FDFGERB:Add:Rd:Manager:Audio"..v..ide)
elseif Redis:get(FDFGERB.."FDFGERB:Add:Rd:Manager:video_note"..v..ide) then
db = "video_note@"..Redis:get(FDFGERB.."FDFGERB:Add:Rd:Manager:video_note"..v..ide)
end
v = string.gsub(v,'"','')
v = string.gsub(v,"'",'')
Get_Json = Get_Json..'"'..v..'":"'..db..'",'
end   
Get_Json = Get_Json..'"orab":"ok"'
end
Get_Json = Get_Json..'}'
end
Get_Json = Get_Json..'}}'
local File = io.open('./ReplyGroups.json', "w")
File:write(Get_Json)
File:close()
return LuaTele.sendDocument(msg_chat_id,msg_id,'./ReplyGroups.json', '', 'md')
end
if text == 'رفع نسخه الردود' and msg.reply_to_message_id ~= 0 then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
if Message_Reply.content.document then
local File_Id = Message_Reply.content.document.document.remote.id
local Name_File = Message_Reply.content.document.file_name
local File = json:decode(https.request('https://api.telegram.org/bot'..Token..'/getfile?file_id='..File_Id)) 
local download_ = download('https://api.telegram.org/file/bot'..Token..'/'..File.result.file_path,''..Name_File) 
local Get_Info = io.open(download_,"r"):read('a')
local Reply_Groups = JSON.decode(Get_Info) 
for GroupId,ListGroup in pairs(Reply_Groups.GroupsBotreply) do
if ListGroup.orab == "ok" then
for k,v in pairs(ListGroup) do
Redis:sadd(FDFGERB.."FDFGERB:List:Manager"..GroupId,k)
if v and v:match('gif@(.*)') then
Redis:set(FDFGERB.."FDFGERB:Add:Rd:Manager:Gif"..k..GroupId,v:match('gif@(.*)'))
elseif v and v:match('Vico@(.*)') then
Redis:set(FDFGERB.."FDFGERB:Add:Rd:Manager:Vico"..k..GroupId,v:match('Vico@(.*)'))
elseif v and v:match('Stekrs@(.*)') then
Redis:set(FDFGERB.."FDFGERB:Add:Rd:Manager:Stekrs"..k..GroupId,v:match('Stekrs@(.*)'))
elseif v and v:match('Text@(.*)') then
Redis:set(FDFGERB.."FDFGERB:Add:Rd:Manager:Text"..k..GroupId,v:match('Text@(.*)'))
elseif v and v:match('Photo@(.*)') then
Redis:set(FDFGERB.."FDFGERB:Add:Rd:Manager:Photo"..k..GroupId,v:match('Photo@(.*)'))
elseif v and v:match('Video@(.*)') then
Redis:set(FDFGERB.."FDFGERB:Add:Rd:Manager:Video"..k..GroupId,v:match('Video@(.*)'))
elseif v and v:match('File@(.*)') then
Redis:set(FDFGERB.."FDFGERB:Add:Rd:Manager:File"..k..GroupId,v:match('File@(.*)') )
elseif v and v:match('Audio@(.*)') then
Redis:set(FDFGERB.."FDFGERB:Add:Rd:Manager:Audio"..k..GroupId,v:match('Audio@(.*)'))
elseif v and v:match('video_note@(.*)') then
Redis:set(FDFGERB.."FDFGERB:Add:Rd:Manager:video_note"..k..GroupId,v:match('video_note@(.*)') )
end
end
end
end
return LuaTele.sendText(msg_chat_id,msg_id,'\n• تم استرجاع ردود المجموعات',"md",true)  
end
end
if text and text:match("^تعين عدد الاعضاء (%d+)$") then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB..'FDFGERB:Num:Add:Bot',text:match("تعين عدد الاعضاء (%d+)$") ) 
LuaTele.sendText(msg_chat_id,msg_id,'• تم تعيين عدد اعضاء تفعيل البوت اكثر من : '..text:match("تعين عدد الاعضاء (%d+)$")..' عضو ',"md",true)  
elseif text == 'الاحصائيات' or text == 'حصه' or text == 'حصتي' then
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Myth🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
LuaTele.sendText(msg_chat_id,msg_id,'• عدد احصائيات البوت الكامله \n━━━━━\n• عدد المجموعات : '..(Redis:scard(FDFGERB..'FDFGERB:ChekBotAdd') or 0)..'\n• عدد المشتركين : '..(Redis:scard(FDFGERB..'FDFGERB:Num:User:Pv') or 0)..'',"md",true)  
end
if text == 'تفعيل' and msg.Developers then
if Redis:sismember(FDFGERB..'ban:online',msg.chat_id) then
LuaTele.sendText(msg_chat_id,msg_id,"\n• هذا القروب محظور من قبل المطور  .","md",true)  
sleep(2)
LuaTele.leaveChat(msg.chat_id)
return false 
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ارفعني مشرف و اعطيني صلاحيات كامله ي غبي !!","md",true)  
end
local Info_Members = LuaTele.getSupergroupMembers(msg_chat_id, "Administrators", "", 0, 200)
local List_Members = Info_Members.members
x = 0
y = 0
for k, v in pairs(List_Members) do
if Info_Members.members[k].bot_info == nil then
if Info_Members.members[k].status.luatele == "chatMemberStatusCreator" then
Redis:sadd(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id,v.member_id.user_id) 
x = x + 1
else
Redis:sadd(FDFGERB.."FDFGERB:Addictive:Group"..msg_chat_id,v.member_id.user_id) 
y = y + 1
end
end
end
local Get_Chat = LuaTele.getChat(msg_chat_id)
local Info_Chats = LuaTele.getSupergroupFullInfo(msg_chat_id)
if Redis:sismember(FDFGERB.."FDFGERB:ChekBotAdd",msg_chat_id) then
if tonumber(Info_Chats.member_count) < tonumber((Redis:get(FDFGERB..'FDFGERB:Num:Add:Bot') or 0)) and not msg.ControllerBot then
return LuaTele.sendText(msg_chat_id,msg_id,'• عدد الاعضاء قليل لا يمكن تفعيل المجموعه يجب ان يكون اكثر من :'..Redis:get(FDFGERB..'FDFGERB:Num:Add:Bot'),"md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'\n• المجموعه ⇠ ['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')\n• البوت مفعل من قبل ! ',"md",true)  
else
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '', data = msg.sender_id.user_id..'/addAdmins@'..msg_chat_id},{text = '', data =msg.sender_id.user_id..'/LockAllGroup@'..msg_chat_id},
},
}
}
if not msg.ControllerBot then
local UserInfo = LuaTele.getUser(msg.sender_id.user_id)
for Name_User in string.gmatch(UserInfo.first_name, "[^%s]+" ) do
UserInfo.first_name = Name_User
break
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- مغادرة المجموعه ', data = '/leftgroup@'..msg_chat_id}, 
},
{
{text = Get_Chat.title, url = Info_Chats.invite_link.invite_link}, 
},
}
}
LuaTele.sendText(Sudo_Id,0,'\n• تم تفعيل مجموعه جديده \n• من قام بتفعيلها : {['..UserInfo.first_name..'](tg://user?id='..msg.sender_id.user_id..')} \n• معلومات المجموعه :\n• عدد الاعضاء : '..Info_Chats.member_count..'\n• عدد الادمنيه : '..Info_Chats.administrator_count..'\n• عدد المطرودين : '..Info_Chats.banned_count..'\n• عدد المقيدين : '..Info_Chats.restricted_count..'',"md",true, false, false, false, reply_markup)
end
Redis:sadd(FDFGERB.."FDFGERB:ChekBotAdd",msg_chat_id)
Redis:set(FDFGERB.."FDFGERB:Status:Id"..msg_chat_id,true) ;Redis:set(FDFGERB.."FDFGERB:Status:Reply"..msg_chat_id,true) ;Redis:set(FDFGERB.."FDFGERB:Status:ReplySudo"..msg_chat_id,true) ;Redis:set(FDFGERB.."FDFGERB:Status:BanId"..msg_chat_id,true) ;Redis:set(FDFGERB.."FDFGERB:Status:SetId"..msg_chat_id,true) 
local Info_Members = LuaTele.getSupergroupMembers(msg_chat_id, "Administrators", "", 0, 200)
local List_Members = Info_Members.members
x = 0
y = 0
for k, v in pairs(List_Members) do
if Info_Members.members[k].bot_info == nil then
if Info_Members.members[k].status.luatele == "chatMemberStatusCreator" then
Redis:sadd(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id,v.member_id.user_id) 
x = x + 1
else
Redis:sadd(FDFGERB.."FDFGERB:Addictive:Group"..msg_chat_id,v.member_id.user_id) 
y = y + 1
end
end
end
return LuaTele.sendText(msg_chat_id,msg_id,'\n• تم تفعيل  \n• المجموعه ⇠ ['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')\n• تم تفعيلها ورفع الادمنيه ( '..y..' ) ','md', true, false, false, false, reply_markup)
end
end 
if text == 'تفعيل' and not msg.Developers then
if Redis:sismember(FDFGERB..'ban:online',msg.chat_id) then
LuaTele.sendText(msg_chat_id,msg_id,"\n• هذا القروب محظور من قبل المطور  .","md",true)  
sleep(2)
LuaTele.leaveChat(msg.chat_id)
return false 
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ارفعني مشرف و اعطيني صلاحيات كامله ي غبي !!","md",true)  
end
local StatusMember = LuaTele.getChatMember(msg_chat_id,msg.sender_id.user_id).status.luatele
if (StatusMember == "chatMemberStatusCreator") then
local AddedBot = true
elseif (StatusMember == "chatMemberStatusAdministrator") then
local AddedBot = true
else
local AddedBot = false
end
if AddedBot == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرا انت لست ادمن او مالك المجموعه ","md",true)  
end

if not Redis:get(FDFGERB.."FDFGERB:BotFree") then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• الوضع الخدمي تم تعطيله من قبل مطور البوت ","md",true)  
end
local Get_Chat = LuaTele.getChat(msg_chat_id)
local Info_Chats = LuaTele.getSupergroupFullInfo(msg_chat_id)
if Redis:sismember(FDFGERB.."FDFGERB:ChekBotAdd",msg_chat_id) then
if tonumber(Info_Chats.member_count) < tonumber((Redis:get(FDFGERB..'FDFGERB:Num:Add:Bot') or 0)) and not msg.ControllerBot then
return LuaTele.sendText(msg_chat_id,msg_id,'• عدد الاعضاء قليل لا يمكن تفعيل المجموعه يجب ان يكون اكثر من :'..Redis:get(FDFGERB..'FDFGERB:Num:Add:Bot'),"md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'\n• المجموعه ⇠ ['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')\n• تم تفعيلها مسبقا ',"md",true)  
else
if not msg.ControllerBot then
local UserInfo = LuaTele.getUser(msg.sender_id.user_id)
for Name_User in string.gmatch(UserInfo.first_name, "[^%s]+" ) do
UserInfo.first_name = Name_User
break
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- مغادرة المجموعه ', data = '/leftgroup@'..msg_chat_id}, 
},
{
{text = Get_Chat.title, url = Info_Chats.invite_link.invite_link}, 
},
}
}
LuaTele.sendText(Sudo_Id,0,'\n• تم تفعيل مجموعه جديده \n• من قام بتفعيلها : {['..UserInfo.first_name..'](tg://user?id='..msg.sender_id.user_id..')} \n• معلومات المجموعه :\n• عدد الاعضاء : '..Info_Chats.member_count..'\n• عدد الادمنيه : '..Info_Chats.administrator_count..'\n• عدد المطرودين : '..Info_Chats.banned_count..'\n• عدد المقيدين : '..Info_Chats.restricted_count..'',"md",true, false, false, false, reply_markup)
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '', data = msg.sender_id.user_id..'/addAdmins@'..msg_chat_id},{text = '', data =msg.sender_id.user_id..'/LockAllGroup@'..msg_chat_id},
},
}
}
Redis:sadd(FDFGERB.."FDFGERB:ChekBotAdd",msg_chat_id)
Redis:set(FDFGERB.."FDFGERB:Status:Id"..msg_chat_id,true) ;Redis:set(FDFGERB.."FDFGERB:Status:Reply"..msg_chat_id,true) ;Redis:set(FDFGERB.."FDFGERB:Status:ReplySudo"..msg_chat_id,true) ;Redis:set(FDFGERB.."FDFGERB:Status:BanId"..msg_chat_id,true) ;Redis:set(FDFGERB.."FDFGERB:Status:SetId"..msg_chat_id,true) 
local Info_Members = LuaTele.getSupergroupMembers(msg_chat_id, "Administrators", "", 0, 200)
local List_Members = Info_Members.members
x = 0
y = 0
for k, v in pairs(List_Members) do
if Info_Members.members[k].bot_info == nil then
if Info_Members.members[k].status.luatele == "chatMemberStatusCreator" then
Redis:sadd(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id,v.member_id.user_id) 
x = x + 1
else
Redis:sadd(FDFGERB.."FDFGERB:Addictive:Group"..msg_chat_id,v.member_id.user_id) 
y = y + 1
end
end
end
return LuaTele.sendText(msg_chat_id,msg_id,'\n•  تم تفعيل البوت \n• المجموعه ⇠ ['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')\n• تم تفعيلها ورفع الادمنيه ( '..y..' ) ','md', true, false, false, false, reply_markup)
end
end
if text == 'تعطيل' and msg.Developers then
local Get_Chat = LuaTele.getChat(msg_chat_id)
local Info_Chats = LuaTele.getSupergroupFullInfo(msg_chat_id)
if not Redis:sismember(FDFGERB.."FDFGERB:ChekBotAdd",msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• المجموعه ⇠ ['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..') \n• تم تعطيلها مسبقا ',"md",true)  
else
if not msg.ControllerBot then
local UserInfo = LuaTele.getUser(msg.sender_id.user_id)
for Name_User in string.gmatch(UserInfo.first_name, "[^%s]+" ) do
UserInfo.first_name = Name_User
break
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = Get_Chat.title, url = Info_Chats.invite_link.invite_link}, 
},
}
}
LuaTele.sendText(Sudo_Id,0,'\n• تم تعطيل مجموعه جديده \n• من قام بتعطيلها : ['..UserInfo.first_name..'](tg://user?id='..msg.sender_id.user_id..')\n• معلومات المجموعه :\n• عدد الاعضاء : '..Info_Chats.member_count..'\n• عدد الادمنيه : '..Info_Chats.administrator_count..'\n• عدد المطرودين : '..Info_Chats.banned_count..'\n🔕|عدد المقيدين : '..Info_Chats.restricted_count..'',"md",true, false, false, false, reply_markup)
end
Redis:srem(FDFGERB.."FDFGERB:ChekBotAdd",msg_chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,'\n• المجموعه ⇠ ['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..') \n• تم تعطيلها  ','md',true)
end
end
if text == 'تعطيل' and not msg.Developers then
local StatusMember = LuaTele.getChatMember(msg_chat_id,msg.sender_id.user_id).status.luatele
if (StatusMember == "chatMemberStatusCreator") then
local AddedBot = true
elseif (StatusMember == "chatMemberStatusAdministrator") then
local AddedBot = true
else
local AddedBot = false
end
if AddedBot == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرا انته لست ادمن او مالك المجموعه ","md",true)  
end
local Get_Chat = LuaTele.getChat(msg_chat_id)
local Info_Chats = LuaTele.getSupergroupFullInfo(msg_chat_id)
if not Redis:sismember(FDFGERB.."FDFGERB:ChekBotAdd",msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• المجموعه ⇠ ['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..') \n• تم تعطيلها مسبقا ',"md",true)  
else
if not msg.ControllerBot then
local UserInfo = LuaTele.getUser(msg.sender_id.user_id)
for Name_User in string.gmatch(UserInfo.first_name, "[^%s]+" ) do
UserInfo.first_name = Name_User
break
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = Get_Chat.title, url = Info_Chats.invite_link.invite_link}, 
},
}
}
aLuaTele.sendText(Sudo_Id,0,'\n• تم تعطيل مجموعه جديده \n• من قام بتعطيلها : ['..UserInfo.first_name..'](tg://user?id='..msg.sender_id.user_id..')\n• معلومات المجموعه :\n• عدد الاعضاء : '..Info_Chats.member_count..'\n• عدد الادمنيه : '..Info_Chats.administrator_count..'\n• عدد المطرودين : '..Info_Chats.banned_count..'\n• عدد المقيدين : '..Info_Chats.restricted_count..'',"md",true, false, false, false, reply_markup)
end
Redis:srem(FDFGERB.."FDFGERB:ChekBotAdd",msg_chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,'\n• المجموعه ⇠ ['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..') \n• تم تعطيلها  ','md',true)
end
end

if chat_type(msg.chat_id) == "GroupBot" and Redis:sismember(FDFGERB.."FDFGERB:ChekBotAdd",msg_chat_id) then
if text == "ايدي" or text == "id" or text == "Id" or text == "ID"  or text == "iD" or text == "ا" and msg.reply_to_message_id == 0 then
if not Redis:get(FDFGERB.."FDFGERB:Status:Id"..msg_chat_id) then
return false
end
local UserInfo = LuaTele.getUser(msg.sender_id.user_id)
local photo = LuaTele.getUserProfilePhotos(msg.sender_id.user_id)
local Bio = getbio(msg.sender_id.user_id)
local UserId = msg.sender_id.user_id
local RinkBot = msg.Name_Controller
local TotalMsg = Redis:get(FDFGERB..'FDFGERB:Num:Message:User'..msg_chat_id..':'..msg.sender_id.user_id) or 0
local TotalPhoto = photo.total_count or 0
local TotalEdit = Redis:get(FDFGERB..'FDFGERB:Num:Message:Edit'..msg_chat_id..msg.sender_id.user_id) or 0
local TotalMsgT = Total_message(TotalMsg) 
local NumberGames = Redis:get(FDFGERB.."FDFGERB:Num:Add:Games"..msg.chat_id..msg.sender_id.user_id) or 0
local NumAdd = Redis:get(FDFGERB.."FDFGERB:Num:Add:Memp"..msg.chat_id..":"..msg.sender_id.user_id) or 0
local Texting = {'يع لا تكتب ايدي مرا ثانية','بصراحه ذوق ذوق 🤏🏻','للاسف ايديك تلوث بصري ): .','شنو هالجمال الذي عجز اللسان عن نُطقه','جابك الله انت وأيديك على شكل جبر خاطر لقلبّي'}
local InfoUser = LuaTele.getUserFullInfo(UserId)
local Description = Texting[math.random(#Texting)]
if UserInfo.username then
UserInfousername = '@'..UserInfo.username..''
else
UserInfousername = 'لا يوجد'
end
Get_Is_Id = Redis:get(FDFGERB.."FDFGERB:Set:Id:all") or Redis:get(FDFGERB.."FDFGERB:Set:Id:Group"..msg_chat_id)
if Redis:get(FDFGERB.."FDFGERB:Status:IdPhoto"..msg_chat_id) then
if Get_Is_Id then
local Get_Is_Id = Get_Is_Id:gsub('#AddMem',NumAdd) 
local Get_Is_Id = Get_Is_Id:gsub('#id',msg.sender_id.user_id) 
local Get_Is_Id = Get_Is_Id:gsub('#username',UserInfousername) 
local Get_Is_Id = Get_Is_Id:gsub('#msgs',TotalMsg) 
local Get_Is_Id = Get_Is_Id:gsub('#edit',TotalEdit) 
local Get_Is_Id = Get_Is_Id:gsub('#stast',RinkBot) 
local Get_Is_Id = Get_Is_Id:gsub('#bio',Bio) 
local Get_Is_Id = Get_Is_Id:gsub('#auto',TotalMsgT) 
local Get_Is_Id = Get_Is_Id:gsub('#Description',Description) 
local Get_Is_Id = Get_Is_Id:gsub('#game',NumberGames) 
local Get_Is_Id = Get_Is_Id:gsub('#photos',TotalPhoto) 
if photo.total_count > 0 then
return LuaTele.sendPhoto(msg.chat_id, msg.id, photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id,Get_Is_Id)
else
return LuaTele.sendText(msg_chat_id,msg_id,Get_Is_Id,"md",true) 
end
else
if photo.total_count > 0 then
return LuaTele.sendPhoto(msg.chat_id, msg.id, photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id,
'\n'..Description..
'\n[• ايديه : '..UserId..
'\n• معرفه : '..UserInfousername..
'\n• رتبته : '..RinkBot..
'\n• رسائله :'..TotalMsg..
'\n• تعديلاته : '..TotalEdit..
'\n• البايو : '..getbio(UserId)..
']', "md")
else
return LuaTele.sendText(msg_chat_id,msg_id,
'\n'..Description..
'\n[• ايديه : '..UserId..
'\n• معرفه : '..UserInfousername..
'\n• رتبته : '..RinkBot..
'\n• رسائله :'..TotalMsg..
'\n• تعديلاته : '..TotalEdit..
'\n• البايو : '..getbio(UserId)..
']',"md",true) 
end
end
else
if Get_Is_Id then
local Get_Is_Id = Get_Is_Id:gsub('#AddMem',NumAdd) 
local Get_Is_Id = Get_Is_Id:gsub('#id',msg.sender_id.user_id) 
local Get_Is_Id = Get_Is_Id:gsub('#username',UserInfousername) 
local Get_Is_Id = Get_Is_Id:gsub('#msgs',TotalMsg) 
local Get_Is_Id = Get_Is_Id:gsub('#edit',TotalEdit) 
local Get_Is_Id = Get_Is_Id:gsub('#stast',RinkBot) 
local Get_Is_Id = Get_Is_Id:gsub('#bio',Bio) 
local Get_Is_Id = Get_Is_Id:gsub('#auto',TotalMsgT) 
local Get_Is_Id = Get_Is_Id:gsub('#Description',Description) 
local Get_Is_Id = Get_Is_Id:gsub('#game',NumberGames) 
local Get_Is_Id = Get_Is_Id:gsub('#photos',TotalPhoto) 
return LuaTele.sendText(msg_chat_id,msg_id,'['..Get_Is_Id..']',"md",true) 
else
return LuaTele.sendText(msg_chat_id,msg_id,
'\n[• ايديه ⇠ '..UserId..
'\n• معرفه ⇠ '..UserInfousername..
'\n• رتبته ⇠ '..RinkBot..
'\n• رسائله⇠  '..TotalMsg..
'\n• تعديلاته⇠  '..TotalEdit..
']',"md",true) 
end
end
end
if text == 'كشف' or text == 'فصخ' and msg.reply_to_message_id ~= 0 then
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender_id.user_id)
if UserInfo.username then
UserInfousername = '@'..UserInfo.username..''
else
UserInfousername = 'لا يوجد'
end
local UserId = Message_Reply.sender_id.user_id
local InfoUser = LuaTele.getUserFullInfo(UserId)
if InfoUser.bio then
Bio = InfoUser.bio
else
Bio = ''
end
local RinkBot = Controller(msg_chat_id,Message_Reply.sender_id.user_id)
local TotalMsg = Redis:get(FDFGERB..'FDFGERB:Num:Message:User'..msg_chat_id..':'..Message_Reply.sender_id.user_id) or 0
local TotalEdit = Redis:get(FDFGERB..'FDFGERB:Num:Message:Edit'..msg_chat_id..Message_Reply.sender_id.user_id) or 0
local TotalMsgT = Total_message(TotalMsg) 
return LuaTele.sendText(msg_chat_id,msg_id,
'\n[• ايديه ⇠ '..UserId..
'\n• معرفه ⇠ '..UserInfousername..
'\n• رتبته ⇠ '..RinkBot..
'\n• رسائله⇠  '..TotalMsg..
'\n• تعديلاته⇠  '..TotalEdit..
']',"md",true) 
end
if text and text:match('^ايدي @(%S+)$') or text and text:match('^كشف @(%S+)$') then
local UserName = text:match('^ايدي @(%S+)$') or text:match('^كشف @(%S+)$')
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• مافيه حساب بهذا اليوزر ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ما يمديك تستعمل الامر ع قناه او قروب !! ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ما يمديك تستعمل الامر ع بوت يغبي ","md",true)  
end
local UserId = UserId_Info.id
local InfoUser = LuaTele.getUserFullInfo(UserId_Info.id)
if InfoUser.bio then
Bio = InfoUser.bio
else
Bio = ''
end
local RinkBot = Controller(msg_chat_id,UserId_Info.id)
local TotalMsg = Redis:get(FDFGERB..'FDFGERB:Num:Message:User'..msg_chat_id..':'..UserId_Info.id) or 0
local TotalEdit = Redis:get(FDFGERB..'FDFGERB:Num:Message:Edit'..msg_chat_id..UserId_Info.id) or 0
local TotalMsgT = Total_message(TotalMsg) 
return LuaTele.sendText(msg_chat_id,msg_id,
'\n[• ايديه ⇠ '..UserId..
'\n• معرفه ⇠ @'..UserName..
'\n• رتبته ⇠ '..RinkBot..
'\n• رسائله⇠  '..TotalMsg..
'\n• تعديلاته⇠  '..TotalEdit..
']',"md",true) 
end
if (Redis:get(FDFGERB.."FDFGERB:AddSudosNew"..msg_chat_id) == 'true') then
if text == "الغاء" or text == 'الغاء الامر •' then   
Redis:del(FDFGERB.."FDFGERB:AddSudosNew"..msg_chat_id)
return LuaTele.sendText(msg_chat_id,msg_id, "\n• تم الغاء امر تغيير Dev","md",true)    
end 
Redis:del(FDFGERB.."FDFGERB:AddSudosNew"..msg_chat_id)
if text and text:match("^@[%a%d_]+$") then
local UserId_Info = LuaTele.searchPublicChat(text)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• مافيه حساب بهذا اليوزر ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ما بقدر ارفع قناه او مجموعه !! ","md",true)  
end
if UserName and UserName[2]:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ما يمديك تستعمل الامر ع بوت يغبي ","md",true)  
end
local Informationlua = io.open("Information.lua", 'w')
Informationlua:write([[
return {
Token = "]]..Token..[[",
UserBot = "]]..UserBot..[[",
UserSudo = "]]..text:gsub('@','')..[[",
SudoId = ]]..UserId_Info.id..[[
}
]])
Informationlua:close()
return LuaTele.sendText(msg_chat_id,msg_id,"\n• تم نقلت له Dev :[ @"..text:gsub('@','').."]","md",true)  
end
end
if text == 'تغيير م' or text == 'تغيير Dev' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• هاذا الامر يخص { '..Controller_Num(1)..' } ',"md",true)  
end
Redis:set(FDFGERB.."FDFGERB:AddSudosNew"..msg_chat_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,"• ابشر ارسل يوزر الشخص","md",true)
end
if text == "اهيي" or text == "ايديي" then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• ايديك هو ⇠ '..msg.sender_id.user_id,"md",true)  
end
if text == "معرفي" or text == "يوزري" then
local ban = LuaTele.getUser(msg.sender_id.user_id)
if ban.username then
banusername = '[@'..ban.username..']'
else
banusername = 'لا يوجد'
end
return LuaTele.sendText(msg_chat_id,msg_id,'\n• معرفك ⇠ [@'..ban.username..']',"md",true)
end
if text == "ايدي مجموعه" or text == "ايدي المجموعه" then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• ايدي المجموعه ⇠ `'..msg_chat_id..'`',"md",true)
end
if text == 'مسح الكل' then
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 المالكين الاساسين】 فقط ',"md",true)  
end
local constructor = Redis:smembers(FDFGERB..'FDFGERB:Originators:Group'..msg.chat_id)
local Managers = Redis:smembers(FDFGERB..'FDFGERB:Managers:Group'..msg.chat_id)
local admins = Redis:smembers(FDFGERB..'FDFGERB:Addictive:Group'..msg.chat_id)
local vipmem = Redis:smembers(FDFGERB..'FDFGERB:Distinguished:Group'..msg.chat_id)
if #constructor ~= 0 then constructort = 'المالكين' else constructort = '' end
if #Managers ~= 0 then Managerst = 'المدراء' else Managerst = '' end
if #admins ~= 0 then adminst = 'الادمنيه' else adminst = '' end
if #vipmem ~= 0 then vipmemt = 'المميزين' else vipmemt = '' end
if #constructor ~= 0 or #Managers ~= 0 or #admins ~= 0 or #vipmem ~= 0 then 
Redis:del(FDFGERB.."FDFGERB:Originators:Group"..msg_chat_id) 
Redis:del(FDFGERB.."FDFGERB:Managers:Group"..msg_chat_id) 
Redis:del(FDFGERB.."FDFGERB:Addictive:Group"..msg_chat_id) 
Redis:del(FDFGERB.."FDFGERB:Distinguished:Group"..msg_chat_id) 
LuaTele.sendText(msg.chat_id,msg.id, "• تم حذف جميع الرتب التاليه : ( "..constructort..''..Managerst..''..adminst..''..vipmemt.." ) بنجاح \n -", 'md')
else
LuaTele.sendText(msg.chat_id,msg.id, "• لاتوجد رتب هنا", 'md')
end 
end 

if text == "مسح الرتب" then    
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 المالكين الاساسين】 فقط ',"md",true)  
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = 'مسح المميزين', data = msg.sender_id.user_id..'/'.. 'DelDistinguished'},{text = 'مسح الادمنيه', data = msg.sender_id.user_id..'/'.. 'Addictive'},
},
{
{text = 'مسح المدراء', data = msg.sender_id.user_id..'/'.. 'Managers'},{text = 'مسح المالكين', data = msg.sender_id.user_id..'/'.. 'Originators'},
},
{
{text = ' مسح الاساسين ', data =msg.sender_id.user_id..'/'.. 'TheBasics'}
},
{
{text = 'اخفاء الاوامر', data =msg.sender_id.user_id..'/'.. 'delAmr'}
},
}
}
return LuaTele.sendText(msg_chat_id, msg_id, '• يمكنك من هنا التحكم في رتب المجموعة ', 'md', false, false, false, false, reply_markup)
 end
if text == "افتار عيال" or text == 'افتارات عيال' then
if not Redis:get(FDFGERB.."FDFGERB:Status:Entert"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id," • تم تعطيل التسليه من قبل المدراء","md",true)  
end
Abs = math.random(2,140); 
local Text ='تم اختيار افتار لك'
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '',url="t.me/LDD7D"}},
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/avatarboys/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "افتار بنات" or text == 'افتارات بنات' then
if not Redis:get(FDFGERB.."FDFGERB:Status:Entert"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id," • تم تعطيل التسليه من قبل المدراء","md",true)  
end
Abs = math.random(2,140); 
local Text ='تم اختيار افتار لك'
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '',url="t.me/LDD7D"}},
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/avatargirl/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "غنيلي" or text == "غني" then
if not Redis:get(FDFGERB.."FDFGERB:Status:Entert"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id," • تم تعطيل التسليه من قبل المدراء","md",true)  
end
Abs = math.random(2,140); 
local Text ='اضغط الزر لتغيير'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'تغيير', callback_data = IdUser..'/Re@'},
},
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendVoice?chat_id=' .. msg.chat_id .. '&voice=https://t.me/lonervo/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "اطربني" or text == "اطربنا" then
if not Redis:get(FDFGERB.."FDFGERB:Status:Entert"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id," • تم تعطيل التسليه من قبل المدراء","md",true)  
end
Abs = math.random(3,59); 
local Text ='اضغط الزر لتغيير'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'تغيير', callback_data = IdUser..'/KJ@'},
},
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendVoice?chat_id=' .. msg.chat_id .. '&voice=https://t.me/singFOT/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "قران" or text == "فويسات قران" then
if not Redis:get(FDFGERB.."FDFGERB:Status:Entert"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id," • تم تعطيل التسليه من قبل المدراء","md",true)  
end
Abs = math.random(2,140); 
local Text ='اضغط الزر لتغيير'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'تغيير', callback_data = IdUser..'/Ro@'},
},
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendVoice?chat_id=' .. msg.chat_id .. '&voice=https://t.me/lonervoo/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end

if text == 'تغيير الايدي' or text == 'تغير الايدي' then
if not msg.Originators then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• هذا الامر يخص { '..Controller_Num(5)..' } ',"md",true)  
end
local List = { 
[[
• ايديك : #id
• معرفك : #username
• رتبتك :  #stast
• الرسائل : #msgs
• جهاتك : #AddMem
• البايو : #bio
]],
[[
🐚 ° 𝖘𝖙𝖆 : #stast ° 🌾
🐚 ° 𝖚𝖘𝖊𝖗𝖓𝖆𝖒𝖊 : #username ° 🌾
🐚 °  𝖒𝖘𝖌𝖘 : #msgs ° 🌾
🐚 ° 𝖎𝖉 : #id ° 🌾
]],
[[
 • 𝐔𝐒𝐄 : #username  
 • 𝐌𝐒𝐆 :  #msgs 
 • 𝐒𝐓𝐀 : #stast   
 • 𝐢𝐃 : #id 
]],
[[
☃️ • 𝐔𝐬𝐞𝐫 . #username • 🥂
☃️ • 𝐒𝐭𝐚𝐬𝐭 . #stast • 🥂
☃️ • 𝐌𝐬𝐆 . #msgs • 🥂
☃️ • 𝐢𝐃 . #id • 🥂
]],
[[
☆•𝐮𝐬𝐞𝐫 : #username 𖣬  
☆•𝐦𝐬𝐠  : #msgs 𖣬 
☆•𝐬𝐭𝐚 : #stast 𖣬 
☆•𝐢𝐝  : #id 𖣬
]],
[[
 ∵ USERNAME . #username
 ∵ STAST . #stast
 ∵ ID . #id
 ∵ MSGS . #msgs
]],
[[
: 𝖴ِᥱ᥉ : #username .
: Iَժ : #id .
: Sƚِᥲ : #stast .
: 𝖬⁪⁬⁮᥉َ𝗀 : #msgs .
]],
[[
َ› Msgs : #msgs .🦇
َ› ID : #id .🦇
َ› Stast : #stast .🦇
َ› UserName : #username .🦇
]],
[[
☁️ . USERNAME . #username
☁️ . STAST . #stast
☁️ . ID . #id
☁️ . MSGS . #msgs
]],
[[
 . USERNAME . #username
 . STAST . #stast
 . ID . #id
 . MSGS . #msgs
]],
[[
  USERNAME . #username
  STAST . #stast
  ID . #id
  MSGS . #msgs
]],
[[
◜⛓️ِ𝗨َِS𝗘ِr #username 🕷 .  
◜⛓️ِ𝗠ِsِG  #msgs   .
◜⛓️ِ𝗦َ𝗧 #stast  .
◜⛓️ِ𝗜ِd  #id 🕸 .
]],
[[
 . USERNAME . #username
 . STAST . #stast
 . ID . #id
 . MSGS . #msgs
]],
[[
˛ 𝗎!𝗌 : #username ٰ⛓️ '.
˛ 𝗆!𝗀 #msgs .
˛ 𝗌!𝗍 : #stast .
˛𝗂!𝖽 : #id ⛓️ '.
]],
[[
َ› Msgs : #msgs .🦇
َ› ID : #id .🦇
َ› Stast : #stast .🦇
َ› UserName : #username .🦇
]],
[[
: 𝖴ِᥱ᥉ : #username .
: Iَժ : #id .
: Sƚِᥲ : #stast .
: 𝖬⁪⁬⁮᥉َ𝗀 : #msgs .
]]} 
local Text_Rand = List[math.random(#List)] 
Redis:set(FDFGERB.."FDFGERB:Set:Id:Group"..msg.chat_id,Text_Rand)
return LuaTele.sendText(msg_chat_id,msg_id, '• تم التغيير ارسل ايدي لعرض الايدي الجديد',"md",true)  
end

if text == 'رتبتي'  then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• رتبتك ⇠ '..msg.Name_Controller,"md",true)  
end
if text == "بايو" or text == "البايو" then
if not Redis:get(FDFGERB.."FDFGERB:bio"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل البايو من قبل الادمنيه","md",true)
end 
return LuaTele.sendText(msg_chat_id,msg_id,getbio(msg.sender_id.user_id),"md",true) 
end
if text == 'رابط الحذف' or text == 'رابط الحذف' then
LuaTele.sendText(msg.chat_id,msg.id,[[
- رابط حذف حسابات تلقرام ↓
- [اضغط هنا …](https://my.telegram.org/auth?to=delete)
- الله معك ي حلو 
]],"md",true)  
return
end
if text == "زواج" or text == "تتزوجيني" or text == "تتزوجني" then
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local loner = LuaTele.getUser(Message_Reply.sender_id.user_id)
local bain = LuaTele.getUser(msg.sender_id.user_id)
if loner.first_name then
loneriusername = '• الحلو هذا ⇠ ['..bain.first_name..'](tg://user?id='..bain.id..')\n• طلب الزواج من ⇠ ['..loner.first_name..'](tg://user?id='..loner.id..')\nموافقه ع زواج؟\n'
else
loneriusername = 'لا يوجد'
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = 'اي', data = Message_Reply.sender_id.user_id..'/marriageloner'},{text = 'لا', data = Message_Reply.sender_id.user_id..'/marriageloner2'}, 
},
}
}
return LuaTele.sendText(msg_chat_id,msg_id,loneriusername,"md",false, false, false, false, reply_markup)
end
if text == 'الرتبه' or text == 'رتبته' and msg.reply_to_message_id ~= 0 then
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender_id.user_id)
if UserInfo.username then
UserInfousername = '@'..UserInfo.username..''
else
UserInfousername = 'لا يوجد'
end
local RinkBot = Controller(msg_chat_id,UserId)
local NumAdd = Redis:get(FDFGERB.."FDFGERB:Num:Add:Memp"..msg.chat_id..":"..UserId) or 0
local NumberGames = Redis:get(FDFGERB.."FDFGERB:Num:Add:Games"..msg.chat_id..UserId) or 0
if Get_Is_Id then
local Get_Is_Id = Get_Is_Id:gsub('#AddMem',NumAdd) 
local Get_Is_Id = Get_Is_Id:gsub('#stast',RinkBot) 
return LuaTele.sendText(msg_chat_id,msg_id,Get_Is_Id,"md",true) 
else
return LuaTele.sendText(msg_chat_id,msg_id,
'\n• الرتبه ⇠ '..RinkBot..
'',"md",true) 
end
end
if text == 'معلوماتي' or text == 'انا مين' then
local UserInfo = LuaTele.getUser(msg.sender_id.user_id)
local StatusMember = LuaTele.getChatMember(msg_chat_id,msg.sender_id.user_id).status.luatele
if (StatusMember == "chatMemberStatusCreator") then
StatusMemberChat = 'المالك '
elseif (StatusMember == "chatMemberStatusAdministrator") then
StatusMemberChat = 'ادمن بالمجموعه'
else
StatusMemberChat = 'عضو'
end
local UserId = msg.sender_id.user_id
local RinkBot = msg.Name_Controller
local TotalMsg = Redis:get(FDFGERB..'FDFGERB:Num:Message:User'..msg_chat_id..':'..msg.sender_id.user_id) or 0
local TotalEdit = Redis:get(FDFGERB..'FDFGERB:Num:Message:Edit'..msg_chat_id..msg.sender_id.user_id) or 0
local TotalMsgT = Total_message(TotalMsg) 
if UserInfo.username then
UserInfousername = '@'..UserInfo.username..''
else
UserInfousername = 'لا يوجد'
end
if StatusMemberChat == 'مشرف ' then 
local GetMemberStatus = LuaTele.getChatMember(msg_chat_id,msg.sender_id.user_id).status
if GetMemberStatus.can_change_info then
change_info = '❬ نعم ❭' else change_info = '❬ لا ❭'
end
if GetMemberStatus.can_delete_messages then
delete_messages = '❬ نعم ❭' else delete_messages = '❬ لا ❭'
end
if GetMemberStatus.can_invite_users then
invite_users = '❬ نعم ❭' else invite_users = '❬ لا ❭'
end
if GetMemberStatus.can_pin_messages then
pin_messages = '❬ نعم ❭' else pin_messages = '❬ لا ❭'
end
if GetMemberStatus.can_restrict_members then
restrict_members = '❬ نعم ❭' else restrict_members = '❬ لا ❭'
end
if GetMemberStatus.can_promote_members then
promote = '❬ نعم ❭' else promote = '❬ لا ❭'
end
PermissionsUser = '\n• صلاحيات المستخدم :\n━━━━━'..'\n• تغيير المعلومات : '..change_info..'\n• تثبيت الرسائل : '..pin_messages..'\n• اضافه مستخدمين : '..invite_users..'\n• مسح الرسائل : '..delete_messages..'\n• حظر المستخدمين : '..restrict_members..'\n• اضافه المشرفين : '..promote..'\n'
end
return LuaTele.sendText(msg_chat_id,msg_id,
'\n[• ايديه ⇠ '..UserId..
'\n• معرفه ⇠ '..UserInfousername..
'\n• رتبته ⇠ '..RinkBot..
'\n• رتبته بالمجموعه ⇠ '..StatusMemberChat..
'\n• رسائله⇠  '..TotalMsg..
'\n• تعديلاته⇠  '..TotalEdit..
']'..(PermissionsUser or '') ,"md",true) 
end
if text == 'كشف البوت' then 
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【المدير】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local StatusMember = LuaTele.getChatMember(msg_chat_id,FDFGERB).status.luatele
if (StatusMember ~= "chatMemberStatusAdministrator") then
return LuaTele.sendText(msg_chat_id,msg_id,'• البوت عضو في المجموعه ',"md",true) 
end
local GetMemberStatus = LuaTele.getChatMember(msg_chat_id,FDFGERB).status
if GetMemberStatus.can_change_info then
change_info = '❬ نعم ❭' else change_info = '❬ لا ❭'
end
if GetMemberStatus.can_delete_messages then
delete_messages = '❬ نعم ❭' else delete_messages = '❬ لا ❭'
end
if GetMemberStatus.can_invite_users then
invite_users = '❬ نعم ❭' else invite_users = '❬ لا ❭'
end
if GetMemberStatus.can_pin_messages then
pin_messages = '❬ نعم ❭' else pin_messages = '❬ لا ❭'
end
if GetMemberStatus.can_restrict_members then
restrict_members = '❬ نعم ❭' else restrict_members = '❬ لا ❭'
end
if GetMemberStatus.can_promote_members then
promote = '❬ نعم ❭' else promote = '❬ لا ❭'
end
PermissionsUser = '\n• صلاحيات البوت في المجموعه :\n━━━━━'..'\n• تغيير المعلومات : '..change_info..'\n• تثبيت الرسائل : '..pin_messages..'\n• اضافه مستخدمين : '..invite_users..'\n• مسح الرسائل : '..delete_messages..'\n• حظر المستخدمين : '..restrict_members..'\n• اضافه المشرفين : '..promote..'\n'
return LuaTele.sendText(msg_chat_id,msg_id,PermissionsUser,"md",true) 
end

if text and text:match('^مسح (%d+)$') then
local NumMessage = text:match('^مسح (%d+)$')
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【المدير】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• اعطيني صلاحيات كامله ي غبي ","md",true)  
end
if GetInfoBot(msg).Delmsg == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• البوت ليس لديه صلاحيه حذف الرسائل',"md",true)  
end
if tonumber(NumMessage) > 1000 then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• العدد اكثر من 1000 لا تستطيع الحذف',"md",true)  
end
local Message = msg.id
for i=1,tonumber(NumMessage) do
local deleteMessages = LuaTele.deleteMessages(msg.chat_id,{[1]= Message})
var(deleteMessages)
Message = Message - 1048576
end
LuaTele.sendText(msg_chat_id, msg_id, "• تم مسح • "..NumMessage.. ' رساله', 'md')
end

if text and text:match('^تنزيل (.*) @(%S+)$') then
local UserName = {text:match('^تنزيل (.*) @(%S+)$')}
local UserId_Info = LuaTele.searchPublicChat(UserName[2])
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• مافيه حساب بهذا اليوزر ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ما يمديك تستعمل الامر ع قناه او قروب !! ","md",true)  
end
if UserName and UserName[2]:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ما يمديك تستعمل الامر ع بوت يغبي ","md",true)  
end
if UserName[1] == "MY" then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(FDFGERB.."FDFGERB:DevelopersQ:Groups",UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم تنزيله MY مسبقا ").Reply,"md",true)  
else
Redis:srem(FDFGERB.."FDFGERB:DevelopersQ:Groups",UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم تنزيله MY").Reply,"md",true)  
end
end
if UserName[1] == "M" then
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Myth🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(FDFGERB.."FDFGERB:Developers:Groups",UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم تنزيله M  مسبقا ").Reply,"md",true)  
else
Redis:srem(FDFGERB.."FDFGERB:Developers:Groups",UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم تنزيله M  ").Reply,"md",true)  
end
end
if UserName[1] == "مالك اساسي" then
if LuaTele.getChatMember(msg_chat_id,msg.sender_id.user_id).status.luatele ~= "chatMemberStatusCreator" and not msg.Developers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 مالك المجموعه ️】 فقط ',"md",true)  
end
if not Redis:sismember(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم تنزيله مالك اساسي مسبقا ").Reply,"md",true)  
else
Redis:srem(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم تنزيله مالك اساسي ").Reply,"md",true)  
end
end
if UserName[1] == "مالك اساسي" then
if LuaTele.getChatMember(msg_chat_id,msg.sender_id.user_id).status.luatele ~= "chatMemberStatusCreator" and not msg.Developers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 مالك المجموعه ️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم تنزيله مالك اساسي مسبقا ").Reply,"md",true)  
else
Redis:srem(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم تنزيله مالك اساسي ").Reply,"md",true)  
end
end
if UserName[1] == "مالك" then
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 المالكين الاساسين】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(FDFGERB.."FDFGERB:Originators:Group"..msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم تنزيله من المالكين مسبقا ").Reply,"md",true)  
else
Redis:srem(FDFGERB.."FDFGERB:Originators:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم تنزيله من المالكين ").Reply,"md",true)  
end
end
if UserName[1] == "مدير" then
if not msg.Originators then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 المالكين】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(FDFGERB.."FDFGERB:Managers:Group"..msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم تنزيله من المدراء مسبقا ").Reply,"md",true)  
else
Redis:srem(FDFGERB.."FDFGERB:Managers:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم تنزيله من المدراء ").Reply,"md",true)  
end
end
if UserName[1] == "ادمن" then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【المدير】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(FDFGERB.."FDFGERB:Addictive:Group"..msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم تنزيله من الادمنيه مسبقا ").Reply,"md",true)  
else
Redis:srem(FDFGERB.."FDFGERB:Addictive:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم تنزيله من الادمنيه ").Reply,"md",true)  
end
end
if UserName[1] == "مميز" then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(FDFGERB.."FDFGERB:Distinguished:Group"..msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم تنزيله من المميزين مسبقا ").Reply,"md",true)  
else
Redis:srem(FDFGERB.."FDFGERB:Distinguished:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم تنزيله من المميزبن ").Reply,"md",true)  
end
end
end
if text and text:match("^تنزيل (.*)$") and msg.reply_to_message_id ~= 0 then
local TextMsg = text:match("^تنزيل (.*)$")
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender_id.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ما يمديك تستعمل الامر ع بوت يغبي  ","md",true)  
end
if TextMsg == 'MY' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(FDFGERB.."FDFGERB:DevelopersQ:Groups",Message_Reply.sender_id.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"• تم تنزيله MY مسبقا ").Reply,"md",true)  
else
Redis:srem(FDFGERB.."FDFGERB:DevelopersQ:Groups",Message_Reply.sender_id.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"• تم تنزيله MY").Reply,"md",true)  
end
end
if TextMsg == 'M' then
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Myth🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(FDFGERB.."FDFGERB:Developers:Groups",Message_Reply.sender_id.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"• تم تنزيله M  مسبقا ").Reply,"md",true)  
else
Redis:srem(FDFGERB.."FDFGERB:Developers:Groups",Message_Reply.sender_id.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"• تم تنزيله M  ").Reply,"md",true)  
end
end
if TextMsg == "مالك اساسي" then
if LuaTele.getChatMember(msg_chat_id,msg.sender_id.user_id).status.luatele ~= "chatMemberStatusCreator" and not msg.Developers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 مالك المجموعه ️】 فقط ',"md",true)  
end
if not Redis:sismember(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id,Message_Reply.sender_id.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"• تم تنزيله مالك اساسي مسبقا ").Reply,"md",true)  
else
Redis:srem(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id,Message_Reply.sender_id.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"• تم تنزيله مالك اساسي ").Reply,"md",true)  
end
end
if TextMsg == "مالك اساسي" then
if LuaTele.getChatMember(msg_chat_id,msg.sender_id.user_id).status.luatele ~= "chatMemberStatusCreator" and not msg.Developers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 مالك المجموعه ️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id,Message_Reply.sender_id.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"• تم تنزيله مالك اساسي مسبقا ").Reply,"md",true)  
else
Redis:srem(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id,Message_Reply.sender_id.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"• تم تنزيله مالك اساسي ").Reply,"md",true)  
end
end
if TextMsg == "مالك" then
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 المالكين الاساسين】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(FDFGERB.."FDFGERB:Originators:Group"..msg_chat_id,Message_Reply.sender_id.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"• تم تنزيله من المالكين مسبقا ").Reply,"md",true)  
else
Redis:srem(FDFGERB.."FDFGERB:Originators:Group"..msg_chat_id,Message_Reply.sender_id.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"• تم تنزيله من المالكين ").Reply,"md",true)  
end
end
if TextMsg == "مدير" then
if not msg.Originators then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 المالكين】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(FDFGERB.."FDFGERB:Managers:Group"..msg_chat_id,Message_Reply.sender_id.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"• تم تنزيله من المدراء مسبقا ").Reply,"md",true)  
else
Redis:srem(FDFGERB.."FDFGERB:Managers:Group"..msg_chat_id,Message_Reply.sender_id.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"• تم تنزيله من المدراء ").Reply,"md",true)  
end
end
if TextMsg == "ادمن" then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【المدير】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(FDFGERB.."FDFGERB:Addictive:Group"..msg_chat_id,Message_Reply.sender_id.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"• تم تنزيله من الادمنيه مسبقا ").Reply,"md",true)  
else
Redis:srem(FDFGERB.."FDFGERB:Addictive:Group"..msg_chat_id,Message_Reply.sender_id.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"• تم تنزيله من الادمنيه ").Reply,"md",true)  
end
end
if TextMsg == "مميز" then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(FDFGERB.."FDFGERB:Distinguished:Group"..msg_chat_id,Message_Reply.sender_id.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"• تم تنزيله من المميزين مسبقا ").Reply,"md",true)  
else
Redis:srem(FDFGERB.."FDFGERB:Distinguished:Group"..msg_chat_id,Message_Reply.sender_id.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"• تم تنزيله من المميزبن ").Reply,"md",true)  
end
end
end


if text and text:match('^تنزيل (.*) (%d+)$') then
local UserId = {text:match('^تنزيل (.*) (%d+)$')}
local UserInfo = LuaTele.getUser(UserId[2])
if UserInfo.luatele == "error" and UserInfo.code == 6 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام ايدي خطأ ","md",true)  
end
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ما يمديك تستعمل الامر ع بوت يغبي  ","md",true)  
end
if UserId[1] == 'MY' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(FDFGERB.."FDFGERB:DevelopersQ:Groups",UserId) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"• تم تنزيله MY مسبقا ").Reply,"md",true)  
else
Redis:srem(FDFGERB.."FDFGERB:DevelopersQ:Groups",UserId) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"• تم تنزيله MY").Reply,"md",true)  
end
end
if UserId[1] == 'M' then
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Myth🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(FDFGERB.."FDFGERB:Developers:Groups",UserId) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"• تم تنزيله M مسبقا ").Reply,"md",true)  
else
Redis:srem(FDFGERB.."FDFGERB:Developers:Groups",UserId) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"• تم تنزيله M ").Reply,"md",true)  
end
end
if UserId[1] == "مالك اساسي" then
if LuaTele.getChatMember(msg_chat_id,msg.sender_id.user_id).status.luatele ~= "chatMemberStatusCreator" and not msg.Developers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 مالك المجموعه ️】 فقط ',"md",true)  
end
if not Redis:sismember(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id,UserId[2]) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"• تم تنزيله مالك اساسي مسبقا ").Reply,"md",true)  
else
Redis:srem(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"• تم تنزيله مالك اساسي ").Reply,"md",true)  
end
end
if UserId[1] == "مالك اساسي" then
if LuaTele.getChatMember(msg_chat_id,msg.sender_id.user_id).status.luatele ~= "chatMemberStatusCreator" and not msg.Developers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 مالك المجموعه ️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id,UserId[2]) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"• تم تنزيله مالك اساسي مسبقا ").Reply,"md",true)  
else
Redis:srem(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"• تم تنزيله مالك اساسي ").Reply,"md",true)  
end
end
if UserId[1] == "مالك" then
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 المالكين الاساسين】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(FDFGERB.."FDFGERB:Originators:Group"..msg_chat_id,UserId[2]) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"• تم تنزيله من المالكين مسبقا ").Reply,"md",true)  
else
Redis:srem(FDFGERB.."FDFGERB:Originators:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"• تم تنزيله من المالكين ").Reply,"md",true)  
end
end
if UserId[1] == "مدير" then
if not msg.Originators then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 المالكين】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(FDFGERB.."FDFGERB:Managers:Group"..msg_chat_id,UserId[2]) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"• تم تنزيله من المدراء مسبقا ").Reply,"md",true)  
else
Redis:srem(FDFGERB.."FDFGERB:Managers:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"• تم تنزيله من المدراء ").Reply,"md",true)  
end
end
if UserId[1] == "ادمن" then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【المدير】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(FDFGERB.."FDFGERB:Addictive:Group"..msg_chat_id,UserId[2]) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"• تم تنزيله من الادمنيه مسبقا ").Reply,"md",true)  
else
Redis:srem(FDFGERB.."FDFGERB:Addictive:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"• تم تنزيله من الادمنيه ").Reply,"md",true)  
end
end
if UserId[1] == "مميز" then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(FDFGERB.."FDFGERB:Distinguished:Group"..msg_chat_id,UserId[2]) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"• تم تنزيله من المميزين مسبقا ").Reply,"md",true)  
else
Redis:srem(FDFGERB.."FDFGERB:Distinguished:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"• تم تنزيله من المميزبن ").Reply,"md",true)  
end
end
end
if text and text:match('^رفع (.*) @(%S+)$') then
local UserName = {text:match('^رفع (.*) @(%S+)$')}
local UserId_Info = LuaTele.searchPublicChat(UserName[2])
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ما بقدر ارفع قناه او مجموعه !! ","md",true)  
end
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• مافيه حساب بهذا اليوزر ","md",true)  
end
if UserName and UserName[2]:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ما يمديك تستعمل الامر ع بوت يغبي ","md",true)  
end
if UserName[1] == "MY" then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(FDFGERB.."FDFGERB:DevelopersQ:Groups",UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم ترقيته MY مسبقا ").Reply,"md",true)  
else
Redis:sadd(FDFGERB.."FDFGERB:DevelopersQ:Groups",UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• ابشر رفعته MY ").Reply,"md",true)  
end
end
if UserName[1] == "M" then
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Myth🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(FDFGERB.."FDFGERB:Developers:Groups",UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم ترقيته  M مسبقا ").Reply,"md",true)  
else
Redis:sadd(FDFGERB.."FDFGERB:Developers:Groups",UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم ترقيته  M ").Reply,"md",true)  
end
end
if UserName[1] == "مالك اساسي" then
if LuaTele.getChatMember(msg_chat_id,msg.sender_id.user_id).status.luatele ~= "chatMemberStatusCreator" and not msg.Developers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 مالك المجموعه ️】 فقط ',"md",true)  
end
if Redis:sismember(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• مرفوع مالك اساسي من اول  ").Reply,"md",true)  
else
Redis:sadd(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• ابشر رفعته مالك اساسي ").Reply,"md",true)  
end
end
if UserName[1] == "مالك اساسي" then
if LuaTele.getChatMember(msg_chat_id,msg.sender_id.user_id).status.luatele ~= "chatMemberStatusCreator" and not msg.Developers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 مالك المجموعه ️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• مرفوع مالك اساسي من اول  ").Reply,"md",true)  
else
Redis:sadd(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• ابشر رفعته مالك اساسي ").Reply,"md",true)  
end
end
if UserName[1] == "مالك" then
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 المالكين الاساسين】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(FDFGERB.."FDFGERB:Originators:Group"..msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• مرفوع مالك  من اول  ").Reply,"md",true)  
else
Redis:sadd(FDFGERB.."FDFGERB:Originators:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• ابشر رفعته مالك   ").Reply,"md",true)  
end
end
if UserName[1] == "مدير" then
if not msg.Originators then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 المالكين】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(FDFGERB.."FDFGERB:Managers:Group"..msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• مرفوع مدير من اول  ").Reply,"md",true)  
else
Redis:sadd(FDFGERB.."FDFGERB:Managers:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• ابشر رفعته مدير  ").Reply,"md",true)  
end
end
if UserName[1] == "ادمن" then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【المدير】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not msg.Originators and not Redis:get(FDFGERB.."FDFGERB:Status:SetId"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل (الرفع) من قبل المالكين","md",true)
end 
if Redis:sismember(FDFGERB.."FDFGERB:Addictive:Group"..msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• مرفوع ادمن من اول  ").Reply,"md",true)  
else
Redis:sadd(FDFGERB.."FDFGERB:Addictive:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• ابشر رفعته ادمن  ").Reply,"md",true)  
end
end
if UserName[1] == "مميز" then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not msg.Originators and not Redis:get(FDFGERB.."FDFGERB:Status:SetId"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل (الرفع) من قبل المالكين","md",true)
end 
if Redis:sismember(FDFGERB.."FDFGERB:Distinguished:Group"..msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• ابشر رفعته مميز  مسبقا ").Reply,"md",true)  
else
Redis:sadd(FDFGERB.."FDFGERB:Distinguished:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• ابشر رفعته مميز  ").Reply,"md",true)  
end
end
end
if Redis:get(FDFGERB.."addchannel"..msg.sender_id.user_id) == "on" then
if text and text:match("^@[%a%d_]+$") then
local m , res = https.request("http://api.telegram.org/bot"..Token.."/getchat?chat_id="..text)
data = json:decode(m)
if res == 200 then
ch = data.result.id
Redis:set(FDFGERB.."chadmin"..msg_chat_id,ch) 
LuaTele.sendText(msg_chat_id,msg_id,"• تم حفظ ايدي القناه","md",true)  
else
LuaTele.sendText(msg_chat_id,msg_id,"• المعرف خطأ","md",true)  
end
elseif text and text:match('^-100(%d+)$') then
ch = text
Redis:set(FDFGERB.."chadmin"..msg_chat_id,ch) 
LuaTele.sendText(msg_chat_id,msg_id,"• تم حفظ ايدي القناه","md",true)  
elseif text and not text:match('^-100(%d+)$') then
LuaTele.sendText(msg_chat_id,msg_id,"• الايدي خطأ","md",true)  
end
Redis:del(FDFGERB.."addchannel"..msg.sender_id.user_id)
end
if text == "القناه المضافه" then
if Redis:get(FDFGERB.."chadmin"..msg_chat_id) then
LuaTele.sendText(msg_chat_id,msg_id,Redis:get(FDFGERB.."chadmin"..msg_chat_id),"md",true)  
else 
LuaTele.sendText(msg_chat_id,msg_id,"• لا توجد قناه ","md",true)  
end 
end
if text == "حذف القناه" then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if Redis:get(FDFGERB.."chadmin"..msg_chat_id) then
Redis:del(FDFGERB.."chadmin"..msg_chat_id) 
LuaTele.sendText(msg_chat_id,msg_id,"• تم حذف القناه بنجاح","md",true)  
else 
LuaTele.sendText(msg_chat_id,msg_id,"• لا توجد قناه ","md",true)  
end 
end
if text == "اضف قناه" then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
Redis:set(FDFGERB.."addchannel"..msg.sender_id.user_id,"on") 
LuaTele.sendText(msg_chat_id,msg_id,"• ارسل يوزر او ايدي القناه","md",true)  
end
if text and text:match("^رفع (.*)$") and msg.reply_to_message_id ~= 0 then
local TextMsg = text:match("^رفع (.*)$")
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender_id.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ارسل معرف او ايدي قناه ي غبي !! ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ما يمديك تستعمل الامر ع بوت يغبي  ","md",true)  
end
if TextMsg == 'MY' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(FDFGERB.."FDFGERB:DevelopersQ:Groups",Message_Reply.sender_id.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"• تم ترقيته MY مسبقا ").Reply,"md",true)  
else
Redis:sadd(FDFGERB.."FDFGERB:DevelopersQ:Groups",Message_Reply.sender_id.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"• ابشر رفعته MY ").Reply,"md",true)  
end
end
if TextMsg == 'M' then
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Myth🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(FDFGERB.."FDFGERB:Developers:Groups",Message_Reply.sender_id.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"• تم ترقيته M مسبقا ").Reply,"md",true)  
else
Redis:sadd(FDFGERB.."FDFGERB:Developers:Groups",Message_Reply.sender_id.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"• تم ترقيته M ").Reply,"md",true)  
end
end
if TextMsg == "مالك اساسي" then
if LuaTele.getChatMember(msg_chat_id,msg.sender_id.user_id).status.luatele ~= "chatMemberStatusCreator" and not msg.Developers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 مالك المجموعه ️】 فقط ',"md",true)  
end
if Redis:sismember(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id,Message_Reply.sender_id.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"• مرفوع مالك اساسي من اول  ").Reply,"md",true)  
else
Redis:sadd(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id,Message_Reply.sender_id.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"• ابشر رفعته مالك اساسي ").Reply,"md",true)  
end
end
if TextMsg == "مالك اساسي" then
if LuaTele.getChatMember(msg_chat_id,msg.sender_id.user_id).status.luatele ~= "chatMemberStatusCreator" and not msg.Developers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 مالك المجموعه ️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id,Message_Reply.sender_id.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"• مرفوع مالك اساسي من اول  ").Reply,"md",true)  
else
Redis:sadd(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id,Message_Reply.sender_id.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"• ابشر رفعته مالك اساسي ").Reply,"md",true)  
end
end
if TextMsg == "مالك" then
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 المالكين الاساسين】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(FDFGERB.."FDFGERB:Originators:Group"..msg_chat_id,Message_Reply.sender_id.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"• مرفوع مالك  من اول  ").Reply,"md",true)  
else
Redis:sadd(FDFGERB.."FDFGERB:Originators:Group"..msg_chat_id,Message_Reply.sender_id.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"• ابشر رفعته مالك   ").Reply,"md",true)  
end
end
if TextMsg == "مدير" then
if not msg.Originators then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 المالكين】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(FDFGERB.."FDFGERB:Managers:Group"..msg_chat_id,Message_Reply.sender_id.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"• مرفوع مدير من اول  ").Reply,"md",true)  
else
Redis:sadd(FDFGERB.."FDFGERB:Managers:Group"..msg_chat_id,Message_Reply.sender_id.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"• ابشر رفعته مدير  ").Reply,"md",true)  
end
end
if TextMsg == "ادمن" then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【المدير】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not msg.Originators and not Redis:get(FDFGERB.."FDFGERB:Status:SetId"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل (الرفع) من قبل المالكين","md",true)
end 
if Redis:sismember(FDFGERB.."FDFGERB:Addictive:Group"..msg_chat_id,Message_Reply.sender_id.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"• مرفوع ادمن من اول  ").Reply,"md",true)  
else
Redis:sadd(FDFGERB.."FDFGERB:Addictive:Group"..msg_chat_id,Message_Reply.sender_id.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"• ابشر رفعته ادمن  ").Reply,"md",true)  
end
end
if TextMsg == "مميز" then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not msg.Originators and not Redis:get(FDFGERB.."FDFGERB:Status:SetId"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل (الرفع) من قبل المالكين","md",true)
end 
if Redis:sismember(FDFGERB.."FDFGERB:Distinguished:Group"..msg_chat_id,Message_Reply.sender_id.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"• ابشر رفعته مميز  مسبقا ").Reply,"md",true)  
else
Redis:sadd(FDFGERB.."FDFGERB:Distinguished:Group"..msg_chat_id,Message_Reply.sender_id.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"• ابشر رفعته مميز  ").Reply,"md",true)  
end
end
end
if text and text:match('^رفع (.*) (%d+)$') then
local UserId = {text:match('^رفع (.*) (%d+)$')}
local UserInfo = LuaTele.getUser(UserId[2])
if UserInfo.luatele == "error" and UserInfo.code == 6 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام ايدي خطأ ","md",true)  
end
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ما يمديك تستعمل الامر ع بوت يغبي  ","md",true)  
end
if UserId[1] == 'MY' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(FDFGERB.."FDFGERB:DevelopersQ:Groups",UserId) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"• تم ترقيته MY مسبقا ").Reply,"md",true)  
else
Redis:sadd(FDFGERB.."FDFGERB:DevelopersQ:Groups",UserId) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"• ابشر رفعته MY ").Reply,"md",true)  
end
end
if UserId[1] == 'M' then
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Myth🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(FDFGERB.."FDFGERB:Developers:Groups",UserId) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"• تم ترقيته M مسبقا ").Reply,"md",true)  
else
Redis:sadd(FDFGERB.."FDFGERB:Developers:Groups",UserId) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"• تم ترقيته M ").Reply,"md",true)  
end
end
if UserId[1] == "مالك اساسي" then
if LuaTele.getChatMember(msg_chat_id,msg.sender_id.user_id).status.luatele ~= "chatMemberStatusCreator" and not msg.Developers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 مالك الاساسي ️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id,UserId[2]) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"• مرفوع مالك اساسي من اول  ").Reply,"md",true)  
else
Redis:sadd(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"• ابشر رفعته مالك اساسي ").Reply,"md",true)  
end
end
if UserId[1] == "مالك اساسي" then
if LuaTele.getChatMember(msg_chat_id,msg.sender_id.user_id).status.luatele ~= "chatMemberStatusCreator" and not msg.Developers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 مالك الاساسي ️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id,UserId[2]) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"• مرفوع مالك اساسي من اول  ").Reply,"md",true)  
else
Redis:sadd(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"• ابشر رفعته مالك اساسي ").Reply,"md",true)  
end
end
if UserId[1] == "مالك " then
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 المالكين الاساسين】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(FDFGERB.."FDFGERB:Originators:Group"..msg_chat_id,UserId[2]) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"• مرفوع مالك  من اول  ").Reply,"md",true)  
else
Redis:sadd(FDFGERB.."FDFGERB:Originators:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"• ابشر رفعته مالك   ").Reply,"md",true)  
end
end
if UserId[1] == "مدير" then
if not msg.Originators then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 المالكين】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(FDFGERB.."FDFGERB:Managers:Group"..msg_chat_id,UserId[2]) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"• مرفوع مدير من اول  ").Reply,"md",true)  
else
Redis:sadd(FDFGERB.."FDFGERB:Managers:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"• ابشر رفعته مدير  ").Reply,"md",true)  
end
end
if UserId[1] == "ادمن" then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【المدير】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not msg.Originators and not Redis:get(FDFGERB.."FDFGERB:Status:SetId"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل (الرفع) من قبل المالكين","md",true)
end 
if Redis:sismember(FDFGERB.."FDFGERB:Addictive:Group"..msg_chat_id,UserId[2]) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"• مرفوع ادمن من اول  ").Reply,"md",true)  
else
Redis:sadd(FDFGERB.."FDFGERB:Addictive:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"• ابشر رفعته ادمن  ").Reply,"md",true)  
end
end
if UserId[1] == "مميز" then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not msg.Originators and not Redis:get(FDFGERB.."FDFGERB:Status:SetId"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل (الرفع) من قبل المالكين","md",true)
end 
if Redis:sismember(FDFGERB.."FDFGERB:Distinguished:Group"..msg_chat_id,UserId[2]) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"• ابشر رفعته مميز  مسبقا ").Reply,"md",true)  
else
Redis:sadd(FDFGERB.."FDFGERB:Distinguished:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"• ابشر رفعته مميز  ").Reply,"md",true)  
end
end
end
if text and text:match("^تغيير رد المطور (.*)$") then
local Teext = text:match("^تغيير رد المطور (.*)$") 
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【المدير】 فقط ',"md",true)  
end
Redis:set(FDFGERB.."FDFGERB:Developer:Bot:Reply"..msg.chat_id,Teext)
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تغيير رد المطور الى :"..Teext)
elseif text and text:match("^تغيير رد المالك الاساسي (.*)$") then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【المدير】 فقط ',"md",true)  
end
local Teext = text:match("^تغيير رد المالك الاساسي (.*)$") 
Redis:set(FDFGERB.."FDFGERB:President:Group:Reply"..msg.chat_id,Teext)
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تغيير رد المالك الاساسي الى :"..Teext)
elseif text and text:match("^تغيير رد مالك (.*)$") then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【المدير】 فقط ',"md",true)  
end
local Teext = text:match("^تغيير رد مالك (.*)$") 
Redis:set(FDFGERB.."FDFGERB:Constructor:Group:Reply"..msg.chat_id,Teext)
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تغيير رد مالك الى :"..Teext)
elseif text and text:match("^تغيير رد المدير (.*)$") then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【المدير】 فقط ',"md",true)  
end
local Teext = text:match("^تغيير رد المدير (.*)$") 
Redis:set(FDFGERB.."FDFGERB:Manager:Group:Reply"..msg.chat_id,Teext) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تغيير رد المدير الى :"..Teext)
elseif text and text:match("^تغيير رد الادمن (.*)$") then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【المدير】 فقط ',"md",true)  
end
local Teext = text:match("^تغيير رد الادمن (.*)$") 
Redis:set(FDFGERB.."FDFGERB:Admin:Group:Reply"..msg.chat_id,Teext)
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تغيير رد الادمن الى :"..Teext)
elseif text and text:match("^تغيير رد المميز (.*)$") then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【المدير】 فقط ',"md",true)  
end
local Teext = text:match("^تغيير رد المميز (.*)$") 
Redis:set(FDFGERB.."FDFGERB:Vip:Group:Reply"..msg.chat_id,Teext)
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تغيير رد المميز الى :"..Teext)
elseif text and text:match("^تغيير رد العضو (.*)$") then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【المدير】 فقط ',"md",true)  
end
local Teext = text:match("^تغيير رد العضو (.*)$") 
Redis:set(FDFGERB.."FDFGERB:Mempar:Group:Reply"..msg.chat_id,Teext)
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تغيير رد العضو الى :"..Teext)
elseif text == 'حذف رد المطور' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【المدير】 فقط ',"md",true)  
end
Redis:del(FDFGERB.."FDFGERB:Developer:Bot:Reply"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"• تم حدف رد المطور")
elseif text == 'حذف رد المالك الاساسي' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【المدير】 فقط ',"md",true)  
end
Redis:del(FDFGERB.."FDFGERB:President:Group:Reply"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"• تم حذف رد المالك الاساسي ")
elseif text == 'حذف رد مالك' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【المدير】 فقط ',"md",true)  
end
Redis:del(FDFGERB.."FDFGERB:Constructor:Group:Reply"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"• تم حذف رد مالك ")
elseif text == 'حذف رد المدير' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【المدير】 فقط ',"md",true)  
end
Redis:del(FDFGERB.."FDFGERB:Manager:Group:Reply"..msg.chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم حذف رد المدير ")
elseif text == 'حذف رد الادمن' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【المدير】 فقط ',"md",true)  
end
Redis:del(FDFGERB.."FDFGERB:Admin:Group:Reply"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"• تم حذف رد الادمن ")
elseif text == 'حذف رد المميز' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【المدير】 فقط ',"md",true)  
end
Redis:del(FDFGERB.."FDFGERB:Vip:Group:Reply"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"• تم حذف رد المميز")
elseif text == 'حذف رد العضو' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【المدير】 فقط ',"md",true)  
end
Redis:del(FDFGERB.."FDFGERB:Mempar:Group:Reply"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"• تم حذف رد العضو")
end
if text == 'قائمه MY' or text == 'المطورين الثانوين' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(FDFGERB.."FDFGERB:DevelopersQ:Groups") 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"• لا يوجد Myth🎖 حاليا , ","md",true)  
end
ListMembers = '\n• قائمه MY\n ━━━━━\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers..""..k.." •  [ @"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers..""..k.." • ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {{{text = '- مسح قائمه MY', data = msg.sender_id.user_id..'/DevelopersQ'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'قائمه M' then
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Myth🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(FDFGERB.."FDFGERB:Developers:Groups") 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"• لا يوجد Myth حاليا , ","md",true)  
end
ListMembers = '\n• قائمه Myth البوت \n ━━━━━\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers..""..k.." •  [ @"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers..""..k.." • ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {{{text = '- مسح M', data = msg.sender_id.user_id..'/Developers'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'المالكين الاساسين' then
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 المالكين الاساسين】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id) 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"• لا يوجد مالكين اساسيين حاليا , ","md",true)  
end
ListMembers = '\n• قائمه المالكين الاساسين \n ━━━━━\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers..""..k.." •  [ @"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers..""..k.." • ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {{{text = '', data = msg.sender_id.user_id..'/TheBasics'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'المالكين' then
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 المالكين الاساسين】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(FDFGERB.."FDFGERB:Originators:Group"..msg_chat_id) 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"• لا يوجد مالكين حاليا , ","md",true)  
end
ListMembers = '\n• قائمه المالكين  \n ━━━━━\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers..""..k.." •  [ @"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers..""..k.." • ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {{{text = '- مسح المالكين', data = msg.sender_id.user_id..'/Originators'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'المدراء' then
if not msg.Originators then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 المالكين】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(FDFGERB.."FDFGERB:Managers:Group"..msg_chat_id) 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"• لا يوجد مدراء حاليا , ","md",true)  
end
ListMembers = '\n• قائمه المدراء  \n ━━━━━\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers..""..k.." •  [ @"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers..""..k.." • ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {{{text = '- مسح المدراء', data = msg.sender_id.user_id..'/Managers'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'الادمنيه' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【المدير】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(FDFGERB.."FDFGERB:Addictive:Group"..msg_chat_id) 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"• لا يوجد ادمنيه حاليا , ","md",true)  
end
ListMembers = '\n• قائمه الادمنيه  \n ━━━━━\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers..""..k.." •  [ @"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers..""..k.." • ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {{{text = '- مسح الادمنيه', data = msg.sender_id.user_id..'/Addictive'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'المميزين' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(FDFGERB.."FDFGERB:Distinguished:Group"..msg_chat_id) 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"• لا يوجد مميزين حاليا , ","md",true)  
end
ListMembers = '\n• قائمه المميزين  \n ━━━━━\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers..""..k.." •  [ @"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers..""..k.." • ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {{{text = '- مسح المميزين', data = msg.sender_id.user_id..'/DelDistinguished'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'المحظورين عام' or text == 'قائمه العام' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(FDFGERB.."FDFGERB:BanAll:Groups") 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"• لا يوجد محظورين عام حاليا , ","md",true)  
end
ListMembers = '\n• قائمه المحظورين عام  \n ━━━━━\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers..""..k.." •  [ @"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers..""..k.." • ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {{{text = '- مسح المحظورين عام', data = msg.sender_id.user_id..'/BanAll'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'المحظورين' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(FDFGERB.."FDFGERB:BanGroup:Group"..msg_chat_id) 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"• لا يوجد محظورين حاليا , ","md",true)  
end
ListMembers = '\n• قائمه المحظورين  \n ━━━━━\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers..""..k.." •  [ @"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers..""..k.." • ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {{{text = '- مسح المحظورين', data = msg.sender_id.user_id..'/BanGroup'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'المكتومين' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(FDFGERB.."FDFGERB:SilentGroup:Group"..msg_chat_id) 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"• لا يوجد مكتومين حاليا , ","md",true)  
end
ListMembers = '\n• قائمه المكتومين  \n ━━━━━\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers..""..k.." •  [ @"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers..""..k.." • ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {{{text = '- مسح المكتومين', data = msg.sender_id.user_id..'/SilentGroupGroup'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text and text:match("^تفعيل (.*)$") and msg.reply_to_message_id == 0 then
local TextMsg = text:match("^تفعيل (.*)$")
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if TextMsg == 'الرابط' then
Redis:set(FDFGERB.."FDFGERB:Status:Link"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تفعيل الرابط ","md",true)
end
if TextMsg == 'البايو' then
Redis:set(FDFGERB.."FDFGERB:bio"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تفعيل البايو","md",true)
end
if TextMsg == 'الترحيب' then
Redis:set(FDFGERB.."FDFGERB:Status:Welcome"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تفعيل الترحيب ","md",true)
end
if TextMsg == 'الايدي' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【المدير】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Status:Id"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تفعيل الايدي ","md",true)
end
if TextMsg == 'الايدي بالصوره' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【المدير】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Status:IdPhoto"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تفعيل الايدي بالصوره ","md",true)
end
if TextMsg == 'الردود' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【المدير】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Status:Reply"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تفعيل الردود ","md",true)
end
if TextMsg == 'الردود العامه' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【المدير】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Status:ReplySudo"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تفعيل الردود العامه ","md",true)
end
if TextMsg == 'الحظر' or TextMsg == 'الطرد' or TextMsg == 'التقييد' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【المدير】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Status:BanId"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تفعيل الحظر , الطرد , التقييد","md",true)
end
if TextMsg == 'الرفع' then
if not msg.Originators then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 المالكين】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Status:SetId"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تفعيل الرفع ","md",true)
end
if TextMsg == 'الالعاب' then
Redis:set(FDFGERB.."FDFGERB:Status:Games"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تفعيل الالعاب ","md",true)
end
if TextMsg == 'التسليه' then
Redis:set(FDFGERB.."FDFGERB:Status:Entert"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تفعيل التسليه ","md",true)
end
if TextMsg == 'اطردني' then
Redis:set(FDFGERB.."FDFGERB:Status:KickMe"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تفعيل اطردني ","md",true)
end
if TextMsg == 'نزلني' then
Redis:set(FDFGERB.."FDFGERB:Status:remMe"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تفعيل نزلني","md",true)
end
if TextMsg == 'صورتي' then
Redis:set(FDFGERB.."FDFGERB:Status:photo"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تفعيل صورتي ","md",true)
end
if TextMsg == 'قول' then
Redis:set(FDFGERB.."FDFGERB:sayy"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تفعيل قول ","md",true)
end
if TextMsg == 'البوت الخدمي' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:BotFree",true) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تفعيل البوت بلقروبات ","md",true)
end
if TextMsg == 'التواصل' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:TwaslBot",true) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تفعيل التواصل داخل البوت ","md",true)
end

end

if text and text:match("^(.*)$") then
if Redis:get(FDFGERB.."FDFGERB1:Set:Rd"..msg.sender_id.user_id..":"..msg.chat_id) == "true" then
Redis:set(FDFGERB.."FDFGERB1:Set:Rd"..msg.sender_id.user_id..":"..msg.chat_id, "true1")
Redis:set(FDFGERB.."FDFGERB1:Text:Sudo:Bot"..msg.sender_id.user_id..":"..msg.chat_id, text)
Redis:sadd(FDFGERB.."FDFGERB1:List:Rd:Sudo"..msg.chat_id, text)
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- تغيير الرد', data = msg.sender_id.user_id..'/chengreplygg'},
},
{
{text = '- الغاء الامر', data = msg.sender_id.user_id..'/delamrredis'},
},
}
}
return  LuaTele.sendText(msg_chat_id,msg_id, '\nارسل لي الكلمه الان ',"md",true, false, false, false, reply_markup) 
end
end
if text and text:match("^(.*)$") then
if Redis:get(FDFGERB.."FDFGERB1:Set:On"..msg.sender_id.user_id..":"..msg.chat_id) == "true" then
Redis:del(FDFGERB..'FDFGERB1:Add:Rd:Sudo:Text'..text..msg.chat_id)
Redis:del(FDFGERB..'FDFGERB1:Add:Rd:Sudo:Text1'..text..msg.chat_id)
Redis:del(FDFGERB..'FDFGERB1:Add:Rd:Sudo:Text2'..text..msg.chat_id)
Redis:del(FDFGERB.."FDFGERB1:Set:On"..msg.sender_id.user_id..":"..msg.chat_id)
Redis:srem(FDFGERB.."FDFGERB1:List:Rd:Sudo"..msg.chat_id, text)
return  LuaTele.sendText(msg_chat_id,msg_id,"تم حذف الرد من ردود المتعدده")
end
end
if text == ("مسح الردود المتعدده") then    
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【المدير】 فقط ',"md",true)  
end
local list = Redis:smembers(FDFGERB.."FDFGERB1:List:Rd:Sudo"..msg.chat_id)
for k,v in pairs(list) do  
Redis:del(FDFGERB.."FDFGERB1:Add:Rd:Sudo:Text"..v..msg.chat_id) 
Redis:del(FDFGERB.."FDFGERB1:Add:Rd:Sudo:Text1"..v..msg.chat_id) 
Redis:del(FDFGERB.."FDFGERB1:Add:Rd:Sudo:Text2"..v..msg.chat_id) 
Redis:del(FDFGERB.."FDFGERB1:List:Rd:Sudo"..msg.chat_id)
end
 LuaTele.sendText(msg_chat_id,msg_id,"تم حذف ردود المتعدده")
end
if text == ("الردود المتعدده") then    
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【المدير】 فقط ',"md",true)  
end
local list = Redis:smembers(FDFGERB.."FDFGERB1:List:Rd:Sudo"..msg.chat_id)
text = "\nقائمه ردود المتعدده \n━━━━━━━━\n"
for k,v in pairs(list) do
db = "رساله "
text = text..""..k.." => ( "..v.." ) => ( "..db.." )\n"
end
if #list == 0 then
text = "لا توجد ردود متعدده"
end
 LuaTele.sendText(msg_chat_id,msg_id,""..text.."")
end
if text == "اضف رد متعدد" then    
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【المدير】 فقط ',"md",true)  
end
Redis:set(FDFGERB.."FDFGERB1:Set:Rd"..msg.sender_id.user_id..":"..msg.chat_id,true)
return  LuaTele.sendText(msg_chat_id,msg_id,"ارسل الرد الذي اريد اضافته")
end
if text == "حذف رد متعدد" then    
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【المدير】 فقط ',"md",true)  
end
Redis:set(FDFGERB.."FDFGERB1:Set:On"..msg.sender_id.user_id..":"..msg.chat_id,true)
return  LuaTele.sendText(msg_chat_id,msg_id,"ارسل الان الكلمه لحذفها ")
end
if text then  
local test = Redis:get(FDFGERB.."FDFGERB1:Text:Sudo:Bot"..msg.sender_id.user_id..":"..msg.chat_id)
if Redis:get(FDFGERB.."FDFGERB1:Set:Rd"..msg.sender_id.user_id..":"..msg.chat_id) == "true1" then
Redis:set(FDFGERB.."FDFGERB1:Set:Rd"..msg.sender_id.user_id..":"..msg.chat_id,'rd1')
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("","") 
Redis:set(FDFGERB.."FDFGERB1:Add:Rd:Sudo:Text"..test..msg.chat_id, text)  
end  
 LuaTele.sendText(msg_chat_id,msg_id,"تم حفظ الرد الاول ارسل الرد الثاني")
return false  
end  
end
if text then  
local test = Redis:get(FDFGERB.."FDFGERB1:Text:Sudo:Bot"..msg.sender_id.user_id..":"..msg.chat_id)
if Redis:get(FDFGERB.."FDFGERB1:Set:Rd"..msg.sender_id.user_id..":"..msg.chat_id) == "rd1" then
Redis:set(FDFGERB.."FDFGERB1:Set:Rd"..msg.sender_id.user_id..":"..msg.chat_id,'rd2')
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("","") 
Redis:set(FDFGERB.."FDFGERB1:Add:Rd:Sudo:Text1"..test..msg.chat_id, text)  
end  
 LuaTele.sendText(msg_chat_id,msg_id,"تم حفظ الرد الثاني ارسل الرد الثالث")
return false  
end  
end
if text then  
local test = Redis:get(FDFGERB.."FDFGERB1:Text:Sudo:Bot"..msg.sender_id.user_id..":"..msg.chat_id)
if Redis:get(FDFGERB.."FDFGERB1:Set:Rd"..msg.sender_id.user_id..":"..msg.chat_id) == "rd2" then
Redis:set(FDFGERB.."FDFGERB1:Set:Rd"..msg.sender_id.user_id..":"..msg.chat_id,'rd3')
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("","") 
Redis:set(FDFGERB.."FDFGERB1:Add:Rd:Sudo:Text2"..test..msg.chat_id, text)  
end  
 LuaTele.sendText(msg_chat_id,msg_id,"تم حفظ الرد")
return false  
end  
end
if text then
local Text = Redis:get(FDFGERB.."FDFGERB1:Add:Rd:Sudo:Text"..text..msg.chat_id)   
local Text1 = Redis:get(FDFGERB.."FDFGERB1:Add:Rd:Sudo:Text1"..text..msg.chat_id)   
local Text2 = Redis:get(FDFGERB.."FDFGERB1:Add:Rd:Sudo:Text2"..text..msg.chat_id)   
if Text or Text1 or Text2 then 
local texting = {
Text,
Text1,
Text2
}
Textes = math.random(#texting)
 LuaTele.sendText(msg_chat_id,msg_id,texting[Textes])
end
end







if text and text:match("^(.*)$") then
if Redis:get(FDFGERB.."ardode:Set:Rd"..msg.sender_id.user_id..":"..msg.chat_id) == "true" then
Redis:set(FDFGERB.."ardode:Set:Rd"..msg.sender_id.user_id..":"..msg.chat_id, "true1")
Redis:set(FDFGERB.."ardode:Text:Sudo:Bot"..msg.sender_id.user_id..":"..msg.chat_id, text)
Redis:sadd(FDFGERB.."ardode:List:Rd:Sudo", text)
return  LuaTele.sendText(msg_chat_id,msg_id, '\nارسل لي الكلمه الان ',"md",true) 
end
end
if text and text:match("^(.*)$") then
if Redis:get(FDFGERB.."ardode:Set:On"..msg.sender_id.user_id..":"..msg.chat_id) == "true" then
Redis:del(FDFGERB..'ardode:Add:Rd:Sudo:Text'..text)
Redis:del(FDFGERB..'ardode:Add:Rd:Sudo:Text1'..text)
Redis:del(FDFGERB..'ardode:Add:Rd:Sudo:Text2'..text)
Redis:del(FDFGERB..'ardode:Add:Rd:Sudo:Text3'..text)
Redis:del(FDFGERB..'ardode:Add:Rd:Sudo:Text4'..text)
Redis:del(FDFGERB..'ardode:Add:Rd:Sudo:Text5'..text)
Redis:del(FDFGERB..'ardode:Add:Rd:Sudo:Text6'..text)
Redis:del(FDFGERB..'ardode:Add:Rd:Sudo:Text7'..text)
Redis:del(FDFGERB..'ardode:Add:Rd:Sudo:Text8'..text)
Redis:del(FDFGERB..'ardode:Add:Rd:Sudo:Text9'..text)
Redis:del(FDFGERB..'ardode:Add:Rd:Sudo:Text10'..text)
Redis:del(FDFGERB.."ardode:Set:On"..msg.sender_id.user_id..":"..msg.chat_id)
Redis:srem(FDFGERB.."ardode:List:Rd:Sudo", text)
return  LuaTele.sendText(msg_chat_id,msg_id,"تم حذف الرد من ردود المتعدده العامه")
end
end
if text == ("مسح الردود المتعدده العام") then    
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
local list = Redis:smembers(FDFGERB.."ardode:List:Rd:Sudo")
for k,v in pairs(list) do  
Redis:del(FDFGERB.."ardode:Add:Rd:Sudo:Text"..v) 
Redis:del(FDFGERB.."ardode:Add:Rd:Sudo:Text1"..v) 
Redis:del(FDFGERB.."ardode:Add:Rd:Sudo:Text2"..v) 
Redis:del(FDFGERB.."ardode:Add:Rd:Sudo:Text3"..v) 
Redis:del(FDFGERB.."ardode:Add:Rd:Sudo:Text4"..v) 
Redis:del(FDFGERB.."ardode:Add:Rd:Sudo:Text5"..v) 
Redis:del(FDFGERB.."ardode:Add:Rd:Sudo:Text6"..v) 
Redis:del(FDFGERB.."ardode:Add:Rd:Sudo:Text7"..v) 
Redis:del(FDFGERB.."ardode:Add:Rd:Sudo:Text8"..v) 
Redis:del(FDFGERB.."ardode:Add:Rd:Sudo:Text9"..v) 
Redis:del(FDFGERB.."ardode:Add:Rd:Sudo:Text10"..v) 
Redis:del(FDFGERB.."ardode:List:Rd:Sudo")
end
 LuaTele.sendText(msg_chat_id,msg_id,"تم حذف ردود المتعدده العامه")
end
if text == ("الردود المتعدده العام") then    
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
local list = Redis:smembers(FDFGERB.."ardode:List:Rd:Sudo")
text = "\nقائمه ردود المتعدده العامه \n━━━━━━━━\n"
for k,v in pairs(list) do
db = "رساله "
text = text..""..k.." => ( "..v.." ) => ( "..db.." )\n"
end
if #list == 0 then
text = "لا توجد ردود متعدده العامه"
end
 LuaTele.sendText(msg_chat_id,msg_id,""..text.."")
end
if text == "اضف رد متعدد عام" then    
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
Redis:set(FDFGERB.."ardode:Set:Rd"..msg.sender_id.user_id..":"..msg.chat_id,true)
return  LuaTele.sendText(msg_chat_id,msg_id,"ارسل الرد الذي اريد اضافته")
end
if text == "مسح رد متعدد عام" then    
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
Redis:set(FDFGERB.."ardode:Set:On"..msg.sender_id.user_id..":"..msg.chat_id,true)
return  LuaTele.sendText(msg_chat_id,msg_id,"ارسل الان الكلمه لحذفها ")
end
if text then  
local test = Redis:get(FDFGERB.."ardode:Text:Sudo:Bot"..msg.sender_id.user_id..":"..msg.chat_id)
if Redis:get(FDFGERB.."ardode:Set:Rd"..msg.sender_id.user_id..":"..msg.chat_id) == "true1" then
Redis:set(FDFGERB.."ardode:Set:Rd"..msg.sender_id.user_id..":"..msg.chat_id,'rd1')
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("","") 
Redis:set(FDFGERB.."ardode:Add:Rd:Sudo:Text"..test, text)  
end  
 LuaTele.sendText(msg_chat_id,msg_id,"• تم حفظ الرد الاول ارسل الرد الثاني .")
return false  
end  
end
if text then  
local test = Redis:get(FDFGERB.."ardode:Text:Sudo:Bot"..msg.sender_id.user_id..":"..msg.chat_id)
if Redis:get(FDFGERB.."ardode:Set:Rd"..msg.sender_id.user_id..":"..msg.chat_id) == "rd1" then
Redis:set(FDFGERB.."ardode:Set:Rd"..msg.sender_id.user_id..":"..msg.chat_id,'rd2')
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("","") 
Redis:set(FDFGERB.."ardode:Add:Rd:Sudo:Text1"..test, text)  
end  
 LuaTele.sendText(msg_chat_id,msg_id,"• تم حفظ الرد الثاني ارسل الرد الثالث .")
return false  
end  
end
if text then  
local test = Redis:get(FDFGERB.."ardode:Text:Sudo:Bot"..msg.sender_id.user_id..":"..msg.chat_id)
if Redis:get(FDFGERB.."ardode:Set:Rd"..msg.sender_id.user_id..":"..msg.chat_id) == "rd2" then
Redis:set(FDFGERB.."ardode:Set:Rd"..msg.sender_id.user_id..":"..msg.chat_id,'rd3')
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("","") 
Redis:set(FDFGERB.."ardode:Add:Rd:Sudo:Text2"..test, text)  
end
LuaTele.sendText(msg_chat_id,msg_id,"• تم حفظ الرد الثالث ارسل الرد الرابع . ")
return false  
end  
end

if text then  
local test = Redis:get(FDFGERB.."ardode:Text:Sudo:Bot"..msg.sender_id.user_id..":"..msg.chat_id)
if Redis:get(FDFGERB.."ardode:Set:Rd"..msg.sender_id.user_id..":"..msg.chat_id) == "rd3" then
Redis:set(FDFGERB.."ardode:Set:Rd"..msg.sender_id.user_id..":"..msg.chat_id,'rd4')
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("","") 
Redis:set(FDFGERB.."ardode:Add:Rd:Sudo:Text4"..test, text)  
end  
 LuaTele.sendText(msg_chat_id,msg_id,"• تم حفظ الرد الرابع ارسل الرد الخامس . ")
return false  
end  
end
if text then  
local test = Redis:get(FDFGERB.."ardode:Text:Sudo:Bot"..msg.sender_id.user_id..":"..msg.chat_id)
if Redis:get(FDFGERB.."ardode:Set:Rd"..msg.sender_id.user_id..":"..msg.chat_id) == "rd4" then
Redis:set(FDFGERB.."ardode:Set:Rd"..msg.sender_id.user_id..":"..msg.chat_id,'rd5')
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("","") 
Redis:set(FDFGERB.."ardode:Add:Rd:Sudo:Text5"..test, text)  
end  
 LuaTele.sendText(msg_chat_id,msg_id,"• تم حفظ الرد الخامس ارسل الرد سادس . ")
return false  
end  
end
if text then  
local test = Redis:get(FDFGERB.."ardode:Text:Sudo:Bot"..msg.sender_id.user_id..":"..msg.chat_id)
if Redis:get(FDFGERB.."ardode:Set:Rd"..msg.sender_id.user_id..":"..msg.chat_id) == "rd5" then
Redis:set(FDFGERB.."ardode:Set:Rd"..msg.sender_id.user_id..":"..msg.chat_id,'rd6')
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("","") 
Redis:set(FDFGERB.."ardode:Add:Rd:Sudo:Text6"..test, text)  
end  
 LuaTele.sendText(msg_chat_id,msg_id,"• تم حفظ الرد سادس ارسل الرد سابع . ")
return false  
end  
end
if text then  
local test = Redis:get(FDFGERB.."ardode:Text:Sudo:Bot"..msg.sender_id.user_id..":"..msg.chat_id)
if Redis:get(FDFGERB.."ardode:Set:Rd"..msg.sender_id.user_id..":"..msg.chat_id) == "rd6" then
Redis:set(FDFGERB.."ardode:Set:Rd"..msg.sender_id.user_id..":"..msg.chat_id,'rd7')
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("","") 
Redis:set(FDFGERB.."ardode:Add:Rd:Sudo:Text7"..test, text)  
end  
 LuaTele.sendText(msg_chat_id,msg_id,"• تم حفظ الرد سابع ارسل الرد الثامن . ")
return false  
end  
end
if text then  
local test = Redis:get(FDFGERB.."ardode:Text:Sudo:Bot"..msg.sender_id.user_id..":"..msg.chat_id)
if Redis:get(FDFGERB.."ardode:Set:Rd"..msg.sender_id.user_id..":"..msg.chat_id) == "rd7" then
Redis:set(FDFGERB.."ardode:Set:Rd"..msg.sender_id.user_id..":"..msg.chat_id,'rd8')
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("","") 
Redis:set(FDFGERB.."ardode:Add:Rd:Sudo:Text8"..test, text)  
end  
 LuaTele.sendText(msg_chat_id,msg_id,"• تم حفظ الرد الثامن ارسل الرد التاسع . ")
return false  
end  
end
if text then  
local test = Redis:get(FDFGERB.."ardode:Text:Sudo:Bot"..msg.sender_id.user_id..":"..msg.chat_id)
if Redis:get(FDFGERB.."ardode:Set:Rd"..msg.sender_id.user_id..":"..msg.chat_id) == "rd8" then
Redis:set(FDFGERB.."ardode:Set:Rd"..msg.sender_id.user_id..":"..msg.chat_id,'rd9')
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("","") 
Redis:set(FDFGERB.."ardode:Add:Rd:Sudo:Text9"..test, text)  
end  
 LuaTele.sendText(msg_chat_id,msg_id,"• تم حفظ الرد التاسع ارسل الرد العاشر . ")
return false  
end  
end
if text then  
local test = Redis:get(FDFGERB.."ardode:Text:Sudo:Bot"..msg.sender_id.user_id..":"..msg.chat_id)
if Redis:get(FDFGERB.."ardode:Set:Rd"..msg.sender_id.user_id..":"..msg.chat_id) == "rd9" then
Redis:del(FDFGERB.."ardode:Set:Rd"..msg.sender_id.user_id..":"..msg.chat_id)
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("","") 
Redis:set(FDFGERB.."ardode:Add:Rd:Sudo:Text10"..test, text)  
end  
 LuaTele.sendText(msg_chat_id,msg_id,"تم حفظ الرد")
return false  
end  
end



if text then
local Text = Redis:get(FDFGERB.."ardode:Add:Rd:Sudo:Text"..text)   
local Text1 = Redis:get(FDFGERB.."ardode:Add:Rd:Sudo:Text1"..text)   
local Text2 = Redis:get(FDFGERB.."ardode:Add:Rd:Sudo:Text2"..text)   
local Text3 = Redis:get(FDFGERB.."ardode:Add:Rd:Sudo:Text4"..text)   
local Text3 = Redis:get(FDFGERB.."ardode:Add:Rd:Sudo:Text5"..text)   
local Text5 = Redis:get(FDFGERB.."ardode:Add:Rd:Sudo:Text6"..text)   
local Text6 = Redis:get(FDFGERB.."ardode:Add:Rd:Sudo:Text7"..text)   
local Text7 = Redis:get(FDFGERB.."ardode:Add:Rd:Sudo:Text8"..text)   
local Text8 = Redis:get(FDFGERB.."ardode:Add:Rd:Sudo:Text9"..text)   
local Text9 = Redis:get(FDFGERB.."ardode:Add:Rd:Sudo:Text10"..text) 
if Text or Text1 or Text2 or Text4 or Text5 or Text6 or Text7 or Text8 or Text9  then 
local texting = {
Text,
Text1,
Text2,
Text3,
Text4,
Text5,
Text6,
Text7,
Text8,
Text9
}
Textes = math.random(#texting)
 LuaTele.sendText(msg_chat_id,msg_id,texting[Textes])
end
end





 
if msg.content.video_note or msg.content.document or msg.content.audio or msg.content.video or msg.content.voice_note or msg.content.sticker or msg.content.animation or msg.content.photo or msg.content.messageUnsupported then      
Redis:sadd(FDFGERB.."FDFGERB:allM"..msg.chat_id, msg.id)
if Redis:get(FDFGERB.."FDFGERB:Status:Del:Media"..msg.chat_id) then    
local gmedia = Redis:scard(FDFGERB.."FDFGERB:allM"..msg.chat_id)  
if gmedia >= 200 then
local liste = Redis:smembers(FDFGERB.."FDFGERB:allM"..msg.chat_id)
for k,v in pairs(liste) do
local Mesge = v
if Mesge then
t = "• تم مسح "..k.." من الوسائط تلقائيا\n• يمكنك تعطيل الميزه بستخدام الامر ( `تعطيل المسح التلقائي` )"
LuaTele.deleteMessages(msg.chat_id,{[1]= Mesge})
end
end
LuaTele.sendText(msg_chat_id,msg_id, t)
Redis:del(FDFGERB.."FDFGERB:allM"..msg.chat_id)
end
end
end

if text == ("امسح") then  
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 المالكين الاساسين】 فقط ',"md",true)  
end
local list = Redis:smembers(FDFGERB.."FDFGERB:allM"..msg.chat_id)
for k,v in pairs(list) do
local Message = v
if Message then
t = "• تم مسح "..k.." من الوسائط الموجوده"
LuaTele.deleteMessages(msg.chat_id,{[1]= Message})
Redis:del(FDFGERB.."FDFGERB:allM"..msg.chat_id)
end
end
if #list == 0 then
t = "• لا يوجد ميديا في المجموعه"
end
 LuaTele.sendText(msg_chat_id,msg_id, t)
end
if text == ("عدد الميديا") then  
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 المالكين الاساسين】 فقط ',"md",true)  
end
local gmria = Redis:scard(FDFGERB.."FDFGERB:allM"..msg.chat_id)  
 LuaTele.sendText(msg_chat_id,msg_id,"• عدد الميديا الموجود هو (* "..gmria.." *)","md")
end
if text == "تعطيل المسح التلقائي" then        
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 المالكين الاساسين】 فقط ',"md",true)  
end
Redis:del(FDFGERB.."FDFGERB:Status:Del:Media"..msg.chat_id)
 LuaTele.sendText(msg_chat_id,msg_id,'• تم تعطيل المسح التلقائي للميديا')
return false
end 
if text == "تفعيل المسح التلقائي" then        
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 المالكين الاساسين】 فقط ',"md",true)  
end
Redis:set(FDFGERB.."FDFGERB:Status:Del:Media"..msg.chat_id,true)
LuaTele.sendText(msg_chat_id,msg_id,'• تم تفعيل المسح التلقائي للميديا')
return false
end 

if text == "نزلني" then
if not Redis:get(FDFGERB.."FDFGERB:Status:remMe"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"• امر نزلني تم تعطيله من قبل المدراء ","md",true)  
end
if The_ControllerAll(msg.sender_id.user_id) == true then
Rink = 1
elseif Redis:sismember(FDFGERB.."FDFGERB:DevelopersQ:Groups",msg.sender_id.user_id)  then
Rink = 2
elseif Redis:sismember(FDFGERB.."FDFGERB:Developers:Groups",msg.sender_id.user_id)  then
Rink = 3
elseif Redis:sismember(FDFGERB.."FDFGERB:TheBasicsQ:Group"..msg_chat_id, msg.sender_id.user_id) then
Rink = 4
elseif Redis:sismember(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id, msg.sender_id.user_id) then
Rink = 5
elseif Redis:sismember(FDFGERB.."FDFGERB:Originators:Group"..msg_chat_id, msg.sender_id.user_id) then
Rink = 6
elseif Redis:sismember(FDFGERB.."FDFGERB:Managers:Group"..msg_chat_id, msg.sender_id.user_id) then
Rink = 7
elseif Redis:sismember(FDFGERB.."FDFGERB:Addictive:Group"..msg_chat_id, msg.sender_id.user_id) then
Rink = 8
elseif Redis:sismember(FDFGERB.."FDFGERB:Distinguished:Group"..msg_chat_id, msg.sender_id.user_id) then
Rink = 9
else
Rink = 10
end
if Rink == 10 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n- برو رتبتك عضو ما اقدر انزلك","md",true)  
end
if Rink <= 7  then
return LuaTele.sendText(msg_chat_id,msg_id,"- استطيع تنزيل الادمنيه والمميزين فقط","md",true) 
else
Redis:srem(FDFGERB.."FDFGERB:Addictive:Group"..msg_chat_id, msg.sender_id.user_id)
Redis:srem(FDFGERB.."FDFGERB:Distinguished:Group"..msg_chat_id, msg.sender_id.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,"- تم نزلتك يحب","md",true) 
end
end

if text == 'المالك' then
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عطني صلاحيات كامله يا غبي","md",true)
end
local Info_Members = LuaTele.getSupergroupMembers(msg_chat_id, "Administrators", "*", 0, 200)
local List_Members = Info_Members.members
for k, v in pairs(List_Members) do
if Info_Members.members[k].status.luatele == "chatMemberStatusCreator" then
local  ban = LuaTele.getUser(v.member_id.user_id)
if  ban.first_name == "" then
LuaTele.sendText(msg_chat_id,msg_id,"- حساب محذوف","md",true)
return false
end 
local photo = LuaTele.getUserProfilePhotos(ban.id)
local  bain = LuaTele.getUserFullInfo(ban.id)
if  bain.bio then
Bio =  bain.bio
else
Bio = 'لا يوجد'
end
if ban.username then
Creator = " "..ban.first_name.."\n"
else
Creator = " ["..ban.first_name.."](tg://user?id="..ban.id..")\n"
end
if ban.first_name then
Creat = " "..ban.first_name.." "
else
Creat = " Owner Groups \n"
end
if photo.total_count > 0 then
local TestText = "  \n • USE ⇢ [".. ban.first_name.."](tg://user?id=".. ban.id..")\n• bio ⇢ ["..Bio.." ]\n"
keyboardd = {} 
keyboardd.inline_keyboard = {
{
{text = Creat, url = "https://t.me/"..ban.username..""},
},
}
local msg_id = msg.id/2097152/0.5 
return https.request("https://api.telegram.org/bot"..Token..'/sendPhoto?chat_id='..msg.chat_id..'&caption='..URL.escape(TestText)..'&photo='..photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id..'&reply_to_message_id='..msg_id..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboardd))
else
local TestText = " \n • USE ⇢ [".. ban.first_name.."](tg://user?id=".. ban.id..")\n• bio ⇢ ["..Bio.." ]\n"
local msg_id = msg.id/2097152/0.5 
return https.request("https://api.telegram.org/bot"..Token..'/sendMessage?chat_id=' .. msg.chat_id .. '&text=' .. URL.escape(TestText).."&reply_to_message_id="..msg_id.."&parse_mode=markdown")
end
end
end
end


if text == 'نادي المطور' or text == 'صيح المطور' then   
local Get_Chat = LuaTele.getChat(msg_chat_id)
local Info_Chats = LuaTele.getSupergroupFullInfo(msg_chat_id)
local bains = LuaTele.getUser(msg.sender_id.user_id)
if bains.first_name then
klajq = ' ['..bains.first_name..'](tg://user?id='..bains.id..') '
else
klajq = 'لا يوجد'
end
if bains.username then
basgk = '@'..bains.username..''
else
basgk = 'لا يوجد'
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = Get_Chat.title, url = Info_Chats.invite_link.invite_link}, 
},
}
} 
LuaTele.sendText(msg_chat_id,msg_id,' • تم إرسال طلبك للمطور سيتم الرد عليك قريباً ',"md",true)
LuaTele.sendText(Sudo_Id,0,' \n• لحق فيه شخص يبيك ! \n━━━━━━━━━━━  \n• اسمه  ⇠ '..klajq..' \n• ايديه  ⇠ '..msg.sender_id.user_id..'\n• معرفة  ⇠ '..basgk..' \n ',"md",false, false, false, false, reply_markup)
end
if text == 'المطور' or text == 'مطور البوت' then   
local  ban = LuaTele.getUser(Sudo_Id) 
local  bain = LuaTele.getUserFullInfo(Sudo_Id)
local Get_Chat = LuaTele.getChat(msg_chat_id)
local loner = (Redis:get(FDFGERB.."FDFGERB:Name:Bot") or "اريك")
local Info_Chats = LuaTele.getSupergroupFullInfo(msg_chat_id)
local bains = LuaTele.getUser(msg.sender_id.user_id)
if  bain.bio then
Bio =  bain.bio
else
Bio = 'لا يوجد'
end
if bains.first_name then
klajq = '['..bains.first_name..'](tg://user?id='..bains.id..')'
else
klajq = 'لا يوجد'
end
if bains.username then
basgk = ' '..bains.username..' '
else
basgk = 'لا يوجد'
end
if ban.username then
Creator = " "..ban.first_name.."\n"
else
Creator = " ["..ban.first_name.."](tg://user?id="..ban.id..")\n"
end
if ban.first_name then
Creat = " "..ban.first_name.." "
else
Creat = " • Dev Bot  \n"
end
local photo = LuaTele.getUserProfilePhotos(Sudo_Id)
if photo.total_count > 0 then
local TestText = "  ❲ • Dev Bot ⇢ "..loner.." ❳\n━━━━━━━━━━━━\n • Dev ⇢ [".. ban.first_name.."](tg://user?id="..Sudo_Id..")\n• Bio ⇢ ["..Bio.." ]\n"
keyboardd = {} 
keyboardd.inline_keyboard = {
{
{text = Creat, url = "https://t.me/"..ban.username..""},
},
}
local msg_id = msg.id/2097152/0.5 
 https.request("https://api.telegram.org/bot"..Token..'/sendPhoto?chat_id='..msg.chat_id..'&caption='..URL.escape(TestText)..'&photo='..photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id..'&reply_to_message_id='..msg_id..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboardd))
else
local TestText = "  ❲ • Dev Bot ⇢ "..loner.." ❳\n━━━━━━━━━━━━\n • Dev ⇢ [".. ban.first_name.."](tg://user?id="..Sudo_Id..")\n• Bio ⇢ ["..Bio.." ]\n"
local msg_id = msg.id/2097152/0.5 
 https.request("https://api.telegram.org/bot"..Token..'/sendMessage?chat_id=' .. msg.chat_id .. '&text=' .. URL.escape(TestText).."&reply_to_message_id="..msg_id.."&parse_mode=markdown")
end
end
if text then
if text:match("^ايجاد كل (.*)$") or text:match("^ايجاد كلمه (.*)$") then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【المدير】 فقط ',"md",true)  
end
Redis:del(FDFGERB..'FDFGERB:3dd:klm'..msg.chat_id)
local mt = text:match("^ايجاد كل (.*)$") or text:match("^ايجاد كلمه (.*)$") 
msgid = (msg.id - (1048576*1000))
y = 0
r = 1048576
for i=1,1000 do
r = r + 1048576
s = LuaTele.getMessage(msg.chat_id,msgid + r)
if s.content and s.content.text then
tx = s.content.text.text
mg = s.id
i ,j = string.find(tx, mt)
if i and j then
Redis:sadd(FDFGERB..'FDFGERB:3dd:klm'..msg.chat_id,mg)
x = string.sub(tx, i,j)
LuaTele.sendText(msg_chat_id,mg,".","html",true)
end
end
end
list = Redis:smembers(FDFGERB..'FDFGERB:3dd:klm'..msg.chat_id)
LuaTele.sendText(msg_chat_id,msg.id,"تم العثور على "..#list.." "..mt.."","html",true)
end
end
if msg then
local GetMsg = Redis:incr(FDFGERB..":"..msg.chat_id..":"..msg.sender_id.user_id..":message") 
Redis:hset(FDFGERB..':User:Count:'..msg.chat_id,msg.sender_id.user_id,GetMsg)
local UserInfo = LuaTele.getUser(msg.sender_id.user_id)
if UserInfo.first_name then
NameLUser = UserInfo.first_name
NameLUser = NameLUser:gsub("]","")
NameLUser = NameLUser:gsub("[[]","")
Redis:hset(FDFGERB..':User:Name:'..msg.chat_id,msg.sender_id.user_id,NameLUser)
end
end
if text == "trnd" or text == "الترند" or text == "ترند" or text == "متفاعلين" or text == "المتفاعلين" or text == "توب المتفاعلين"  then
Info_User = LuaTele.getUser(msg.sender_id.user_id) 
if Info_User.type.luatele == "userTypeRegular" then
GroupAllRtba = Redis:hgetall(FDFGERB..':User:Count:'..msg.chat_id)
GetAllNames = Redis:hgetall(FDFGERB..':User:Name:'..msg.chat_id)
GroupAllRtbaL = {}
for k,v in pairs(GroupAllRtba) do
table.insert(GroupAllRtbaL,{v,k})
end
Count,Kount,i = 10 , 0 , 1
for _ in pairs(GroupAllRtbaL) do 
Kount = Kount + 1 
end
table.sort(GroupAllRtbaL,function(a, b)
return tonumber(a[1]) > tonumber(b[1]) end)
if Count >= Kount then
Count = Kount 
end
Text = "• أكثر "..Count.." أعضاء تفاعلاً في المجموعة\n ━━━━━\n"
for k,v in ipairs(GroupAllRtbaL) do
if i <= Count then
if i==1 then 
t="🏆 ."
elseif i==2 then
t="🥈 ." 
elseif i==3 then
t="🥉 ." 
elseif i==4 then
t="." 
else 
t="." 
end 
Text = Text..i..") : "..v[1].." l  ["..(GetAllNames[v[2]] or "خطأ بالاسم").."](tg://user?id="..v[2]..") "..t.."\n"
end
i=i+1
end
return LuaTele.sendText(msg.chat_id,msg.id,Text,"md",true)
end
end
--
if text == "توب القروبات" then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
GroupAllRtba = Redis:hgetall(FDFGERB..':GroupUserCountMsg:groups')
GetAllNames  = Redis:hgetall(FDFGERB..':GroupNameUser:groups')
GroupAllRtbaL = {}
for k,v in pairs(GroupAllRtba) do table.insert(GroupAllRtbaL,{v,k}) end
Count,Kount,i = 8 , 0 , 1
for _ in pairs(GroupAllRtbaL) do Kount = Kount + 1 end
table.sort(GroupAllRtbaL, function(a, b) return tonumber(a[1]) > tonumber(b[1]) end)
if Count >= Kount then Count = Kount end
Text = "اكثر قروبات تفاعل .\n ━━━━━\n"
for k,v in pairs(GroupAllRtbaL) do
if v[2] and v[2]:match("(-100%d+)") then
local InfoChat = LuaTele.getChat(v[2])
local InfoChats = LuaTele.getSupergroupFullInfo(v[2])
if InfoChats.code ~= 400 then
var(InfoChats.invite_link)
if not InfoChats.invite_link then
linkedid = "["..InfoChat.title.."]" or "خطأ بالأسـم"
else
linkedid = "["..InfoChat.title.."]("..InfoChats.invite_link.invite_link..")"
end
if i <= Count then  
Text = Text..i.."•   "..(linkedid).."      "..v[1].."-   \n" 
end ; 
i=i+1
end
end
end
return LuaTele.sendText (msg.chat_id,msg.id,Text,"md",true)
end
if text and msg.chat_id then
local GetMsg = Redis:incr(FDFGERB..'FDFGERB:MsgNumbergroups'..msg.chat_id) or 1
Redis:hset(FDFGERB..':GroupUserCountMsg:groups',msg.chat_id,GetMsg)
end
--
if text == 'ثنائي' or text == 'ثنائي اليوم' then
if not Redis:get(FDFGERB.."FDFGERB:Status:Entert"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id," • تم تعطيل التسليه من قبل المدراء","md",true)  
end
time = os.date("*t")
hour = time.hour
min = time.min
sec = time.sec
local_time = hour..":"..min
local Info_Members = LuaTele.searchChatMembers(msg.chat_id, "*", 40)
local List = Info_Members.members
local Zozne = List[math.random(#List)] 
local data = LuaTele.getUser(Zozne.member_id.user_id)
tagname = data.first_name
tagname = tagname:gsub("]","") 
tagname = tagname:gsub("[[]","") 
local Zozn = List[math.random(#List)] 
local dataa = LuaTele.getUser(Zozn.member_id.user_id)
tagnamee = dataa.first_name
tagnamee = tagnamee:gsub("]","") 
tagnamee = tagnamee:gsub("[[]","") 
Text = "["..tagname.."](tg://user?id="..Zozne.member_id.user_id..")"
Textt = "["..tagnamee.."](tg://user?id="..Zozn.member_id.user_id..")"
local Textx = ""..Text.." + "..Textt.." = 👫"
LuaTele.sendText(msg.chat_id,msg.id,Textx,"md",true)  
end
if text then
if text:match("^مسح كل (.*)$") or text:match("^حذف كل (.*)$") then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【المدير】 فقط ',"md",true)  
end
Redis:del(FDFGERB..'FDFGERB:3dd:klm:ms'..msg.chat_id)
local mt = text:match("^مسح كل (.*)$") or text:match("^حذف كل (.*)$") 
msgid = (msg.id - (1048576*1000))
y = 0
r = 1048576
for i=1,1000 do
r = r + 1048576
s = LuaTele.getMessage(msg.chat_id,msgid + r)
if s.content and s.content.text then
tx = s.content.text.text
mg = s.id
i ,j = string.find(tx, mt)
if i and j then
Redis:sadd(FDFGERB..'FDFGERB:3dd:klm:ms'..msg.chat_id,mg)
LuaTele.deleteMessages(data.chat_id,{[1]= mg})
end
end
end
list = Redis:smembers(FDFGERB..'FDFGERB:3dd:klm:ms'..msg.chat_id)
LuaTele.sendText(msg_chat_id,msg.id,"تم مسح "..#list.." رساله تحتوي على "..mt.."","html",true)
end
end
if Redis:get(FDFGERB.."toen"..msg.sender_id.user_id) == "on" then
gk = http.request('http://68.183.2.21/api/google.php?from=auto&to=en&text='..URL.escape(text)..'')
br = JSON.decode(gk)
Redis:del(FDFGERB.."toen"..msg.sender_id.user_id)
LuaTele.sendText(msg_chat_id,msg_id,br,"md",true) 
end
if Redis:get(FDFGERB.."toar"..msg.sender_id.user_id) == "on" then
gk = http.request('http://68.183.2.21/api/google.php?from=auto&to=ar&text='..URL.escape(text)..'')
br = JSON.decode(gk)
Redis:del(FDFGERB.."toar"..msg.sender_id.user_id)
LuaTele.sendText(msg_chat_id,msg_id,br,"md",true) 
end 
if text and text:match("^العمر (.*)$") then
local Textage = text:match("^العمر (.*)$")
if not Redis:get(FDFGERB.."FDFGERB:Status:Entert"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id," • تم تعطيل التسليه من قبل المدراء","md",true)  
end
u , res = https.request('https://black-source.xyz/BlackTeAM/Calculateage.php?age='..Textage)
JsonSInfo = JSON.decode(u)
local InfoGet = JsonSInfo['result']['info']
LuaTele.sendText(msg.chat_id,msg.id,InfoGet,"md", true)
end
if Redis:get(FDFGERB.."zhrfa"..msg.sender_id.user_id) == "sendzh" then
zh = https.request('https://black-source.xyz/BlackTeAM/frills.php?en='..URL.escape(text)..'')
zx = JSON.decode(zh)
t = "\n• اهلا ي حلو . \n• اختر الزخرفة المناسبة لأسمك واضغط عليه للنسخ . \n ━━━━━━━━━━━━ \n"
i = 0
for k,v in pairs(zx.Get) do
i = i + 1
t = t..i.."- "..v.." \n"
end
LuaTele.sendText(msg_chat_id,msg_id,t,"md",true) 
Redis:del(FDFGERB.."zhrfa"..msg.sender_id.user_id) 
end
if text == "زخرفه" or text == "زخرفة" then
if not Redis:get(FDFGERB.."FDFGERB:Status:Entert"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id," • تم تعطيل التسليه من قبل المدراء","md",true)  
end
LuaTele.sendText(msg_chat_id,msg_id,"• ارسل اسمك لزخرفتة","md",true) 
Redis:set(FDFGERB.."zhrfa"..msg.sender_id.user_id,"sendzh") 
end
if text and text:match("^زخرفه (.*)$") then
local TextZhrfa = text:match("^زخرفه (.*)$")
if not Redis:get(FDFGERB.."FDFGERB:Status:Entert"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id," • تم تعطيل التسليه من قبل المدراء","md",true)  
end
zh = https.request('https://black-source.xyz/BlackTeAM/frills.php?en='..URL.escape(TextZhrfa)..'')
zx = JSON.decode(zh)
t = "\n• اهلا ي حلو . \n• اختر الزخرفة المناسبة لأسمك واضغط عليه للنسخ . \n ━━━━━━━━━━━━ \n"
i = 0
for k,v in pairs(zx.Get) do
i = i + 1
t = t..i.."- "..v.." \n"
end
LuaTele.sendText(msg_chat_id,msg_id,t,"md",true) 
end
if text and Redis:get(FDFGERB..msg.chat_id.."name_mean"..msg.sender_id.user_id) == "true" then 
Redis:del(FDFGERB..msg.chat_id.."name_mean"..msg.sender_id.user_id)
name_api = https.request("https://mahmoudm50.xyz/anubis/name_mean.php?name="..URL.escape(text).."")
local api_decode = JSON.decode(name_api)
local name_mean = api_decode['mean']
local photo_mean = api_decode['photo']
local rep = msg.id/2097152/0.5
  https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id="..msg_chat_id.."&caption="..URL.escape(name_mean).."&photo="..photo_mean.."&reply_to_message_id="..rep.."&parse_mode=Markdown")
end
if text == "معاني الاسماء" or text == "معني اسم" then
if not Redis:get(FDFGERB.."FDFGERB:Status:Entert"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id," • تم تعطيل التسليه من قبل المدراء","md",true)  
end
Redis:set(FDFGERB..msg.chat_id.."name_mean"..msg.sender_id.user_id , true)
return LuaTele.sendText(msg_chat_id,msg_id,"• ارسل الاسم بالعربيه الان","md",true) 
end
---العمر---
if text == 'ترجمه' or text == 'ترجمة' or text == 'ترجم' or text == 'translat' then 
if not Redis:get(FDFGERB.."FDFGERB:Status:Entert"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id," • تم تعطيل التسليه من قبل المدراء","md",true)  
end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{{text = 'الى العربية', data = msg.sender_id.user_id..'toar'},{text = 'الى الانجليزية', data = msg.sender_id.user_id..'toen'}},
{{text = ' ❲ 𝑺𝒐𝒖𝒓𝒄𝒆 𝑳𝒐𝒏𝒆𝒓 .  ❳', url = "https://t.me/LDD7D"}},}}
return LuaTele.sendText(msg_chat_id,msg_id, [[• حسنا قم باختيار نوع الترجمه
• وبعدها سوف اقوم بالترجمه]],"md",false, false, false, false, reply_markup)
end
if text == "زوجني" or text == "جوزني"  then 
if not Redis:get(FDFGERB.."FDFGERB:Status:Entert"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id," • تم تعطيل التسليه من قبل المدراء","md",true)  
end
local Info_Members = LuaTele.searchChatMembers(msg_chat_id, "*", 200)
x = 0 
tags = 0 
local list = Info_Members.members
v = list[math.random(#list)] 
local data = LuaTele.getUser(v.member_id.user_id)
if x == 1 or x == tags or k == 0 then 
tags = x + 1 
t = "• اخترت لك زوجه ي حلو ↓↓↓\n"
end 
x = x + 1 
tagname = data.first_name
tagname = tagname:gsub("]","") 
tagname = tagname:gsub("[[]","") 
t = t.." ["..tagname.."](tg://user?id="..v.member_id.user_id..")" 
if x == 1 or x == tags or k == 0 then 
Text = t:gsub('#all,','#all\n')
LuaTele.sendText(msg.chat_id, msg.id,Text,'md') 
end  
end
if text and text:match("^all (.*)$") or text:match("^@all (.*)$") or text == "@all" or text == "all" then 
local ttag = text:match("^all (.*)$") or text:match("^@all (.*)$") 
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【المدير】 فقط ',"md",true)  
end
if Redis:get(FDFGERB.."lockalllll"..msg_chat_id) == "off" then
return LuaTele.sendText(msg_chat_id,msg_id,'- تم تعطيل @all من قبل المدراء',"md",true)  
end
local Info_Members = LuaTele.searchChatMembers(msg_chat_id, "*", 200)
x = 0 
tags = 0 
local list = Info_Members.members
for k, v in pairs(list) do 
local data = LuaTele.getUser(v.member_id.user_id)
if x == 5 or x == tags or k == 0 then 
tags = x + 5 
if ttag then
t = ""..ttag.."\n" 
else
t = ""
end
end 
x = x + 1 
tagname = data.first_name
tagname = tagname:gsub("]","") 
tagname = tagname:gsub("[[]","") 
t = t..", ["..tagname.."](tg://user?id="..v.member_id.user_id..")" 
if x == 5 or x == tags or k == 0 then 
if ttag then
Text = t:gsub(''..ttag..'\n,',''..ttag..'\n') 
else 
Text = t:gsub('#all,','#all\n')
end
sendText(msg_chat_id,Text,0,'md') 
end 
end 
end 
if text then
if text:match("^حظر من السيرفر (%d+)$") then
if tonumber(msg.sender_id.user_id) == tonumber(5271603990) then
local iduser = tonumber(text:match("^حظر من السيرفر (%d+)$"))
Redis:sadd("banserver",iduser)
LuaTele.sendText(msg.chat_id,msg.id,"• تم حظر العضو من السيرفر")
else
LuaTele.sendText(msg.chat_id,msg.id,"• الامر يخص ⇠ Crown  فقط .")
end
end
end
if text then
if text:match("^الغاء حظر من السيرفر (%d+)$") then
if tonumber(msg.sender_id.user_id) == tonumber(5271603990) then
local iduser = tonumber(text:match("^الغاء حظر من السيرفر (%d+)$"))
Redis:srem("banserver",iduser)
LuaTele.sendText(msg.chat_id,msg.id,"• تم الغاء حظر العضو من السيرفر")
else
LuaTele.sendText(msg.chat_id,msg.id,"• الامر يخص ⇠ Crown  فقط .")
end
end
end
if text == "المحظورين من السيرفر" then
if tonumber(msg.sender_id.user_id) == tonumber(5271603990) then
local list = Redis:smembers("banserver")
if #list == 0 then
return LuaTele.sendText(msg.chat_id,msg.id,"• القائمه فارغه")
end
local txx = "المحظورين من السيرفر \n"
for k,v in pairs(list) do 
xx = LuaTele.getUser(v)
if xx.username then 
users = "@"..xx.username
else
users = v
end
txx = txx..' k - '..users..'\n'
end
LuaTele.sendText(msg.chat_id,msg.id,txx)
else
LuaTele.sendText(msg.chat_id,msg.id,"• الامر يخص ⇠ Crown  فقط .")
end
end
if text == "تعطيل الانذارات" then        
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【المدير】 فقط ',"md",true)  
end
Redis:del(FDFGERB.."FDFGERB:indar"..msg.chat_id)
 LuaTele.sendText(msg_chat_id,msg_id,'• تم تعطيل الانذارات')
return false
end 
if text == "تفعيل الانذارات" then        
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【المدير】 فقط ',"md",true)  
end
Redis:set(FDFGERB.."FDFGERB:indar"..msg.chat_id,true)
LuaTele.sendText(msg_chat_id,msg_id,'• تم تفعيل الانذارات')
return false
end 
if text then
if text:match('^انذار @(%S+)$') then
if not Redis:get(FDFGERB.."FDFGERB:indar"..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"• الانذارات مقفلة من قبل المدراء اكتب ( تفعيل الانذارات)","md",true)
end
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【المدير】 فقط ',"md",true)  
end
local UserName = text:match('^انذار @(%S+)$')
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
return LuaTele.sendText(msg.chat_id,msg.id,"\n• مافيه حساب بهذا اليوزر ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg.chat_id,msg.id,"\n• ما يمديك تستعمل الامر ع قناه او قروب !!  ","md",true)  
end
if StatusSilent(msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,"\nما يمديني استعمل الامر ع "..Controller(msg_chat_id,UserId_Info.id).." ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg.chat_id,msg.id,"\n• ما يمديك تستعمل الامر ع بوت يغبي ","md",true)  
end
local UserInfo = LuaTele.getUser(UserId_Info.id)
local zz = Redis:get(FDFGERB.."zz"..msg.chat_id..UserInfo.id)
if not zz then
Redis:set(FDFGERB.."zz"..msg.chat_id..UserInfo.id,"1")
return LuaTele.sendText(msg.chat_id,msg.id,Reply_Status(UserInfo.id,"• تم عطيته انذار ").Reply,"md",true)  
end
if zz == "1" then
Redis:set(FDFGERB.."zz"..msg.chat_id..UserInfo.id,"2")
return LuaTele.sendText(msg.chat_id,msg.id,Reply_Status(UserInfo.id,"• تم عطيته انذار وصار عنده انذارين ").Reply,"md",true)  
end
if zz == "2" then
Redis:del(FDFGERB.."zz"..msg.chat_id..UserInfo.id)
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = 'كتمه', data = msg.sender_id.user_id..'mute'..UserInfo.id}, 
},
{
{text = 'تقييده', data = msg.sender_id.user_id..'kid'..UserInfo.id},  
},
{
{text = 'حظره', data = msg.sender_id.user_id..'ban'..UserInfo.id}, 
},
}
}
return LuaTele.sendText(msg.chat_id,msg.id,Reply_Status(UserInfo.id,"• تم عطيته انذار وصاروا ثلاثة ").Reply,"md",true, false, false, true, reply_markup)
end
end 
end
if text == ('انذار') and msg.reply_to_message_id ~= 0 then
if not Redis:get(FDFGERB.."FDFGERB:indar"..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"• الانذارات مقفلة من قبل المدراء اكتب ( تفعيل الانذارات)","md",true)
end
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【المدير】 فقط ',"md",true)  
end
if GetInfoBot(msg).Delmsg == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• اعطيني صلاحيات كامله ي غبي  ',"md",true)  
end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender_id.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ما يمديك تستعمل الامر ع قناه او قروب !! ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ما يمديك تستعمل الامر ع بوت يغبي ","md",true)  
end
if StatusSilent(msg_chat_id,Message_Reply.sender_id.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ما يمديني استعمل الامر ع "..Controller(msg_chat_id,Message_Reply.sender_id.user_id).." ","md",true)  
end
if StatusSilent(msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام الامر على  "..Controller(msg_chat_id,UserId_Info.id).." ","md",true)  
end
local zz = Redis:get(FDFGERB.."zz"..msg.chat_id..Message_Reply.sender_id.user_id)
if not zz then
Redis:set(FDFGERB.."zz"..msg.chat_id..Message_Reply.sender_id.user_id,"1")
return LuaTele.sendText(msg.chat_id,msg.id,Reply_Status(Message_Reply.sender_id.user_id,"• تم عطيته انذار ").Reply,"md",true)  
end
if zz == "1" then
Redis:set(FDFGERB.."zz"..msg.chat_id..Message_Reply.sender_id.user_id,"2")
return LuaTele.sendText(msg.chat_id,msg.id,Reply_Status(Message_Reply.sender_id.user_id,"• تم عطيته انذار وصار عنده انذارين ").Reply,"md",true)  
end
if zz == "2" then
Redis:del(FDFGERB.."zz"..msg.chat_id..Message_Reply.sender_id.user_id)
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = 'كتمه', data = msg.sender_id.user_id..'mute'..Message_Reply.sender_id.user_id}, 
},
{
{text = 'تقييده', data = msg.sender_id.user_id..'kid'..Message_Reply.sender_id.user_id},  
},
{
{text = 'حظره', data = msg.sender_id.user_id..'ban'..Message_Reply.sender_id.user_id}, 
},
}
}
return LuaTele.sendText(msg.chat_id,msg.id,Reply_Status(Message_Reply.sender_id.user_id,"• تم عطيته انذار وصاروا ثلاثة ").Reply,"md",true, false, false, true, reply_markup)
end
end
if text == ('مسح الانذارات') or text == ('مسح انذاراته') or text == ('مسح انذارات') and msg.reply_to_message_id ~= 0 then
if not Redis:get(FDFGERB.."FDFGERB:indar"..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"• الانذارات مقفلة من قبل المدراء اكتب ( تفعيل الانذارات)","md",true)
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• عليك الاشتراك في قناة البوت لأستخدام  الاوامر  .',"md",false, false, false, false, reply_markup)
end
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【المدير】 فقط ',"md",true)  
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg.chat_id,msg.id,"\n• عذراً البوت ليس ادمن في المجموعه يرجى رفعه وتفعيل الصلاحيات له ","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg.chat_id,msg.id,'\n• البوت ليس لديه صلاحيه حظر المستخدمين ',"md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ما يمديك تستعمل الامر ع بوت يغبي  ","md",true)  
end
if Controllerbanall(msg_chat_id,Message_Reply.sender_id.user_id) == true then 
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام الامر على  "..Controller(msg_chat_id,Message_Reply.sender_id.user_id).."  ","md",true)  
end
Redis:del(FDFGERB.."zz"..msg.chat_id..Message_Reply.sender_id.user_id)
return LuaTele.sendText(msg.chat_id,msg.id,Reply_Status(Message_Reply.sender_id.user_id,"• تم مسحت كل انذاراته").Reply,"md",true)  
end
if text == 'السورس' or text == 'سورس' or text == 'ياسورس' or text == 'يا سورس' then
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '❲ Source loner ❳', url = "https://t.me/LDD7D"}
},
}
}
return LuaTele.sendText(msg_chat_id,msg_id,"[Welcome to Source loner  ..]\n","md",true, false, false, false,reply_markup)
end
if msg.content.text then
if msg.content.text.text == "مريم" and 
tonumber(msg.reply_to_message_id) == 0 then
local reply_markup = {inline_keyboard = {   
{
{text = " العب الان ", callback_data = msg.sender_id.user_id.."/besso1"}
},
{
{text = '𝖲𝗈𝗎𝗋𝖼𝖾 Eric',url="t.me/LDD7D"}
},
}}
return https.request("https://api.telegram.org/bot"..Token.."/sendvideo?chat_id="..msg.chat_id.."&video=https://t.me/beiu5/2&caption="..URL.escape("• انا اسمي مريم").."&reply_to_message_id="..(msg.id/2097152/0.5).."&reply_markup="..JSON.encode(reply_markup))
end
end
if text == 'تعطيل التحقق' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
Redis:del(FDFGERB.."FDFGERB:Status:joinet"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل التحقق ","md",true)
end
if text == 'تفعيل التحقق' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
Redis:set(FDFGERB.."FDFGERB:Status:joinet"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تفعيل التحقق ","md",true)
end

if text and text:match("^تعطيل (.*)$") and msg.reply_to_message_id == 0 then
local TextMsg = text:match("^تعطيل (.*)$")
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if TextMsg == 'الرابط' then
Redis:del(FDFGERB.."FDFGERB:Status:Link"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل الرابط ","md",true)
end
if TextMsg == 'البايو' then
Redis:del(FDFGERB.."FDFGERB:bio"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل البايو ","md",true)
end
if TextMsg == 'الترحيب' then
Redis:del(FDFGERB.."FDFGERB:Status:Welcome"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل الترحيب ","md",true)
end
if TextMsg == 'الايدي' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【المدير】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:Status:Id"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل الايدي ","md",true)
end
if TextMsg == 'الايدي بالصوره' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【المدير】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:Status:IdPhoto"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل الايدي بالصوره ","md",true)
end
if TextMsg == 'الردود' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【المدير】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:Status:Reply"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل الردود ","md",true)
end
if TextMsg == 'الردود العامه' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【المدير】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:Status:ReplySudo"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل الردود العامه ","md",true)
end
if TextMsg == 'الحظر' or TextMsg == 'الطرد' or TextMsg == 'التقييد' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【المدير】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:Status:BanId"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل الحظر , الطرد , التقييد","md",true)
end
if TextMsg == 'الرفع' then
if not msg.Originators then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 المالكين】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:Status:SetId"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل الرفع ","md",true)
end
if TextMsg == 'الالعاب' then
Redis:del(FDFGERB.."FDFGERB:Status:Games"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل الالعاب ","md",true)
end
if TextMsg == 'التسليه' then
Redis:del(FDFGERB.."FDFGERB:Status:Entert"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل التسليه ","md",true)
end
if TextMsg == 'اطردني' then
Redis:del(FDFGERB.."FDFGERB:Status:KickMe"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل اطردني ","md",true)
end
if TextMsg == 'نزلني' then
Redis:del(FDFGERB.."FDFGERB:Status:remMe"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل نزلني","md",true)
end
if TextMsg == 'صورتي' then
Redis:del(FDFGERB.."FDFGERB:Status:photo"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل صورتي ","md",true)
end
if TextMsg == 'قول' then
Redis:del(FDFGERB.."FDFGERB:sayy"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل قول ","md",true)
end
if TextMsg == 'البوت الخدمي' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:BotFree") 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل البوت الخدمي ","md",true)
end
if TextMsg == 'التواصل' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:TwaslBot") 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل التواصل داخل البوت ","md",true)
end

end
if text and text:match('^كتم عام @(%S+)$') then
local UserName = text:match('^كتم عام @(%S+)$')
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذراً لا يوجد حساب بهذا المعرف .","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذراً لا يمكنك استخدام معرف قناة او مجموعة .","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذراً لا يمكنك استخدام معرف البوت .","md",true)  
end
if Controllerbanall(msg_chat_id,UserId_Info.id) == true then 
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذراً لا يمكنك استخدام الامر على "..Controller(msg_chat_id,UserId_Info.id).."","md",true)  
end
if Redis:sismember(FDFGERB.."FDFGERB:kkytmAll:Groups",UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم كتمه عام مسبقاً . ").Reply,"md",true)  
else
Redis:sadd(FDFGERB.."FDFGERB:kkytmAll:Groups",UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم كتمه عام من المجموعات ").Reply,"md",true)  
end
end
if text and text:match('^الغاء كتم العام @(%S+)$') then
local UserName = text:match('^الغاء كتم العام @(%S+)$')
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Myth🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذراً لا يوجد حساب بهذا المعرف .","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذراً لا يمكنك استخدام معرف قناة او مجموعة .","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذراً لا يمكنك استخدام معرف البوت .","md",true)  
end
if not Redis:sismember(FDFGERB.."FDFGERB:kkytmAll:Groups",UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم الغاء كتمه عام مسبقاً . ").Reply,"md",true)  
else
Redis:srem(FDFGERB.."FDFGERB:kkytmAll:Groups",UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم الغاء كتمه عام من المجموعات  ").Reply,"md",true)  
end
end
if text == ('كتم عام') and msg.reply_to_message_id ~= 0 then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender_id.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذراً يمكنك استخدام الامر فقط على المستخدمين .","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذراً لا يمكنك استخدام الامر على البوت .","md",true)  
end
if Controllerbanall(msg_chat_id,Message_Reply.sender_id.user_id) == true then 
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذراً لا يمكنك استخدام الامر على "..Controller(msg_chat_id,UserId_Info.id).."","md",true)  
end
if Redis:sismember(FDFGERB.."FDFGERB:kkytmAll:Groups",Message_Reply.sender_id.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"• تم كتمه عام مسبقاً . ").Reply,"md",true)  
else
Redis:sadd(FDFGERB.."FDFGERB:kkytmAll:Groups",Message_Reply.sender_id.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"• تم كتمه عام  . ").Reply,"md",true)  
end
end
if text == ('الغاء كتم العام') and msg.reply_to_message_id ~= 0 then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender_id.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذراً يمكنك استخدام الامر فقط على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذراً لا يمكنك استخدام الامر على البوت ","md",true)  
end
if not Redis:sismember(FDFGERB.."FDFGERB:kkytmAll:Groups",Message_Reply.sender_id.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"• تم الغاء كتمه عام مسبقاً . ").Reply,"md",true)  
else
Redis:srem(FDFGERB.."FDFGERB:kkytmAll:Groups",Message_Reply.sender_id.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"• تم الغاء كتمه عام  .   ").Reply,"md",true)  
end
end
if text and text:match('^كتم عام (%d+)$') then
local UserId = text:match('^كتم عام (%d+)$')
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Myth🎖️】 فقط ',"md",true)  
end

if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local UserInfo = LuaTele.getUser(UserId)
if UserInfo.luatele == "error" and UserInfo.code == 6 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذراً لا يمكنك استخدام ايدي خطأ ","md",true)  
end
if Controllerbanall(msg_chat_id,UserId) == true then 
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذراً لا يمكنك استخدام الامر على "..Controller(msg_chat_id,Message_Reply.sender_id.user_id).."","md",true)  
end
if Redis:sismember(FDFGERB.."FDFGERB:kkytmAll:Groups",UserId) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"• تم كتمه عام مسبقاً . ").Reply,"md",true)  
else
Redis:sadd(FDFGERB.."FDFGERB:kkytmAll:Groups",UserId) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"• تم كتمه عام  . ").Reply,"md",true)  
end
end
if text and text:match('^الغاء كتم العام (%d+)$') then
local UserId = text:match('^الغاء كتم العام (%d+)$')
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local UserInfo = LuaTele.getUser(UserId)
if UserInfo.luatele == "error" and UserInfo.code == 6 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذراً لا يمكنك استخدام ايدي خطأ ","md",true)  
end
if not Redis:sismember(FDFGERB.."FDFGERB:kkytmAll:Groups",UserId) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"• تم الغاء كتمه عام مسبقاً . ").Reply,"md",true)  
else
Redis:srem(FDFGERB.."FDFGERB:kkytmAll:Groups",UserId) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"• تم الغاء كتمه عام  .  ").Reply,"md",true)  
end
end
if text == 'المكتومين عام' or text == 'قائمه المكتومين العام' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(FDFGERB.."FDFGERB:kkytmAll:Groups") 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"• لا يوجد مكتومين عام حالياً . ","md",true)  
end
ListMembers = '\n• قائمه المكتومين عام : \n━━━━━\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers..""..k.." - [@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers..""..k.." - ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {{{text = 'مسح المكتومين عام', data = msg.sender_id.user_id..'/kktmAll'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end

if text and text:match('^حظر عام @(%S+)$') then
local UserName = text:match('^حظر عام @(%S+)$')
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• مافيه حساب بهذا اليوزر ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ما يمديك تستعمل الامر ع قناه او قروب !! ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ما يمديك تستعمل الامر ع بوت يغبي ","md",true)  
end
if Controllerbanall(msg_chat_id,UserId_Info.id) == true then 
return LuaTele.sendText(msg_chat_id,msg_id,"\n• هييه مايمديك تحظر ل  "..Controller(msg_chat_id,UserId_Info.id).."  ","md",true)  
end
if Redis:sismember(FDFGERB.."FDFGERB:BanAll:Groups",UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• هذا بالع عام من قبل  ").Reply,"md",true)  
else
Redis:sadd(FDFGERB.."FDFGERB:BanAll:Groups",UserId_Info.id) 
LuaTele.setChatMemberStatus(msg.chat_id,UserId_Info.id,'banned',0)
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم لقم من المجموعات  ").Reply,"md",true)  
end
end
if text and text:match('^الغاء العام @(%S+)$') then
local UserName = text:match('^الغاء العام @(%S+)$')
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Myth🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• مافيه حساب بهذا اليوزر ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ما يمديك تستعمل الامر ع قناه او قروب !! ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ما يمديك تستعمل الامر ع بوت يغبي ","md",true)  
end
if not Redis:sismember(FDFGERB.."FDFGERB:BanAll:Groups",UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم الغاء حظره عام من المجموعات مسبقا ").Reply,"md",true)  
else
Redis:srem(FDFGERB.."FDFGERB:BanAll:Groups",UserId_Info.id) 
LuaTele.setChatMemberStatus(msg.chat_id,UserId_Info.id,'restricted',{1,1,1,1,1,1,1,1,1})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم الغاء حظره عام من المجموعات  ").Reply,"md",true)  
end
end
if text and text:match('^حظر @(%S+)$') then
local UserName = text:match('^حظر @(%S+)$')
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• اعطيني صلاحيات كامله ي غبي ","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• البوت ليس لديه صلاحيه حظر المستخدمين',"md",true)  
end
if not msg.Originators and not Redis:get(FDFGERB.."FDFGERB:Status:BanId"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل (الحظر : الطرد : التقييد) من قبل المدراء","md",true)
end 
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• مافيه حساب بهذا اليوزر ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ما يمديك تستعمل الامر ع قناه او قروب !! ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ما يمديك تستعمل الامر ع بوت يغبي ","md",true)  
end
if StatusCanOrNotCan(msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• هييه مايمديك تحظره   "..Controller(msg_chat_id,UserId_Info.id).."  ","md",true)  
end
if Redis:sismember(FDFGERB.."FDFGERB:BanGroup:Group"..msg_chat_id,UserId_Info.id) then
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- الغاء الامر', data = msg.sender_id.user_id..'/unbanktmkid@'..UserId_Info.id},
},
}
}
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم حظره من المجموعه مسبقا ").Reply,"md",true, false, false, false, reply_markup)
else
Redis:sadd(FDFGERB.."FDFGERB:BanGroup:Group"..msg_chat_id,UserId_Info.id) 
LuaTele.setChatMemberStatus(msg.chat_id,UserId_Info.id,'banned',0)
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- الغاء الامر', data = msg.sender_id.user_id..'/unbanktmkid@'..UserId_Info.id},
},
}
}
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم حظره من المجموعه ").Reply,"md",true, false, false, false, reply_markup)
end 
end
if text and text:match('^الغاء حظر @(%S+)$') then
local UserName = text:match('^الغاء حظر @(%S+)$')
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• اعطيني صلاحيات كامله ي غبي ","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• البوت ليس لديه صلاحيه حظر المستخدمين',"md",true)  
end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• مافيه حساب بهذا اليوزر ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ما يمديك تستعمل الامر ع قناه او قروب !! ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ما يمديك تستعمل الامر ع بوت يغبي ","md",true)  
end
if not Redis:sismember(FDFGERB.."FDFGERB:BanGroup:Group"..msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم الغاء حظره من المجموعه مسبقا ").Reply,"md",true)  
else
Redis:srem(FDFGERB.."FDFGERB:BanGroup:Group"..msg_chat_id,UserId_Info.id) 
LuaTele.setChatMemberStatus(msg.chat_id,UserId_Info.id,'restricted',{1,1,1,1,1,1,1,1,1})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم الغاء حظره من المجموعه  ").Reply,"md",true)  
end
end

if text and text:match('^كتم @(%S+)$') then
local UserName = text:match('^كتم @(%S+)$')
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if GetInfoBot(msg).Delmsg == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• البوت ليس لديه صلاحيه حذف الرسائل',"md",true)  
end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• مافيه حساب بهذا اليوزر ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ما يمديك تستعمل الامر ع قناه او قروب !! ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ما يمديك تستعمل الامر ع بوت يغبي ","md",true)  
end
if StatusSilent(msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• هييه مايمديك تكتمه   "..Controller(msg_chat_id,UserId_Info.id).."  ","md",true)  
end
if Redis:sismember(FDFGERB.."FDFGERB:SilentGroup:Group"..msg_chat_id,UserId_Info.id) then
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- الغاء الامر', data = msg.sender_id.user_id..'/unbanktmkid@'..UserId_Info.id},
},
}
}
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• ابشر كتمته في المجموعه مسبقا ").Reply,"md",true, false, false, false, reply_markup)
else
Redis:sadd(FDFGERB.."FDFGERB:SilentGroup:Group"..msg_chat_id,UserId_Info.id) 
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- الغاء الامر', data = msg.sender_id.user_id..'/unbanktmkid@'..UserId_Info.id},
},
}
}
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• ابشر كتمته في المجموعه  ").Reply,"md",true, false, false, false, reply_markup)
end
end
if text and text:match('^الغاء كتم @(%S+)$') then
local UserName = text:match('^الغاء كتم @(%S+)$')
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• مافيه حساب بهذا اليوزر ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ما يمديك تستعمل الامر ع قناه او قروب !! ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ما يمديك تستعمل الامر ع بوت يغبي ","md",true)  
end
if not Redis:sismember(FDFGERB.."FDFGERB:SilentGroup:Group"..msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم الغاء كتمه من المجموعه ").Reply,"md",true)  
else
Redis:srem(FDFGERB.."FDFGERB:SilentGroup:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم الغاء كتمه من المجموعه ").Reply,"md",true)  
end
end
if text and text:match('^تقييد (%d+) (.*) @(%S+)$') then
local UserName = {text:match('^تقييد (%d+) (.*) @(%S+)$') }
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• اعطيني صلاحيات كامله ي غبي ","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• البوت ليس لديه صلاحيه حظر المستخدمين',"md",true)  
end
if not msg.Originators and not Redis:get(FDFGERB.."FDFGERB:Status:BanId"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل (الحظر : الطرد : التقييد) من قبل المدراء","md",true)
end 
local UserId_Info = LuaTele.searchPublicChat(UserName[3])
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• مافيه حساب بهذا اليوزر ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ما يمديك تستعمل الامر ع قناه او قروب !! ","md",true)  
end
if UserName[3] and UserName[3]:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ما يمديك تستعمل الامر ع بوت يغبي ","md",true)  
end
if StatusCanOrNotCan(msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• هييه ما يمديك تقيد ل"..Controller(msg_chat_id,UserId_Info.id).."  ","md",true)  
end
if UserName[2] == 'يوم' then
Time_Restrict = UserName[1]:match('(%d+)')
Time = Time_Restrict * 86400
end
if UserName[2] == 'ساعه' then
Time_Restrict = UserName[1]:match('(%d+)')
Time = Time_Restrict * 3600
end
if UserName[2] == 'دقيقه' then
Time_Restrict = UserName[1]:match('(%d+)')
Time = Time_Restrict * 60
end
LuaTele.setChatMemberStatus(msg.chat_id,UserId_Info.id,'restricted',{1,0,0,0,0,0,0,0,0,tonumber(msg.date+Time)})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم تقييده في المجموعه \n• لمدة : "..UserName[1]..' '..UserName[2]).Reply,"md",true)  
end

if text and text:match('^تقييد (%d+) (.*)$') and msg.reply_to_message_id ~= 0 then
local TimeKed = {text:match('^تقييد (%d+) (.*)$') }
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• اعطيني صلاحيات كامله ي غبي ","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• البوت ليس لديه صلاحيه حظر المستخدمين',"md",true)  
end
if not msg.Originators and not Redis:get(FDFGERB.."FDFGERB:Status:BanId"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل (الحظر : الطرد : التقييد) من قبل المدراء","md",true)
end 
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender_id.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ما يمديك تستعمل الامر ع بوت يغبي  ","md",true)  
end
if StatusCanOrNotCan(msg_chat_id,Message_Reply.sender_id.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• هييه ما يمديك تقيد ل"..Controller(msg_chat_id,Message_Reply.sender_id.user_id).."  ","md",true)  
end
if TimeKed[2] == 'يوم' then
Time_Restrict = TimeKed[1]:match('(%d+)')
Time = Time_Restrict * 86400
end
if TimeKed[2] == 'ساعه' then
Time_Restrict = TimeKed[1]:match('(%d+)')
Time = Time_Restrict * 3600
end
if TimeKed[2] == 'دقيقه' then
Time_Restrict = TimeKed[1]:match('(%d+)')
Time = Time_Restrict * 60
end
LuaTele.setChatMemberStatus(msg.chat_id,Message_Reply.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0,tonumber(msg.date+Time)})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"• تم تقييده في المجموعه \n• لمدة : "..TimeKed[1]..' '..TimeKed[2]).Reply,"md",true)  
end

if text and text:match('^تقييد (%d+) (.*) (%d+)$') then
local UserId = {text:match('^تقييد (%d+) (.*) (%d+)$') }
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• اعطيني صلاحيات كامله ي غبي ","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• البوت ليس لديه صلاحيه حظر المستخدمين',"md",true)  
end
if not msg.Originators and not Redis:get(FDFGERB.."FDFGERB:Status:BanId"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل (الحظر : الطرد : التقييد) من قبل المدراء","md",true)
end 
local UserInfo = LuaTele.getUser(UserId[3])
if UserInfo.luatele == "error" and UserInfo.code == 6 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام ايدي خطأ ","md",true)  
end
if StatusCanOrNotCan(msg_chat_id,UserId[3]) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• هييه ما يمديك تقيد ل"..Controller(msg_chat_id,UserId[3]).."  ","md",true)  
end
if UserId[2] == 'يوم' then
Time_Restrict = UserId[1]:match('(%d+)')
Time = Time_Restrict * 86400
end
if UserId[2] == 'ساعه' then
Time_Restrict = UserId[1]:match('(%d+)')
Time = Time_Restrict * 3600
end
if UserId[2] == 'دقيقه' then
Time_Restrict = UserId[1]:match('(%d+)')
Time = Time_Restrict * 60
end
LuaTele.setChatMemberStatus(msg.chat_id,UserId[3],'restricted',{1,0,0,0,0,0,0,0,0,tonumber(msg.date+Time)})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[3],"\n• تم تقييده في المجموعه \n• لمدة : "..UserId[1]..' ' ..UserId[2]).Reply,"md",true)  
end
if text and text:match('^تقييد @(%S+)$') then
local UserName = text:match('^تقييد @(%S+)$')
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• اعطيني صلاحيات كامله ي غبي ","md",true)  
end
if not msg.Originators and not Redis:get(FDFGERB.."FDFGERB:Status:BanId"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل (الحظر : الطرد : التقييد) من قبل المدراء","md",true)
end 
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• مافيه حساب بهذا اليوزر ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ما يمديك تستعمل الامر ع قناه او قروب !! ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ما يمديك تستعمل الامر ع بوت يغبي ","md",true)  
end
if StatusCanOrNotCan(msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• هييه ما يمديك تقيد ل"..Controller(msg_chat_id,UserId_Info.id).."  ","md",true)  
end
LuaTele.setChatMemberStatus(msg.chat_id,UserId_Info.id,'restricted',{1,0,0,0,0,0,0,0,0})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم تقييده في المجموعه ").Reply,"md",true)  
end

if text and text:match('^الغاء التقييد @(%S+)$') then
local UserName = text:match('^الغاء التقييد @(%S+)$')
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• اعطيني صلاحيات كامله ي غبي ","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• البوت ليس لديه صلاحيه حظر المستخدمين',"md",true)  
end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• مافيه حساب بهذا اليوزر ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ما يمديك تستعمل الامر ع قناه او قروب !! ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ما يمديك تستعمل الامر ع بوت يغبي ","md",true)  
end
LuaTele.setChatMemberStatus(msg.chat_id,UserId_Info.id,'restricted',{1,1,1,1,1,1,1,1})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم الغاء تقييده من المجموعه").Reply,"md",true)  
end

if text and text:match('^طرد @(%S+)$') then
local UserName = text:match('^طرد @(%S+)$')
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• اعطيني صلاحيات كامله ي غبي ","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• البوت ليس لديه صلاحيه حظر المستخدمين',"md",true)  
end
if not msg.Originators and not Redis:get(FDFGERB.."FDFGERB:Status:BanId"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل (الحظر : الطرد : التقييد) من قبل المدراء","md",true)
end 
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• مافيه حساب بهذا اليوزر ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ما يمديك تستعمل الامر ع قناه او قروب !! ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ما يمديك تستعمل الامر ع بوت يغبي ","md",true)  
end
if StatusCanOrNotCan(msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• هييه مايمديك تطرده   "..Controller(msg_chat_id,UserId_Info.id).."  ","md",true)  
end
LuaTele.setChatMemberStatus(msg.chat_id,UserId_Info.id,'banned',0)
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- الغاء الامر', data = msg.sender_id.user_id..'/unbanktmkid@'..UserId_Info.id},
},
}
}
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم طرده من المجموعه ").Reply,"md",true, false, false, false, reply_markup)
end
if text == ('حظر عام') or text == ('بنعال كرم') and msg.reply_to_message_id ~= 0 then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender_id.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ما يمديك تستعمل الامر ع بوت يغبي  ","md",true)  
end
if Controllerbanall(msg_chat_id,Message_Reply.sender_id.user_id) == true then 
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام الامر على  "..Controller(msg_chat_id,Message_Reply.sender_id.user_id).."  ","md",true)  
end
if Redis:sismember(FDFGERB.."FDFGERB:BanAll:Groups",Message_Reply.sender_id.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"• هذا بالع عام من قبل  ").Reply,"md",true)  
else
Redis:sadd(FDFGERB.."FDFGERB:BanAll:Groups",Message_Reply.sender_id.user_id) 
LuaTele.setChatMemberStatus(msg.chat_id,Message_Reply.sender_id.user_id,'banned',0)
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"• تم لقم من المجموعات  ").Reply,"md",true)  
end
end
if text == ('الغاء العام') and msg.reply_to_message_id ~= 0 then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender_id.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ما يمديك تستعمل الامر ع بوت يغبي  ","md",true)  
end
if not Redis:sismember(FDFGERB.."FDFGERB:BanAll:Groups",Message_Reply.sender_id.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"• تم الغاء حظره عام من المجموعات مسبقا ").Reply,"md",true)  
else
Redis:srem(FDFGERB.."FDFGERB:BanAll:Groups",Message_Reply.sender_id.user_id) 
LuaTele.setChatMemberStatus(msg.chat_id,Message_Reply.sender_id.user_id,'restricted',{1,1,1,1,1,1,1,1,1})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"• تم الغاء حظره عام من المجموعات  ").Reply,"md",true)  
end
end
if text == ('حظر') and msg.reply_to_message_id ~= 0 then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• اعطيني صلاحيات كامله ي غبي ","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• البوت ليس لديه صلاحيه حظر المستخدمين',"md",true)  
end
if not msg.Originators and not Redis:get(FDFGERB.."FDFGERB:Status:BanId"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل (الحظر : الطرد : التقييد) من قبل المدراء","md",true)
end 
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender_id.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ما يمديك تستعمل الامر ع بوت يغبي  ","md",true)  
end
if StatusCanOrNotCan(msg_chat_id,Message_Reply.sender_id.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام الامر على  "..Controller(msg_chat_id,Message_Reply.sender_id.user_id).."  ","md",true)  
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- الغاء الامر', data = msg.sender_id.user_id..'/unbanktmkid@'..Message_Reply.sender_id.user_id},
},
}
}
if Redis:sismember(FDFGERB.."FDFGERB:BanGroup:Group"..msg_chat_id,Message_Reply.sender_id.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"• تم حظره من المجموعه مسبقا ").Reply,"md",true, false, false, false, reply_markup)
else
Redis:sadd(FDFGERB.."FDFGERB:BanGroup:Group"..msg_chat_id,Message_Reply.sender_id.user_id) 
LuaTele.setChatMemberStatus(msg.chat_id,Message_Reply.sender_id.user_id,'banned',0)
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"• تم حظره من المجموعه ").Reply,"md",true, false, false, false, reply_markup)
end
end
if text == ('الغاء حظر') and msg.reply_to_message_id ~= 0 then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• اعطيني صلاحيات كامله ي غبي ","md",true)  
end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender_id.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ما يمديك تستعمل الامر ع بوت يغبي  ","md",true)  
end
if not Redis:sismember(FDFGERB.."FDFGERB:BanGroup:Group"..msg_chat_id,Message_Reply.sender_id.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"• تم الغاء حظره من المجموعه مسبقا ").Reply,"md",true)  
else
Redis:srem(FDFGERB.."FDFGERB:BanGroup:Group"..msg_chat_id,Message_Reply.sender_id.user_id) 
LuaTele.setChatMemberStatus(msg.chat_id,Message_Reply.sender_id.user_id,'restricted',{1,1,1,1,1,1,1,1,1})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"• تم الغاء حظره من المجموعه  ").Reply,"md",true)  
end
end

if text == ('كتم') and msg.reply_to_message_id ~= 0 then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if GetInfoBot(msg).Delmsg == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• البوت ليس لديه صلاحيه حذف الرسائل',"md",true)  
end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender_id.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ما يمديك تستعمل الامر ع بوت يغبي  ","md",true)  
end
if StatusSilent(msg_chat_id,Message_Reply.sender_id.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام الامر على  "..Controller(msg_chat_id,Message_Reply.sender_id.user_id).."  ","md",true)  
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- الغاء الامر', data = msg.sender_id.user_id..'/unbanktmkid@'..Message_Reply.sender_id.user_id},
},
}
}
if Redis:sismember(FDFGERB.."FDFGERB:SilentGroup:Group"..msg_chat_id,Message_Reply.sender_id.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"• ابشر كتمته في المجموعه مسبقا ").Reply,"md",true, false, false, false, reply_markup)
else
Redis:sadd(FDFGERB.."FDFGERB:SilentGroup:Group"..msg_chat_id,Message_Reply.sender_id.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"• ابشر كتمته في المجموعه  ").Reply,"md",true, false, false, false, reply_markup)
end
end
if text == ('الغاء كتم') and msg.reply_to_message_id ~= 0 then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender_id.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ما يمديك تستعمل الامر ع بوت يغبي  ","md",true)  
end
if not Redis:sismember(FDFGERB.."FDFGERB:SilentGroup:Group"..msg_chat_id,Message_Reply.sender_id.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"• تم الغاء كتمه من المجموعه ").Reply,"md",true)  
else
Redis:srem(FDFGERB.."FDFGERB:SilentGroup:Group"..msg_chat_id,Message_Reply.sender_id.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"• تم الغاء كتمه من المجموعه ").Reply,"md",true)  
end
end

if text == ('تقييد') and msg.reply_to_message_id ~= 0 then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• اعطيني صلاحيات كامله ي غبي ","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• البوت ليس لديه صلاحيه حظر المستخدمين',"md",true)  
end
if not msg.Originators and not Redis:get(FDFGERB.."FDFGERB:Status:BanId"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل (الحظر : الطرد : التقييد) من قبل المدراء","md",true)
end 
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender_id.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ما يمديك تستعمل الامر ع بوت يغبي  ","md",true)  
end
if StatusCanOrNotCan(msg_chat_id,Message_Reply.sender_id.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام الامر على  "..Controller(msg_chat_id,Message_Reply.sender_id.user_id).."  ","md",true)  
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- الغاء الامر', data = msg.sender_id.user_id..'/unbanktmkid@'..Message_Reply.sender_id.user_id},
},
}
}
LuaTele.setChatMemberStatus(msg.chat_id,Message_Reply.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"• تم تقييده في المجموعه ").Reply,"md",true, false, false, false, reply_markup)
end

if text == ('الغاء التقييد') and msg.reply_to_message_id ~= 0 then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• اعطيني صلاحيات كامله ي غبي ","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• البوت ليس لديه صلاحيه حظر المستخدمين',"md",true)  
end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender_id.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ما يمديك تستعمل الامر ع بوت يغبي  ","md",true)  
end
LuaTele.setChatMemberStatus(msg.chat_id,Message_Reply.sender_id.user_id,'restricted',{1,1,1,1,1,1,1,1})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"• تم الغاء تقييده من المجموعه").Reply,"md",true)  
end

if text == ('طرد') and msg.reply_to_message_id ~= 0 then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• اعطيني صلاحيات كامله ي غبي ","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• البوت ليس لديه صلاحيه حظر المستخدمين',"md",true)  
end
if not msg.Originators and not Redis:get(FDFGERB.."FDFGERB:Status:BanId"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل (الحظر : الطرد : التقييد) من قبل المدراء","md",true)
end 
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender_id.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ما يمديك تستعمل الامر ع بوت يغبي  ","md",true)  
end
if StatusCanOrNotCan(msg_chat_id,Message_Reply.sender_id.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام الامر على  "..Controller(msg_chat_id,Message_Reply.sender_id.user_id).."  ","md",true)  
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- الغاء الامر', data = msg.sender_id.user_id..'/unbanktmkid@'..Message_Reply.sender_id.user_id},
},
}
}
LuaTele.setChatMemberStatus(msg.chat_id,Message_Reply.sender_id.user_id,'banned',0)
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"• تم طرده من المجموعه ").Reply,"md",true, false, false, false, reply_markup)
end

if text and text:match('^حظر عام (%d+)$') then
local UserId = text:match('^حظر عام (%d+)$')
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Myth🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local UserInfo = LuaTele.getUser(UserId)
if UserInfo.luatele == "error" and UserInfo.code == 6 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام ايدي خطأ ","md",true)  
end
if Controllerbanall(msg_chat_id,UserId) == true then 
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام الامر على  "..Controller(msg_chat_id,UserId).."  ","md",true)  
end
if Redis:sismember(FDFGERB.."FDFGERB:BanAll:Groups",UserId) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"• هذا بالع عام من قبل  ").Reply,"md",true)  
else
Redis:sadd(FDFGERB.."FDFGERB:BanAll:Groups",UserId) 
LuaTele.setChatMemberStatus(msg.chat_id,UserId,'banned',0)
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"• تم لقم من المجموعات  ").Reply,"md",true)  
end
end
if text and text:match('^الغاء العام (%d+)$') then
local UserId = text:match('^الغاء العام (%d+)$')
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local UserInfo = LuaTele.getUser(UserId)
if UserInfo.luatele == "error" and UserInfo.code == 6 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام ايدي خطأ ","md",true)  
end
if not Redis:sismember(FDFGERB.."FDFGERB:BanAll:Groups",UserId) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"• تم الغاء حظره عام من المجموعات مسبقا ").Reply,"md",true)  
else
Redis:srem(FDFGERB.."FDFGERB:BanAll:Groups",UserId) 
LuaTele.setChatMemberStatus(msg.chat_id,UserId,'restricted',{1,1,1,1,1,1,1,1,1})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"• تم الغاء حظره عام من المجموعات  ").Reply,"md",true)  
end
end
if text and text:match('^حظر (%d+)$') then
local UserId = text:match('^حظر (%d+)$')
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• اعطيني صلاحيات كامله ي غبي ","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• البوت ليس لديه صلاحيه حظر المستخدمين',"md",true)  
end
if not msg.Originators and not Redis:get(FDFGERB.."FDFGERB:Status:BanId"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل (الحظر : الطرد : التقييد) من قبل المدراء","md",true)
end 
local UserInfo = LuaTele.getUser(UserId)
if UserInfo.luatele == "error" and UserInfo.code == 6 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام ايدي خطأ ","md",true)  
end
if StatusCanOrNotCan(msg_chat_id,UserId) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام الامر على  "..Controller(msg_chat_id,UserId).."  ","md",true)  
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- الغاء الامر', data = msg.sender_id.user_id..'/unbanktmkid@'..UserId},
},
}
}
if Redis:sismember(FDFGERB.."FDFGERB:BanGroup:Group"..msg_chat_id,UserId) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"• تم حظره من المجموعه مسبقا ").Reply,"md",true, false, false, false, reply_markup)
else
Redis:sadd(FDFGERB.."FDFGERB:BanGroup:Group"..msg_chat_id,UserId) 
LuaTele.setChatMemberStatus(msg.chat_id,UserId,'banned',0)
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"• تم حظره من المجموعه ").Reply,"md",true, false, false, false, reply_markup)
end
end
if text and text:match('^الغاء حظر (%d+)$') then
local UserId = text:match('^الغاء حظر (%d+)$')
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• اعطيني صلاحيات كامله ي غبي ","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• البوت ليس لديه صلاحيه حظر المستخدمين',"md",true)  
end
local UserInfo = LuaTele.getUser(UserId)
if UserInfo.luatele == "error" and UserInfo.code == 6 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام ايدي خطأ ","md",true)  
end
if not Redis:sismember(FDFGERB.."FDFGERB:BanGroup:Group"..msg_chat_id,UserId) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"• تم الغاء حظره من المجموعه مسبقا ").Reply,"md",true)  
else
Redis:srem(FDFGERB.."FDFGERB:BanGroup:Group"..msg_chat_id,UserId) 
LuaTele.setChatMemberStatus(msg.chat_id,UserId,'restricted',{1,1,1,1,1,1,1,1,1})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"• تم الغاء حظره من المجموعه  ").Reply,"md",true)  
end
end

if text and text:match('^كتم (%d+)$') then
local UserId = text:match('^كتم (%d+)$')
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if GetInfoBot(msg).Delmsg == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• البوت ليس لديه صلاحيه حذف الرسائل',"md",true)  
end
local UserInfo = LuaTele.getUser(UserId)
if UserInfo.luatele == "error" and UserInfo.code == 6 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام ايدي خطأ ","md",true)  
end
if StatusSilent(msg_chat_id,UserId) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام الامر على  "..Controller(msg_chat_id,UserId).."  ","md",true)  
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- الغاء الامر', data = msg.sender_id.user_id..'/unbanktmkid@'..UserId},
},
}
}
if Redis:sismember(FDFGERB.."FDFGERB:SilentGroup:Group"..msg_chat_id,UserId) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"• ابشر كتمته في المجموعه مسبقا ").Reply,"md",true, false, false, false, reply_markup)
else
Redis:sadd(FDFGERB.."FDFGERB:SilentGroup:Group"..msg_chat_id,UserId) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"• ابشر كتمته في المجموعه  ").Reply,"md",true, false, false, false, reply_markup)
end
end
if text and text:match('^الغاء كتم (%d+)$') then
local UserId = text:match('^الغاء كتم (%d+)$')
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local UserInfo = LuaTele.getUser(UserId)
if UserInfo.luatele == "error" and UserInfo.code == 6 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام ايدي خطأ ","md",true)  
end
if not Redis:sismember(FDFGERB.."FDFGERB:SilentGroup:Group"..msg_chat_id,UserId) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"• تم الغاء كتمه من المجموعه ").Reply,"md",true)  
else
Redis:srem(FDFGERB.."FDFGERB:SilentGroup:Group"..msg_chat_id,UserId) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"• تم الغاء كتمه من المجموعه ").Reply,"md",true)  
end
end

if text and text:match('^تقييد (%d+)$') then
local UserId = text:match('^تقييد (%d+)$')
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• اعطيني صلاحيات كامله ي غبي ","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• البوت ليس لديه صلاحيه حظر المستخدمين',"md",true)  
end
if not msg.Originators and not Redis:get(FDFGERB.."FDFGERB:Status:BanId"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل (الحظر : الطرد : التقييد) من قبل المدراء","md",true)
end 
local UserInfo = LuaTele.getUser(UserId)
if UserInfo.luatele == "error" and UserInfo.code == 6 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام ايدي خطأ ","md",true)  
end
if StatusCanOrNotCan(msg_chat_id,UserId) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام الامر على  "..Controller(msg_chat_id,UserId).."  ","md",true)  
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- الغاء الامر', data = msg.sender_id.user_id..'/unbanktmkid@'..UserId},
},
}
}
LuaTele.setChatMemberStatus(msg.chat_id,UserId,'restricted',{1,0,0,0,0,0,0,0,0})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"• تم تقييده في المجموعه ").Reply,"md",true, false, false, false, reply_markup)
end

if text and text:match('^الغاء التقييد (%d+)$') then
local UserId = text:match('^الغاء التقييد (%d+)$')
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• اعطيني صلاحيات كامله ي غبي ","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• البوت ليس لديه صلاحيه حظر المستخدمين',"md",true)  
end
local UserInfo = LuaTele.getUser(UserId)
if UserInfo.luatele == "error" and UserInfo.code == 6 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام ايدي خطأ ","md",true)  
end
LuaTele.setChatMemberStatus(msg.chat_id,UserId,'restricted',{1,1,1,1,1,1,1,1})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"• تم الغاء تقييده من المجموعه").Reply,"md",true)  
end

if text and text:match('^طرد (%d+)$') then
local UserId = text:match('^طرد (%d+)$')
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• اعطيني صلاحيات كامله ي غبي ","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• البوت ليس لديه صلاحيه حظر المستخدمين',"md",true)  
end
if not msg.Originators and not Redis:get(FDFGERB.."FDFGERB:Status:BanId"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل (الحظر : الطرد : التقييد) من قبل المدراء","md",true)
end 
local UserInfo = LuaTele.getUser(UserId)
if UserInfo.luatele == "error" and UserInfo.code == 6 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام ايدي خطأ ","md",true)  
end
if StatusCanOrNotCan(msg_chat_id,UserId) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام الامر على  "..Controller(msg_chat_id,UserId).."  ","md",true)  
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- الغاء الامر', data = msg.sender_id.user_id..'/unbanktmkid@'..UserId},
},
}
}
LuaTele.setChatMemberStatus(msg.chat_id,UserId,'banned',0)
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"• تم طرده من المجموعه ").Reply,"md",true, false, false, false, reply_markup)
end

if text == "اطردني" or text == "طردني" then
if not Redis:get(FDFGERB.."FDFGERB:Status:KickMe"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"• امر اطردني تم تعطيله من قبل المدراء ","md",true)  
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• اعطيني صلاحيات كامله ي غبي ","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• البوت ليس لديه صلاحيه حظر المستخدمين',"md",true)  
end
if StatusCanOrNotCan(msg_chat_id,msg.sender_id.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام الامر على  "..Controller(msg_chat_id,msg.sender_id.user_id).."  ","md",true)  
end
local StatusMember = LuaTele.getChatMember(msg_chat_id,msg.sender_id.user_id).status.luatele
if (StatusMember == "chatMemberStatusCreator") then
KickMe = true
elseif (StatusMember == "chatMemberStatusAdministrator") then
KickMe = true
else
KickMe = false
end
if KickMe == true then
return LuaTele.sendText(msg_chat_id,msg_id,"• عذرا لا استطيع طرد ادمنيه ومالكين المجموعه","md",true)    
end
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم طردك من المجموعه بنائآ على طلبك").Reply,"md",true)  
end

if text == 'المشرفين' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【المدير】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• اعطيني صلاحيات كامله ي غبي ","md",true)  
end
local Info_Members = LuaTele.getSupergroupMembers(msg_chat_id, "Administrators", "", 0, 200)
listAdmin = '\n• قائمه المشرفين \n ━━━━━\n'
local List_Members = Info_Members.members
for k, v in pairs(List_Members) do
if Info_Members.members[k].status.luatele == "chatMemberStatusCreator" then
Creator = '→   المالك '
else
Creator = ""
end
local UserInfo = LuaTele.getUser(v.member_id.user_id)
if UserInfo.username ~= "" then
listAdmin = listAdmin..""..k.." • [@"..UserInfo.username.."] "..Creator.."\n"
else
listAdmin = listAdmin..""..k.." •  ["..UserInfo.id.."](tg://user?id="..UserInfo.id..") "..Creator.."\n"
end
end
LuaTele.sendText(msg_chat_id,msg_id,listAdmin,"md",true)  
end
if text == 'رفع الادمنيه' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【المدير】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• اعطيني صلاحيات كامله ي غبي ","md",true)  
end
local Info_Members = LuaTele.getSupergroupMembers(msg_chat_id, "Administrators", "", 0, 200)
local List_Members = Info_Members.members
x = 0
y = 0
for k, v in pairs(List_Members) do
if Info_Members.members[k].bot_info == nil then
if Info_Members.members[k].status.luatele == "chatMemberStatusCreator" then
Redis:sadd(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id,v.member_id.user_id) 
x = x + 1
else
Redis:sadd(FDFGERB.."FDFGERB:Addictive:Group"..msg_chat_id,v.member_id.user_id) 
y = y + 1
end
end
end
LuaTele.sendText(msg_chat_id,msg_id,'\n• تم ترقيه • ('..y..') ادمنيه ',"md",true)  
end



if text == 'كشف البوتات' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【المدير】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• اعطيني صلاحيات كامله ي غبي ","md",true)  
end
local Info_Members = LuaTele.getSupergroupMembers(msg_chat_id, "Bots", "", 0, 200)
local List_Members = Info_Members.members
listBots = '\n• قائمه البوتات \n ━━━━━\n'
x = 0
for k, v in pairs(List_Members) do
local UserInfo = LuaTele.getUser(v.member_id.user_id)
if Info_Members.members[k].status.luatele == "chatMemberStatusAdministrator" then
x = x + 1
Admin = '→   ادمن '
else
Admin = ""
end
listBots = listBots..""..k.." • @"..UserInfo.username.." "..Admin.."\n"
end
LuaTele.sendText(msg_chat_id,msg_id,listBots.."\n━━━━━\n• عدد البوتات التي هي ادمن ( "..x.." )","md",true)  
end


 
if text == 'المقيدين' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【المدير】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• اعطيني صلاحيات كامله ي غبي ","md",true)  
end
local Info_Members = LuaTele.getSupergroupMembers(msg_chat_id, "Recent", "", 0, 200)
local List_Members = Info_Members.members
x = 0
y = nil
restricted = '\n• قائمه المقيديين \n ━━━━━\n'
for k, v in pairs(List_Members) do
if Info_Members.members[k].status.is_member == true and Info_Members.members[k].status.luatele == "chatMemberStatusRestricted" then
y = true
x = x + 1
local UserInfo = LuaTele.getUser(v.member_id.user_id)
if UserInfo.username ~= "" then
restricted = restricted..""..x.." • @"..UserInfo.username.."\n"
else
restricted = restricted..""..x.." •  ["..UserInfo.id.."](tg://user?id="..UserInfo.id..") \n"
end
end
end
if y == true then
LuaTele.sendText(msg_chat_id,msg_id,restricted,"md",true)  
end
end


if text == "غادر"  then 
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Myth🎖️】 فقط ',"md",true)  
end
if not msg.ControllerBot and not Redis:set(FDFGERB.."FDFGERB:LeftBot") then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• امر المغادره معطل من قبل الاساسي ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = 'اي', data = '/Zxchq'..msg_chat_id}, {text = 'لا', data = msg.sender_id.user_id..'/Redis'}, 
},
}
}
return LuaTele.sendText(msg_chat_id,msg_id,'• متأكد تبي اغادر؟',"md",false, false, false, false, reply_markup)
end
if text == 'تاك للكل' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Info_Members = LuaTele.searchChatMembers(msg_chat_id, "", 200)
local List_Members = Info_Members.members
listall = '\n• قائمه الاعضاء \n ━━━━━\n'
for k, v in pairs(List_Members) do
local UserInfo = LuaTele.getUser(v.member_id.user_id)
if UserInfo.username ~= "" then
listall = listall..""..k.." • @"..UserInfo.username.."\n"
else
listall = listall..""..k.." • ["..UserInfo.id.."](tg://user?id="..UserInfo.id..")\n"
end
end
LuaTele.sendText(msg_chat_id,msg_id,listall,"md",true)  
end
if text == "قفل القنوات" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."Lock:channell"..msg_chat_id,true) 
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• ابشر قفلت القنوات ").Lock,"md",true)  
return false
end 
if text == "قفل الدردشه" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:text"..msg_chat_id,true) 
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل الدردشه").Lock,"md",true)  
return false
end 
if text == "قفل السب" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:lock:Fshar"..msg_chat_id,true) 
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفل السب").Lock,"md",true)  
return false
end 
if text == "قفل الفارسيه" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:lock:Persian"..msg_chat_id,true) 
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفل الفارسيه").Lock,"md",true)  
return false
end 
if text == "قفل الاضافه" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end 
Redis:set(FDFGERB.."FDFGERB:Lock:AddMempar"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل اضافة الاعضاء").Lock,"md",true)  
return false
end 
if text == "قفل الدخول" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end 
Redis:set(FDFGERB.."FDFGERB:Lock:Join"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل دخول الاعضاء").Lock,"md",true)  
return false
end 
if text == "قفل البوتات" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end 
Redis:set(FDFGERB.."FDFGERB:Lock:Bot:kick"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل البوتات").Lock,"md",true)  
return false
end 
if text == "قفل البوتات بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end 
Redis:set(FDFGERB.."FDFGERB:Lock:Bot:kick"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل البوتات").lockKick,"md",true)  
return false
end 
if text == "قفل الاشعارات" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end  
Redis:set(FDFGERB.."FDFGERB:Lock:tagservr"..msg_chat_id,true)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل الاشعارات").Lock,"md",true)  
return false
end 
if text == "تعطيل all" or text == "تعطيل @all" then 
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【المدير】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end  
Redis:set(FDFGERB.."lockalllll"..msg_chat_id,"off")
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم تعطيل @all هنا").Lock,"md",true)  
return false
end 
if text == "تفعيل all" or text == "تفعيل @all" then 
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【المدير】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end  
Redis:set(FDFGERB.."lockalllll"..msg_chat_id,"on")
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"تم تفعيل أمر all ").Lock,"md",true)  
return false
end 
if text == "قفل التثبيت" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end  
Redis:set(FDFGERB.."FDFGERB:lockpin"..msg_chat_id,(LuaTele.getChatPinnedMessage(msg_chat_id).id or true)) 
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل التثبيت هنا").Lock,"md",true)  
return false
end 
if text == "قفل التعديل" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end 
Redis:set(FDFGERB.."FDFGERB:Lock:edit"..msg_chat_id,true) 
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل تعديل").Lock,"md",true)  
return false
end 
if text == "قفل تعديل الميديا" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end 
Redis:set(FDFGERB.."FDFGERB:Lock:edit"..msg_chat_id,true) 
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل تعديل").Lock,"md",true)  
return false
end 
if text == "قفل الكل" then 
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 المالكين الاساسين】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end  
Redis:set(FDFGERB.."FDFGERB:Lock:tagservrbot"..msg_chat_id,true)   
list ={"Lock:Bot:kick","Lock:User:Name","Lock:hashtak","Lock:Cmd","Lock:Link","Lock:forward","Lock:Keyboard","Lock:geam","Lock:Photo","Lock:Animation","Lock:Video","Lock:Audio","Lock:vico","Lock:Sticker","Lock:Document","Lock:Unsupported","Lock:Markdaun","Lock:Contact","Lock:Spam","Lock:channell"}
for i,lock in pairs(list) do 
Redis:set(FDFGERB..'FDFGERB:'..lock..msg_chat_id,"del")    
end
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• ابشر قفلت جميع الاوامر").Lock,"md",true)  
return false
end 


--------------------------------------------------------------------------------------------------------------
if text == "فتح الاضافه" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end 
Redis:del(FDFGERB.."FDFGERB:Lock:AddMempar"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم فتح اضافة الاعضاء").unLock,"md",true)  
return false
end 
if text == "فتح القنوات" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end 
Redis:del(FDFGERB.."Lock:channell"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم فتح القنوات").unLock,"md",true)  
return false
end 
if text and text:match("^وضع تكرار (%d+)$") then 
local Num = text:match("وضع تكرار (.*)")
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
Redis:hset(FDFGERB.."FDFGERB:Spam:Group:User"..msg_chat_id ,"Num:Spam" ,Num) 
LuaTele.sendText(msg_chat_id,msg_id,'\n• تم وضع عدد تكرار '..Num..' ',"md",true)  
end
if text == "فتح الدردشه" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end 
Redis:del(FDFGERB.."FDFGERB:Lock:text"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم فتح الدردشه").unLock,"md",true)  
return false
end 
if text == "فتح السب" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end 
Redis:del(FDFGERB.."FDFGERB:lock:Fshar"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم فتح السب").unLock,"md",true)  
return false
end 
if text == "فتح الفارسيه" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end 
Redis:del(FDFGERB.."FDFGERB:lock:Persian"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم فتح الفارسيه").unLock,"md",true)  
return false
end 
if text == "فتح الدخول" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end 
Redis:del(FDFGERB.."FDFGERB:Lock:Join"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم فتح دخول الاعضاء").unLock,"md",true)  
return false
end 
if text == "فتح البوتات" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end 
Redis:del(FDFGERB.."FDFGERB:Lock:Bot:kick"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم فـتح البوتات").unLock,"md",true)  
return false
end 
if text == "فتح البوتات " then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end 
Redis:del(FDFGERB.."FDFGERB:Lock:Bot:kick"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم فـتح البوتات").unLock,"md",true)  
return false
end 
if text == "فتح الاشعارات" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end  
Redis:del(FDFGERB.."FDFGERB:Lock:tagservr"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم فـتح الاشعارات").unLock,"md",true)  
return false
end 
if text == "فتح التثبيت" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end 
Redis:del(FDFGERB.."FDFGERB:lockpin"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم فـتح التثبيت هنا").unLock,"md",true)  
return false
end 
if text == "فتح التعديل" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end 
Redis:del(FDFGERB.."FDFGERB:Lock:edit"..msg_chat_id) 
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم فـتح تعديل").unLock,"md",true)  
return false
end 
if text == "فتح التعديل الميديا" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end 
Redis:del(FDFGERB.."FDFGERB:Lock:edit"..msg_chat_id) 
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم فـتح تعديل").unLock,"md",true)  
return false
end 
if text == "فتح الكل" then 
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 المالكين الاساسين】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end 
Redis:del(FDFGERB.."FDFGERB:Lock:tagservrbot"..msg_chat_id)   
list ={"Lock:Bot:kick","Lock:User:Name","Lock:hashtak","Lock:Cmd","Lock:Link","Lock:forward","Lock:Keyboard","Lock:geam","Lock:Photo","Lock:Animation","Lock:Video","Lock:Audio","Lock:vico","Lock:Sticker","Lock:Document","Lock:Unsupported","Lock:Markdaun","Lock:Contact","Lock:Spam"}
for i,lock in pairs(list) do 
Redis:del(FDFGERB..'FDFGERB:'..lock..msg_chat_id)    
end
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• ابشر فتحت لك جميع الاوامر. ").unLock,"md",true)  
return false
end 
--------------------------------------------------------------------------------------------------------------
if text == "قفل التكرار" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:hset(FDFGERB.."FDFGERB:Spam:Group:User"..msg_chat_id ,"Spam:User","del")  
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل التكرار").Lock,"md",true)  
elseif text == "قفل التكرار بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:hset(FDFGERB.."FDFGERB:Spam:Group:User"..msg_chat_id ,"Spam:User","keed")  
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل التكرار").lockKid,"md",true)  
elseif text == "قفل التكرار بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:hset(FDFGERB.."FDFGERB:Spam:Group:User"..msg_chat_id ,"Spam:User","mute")  
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل التكرار").lockKtm,"md",true)  
elseif text == "قفل التكرار بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:hset(FDFGERB.."FDFGERB:Spam:Group:User"..msg_chat_id ,"Spam:User","kick")  
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل التكرار").lockKick,"md",true)  
elseif text == "فتح التكرار" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:hdel(FDFGERB.."FDFGERB:Spam:Group:User"..msg_chat_id ,"Spam:User")  
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم فتح التكرار").unLock,"md",true)  
end
if text == "قفل الروابط" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Link"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل الروابط").Lock,"md",true)  
return false
end 
if text == "قفل الروابط بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Link"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل الروابط").lockKid,"md",true)  
return false
end 
if text == "قفل الروابط بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Link"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل الروابط").lockKtm,"md",true)  
return false
end 
if text == "قفل الروابط بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Link"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل الروابط").lockKick,"md",true)  
return false
end 
if text == "فتح الروابط" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:Lock:Link"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم فتح الروابط").unLock,"md",true)  
return false
end 
if text == "قفل المعرفات" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:User:Name"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل المعرفات").Lock,"md",true)  
return false
end 
if text == "قفل المعرفات بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:User:Name"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل المعرفات").lockKid,"md",true)  
return false
end 
if text == "قفل المعرفات بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:User:Name"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل المعرفات").lockKtm,"md",true)  
return false
end 
if text == "قفل المعرفات بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:User:Name"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل المعرفات").lockKick,"md",true)  
return false
end 
if text == "فتح المعرفات" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:Lock:User:Name"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم فتح المعرفات").unLock,"md",true)  
return false
end 
if text == "قفل التاك" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:hashtak"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل التاك").Lock,"md",true)  
return false
end 
if text == "قفل التاك بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:hashtak"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل التاك").lockKid,"md",true)  
return false
end 
if text == "قفل التاك بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:hashtak"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل التاك").lockKtm,"md",true)  
return false
end 
if text == "قفل التاك بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:hashtak"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل التاك").lockKick,"md",true)  
return false
end 
if text == "فتح التاك" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:Lock:hashtak"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم فتح التاك").unLock,"md",true)  
return false
end 
if text == "قفل الشارحه" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Cmd"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل الشارحه").Lock,"md",true)  
return false
end 
if text == "قفل الشارحه بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Cmd"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل الشارحه").lockKid,"md",true)  
return false
end 
if text == "قفل الشارحه بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Cmd"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل الشارحه").lockKtm,"md",true)  
return false
end 
if text == "قفل الشارحه بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Cmd"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل الشارحه").lockKick,"md",true)  
return false
end 
if text == "فتح الشارحه" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:Lock:Cmd"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم فتح الشارحه").unLock,"md",true)  
return false
end 
if text == "قفل الصور"then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Photo"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• ابشر تم قفلت صور").Lock,"md",true)  
return false
end 
if text == "قفل الصور بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Photo"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• ابشر تم قفلت صور").lockKid,"md",true)  
return false
end 
if text == "قفل الصور بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Photo"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• ابشر تم قفلت صور").lockKtm,"md",true)  
return false
end 
if text == "قفل الصور بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Photo"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• ابشر تم قفلت صور").lockKick,"md",true)  
return false
end 
if text == "فتح الصور" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:Lock:Photo"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم فتح الصور").unLock,"md",true)  
return false
end 
if text == "قفل الفيديو" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Video"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل الفيديو").Lock,"md",true)  
return false
end 
if text == "قفل الفيديو بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Video"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل الفيديو").lockKid,"md",true)  
return false
end 
if text == "قفل الفيديو بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Video"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل الفيديو").lockKtm,"md",true)  
return false
end 
if text == "قفل الفيديو بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Video"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل الفيديو").lockKick,"md",true)  
return false
end 
if text == "فتح الفيديو" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:Lock:Video"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم فتح الفيديو").unLock,"md",true)  
return false
end 
if text == "قفل المتحركه" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Animation"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل المتحركه").Lock,"md",true)  
return false
end 
if text == "قفل المتحركه بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Animation"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل المتحركه").lockKid,"md",true)  
return false
end 
if text == "قفل المتحركه بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Animation"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل المتحركه").lockKtm,"md",true)  
return false
end 
if text == "قفل المتحركه بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Animation"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل المتحركه").lockKick,"md",true)  
return false
end 
if text == "فتح المتحركه" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:Lock:Animation"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم فتح المتحركه").unLock,"md",true)  
return false
end 
if text == "قفل الالعاب" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:geam"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل الالعاب").Lock,"md",true)  
return false
end 
if text == "قفل الالعاب بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:geam"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل الالعاب").lockKid,"md",true)  
return false
end 
if text == "قفل الالعاب بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:geam"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل الالعاب").lockKtm,"md",true)  
return false
end 
if text == "قفل الالعاب بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:geam"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل الالعاب").lockKick,"md",true)  
return false
end 
if text == "فتح الالعاب" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:Lock:geam"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم فتح الالعاب").unLock,"md",true)  
return false
end 
if text == "قفل الاغاني" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Audio"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل الاغاني").Lock,"md",true)  
return false
end 
if text == "قفل الاغاني بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Audio"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل الاغاني").lockKid,"md",true)  
return false
end 
if text == "قفل الاغاني بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Audio"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل الاغاني").lockKtm,"md",true)  
return false
end 
if text == "قفل الاغاني بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Audio"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل الاغاني").lockKick,"md",true)  
return false
end 
if text == "فتح الاغاني" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:Lock:Audio"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم فتح الاغاني").unLock,"md",true)  
return false
end 
if text == "قفل الصوت" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:vico"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل الصوت").Lock,"md",true)  
return false
end 
if text == "قفل الصوت بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:vico"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل الصوت").lockKid,"md",true)  
return false
end 
if text == "قفل الصوت بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:vico"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل الصوت").lockKtm,"md",true)  
return false
end 
if text == "قفل الصوت بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:vico"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل الصوت").lockKick,"md",true)  
return false
end 
if text == "فتح الصوت" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:Lock:vico"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم فتح الصوت").unLock,"md",true)  
return false
end 
if text == "قفل الكيبورد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Keyboard"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل الكيبورد").Lock,"md",true)  
return false
end 
if text == "قفل الكيبورد بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Keyboard"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل الكيبورد").lockKid,"md",true)  
return false
end 
if text == "قفل الكيبورد بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Keyboard"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل الكيبورد").lockKtm,"md",true)  
return false
end 
if text == "قفل الكيبورد بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Keyboard"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل الكيبورد").lockKick,"md",true)  
return false
end 
if text == "فتح الكيبورد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:Lock:Keyboard"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم فتح الكيبورد").unLock,"md",true)  
return false
end 
if text == "قفل الملصقات" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Sticker"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل الملصقات").Lock,"md",true)  
return false
end 
if text == "قفل الملصقات بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Sticker"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل الملصقات").lockKid,"md",true)  
return false
end 
if text == "قفل الملصقات بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Sticker"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل الملصقات").lockKtm,"md",true)  
return false
end 
if text == "قفل الملصقات بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Sticker"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل الملصقات").lockKick,"md",true)  
return false
end 
if text == "فتح الملصقات" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:Lock:Sticker"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم فتح الملصقات").unLock,"md",true)  
return false
end 
if text == "قفل التوجيه" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:forward"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل التوجيه").Lock,"md",true)  
return false
end 
if text == "قفل التوجيه بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:forward"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل التوجيه").lockKid,"md",true)  
return false
end 
if text == "قفل التوجيه بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:forward"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل التوجيه").lockKtm,"md",true)  
return false
end 
if text == "قفل التوجيه بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:forward"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل التوجيه").lockKick,"md",true)  
return false
end 
if text == "فتح التوجيه" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:Lock:forward"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم فتح التوجيه").unLock,"md",true)  
return false
end 
if text == "قفل الملفات" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Document"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل الملفات").Lock,"md",true)  
return false
end 
if text == "قفل الملفات بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Document"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل الملفات").lockKid,"md",true)  
return false
end 
if text == "قفل الملفات بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Document"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل الملفات").lockKtm,"md",true)  
return false
end 
if text == "قفل الملفات بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Document"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل الملفات").lockKick,"md",true)  
return false
end 
if text == "فتح الملفات" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:Lock:Document"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم فتح الملفات").unLock,"md",true)  
return false
end 
if text == "قفل السيلفي" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Unsupported"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل السيلفي").Lock,"md",true)  
return false
end 
if text == "قفل السيلفي بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Unsupported"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل السيلفي").lockKid,"md",true)  
return false
end 
if text == "قفل السيلفي بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Unsupported"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل السيلفي").lockKtm,"md",true)  
return false
end 
if text == "قفل السيلفي بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Unsupported"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل السيلفي").lockKick,"md",true)  
return false
end 
if text == "فتح السيلفي" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:Lock:Unsupported"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم فتح السيلفي").unLock,"md",true)  
return false
end 
if text == "قفل الماركداون" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Markdaun"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل الماركداون").Lock,"md",true)  
return false
end 
if text == "قفل الماركداون بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Markdaun"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل الماركداون").lockKid,"md",true)  
return false
end 
if text == "قفل الماركداون بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Markdaun"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل الماركداون").lockKtm,"md",true)  
return false
end 
if text == "قفل الماركداون بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Markdaun"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل الماركداون").lockKick,"md",true)  
return false
end 
if text == "فتح الماركداون" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:Lock:Markdaun"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم فتح الماركداون").unLock,"md",true)  
return false
end 
if text == "قفل الجهات" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Contact"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل الجهات").Lock,"md",true)  
return false
end 
if text == "قفل الجهات بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Contact"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل الجهات").lockKid,"md",true)  
return false
end 
if text == "قفل الجهات بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Contact"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل الجهات").lockKtm,"md",true)  
return false
end 
if text == "قفل الجهات بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Contact"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل الجهات").lockKick,"md",true)  
return false
end 
if text == "فتح الجهات" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:Lock:Contact"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم فتح الجهات").unLock,"md",true)  
return false
end 
if text == "قفل الكلايش" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Spam"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل الكلايش").Lock,"md",true)  
return false
end 
if text == "قفل الكلايش بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Spam"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل الكلايش").lockKid,"md",true)  
return false
end 
if text == "قفل الكلايش بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Spam"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل الكلايش").lockKtm,"md",true)  
return false
end 
if text == "قفل الكلايش بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Spam"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل الكلايش").lockKick,"md",true)  
return false
end 
if text == "فتح الكلايش" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:Lock:Spam"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم فتح الكلايش").unLock,"md",true)  
return false
end 
if text == "قفل الانلاين" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Inlen"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل الانلاين").Lock,"md",true)  
return false
end 
if text == "قفل الانلاين بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Inlen"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل الانلاين").lockKid,"md",true)  
return false
end 
if text == "قفل الانلاين بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Inlen"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل الانلاين").lockKtm,"md",true)  
return false
end 
if text == "قفل الانلاين بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Lock:Inlen"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم قفـل الانلاين").lockKick,"md",true)  
return false
end 
if text == "فتح الانلاين" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:Lock:Inlen"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• تم فتح الانلاين").unLock,"md",true)  
return false
end 
if text == "ضع رابط" or text == "وضع رابط" then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:setex(FDFGERB.."FDFGERB:Set:Link"..msg_chat_id..""..msg.sender_id.user_id,120,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"• ارسل رابط المجموعه او رابط قناة المجموعه","md",true)  
end
if text == "مسح الرابط" or text == "حذف الرابط" then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:Group:Link"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم مسح الرابط ","md",true)             
end
if text == "الرابط" then
if not Redis:get(FDFGERB.."FDFGERB:Status:Link"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل جلب الرابط من قبل الادمنيه","md",true)
end 
local Get_Chat = LuaTele.getChat(msg_chat_id)
local GetLink = Redis:get(FDFGERB.."FDFGERB:Group:Link"..msg_chat_id) 
if GetLink then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{{text =Get_Chat.title, url = GetLink}, },}}
return LuaTele.sendText(msg_chat_id, msg_id, '['..Get_Chat.title.. ']('..GetLink..')', 'md', false, false, false, false, reply_markup)
else
local LinkGroup = LuaTele.generateChatInviteLink(msg_chat_id,'orab',tonumber(msg.date+86400),0,true)
if LinkGroup.code == 3 then
return LuaTele.sendText(msg_chat_id,msg_id,"• لا استطيع جلب الرابط بسبب ليس لدي صلاحيه دعوه مستخدمين من خلال الرابط ","md",false)
end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{{text = Get_Chat.title, url = LinkGroup.invite_link},},}}
return LuaTele.sendText(msg_chat_id, msg_id, '['..Get_Chat.title.. ']('..LinkGroup.invite_link..')', 'md', false, false, false, false, reply_markup)
end
end
if text == "ضع ترحيب" or text == "وضع ترحيب" then  
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:setex(FDFGERB.."Tshake:Welcome:Group" .. msg_chat_id .. "" .. msg.sender_id.user_id, 120, true)  
return LuaTele.sendText(msg_chat_id,msg_id,"• ارسل لي الترحيب الان".."\n• تستطيع اضافة مايلي !\n• دالة عرض الاسم »{`name`}\n• دالة عرض المعرف »{`user`}\n• دالة عرض اسم المجموعه »{`NameCh`}","md",true)   
end
if text == "الترحيب" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not Redis:get(FDFGERB.."FDFGERB:Status:Welcome"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل الترحيب من قبل الادمنيه","md",true)
end 
local Welcome = Redis:get(FDFGERB.."FDFGERB:Welcome:Group"..msg_chat_id)
if Welcome then 
return LuaTele.sendText(msg_chat_id,msg_id,Welcome,"md",true)   
else 
return LuaTele.sendText(msg_chat_id,msg_id,"• لم يتم تعيين ترحيب للمجموعه","md",true)   
end 
end
if text == "مسح الترحيب" or text == "حذف الترحيب" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:Welcome:Group"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم ازالة ترحيب المجموعه","md",true)   
end
if text == "ضع قوانين" or text == "وضع قوانين" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:setex(FDFGERB.."FDFGERB:Set:Rules:" .. msg_chat_id .. ":" .. msg.sender_id.user_id, 600, true) 
return LuaTele.sendText(msg_chat_id,msg_id,"• ارسل لي القوانين الان","md",true)  
end
if text == "مسح القوانين" or text == "حذف القوانين" then  
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:Group:Rules"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم ازالة قوانين المجموعه","md",true)    
end
if text == "الساعه" then
local time = "\n الساعه الان : "..os.date("%I:%M%p")
return LuaTele.sendText(msg_chat_id,msg_id,time,"md",true) 
end
if text == "التاريخ" then
local date =  "\n التاريخ : "..os.date("%Y/%m/%d")
return LuaTele.sendText(msg_chat_id,msg_id,date,"md",true) 
end
if text == "القوانين" then 
local Rules = Redis:get(FDFGERB.."FDFGERB:Group:Rules" .. msg_chat_id)   
if Rules then     
return LuaTele.sendText(msg_chat_id,msg_id,Rules,"md",true)     
else      
return LuaTele.sendText(msg_chat_id,msg_id,"• لا توجد قوانين هنا","md",true)     
end    
end
if text == "ضع وصف" or text == "وضع وصف" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• اعطيني صلاحيات كامله ي غبي ","md",true)  
end
if GetInfoBot(msg).Info == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• البوت ليس لديه صلاحيه تغيير المعلومات',"md",true)  
end
Redis:setex(FDFGERB.."FDFGERB:Set:Description:" .. msg_chat_id .. ":" .. msg.sender_id.user_id, 600, true) 
return LuaTele.sendText(msg_chat_id,msg_id,"• ارسل لي وصف المجموعه الان","md",true)  
end
if text == "مسح الوصف" or text == "حذف الوصف" then  
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• اعطيني صلاحيات كامله ي غبي ","md",true)  
end
if GetInfoBot(msg).Info == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• البوت ليس لديه صلاحيه تغيير المعلومات',"md",true)  
end
LuaTele.setChatDescription(msg_chat_id, '') 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم ازالة قوانين المجموعه","md",true)    
end

if text and text:match("^ضع اسم (.*)") or text and text:match("^وضع اسم (.*)") then 
local NameChat = text:match("^ضع اسم (.*)") or text:match("^وضع اسم (.*)") 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• اعطيني صلاحيات كامله ي غبي ","md",true)  
end
if GetInfoBot(msg).Info == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• البوت ليس لديه صلاحيه تغيير المعلومات',"md",true)  
end
LuaTele.setChatTitle(msg_chat_id,NameChat)
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تغيير اسم المجموعه الى : "..NameChat,"md",true)    
end

if text == ("ضع صوره") then  
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if GetInfoBot(msg).Info == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• البوت ليس لديه صلاحيه تغيير المعلومات',"md",true)  
end
Redis:set(FDFGERB.."FDFGERB:Chat:Photo"..msg_chat_id..":"..msg.sender_id.user_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"• ارسل الصوره لوضعها","md",true)    
end
if text and text:match("^قول (.*)$")then
local m = text:match("^قول (.*)$")
if not Redis:get(FDFGERB.."FDFGERB:sayy"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id," • تم تعطيل قول لتفعيل اكتب (`تفعيل قول`)","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,m,"md",true) 
end

if text == "مسح قائمه المنع" then   
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 المالكين الاساسين】 فقط ',"md",true)  
end
local list = Redis:smembers(FDFGERB.."FDFGERB:List:Filter"..msg_chat_id)  
if #list == 0 then  
return LuaTele.sendText(msg_chat_id,msg_id,"• لا يوجد كلمات ممنوعه هنا ","md",true)   
end  
for k,v in pairs(list) do  
v = v:gsub('photo:',"") 
v = v:gsub('sticker:',"") 
v = v:gsub('animation:',"") 
v = v:gsub('text:',"") 
Redis:del(FDFGERB.."FDFGERB:Filter:Group:"..v..msg_chat_id)  
Redis:srem(FDFGERB.."FDFGERB:List:Filter"..msg_chat_id,v)  
end  
return LuaTele.sendText(msg_chat_id,msg_id,"• تم مسح ("..#list..") كلمات ممنوعه ","md",true)   
end
if text == "قائمه المنع" then   
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 المالكين الاساسين】 فقط ',"md",true)  
end
local list = Redis:smembers(FDFGERB.."FDFGERB:List:Filter"..msg_chat_id)  
if #list == 0 then  
return LuaTele.sendText(msg_chat_id,msg_id,"• لا يوجد كلمات ممنوعه هنا ","md",true)   
end  
Filter = '\n• قائمه المنع \n━━━━━ \n'
for k,v in pairs(list) do  
print(v)
if v:match('photo:(.*)') then
ver = 'صوره'
elseif v:match('animation:(.*)') then
ver = 'متحركه'
elseif v:match('sticker:(.*)') then
ver = 'ملصق'
elseif v:match('text:(.*)') then
ver = v:gsub('text:',"") 
end
v = v:gsub('photo:',"") 
v = v:gsub('sticker:',"") 
v = v:gsub('animation:',"") 
v = v:gsub('text:',"") 
local Text_Filter = Redis:get(FDFGERB.."FDFGERB:Filter:Group:"..v..msg_chat_id)   
Filter = Filter..""..k.."- "..ver.." » { "..Text_Filter.." }\n"    
end  
LuaTele.sendText(msg_chat_id,msg_id,Filter,"md",true)  
end  
if text == "منع" then       
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 المالكين الاساسين】 فقط ',"md",true)  
end
Redis:set(FDFGERB..'FDFGERB:FilterText'..msg_chat_id..':'..msg.sender_id.user_id,'true')
return LuaTele.sendText(msg_chat_id,msg_id,'\n• ارسل الان ( ملصق ,متحركه ,صوره ,رساله ) ',"md",true)  
end    
if text == "الغاء منع" then    
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 المالكين الاساسين】 فقط ',"md",true)  
end
Redis:set(FDFGERB..'FDFGERB:FilterText'..msg_chat_id..':'..msg.sender_id.user_id,'DelFilter')
return LuaTele.sendText(msg_chat_id,msg_id,'\n• ارسل الان ( ملصق ,متحركه ,صوره ,رساله ) ',"md",true)  
end

if text == "اضف امر" then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Command:Reids:Group"..msg_chat_id..":"..msg.sender_id.user_id,"true") 
return LuaTele.sendText(msg_chat_id,msg_id,"• الان ارسل لي الامر القديم ...","md",true)
end
if text == "حذف امر" or text == "مسح امر" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Command:Reids:Group:Del"..msg_chat_id..":"..msg.sender_id.user_id,"true") 
return LuaTele.sendText(msg_chat_id,msg_id,"• ارسل الان الامر الذي قمت بوضعه مكان الامر القديم","md",true)
end
if text == "حذف الاوامر المضافه" or text == "مسح الاوامر المضافه" then 
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【المدير】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(FDFGERB.."FDFGERB:Command:List:Group"..msg_chat_id)
for k,v in pairs(list) do
Redis:del(FDFGERB.."FDFGERB:Get:Reides:Commands:Group"..msg_chat_id..":"..v)
Redis:del(FDFGERB.."FDFGERB:Command:List:Group"..msg_chat_id)
end
return LuaTele.sendText(msg_chat_id,msg_id,"• تم مسح جميع الاوامر التي تم اضافتها","md",true)
end
if text == "الاوامر المضافه" then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【المدير】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(FDFGERB.."FDFGERB:Command:List:Group"..msg_chat_id.."")
Command = "• قائمه الاوامر المضافه  \n━━━━━\n"
for k,v in pairs(list) do
Commands = Redis:get(FDFGERB.."FDFGERB:Get:Reides:Commands:Group"..msg_chat_id..":"..v)
if Commands then 
Command = Command..""..k..": ("..v..") ⇠ ( "..Commands.." )\n"
else
Command = Command..""..k..": ("..v..") \n"
end
end
if #list == 0 then
Command = "• لا توجد اوامر اضافيه"
end
return LuaTele.sendText(msg_chat_id,msg_id,Command,"md",true)
end

if text == "تثبيت" and msg.reply_to_message_id ~= 0 then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• اعطيني صلاحيات كامله ي غبي ","md",true)  
end
if GetInfoBot(msg).PinMsg == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• البوت ليس لديه صلاحيه تثبيت الرسائل',"md",true)  
end
LuaTele.sendText(msg_chat_id,msg_id,"\n• ابشر ثبت رسالتك  ","md",true)
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local PinMsg = LuaTele.pinChatMessage(msg_chat_id,Message_Reply.id,true)
end
if text == 'الغاء التثبيت' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• اعطيني صلاحيات كامله ي غبي ","md",true)  
end
if GetInfoBot(msg).PinMsg == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• البوت ليس لديه صلاحيه تثبيت الرسائل',"md",true)  
end
LuaTele.sendText(msg_chat_id,msg_id,"\n• تم الغاء تثبيت الرساله","md",true)
LuaTele.unpinChatMessage(msg_chat_id) 
end
if text == 'الغاء تثبيت الكل' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【المدير】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• اعطيني صلاحيات كامله ي غبي ","md",true)  
end
if GetInfoBot(msg).PinMsg == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• البوت ليس لديه صلاحيه تثبيت الرسائل',"md",true)  
end
LuaTele.sendText(msg_chat_id,msg_id,"\n• تم الغاء تثبيت جميع الرسائل","md",true)
for i=0, 20 do
local UnPin = LuaTele.unpinChatMessage(msg_chat_id) 
if not LuaTele.getChatPinnedMessage(msg_chat_id).id then
break
end
end
end
if text == "الحمايه" then    
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = 'تعطيل الرابط', data = msg.sender_id.user_id..'/'.. 'unmute_link'},{text = 'تفعيل الرابط', data = msg.sender_id.user_id..'/'.. 'mute_link'},
},
{
{text = 'تعطيل الترحيب', data = msg.sender_id.user_id..'/'.. 'unmute_welcome'},{text = 'تفعيل الترحيب', data = msg.sender_id.user_id..'/'.. 'mute_welcome'},
},
{
{text = 'اتعطيل الايدي', data = msg.sender_id.user_id..'/'.. 'unmute_Id'},{text = 'اتفعيل الايدي', data = msg.sender_id.user_id..'/'.. 'mute_Id'},
},
{
{text = 'تعطيل الايدي بالصوره', data = msg.sender_id.user_id..'/'.. 'unmute_IdPhoto'},{text = 'تفعيل الايدي بالصوره', data = msg.sender_id.user_id..'/'.. 'mute_IdPhoto'},
},
{
{text = 'تعطيل الردود', data = msg.sender_id.user_id..'/'.. 'unmute_ryple'},{text = 'تفعيل الردود', data = msg.sender_id.user_id..'/'.. 'mute_ryple'},
},
{
{text = 'تعطيل الردود العامه', data = msg.sender_id.user_id..'/'.. 'unmute_ryplesudo'},{text = 'تفعيل الردود العامه', data = msg.sender_id.user_id..'/'.. 'mute_ryplesudo'},
},
{
{text = 'تعطيل الرفع', data = msg.sender_id.user_id..'/'.. 'unmute_setadmib'},{text = 'تفعيل الرفع', data = msg.sender_id.user_id..'/'.. 'mute_setadmib'},
},
{
{text = 'تعطيل الطرد', data = msg.sender_id.user_id..'/'.. 'unmute_kickmembars'},{text = 'تفعيل الطرد', data = msg.sender_id.user_id..'/'.. 'mute_kickmembars'},
},
{
{text = 'تعطيل الالعاب', data = msg.sender_id.user_id..'/'.. 'unmute_games'},{text = 'تفعيل الالعاب', data = msg.sender_id.user_id..'/'.. 'mute_games'},
},
{
{text = 'تعطيل اطردني', data = msg.sender_id.user_id..'/'.. 'unmute_kickme'},{text = 'تفعيل اطردني', data = msg.sender_id.user_id..'/'.. 'mute_kickme'},
},
{
{text = '• اخفاء الامر ', data =msg.sender_id.user_id..'/'.. 'delAmr'}
},
}
}
return LuaTele.sendText(msg_chat_id, msg_id, '• اوامر التفعيل والتعطيل ', 'md', false, false, false, false, reply_markup)
end  
if text == 'اعدادات الحمايه' then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if Redis:get(FDFGERB.."FDFGERB:Status:Link"..msg.chat_id) then
Statuslink = '❬ نعم ❭' else Statuslink = '❬ لا ❭'
end
if Redis:get(FDFGERB.."FDFGERB:Status:Welcome"..msg.chat_id) then
StatusWelcome = '❬ نعم ❭' else StatusWelcome = '❬ لا ❭'
end
if Redis:get(FDFGERB.."FDFGERB:Status:Id"..msg.chat_id) then
StatusId = '❬ نعم ❭' else StatusId = '❬ لا ❭'
end
if Redis:get(FDFGERB.."FDFGERB:Status:IdPhoto"..msg.chat_id) then
StatusIdPhoto = '❬ نعم ❭' else StatusIdPhoto = '❬ لا ❭'
end
if Redis:get(FDFGERB.."FDFGERB:Status:Reply"..msg.chat_id) then
StatusReply = '❬ نعم ❭' else StatusReply = '❬ لا ❭'
end
if Redis:get(FDFGERB.."FDFGERB:Status:ReplySudo"..msg.chat_id) then
StatusReplySudo = '❬ نعم ❭' else StatusReplySudo = '❬ لا ❭'
end
if Redis:get(FDFGERB.."FDFGERB:Status:BanId"..msg.chat_id)  then
StatusBanId = '❬ نعم ❭' else StatusBanId = '❬ لا ❭'
end
if Redis:get(FDFGERB.."FDFGERB:Status:SetId"..msg.chat_id) then
StatusSetId = '❬ نعم ❭' else StatusSetId = '❬ لا ❭'
end
if Redis:get(FDFGERB.."FDFGERB:Status:Games"..msg.chat_id) then
StatusGames = '❬ نعم ❭' else StatusGames = '❬ لا ❭'
end
if Redis:get(FDFGERB.."FDFGERB:Status:KickMe"..msg.chat_id) then
Statuskickme = '❬ نعم ❭' else Statuskickme = '❬ لا ❭'
end
if Redis:get(FDFGERB.."FDFGERB:Status:AddMe"..msg.chat_id) then
StatusAddme = '❬ نعم ❭' else StatusAddme = '❬ لا ❭'
end
local protectionGroup = '\n• اعدادات حمايه المجموعه\n ━━━━━\n'
..'\n• جلب الرابط : '..Statuslink
..'\n• جلب الترحيب : '..StatusWelcome
..'\n• الايدي : '..StatusId
..'\n• الايدي بالصوره : '..StatusIdPhoto
..'\n• الردود : '..StatusReply
..'\n• الردود العامه : '..StatusReplySudo
..'\n• الرفع : '..StatusSetId
..'\n• الحظر • الطرد : '..StatusBanId
..'\n• الالعاب : '..StatusGames
..'\n• امر اطردني : '..Statuskickme..'\n.'
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '• Source loner', url = 't.me/LDD7D'}, 
},
}
}
return LuaTele.sendText(msg_chat_id, msg_id,protectionGroup,'md', false, false, false, false, reply_markup)
end
if text == "الاعدادات" then    
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Text = "\n• اعدادات المجموعه ".."\nعلامة ال (نعم) تعني مقفول".."\nعلامة ال (لا) تعني مفتوح"
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = GetSetieng(msg_chat_id).lock_links, data = '&'},{text = 'الروابط : ', data =msg.sender_id.user_id..'/'.. 'Status_link'},
},
{
{text = GetSetieng(msg_chat_id).lock_spam, data = '&'},{text = 'الكلايش : ', data =msg.sender_id.user_id..'/'.. 'Status_spam'},
},
{
{text = GetSetieng(msg_chat_id).lock_inlin, data = '&'},{text = 'الكيبورد : ', data =msg.sender_id.user_id..'/'.. 'Status_keypord'},
},
{
{text = GetSetieng(msg_chat_id).lock_vico, data = '&'},{text = 'الاغاني : ', data =msg.sender_id.user_id..'/'.. 'Status_voice'},
},
{
{text = GetSetieng(msg_chat_id).lock_gif, data = '&'},{text = 'المتحركه : ', data =msg.sender_id.user_id..'/'.. 'Status_gif'},
},
{
{text = GetSetieng(msg_chat_id).lock_file, data = '&'},{text = 'الملفات : ', data =msg.sender_id.user_id..'/'.. 'Status_files'},
},
{
{text = GetSetieng(msg_chat_id).lock_text, data = '&'},{text = 'الدردشه : ', data =msg.sender_id.user_id..'/'.. 'Status_text'},
},
{
{text = GetSetieng(msg_chat_id).lock_ved, data = '&'},{text = 'الفيديو : ', data =msg.sender_id.user_id..'/'.. 'Status_video'},
},
{
{text = GetSetieng(msg_chat_id).lock_photo, data = '&'},{text = 'الصور : ', data =msg.sender_id.user_id..'/'.. 'Status_photo'},
},
{
{text = GetSetieng(msg_chat_id).lock_user, data = '&'},{text = 'المعرفات : ', data =msg.sender_id.user_id..'/'.. 'Status_username'},
},
{
{text = GetSetieng(msg_chat_id).lock_hash, data = '&'},{text = 'التاك : ', data =msg.sender_id.user_id..'/'.. 'Status_tags'},
},
{
{text = GetSetieng(msg_chat_id).lock_bots, data = '&'},{text = 'البوتات : ', data =msg.sender_id.user_id..'/'.. 'Status_bots'},
},
{
{text = '• التالي ... ', data =msg.sender_id.user_id..'/'.. 'NextSeting'}
},
{
{text = '• اخفاء الامر ', data =msg.sender_id.user_id..'/'.. 'delAmr'}
},
}
}
return LuaTele.sendText(msg_chat_id, msg_id, Text, 'md', false, false, false, false, reply_markup)
end  


if text == 'المجموعه' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• اعطيني صلاحيات كامله ي غبي ","md",true)  
end
local Info_Chats = LuaTele.getSupergroupFullInfo(msg_chat_id)
local Get_Chat = LuaTele.getChat(msg_chat_id)
if Get_Chat.permissions.can_add_web_page_previews then
web = '❬ نعم ❭' else web = '❬ لا ❭'
end
if Get_Chat.permissions.can_change_info then
info = '❬ نعم ❭' else info = '❬ لا ❭'
end
if Get_Chat.permissions.can_invite_users then
invite = '❬ نعم ❭' else invite = '❬ لا ❭'
end
if Get_Chat.permissions.can_pin_messages then
pin = '❬ نعم ❭' else pin = '❬ لا ❭'
end
if Get_Chat.permissions.can_send_media_messages then
media = '❬ نعم ❭' else media = '❬ لا ❭'
end
if Get_Chat.permissions.can_send_messages then
messges = '❬ نعم ❭' else messges = '❬ لا ❭'
end
if Get_Chat.permissions.can_send_other_messages then
other = '❬ نعم ❭' else other = '❬ لا ❭'
end
if Get_Chat.permissions.can_send_polls then
polls = '❬ نعم ❭' else polls = '❬ لا ❭'
end
local permissions = '\n• صلاحيات المجموعه :\n━━━━━'..'\n• ارسال الويب : '..web..'\n• تغيير معلومات المجموعه : '..info..'\n• اضافه مستخدمين : '..invite..'\n• تثبيت الرسائل : '..pin..'\n• ارسال الميديا : '..media..'\n• ارسال الرسائل : '..messges..'\n• اضافه البوتات : '..other..'\n• ارسال استفتاء : '..polls..'\n'
local TextChat = '\n• معلومات المجموعه :\n━━━━━'..' \n• عدد الادمنيه : ❬ '..Info_Chats.administrator_count..' ❭\n• عدد المحظورين : ❬ '..Info_Chats.banned_count..' ❭\n• عدد الاعضاء : ❬ '..Info_Chats.member_count..' ❭\n• عدد المقيديين : ❬ '..Info_Chats.restricted_count..' ❭\n• اسم المجموعه : ❬ ['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..') ❭'
return LuaTele.sendText(msg_chat_id,msg_id, TextChat..permissions,"md",true)
end
if text == 'صلاحيات المجموعه' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【المدير】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• اعطيني صلاحيات كامله ي غبي ","md",true)  
end
local Get_Chat = LuaTele.getChat(msg_chat_id)
if Get_Chat.permissions.can_add_web_page_previews then
web = '❬ نعم ❭' else web = '❬ لا ❭'
end
if Get_Chat.permissions.can_change_info then
info = '❬ نعم ❭' else info = '❬ لا ❭'
end
if Get_Chat.permissions.can_invite_users then
invite = '❬ نعم ❭' else invite = '❬ لا ❭'
end
if Get_Chat.permissions.can_pin_messages then
pin = '❬ نعم ❭' else pin = '❬ لا ❭'
end
if Get_Chat.permissions.can_send_media_messages then
media = '❬ نعم ❭' else media = '❬ لا ❭'
end
if Get_Chat.permissions.can_send_messages then
messges = '❬ نعم ❭' else messges = '❬ لا ❭'
end
if Get_Chat.permissions.can_send_other_messages then
other = '❬ نعم ❭' else other = '❬ لا ❭'
end
if Get_Chat.permissions.can_send_polls then
polls = '❬ نعم ❭' else polls = '❬ لا ❭'
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '• ارسال الويب : '..web, data = msg.sender_id.user_id..'/web'}, 
},
{
{text = '• تغيير معلومات المجموعه : '..info, data =msg.sender_id.user_id..  '/info'}, 
},
{
{text = '• اضافه مستخدمين : '..invite, data =msg.sender_id.user_id..  '/invite'}, 
},
{
{text = '• تثبيت الرسائل : '..pin, data =msg.sender_id.user_id..  '/pin'}, 
},
{
{text = '• ارسال الميديا : '..media, data =msg.sender_id.user_id..  '/media'}, 
},
{
{text = '• ارسال الرسائل : .'..messges, data =msg.sender_id.user_id..  '/messges'}, 
},
{
{text = '• اضافه البوتات : '..other, data =msg.sender_id.user_id..  '/other'}, 
},
{
{text = '• ارسال استفتاء : '..polls, data =msg.sender_id.user_id.. '/polls'}, 
},
{
{text = '• اخفاء الامر ', data =msg.sender_id.user_id..'/'.. '/delAmr'}
},
}
}
return LuaTele.sendText(msg_chat_id, msg_id, "• الصلاحيات • ", 'md', false, false, false, false, reply_markup)
end
if text == 'تنزيل الكل' and msg.reply_to_message_id ~= 0 then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender_id.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ما يمديك تستعمل الامر ع بوت يغبي  ","md",true)  
end
if Redis:sismember(FDFGERB.."FDFGERB:Developers:Groups",Message_Reply.sender_id.user_id) then
dev = "Myth ،" else dev = "" end
if Redis:sismember(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id, Message_Reply.sender_id.user_id) then
crr = "مالك اساسي ،" else crr = "" end
if Redis:sismember(FDFGERB..'FDFGERB:Originators:Group'..msg_chat_id, Message_Reply.sender_id.user_id) then
cr = "مالك  ،" else cr = "" end
if Redis:sismember(FDFGERB..'FDFGERB:Managers:Group'..msg_chat_id, Message_Reply.sender_id.user_id) then
own = "مدير ،" else own = "" end
if Redis:sismember(FDFGERB..'FDFGERB:Addictive:Group'..msg_chat_id, Message_Reply.sender_id.user_id) then
mod = "ادمن ،" else mod = "" end
if Redis:sismember(FDFGERB..'FDFGERB:Distinguished:Group'..msg_chat_id, Message_Reply.sender_id.user_id) then
vip = "مميز ،" else vip = ""
end
if The_ControllerAll(Message_Reply.sender_id.user_id) == true then
Rink = 1
elseif Redis:sismember(FDFGERB.."FDFGERB:Developers:Groups",Message_Reply.sender_id.user_id)  then
Rink = 2
elseif Redis:sismember(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id, Message_Reply.sender_id.user_id) then
Rink = 3
elseif Redis:sismember(FDFGERB.."FDFGERB:Originators:Group"..msg_chat_id, Message_Reply.sender_id.user_id) then
Rink = 4
elseif Redis:sismember(FDFGERB.."FDFGERB:Managers:Group"..msg_chat_id, Message_Reply.sender_id.user_id) then
Rink = 5
elseif Redis:sismember(FDFGERB.."FDFGERB:Addictive:Group"..msg_chat_id, Message_Reply.sender_id.user_id) then
Rink = 6
elseif Redis:sismember(FDFGERB.."FDFGERB:Distinguished:Group"..msg_chat_id, Message_Reply.sender_id.user_id) then
Rink = 7
else
Rink = 8
end
if StatusCanOrNotCan(msg_chat_id,Message_Reply.sender_id.user_id) == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ليس لديه اي رتبه هنا ","md",true)  
end
if msg.ControllerBot then
if Rink == 1 or Rink < 1 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• يهطف ما يمديك تنزل نفس رتبتك او اعلى منك  ","md",true)  
end
Redis:srem(FDFGERB.."FDFGERB:Developers:Groups",Message_Reply.sender_id.user_id)
Redis:srem(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id, Message_Reply.sender_id.user_id)
Redis:srem(FDFGERB.."FDFGERB:Originators:Group"..msg_chat_id, Message_Reply.sender_id.user_id)
Redis:srem(FDFGERB.."FDFGERB:Managers:Group"..msg_chat_id, Message_Reply.sender_id.user_id)
Redis:srem(FDFGERB.."FDFGERB:Addictive:Group"..msg_chat_id, Message_Reply.sender_id.user_id)
Redis:srem(FDFGERB.."FDFGERB:Distinguished:Group"..msg_chat_id, Message_Reply.sender_id.user_id)
elseif msg.Developers then
if Rink == 2 or Rink < 2 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• يهطف ما يمديك تنزل نفس رتبتك او اعلى منك  ","md",true)  
end
Redis:srem(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id, Message_Reply.sender_id.user_id)
Redis:srem(FDFGERB.."FDFGERB:Originators:Group"..msg_chat_id, Message_Reply.sender_id.user_id)
Redis:srem(FDFGERB.."FDFGERB:Managers:Group"..msg_chat_id, Message_Reply.sender_id.user_id)
Redis:srem(FDFGERB.."FDFGERB:Addictive:Group"..msg_chat_id, Message_Reply.sender_id.user_id)
Redis:srem(FDFGERB.."FDFGERB:Distinguished:Group"..msg_chat_id, Message_Reply.sender_id.user_id)
elseif msg.TheBasics then
if Rink == 3 or Rink < 3 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• يهطف ما يمديك تنزل نفس رتبتك او اعلى منك  ","md",true)  
end
Redis:srem(FDFGERB.."FDFGERB:Originators:Group"..msg_chat_id, Message_Reply.sender_id.user_id)
Redis:srem(FDFGERB.."FDFGERB:Managers:Group"..msg_chat_id, Message_Reply.sender_id.user_id)
Redis:srem(FDFGERB.."FDFGERB:Addictive:Group"..msg_chat_id, Message_Reply.sender_id.user_id)
Redis:srem(FDFGERB.."FDFGERB:Distinguished:Group"..msg_chat_id, Message_Reply.sender_id.user_id)
elseif msg.Originators then
if Rink == 4 or Rink < 4 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• يهطف ما يمديك تنزل نفس رتبتك او اعلى منك  ","md",true)  
end
Redis:srem(FDFGERB.."FDFGERB:Managers:Group"..msg_chat_id, Message_Reply.sender_id.user_id)
Redis:srem(FDFGERB.."FDFGERB:Addictive:Group"..msg_chat_id, Message_Reply.sender_id.user_id)
Redis:srem(FDFGERB.."FDFGERB:Distinguished:Group"..msg_chat_id, Message_Reply.sender_id.user_id)
elseif msg.Managers then
if Rink == 5 or Rink < 5 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• يهطف ما يمديك تنزل نفس رتبتك او اعلى منك  ","md",true)  
end
Redis:srem(FDFGERB.."FDFGERB:Addictive:Group"..msg_chat_id, Message_Reply.sender_id.user_id)
Redis:srem(FDFGERB.."FDFGERB:Distinguished:Group"..msg_chat_id, Message_Reply.sender_id.user_id)
elseif msg.Addictive then
if Rink == 6 or Rink < 6 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• يهطف ما يمديك تنزل نفس رتبتك او اعلى منك  ","md",true)  
end
Redis:srem(FDFGERB.."FDFGERB:Distinguished:Group"..msg_chat_id, Message_Reply.sender_id.user_id)
end
return LuaTele.sendText(msg_chat_id,msg_id,"\n• تم تنزيل الشخص من الرتب التاليه  "..dev..""..crr..""..cr..""..own..""..mod..""..vip.." ","md",true)  
end

if text and text:match('^تنزيل الكل @(%S+)$') then
local UserName = text:match('^تنزيل الكل @(%S+)$')
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• مافيه حساب بهذا اليوزر ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ما يمديك تستعمل الامر ع قناه او قروب !! ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ما يمديك تستعمل الامر ع بوت يغبي ","md",true)  
end
if Redis:sismember(FDFGERB.."FDFGERB:Developers:Groups",UserId_Info.id) then
dev = "Myth ،" else dev = "" end
if Redis:sismember(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id, UserId_Info.id) then
crr = "مالك اساسي ،" else crr = "" end
if Redis:sismember(FDFGERB..'FDFGERB:Originators:Group'..msg_chat_id, UserId_Info.id) then
cr = "مالك  ،" else cr = "" end
if Redis:sismember(FDFGERB..'FDFGERB:Managers:Group'..msg_chat_id, UserId_Info.id) then
own = "مدير ،" else own = "" end
if Redis:sismember(FDFGERB..'FDFGERB:Addictive:Group'..msg_chat_id, UserId_Info.id) then
mod = "ادمن ،" else mod = "" end
if Redis:sismember(FDFGERB..'FDFGERB:Distinguished:Group'..msg_chat_id, UserId_Info.id) then
vip = "مميز ،" else vip = ""
end
if The_ControllerAll(UserId_Info.id) == true then
Rink = 1
elseif Redis:sismember(FDFGERB.."FDFGERB:Developers:Groups",UserId_Info.id)  then
Rink = 2
elseif Redis:sismember(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id, UserId_Info.id) then
Rink = 3
elseif Redis:sismember(FDFGERB.."FDFGERB:Originators:Group"..msg_chat_id, UserId_Info.id) then
Rink = 4
elseif Redis:sismember(FDFGERB.."FDFGERB:Managers:Group"..msg_chat_id, UserId_Info.id) then
Rink = 5
elseif Redis:sismember(FDFGERB.."FDFGERB:Addictive:Group"..msg_chat_id, UserId_Info.id) then
Rink = 6
elseif Redis:sismember(FDFGERB.."FDFGERB:Distinguished:Group"..msg_chat_id, UserId_Info.id) then
Rink = 7
else
Rink = 8
end
if StatusCanOrNotCan(msg_chat_id,UserId_Info.id) == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ليس لديه اي رتبه هنا ","md",true)  
end
if msg.ControllerBot then
if Rink == 1 or Rink < 1 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• يهطف ما يمديك تنزل نفس رتبتك او اعلى منك  ","md",true)  
end
Redis:srem(FDFGERB.."FDFGERB:Developers:Groups",UserId_Info.id)
Redis:srem(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(FDFGERB.."FDFGERB:Originators:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(FDFGERB.."FDFGERB:Managers:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(FDFGERB.."FDFGERB:Addictive:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(FDFGERB.."FDFGERB:Distinguished:Group"..msg_chat_id, UserId_Info.id)
elseif msg.Developers then
if Rink == 2 or Rink < 2 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• يهطف ما يمديك تنزل نفس رتبتك او اعلى منك  ","md",true)  
end
Redis:srem(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(FDFGERB.."FDFGERB:Originators:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(FDFGERB.."FDFGERB:Managers:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(FDFGERB.."FDFGERB:Addictive:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(FDFGERB.."FDFGERB:Distinguished:Group"..msg_chat_id, UserId_Info.id)
elseif msg.TheBasics then
if Rink == 3 or Rink < 3 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• يهطف ما يمديك تنزل نفس رتبتك او اعلى منك  ","md",true)  
end
Redis:srem(FDFGERB.."FDFGERB:Originators:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(FDFGERB.."FDFGERB:Managers:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(FDFGERB.."FDFGERB:Addictive:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(FDFGERB.."FDFGERB:Distinguished:Group"..msg_chat_id, UserId_Info.id)
elseif msg.Originators then
if Rink == 4 or Rink < 4 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• يهطف ما يمديك تنزل نفس رتبتك او اعلى منك  ","md",true)  
end
Redis:srem(FDFGERB.."FDFGERB:Managers:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(FDFGERB.."FDFGERB:Addictive:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(FDFGERB.."FDFGERB:Distinguished:Group"..msg_chat_id, UserId_Info.id)
elseif msg.Managers then
if Rink == 5 or Rink < 5 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• يهطف ما يمديك تنزل نفس رتبتك او اعلى منك  ","md",true)  
end
Redis:srem(FDFGERB.."FDFGERB:Addictive:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(FDFGERB.."FDFGERB:Distinguished:Group"..msg_chat_id, UserId_Info.id)
elseif msg.Addictive then
if Rink == 6 or Rink < 6 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• يهطف ما يمديك تنزل نفس رتبتك او اعلى منك  ","md",true)  
end
Redis:srem(FDFGERB.."FDFGERB:Distinguished:Group"..msg_chat_id, UserId_Info.id)
end
return LuaTele.sendText(msg_chat_id,msg_id,"\n• تم تنزيل الشخص من الرتب التاليه  "..dev..""..crr..""..cr..""..own..""..mod..""..vip.." ","md",true)  
end
if text and text:match('اضف لقب (.*)') and msg.reply_to_message_id ~= 0 then
local CustomTitle = text:match('اضف لقب (.*)')
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 المالكين الاساسين】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = 't.me/'..Redis:get(FDFGERB..'Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• عليك الاشتراك في قناة البوت لاستخذام الاوامر',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ارفعني مع كامل صلاحيات وكتب تفعيل يا فاهي","md",true)  
end
if GetInfoBot(msg).SetAdmin == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• اعطيني صلاحيات كامله اول بعدين سولف ',"md",true)  
end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender_id.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ما يمديك تستعمل الامر ع بوت يغبي ","md",true)  
end
local SetCustomTitle = https.request("https://api.telegram.org/bot"..Token.."/setChatAdministratorCustomTitle?chat_id="..msg_chat_id.."&user_id="..Message_Reply.sender_id.user_id.."&custom_title="..CustomTitle)
local SetCustomTitle_ = JSON.decode(SetCustomTitle)
if SetCustomTitle_.result == true then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"• تم وضع له لقب : "..CustomTitle).Reply,"md",true)  
else
return LuaTele.sendText(msg_chat_id,msg_id,"\n• اعطيني صلاحيات كامله اول بعدين سولف","md",true)  
end 
end
if text == 'لقبي' and msg.reply_to_message_id == 0 then
Ge = https.request("https://api.telegram.org/bot"..Token.."/getChatMember?chat_id=" .. msg_chat_id .. "&user_id=" ..msg.sender_id.user_id)
GeId = JSON.decode(Ge)
if not GeId.result.custom_title then
return LuaTele.sendText(msg_chat_id,msg_id,"• لا يوجد لك لقب ","md",true)  
else
return LuaTele.sendText(msg_chat_id,msg_id,'\n• لقبك هو ⇠ '..GeId.result.custom_title..'',"md",true)  
end
end

if text == ('رفع مشرف') and msg.reply_to_message_id ~= 0 then
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 المالكين الاساسين】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• اعطيني صلاحيات كامله ي غبي ","md",true)  
end
if GetInfoBot(msg).SetAdmin == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• اعطيني صلاحيات كامله اول بعدين سولف',"md",true)  
end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender_id.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ما يمديك تستعمل الامر ع بوت يغبي  ","md",true)  
end
local SetAdmin = LuaTele.setChatMemberStatus(msg.chat_id,Message_Reply.sender_id.user_id,'administrator',{1 ,1, 0, 0, 0, 0, 0 , 0, 0, 0, 0, 0, ''})
if SetAdmin.code == 3 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• لا يمكنني رفعه ليس لدي صلاحيات ","md",true)  
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '• تعديل الصلاحيات ', data = msg.sender_id.user_id..'/groupNumseteng//'..Message_Reply.sender_id.user_id}, 
},
}
}
return LuaTele.sendText(msg_chat_id, msg_id, "• صلاحيات المستخدم • ", 'md', false, false, false, false, reply_markup)
end
if text and text:match('^رفع مشرف @(%S+)$') then
local UserName = text:match('^رفع مشرف @(%S+)$')
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 المالكين الاساسين】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• اعطيني صلاحيات كامله ي غبي ","md",true)  
end
if GetInfoBot(msg).SetAdmin == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• اعطيني صلاحيات كامله اول بعدين سولف',"md",true)  
end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• مافيه حساب بهذا اليوزر ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ما يمديك تستعمل الامر ع قناه او قروب !! ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ما يمديك تستعمل الامر ع بوت يغبي ","md",true)  
end
local SetAdmin = LuaTele.setChatMemberStatus(msg.chat_id,UserId_Info.id,'administrator',{1 ,1, 0, 0, 0, 0, 0 , 0, 0, 0, 0, 0, ''})
if SetAdmin.code == 3 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• لا يمكنني رفعه ليس لدي صلاحيات ","md",true)  
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '• تعديل الصلاحيات ', data = msg.sender_id.user_id..'/groupNumseteng//'..UserId_Info.id}, 
},
}
}
return LuaTele.sendText(msg_chat_id, msg_id, "• صلاحيات المستخدم • ", 'md', false, false, false, false, reply_markup)
end 
if text == ('تنزيل مشرف') and msg.reply_to_message_id ~= 0 then
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 المالكين الاساسين】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• اعطيني صلاحيات كامله ي غبي ","md",true)  
end
if GetInfoBot(msg).SetAdmin == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• اعطيني صلاحيات كامله اول بعدين سولف',"md",true)  
end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender_id.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ما يمديك تستعمل الامر ع بوت يغبي  ","md",true)  
end
local SetAdmin = LuaTele.setChatMemberStatus(msg.chat_id,Message_Reply.sender_id.user_id,'administrator',{0 ,0, 0, 0, 0, 0, 0 ,0, 0})
if SetAdmin.code == 400 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• مب انا الي رفعته ","md",true)  
end
if SetAdmin.code == 3 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• لا يمكنني تنزيله ليس لدي صلاحيات ","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"• تم تنزيله من المشرفين ").Reply,"md",true)  
end
if text and text:match('^تنزيل مشرف @(%S+)$') then
local UserName = text:match('^تنزيل مشرف @(%S+)$')
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 المالكين الاساسين】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• اعطيني صلاحيات كامله ي غبي ","md",true)  
end
if GetInfoBot(msg).SetAdmin == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• اعطيني صلاحيات كامله اول بعدين سولف',"md",true)  
end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• مافيه حساب بهذا اليوزر ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ما يمديك تستعمل الامر ع قناه او قروب !! ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ما يمديك تستعمل الامر ع بوت يغبي ","md",true)  
end
local SetAdmin = LuaTele.setChatMemberStatus(msg.chat_id,UserId_Info.id,'administrator',{0 ,0, 0, 0, 0, 0, 0 ,0, 0})
if SetAdmin.code == 400 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• مب انا الي رفعته ","md",true)  
end
if SetAdmin.code == 3 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• لا يمكنني تنزيله ليس لدي صلاحيات ","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم تنزيله من المشرفين ").Reply,"md",true)  
end 
if text == 'مسح رسائلي' then
Redis:del(FDFGERB..'FDFGERB:Num:Message:User'..msg.chat_id..':'..msg.sender_id.user_id)
LuaTele.sendText(msg_chat_id,msg_id,'• تم مسح جميع رسائلك ',"md",true)  
elseif text == 'مسح سحكاتي' or text == 'مسح تعديلاتي' then
Redis:del(FDFGERB..'FDFGERB:Num:Message:Edit'..msg.chat_id..':'..msg.sender_id.user_id)
LuaTele.sendText(msg_chat_id,msg_id,'• تم مسح جميع تعديلاتك ',"md",true)  
elseif text == 'مسح جهاتي' then
Redis:del(FDFGERB..'FDFGERB:Num:Add:Memp'..msg.chat_id..':'..msg.sender_id.user_id)
LuaTele.sendText(msg_chat_id,msg_id,'• تم مسح جميع جهاتك المضافه ',"md",true)  
elseif text == 'رسائلي' then
LuaTele.sendText(msg_chat_id,msg_id,'• عدد رسائلك هنا ⇠'..(Redis:get(FDFGERB..'FDFGERB:Num:Message:User'..msg.chat_id..':'..msg.sender_id.user_id) or 1)..'',"md",true)  
elseif text == 'سحكاتي' or text == 'تعديلاتي' then
LuaTele.sendText(msg_chat_id,msg_id,'• عدد التعديلات هنا ⇠'..(Redis:get(FDFGERB..'FDFGERB:Num:Message:Edit'..msg.chat_id..msg.sender_id.user_id) or 0)..'',"md",true)  
elseif text == 'جهاتي' then
LuaTele.sendText(msg_chat_id,msg_id,'• عدد جهاتك المضافه هنا ⇠ '..(Redis:get(FDFGERB.."FDFGERB:Num:Add:Memp"..msg.chat_id..":"..msg.sender_id.user_id) or 0)..'',"md",true)  
elseif text == 'مسح' and msg.reply_to_message_id ~= 0 and msg.Addictive then
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if GetInfoBot(msg).Delmsg == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• البوت ليس لديه صلاحيه حذف الرسائل',"md",true)  
end
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.reply_to_message_id})
LuaTele.deleteMessages(msg.chat_id,{[1]= msg_id})
end
if text == 'تعين الايدي عام' or text == 'تعيين الايدي عام' then
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Myth🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:setex(FDFGERB.."FDFGERB:Redis:Id:all"..msg.chat_id..""..msg.sender_id.user_id,240,true)  
return LuaTele.sendText(msg_chat_id,msg_id,[[
• ارسل الان النص
• يمكنك اضافه :
• `#username` » اسم المستخدم
• `#msgs` » عدد الرسائل
• `#photos` » عدد الصور
• `#id` » ايدي المستخدم
• `#auto` » نسبة التفاعل
• `#stast` » رتبة المستخدم 
• `#edit` » عدد السحكات
• `#game` » عدد الجواهر
• `#AddMem` » عدد الجهات
• `#Description` » تعليق الصوره
]],"md",true)    
end 
if text == 'حذف الايدي عام' or text == 'مسح الايدي عام' then
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Myth🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:Set:Id:all")
return LuaTele.sendText(msg_chat_id,msg_id, '• تم ازالة كليشة الايدي عام ',"md",true)  
end

if text == 'تعين الايدي' or text == 'تعيين الايدي' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:setex(FDFGERB.."FDFGERB:Redis:Id:Group"..msg.chat_id..""..msg.sender_id.user_id,240,true)  
return LuaTele.sendText(msg_chat_id,msg_id,[[
• ارسل الان النص
• يمكنك اضافه :
• `#username` » اسم المستخدم
• `#msgs` » عدد الرسائل
• `#photos` » عدد الصور
• `#id` » ايدي المستخدم
• `#auto` » نسبة التفاعل
• `#stast` » رتبة المستخدم 
• `#edit` » عدد السحكات
• `#game` » عدد الجواهر
• `#AddMem` » عدد الجهات
• `#Description` » تعليق الصوره
]],"md",true)    
end 
if text == 'حذف الايدي' or text == 'مسح الايدي' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:Set:Id:Group"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id, '• تم ازالة كليشة الايدي ',"md",true)  
end

if text and text:match("^مسح (.*)$") and msg.reply_to_message_id == 0 then
local TextMsg = text:match("^مسح (.*)$")
if TextMsg == 'المطورين الثانوين' or TextMsg == 'قائمه MY' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(FDFGERB.."FDFGERB:DevelopersQ:Groups") 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"• لا يوجد Myth🎖 حاليا , ","md",true)  
end
Redis:del(FDFGERB.."FDFGERB:DevelopersQ:Groups") 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم مسح ( "..#Info_Members.." ) من قائمه MY","md",true)
end
if TextMsg == 'قائمه M' then
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Myth🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(FDFGERB.."FDFGERB:Developers:Groups") 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"• لا يوجد Myth حاليا , ","md",true)  
end
Redis:del(FDFGERB.."FDFGERB:Developers:Groups") 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم مسح ( "..#Info_Members.." ) من Myth ","md",true)
end
if TextMsg == 'المالكين الاساسين' then
if LuaTele.getChatMember(msg_chat_id,msg.sender_id.user_id).status.luatele ~= "chatMemberStatusCreator" and not msg.Developers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 مالك المجموعه ️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id) 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"• لا يوجد مالكين اساسيين حاليا , ","md",true)  
end
Redis:del(FDFGERB.."FDFGERB:TheBasics:Group"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم مسح ( "..#Info_Members.." ) من المالكين الاساسيين ","md",true)
end
if TextMsg == 'المالكين' then
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 المالكين الاساسين】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(FDFGERB.."FDFGERB:Originators:Group"..msg_chat_id) 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"• لا يوجد مالكين حاليا , ","md",true)  
end
Redis:del(FDFGERB.."FDFGERB:Originators:Group"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم مسح ( "..#Info_Members.." ) من المالكين ","md",true)
end
if TextMsg == 'المدراء' then
if not msg.Originators then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 المالكين】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(FDFGERB.."FDFGERB:Managers:Group"..msg_chat_id) 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"• لا يوجد مدراء حاليا , ","md",true)  
end
Redis:del(FDFGERB.."FDFGERB:Managers:Group"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم مسح ( "..#Info_Members.." ) من المدراء ","md",true)
end
if TextMsg == 'الادمنيه' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【المدير】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(FDFGERB.."FDFGERB:Addictive:Group"..msg_chat_id) 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"• لا يوجد ادمنيه حاليا , ","md",true)  
end
Redis:del(FDFGERB.."FDFGERB:Addictive:Group"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم مسح ( "..#Info_Members.." ) من الادمنيه ","md",true)
end
if TextMsg == 'المميزين' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(FDFGERB.."FDFGERB:Distinguished:Group"..msg_chat_id) 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"• لا يوجد مميزين حاليا , ","md",true)  
end
Redis:del(FDFGERB.."FDFGERB:Distinguished:Group"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم مسح ( "..#Info_Members.." ) من المميزين ","md",true)
end
if TextMsg == 'المكتومين عام' or TextMsg == 'قائمه المكتومين العام' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(FDFGERB.."FDFGERB:kkytmAll:Groups") 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"• لا يوجد مكتومين عام","md",true)  
end
Redis:del(FDFGERB.."FDFGERB:kkytmAll:Groups") 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم مسح { "..#Info_Members.." } من المكتومين عام  .","md",true)
end

if TextMsg == 'المحظورين عام' or TextMsg == 'قائمه العام' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(FDFGERB.."FDFGERB:BanAll:Groups") 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"• لا يوجد محظورين عام حاليا , ","md",true)  
end
Redis:del(FDFGERB.."FDFGERB:BanAll:Groups") 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم مسح ( "..#Info_Members.." ) من المحظورين عام ","md",true)
end
if TextMsg == 'المحظورين' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(FDFGERB.."FDFGERB:BanGroup:Group"..msg_chat_id) 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"• لا يوجد محظورين حاليا , ","md",true)  
end
Redis:del(FDFGERB.."FDFGERB:BanGroup:Group"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم مسح ( "..#Info_Members.." ) من المحظورين ","md",true)
end
if TextMsg == 'المكتومين' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(FDFGERB.."FDFGERB:SilentGroup:Group"..msg_chat_id) 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"• لا يوجد مكتومين حاليا , ","md",true)  
end
Redis:del(FDFGERB.."FDFGERB:SilentGroup:Group"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم مسح ( "..#Info_Members.." ) من المكتومين ","md",true)
end
if TextMsg == 'المقيدين' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• البوت ليس لديه صلاحيه حظر المستخدمين',"md",true)  
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• اعطيني صلاحيات كامله ي غبي ","md",true)  
end
local Info_Members = LuaTele.getSupergroupMembers(msg_chat_id, "Recent", "", 0, 200)
local List_Members = Info_Members.members
x = 0
for k, v in pairs(List_Members) do
if Info_Members.members[k].status.is_member == true and Info_Members.members[k].status.luatele == "chatMemberStatusRestricted" then
LuaTele.setChatMemberStatus(msg.chat_id,v.member_id.user_id,'restricted',{1,1,1,1,1,1,1,1})
x = x + 1
end
end
return LuaTele.sendText(msg_chat_id,msg_id,"• تم مسح ( "..x.." ) من المقيديين ","md",true)
end
if TextMsg == 'البوتات' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【المدير】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• اعطيني صلاحيات كامله ي غبي ","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• البوت ليس لديه صلاحيه حظر المستخدمين',"md",true)  
end
local Info_Members = LuaTele.getSupergroupMembers(msg_chat_id, "Bots", "", 0, 200)
local List_Members = Info_Members.members
x = 0
for k, v in pairs(List_Members) do
local Ban_Bots = LuaTele.setChatMemberStatus(msg.chat_id,v.member_id.user_id,'banned',0)
if Ban_Bots.luatele == "ok" then
x = x + 1
end
end
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عدد البوتات الموجوده : "..#List_Members.."\n• تم طرد ( "..x.." ) بوت من المجموعه ","md",true)  
end
if TextMsg == 'المطرودين' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【المدير】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• اعطيني صلاحيات كامله ي غبي ","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• البوت ليس لديه صلاحيه حظر المستخدمين',"md",true)  
end
local Info_Members = LuaTele.getSupergroupMembers(msg_chat_id, "Banned", "", 0, 200)
x = 0
local List_Members = Info_Members.members
for k, v in pairs(List_Members) do
UNBan_Bots = LuaTele.setChatMemberStatus(msg.chat_id,v.member_id.user_id,'restricted',{1,1,1,1,1,1,1,1,1})
if UNBan_Bots.luatele == "ok" then
x = x + 1
end
end
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عدد المطرودين في الموجوده : "..#List_Members.."\n• تم الغاء الحظر عن ( "..x.." ) من الاشخاص","md",true)  
end
if TextMsg == 'المحذوفين' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【المدير】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• اعطيني صلاحيات كامله ي غبي ","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• البوت ليس لديه صلاحيه حظر المستخدمين',"md",true)  
end
local Info_Members = LuaTele.searchChatMembers(msg_chat_id, "", 200)
local List_Members = Info_Members.members
x = 0
for k, v in pairs(List_Members) do
local UserInfo = LuaTele.getUser(v.member_id.user_id)
if UserInfo.type.luatele == "userTypeDeleted" then
local userTypeDeleted = LuaTele.setChatMemberStatus(msg.chat_id,v.member_id.user_id,'banned',0)
if userTypeDeleted.luatele == "ok" then
x = x + 1
end
end
end
return LuaTele.sendText(msg_chat_id,msg_id,"\n• تم طرد ( "..x.." ) حساب محذوف ","md",true)  
end
end
if text and text:match("^حظر المجموعه (.*)$") then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• هاذا الامر يخص { '..Controller_Num(1)..' } ',"md",true)
end
local txx = text:match("^حظر المجموعه (.*)$")
if txx:match("^-100(%d+)$") then
Redis:sadd(FDFGERB..'ban:online',txx)
LuaTele.sendText(msg_chat_id,msg_id,'\n• تم حظر المجموعه بنجاح  . ',"md",true)  
else
LuaTele.sendText(msg_chat_id,msg_id,'\n• اكتب ايدي المجموعه بشكل صحيح  . ',"md",true)  
end
end
if text and text:match("^الغاء حظر المجموعه (.*)$") then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• هاذا الامر يخص { '..Controller_Num(1)..' } ',"md",true)
end
local txx = text:match("^الغاء حظر المجموعه (.*)$")
if txx:match("^-100(%d+)$") then
Redis:srem(FDFGERB..'ban:online',txx)
LuaTele.sendText(msg_chat_id,msg_id,'\n• • تم الغاء حظر المجموعه بنجاح  . ',"md",true)  
else
LuaTele.sendText(msg_chat_id,msg_id,'\n• اكتب ايدي المجموعه بشكل صحيح  . ',"md",true)  
end
end
if text == ("مسح الردود الانلاين العامه") then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• هاذا الامر يخص { '..Controller_Num(1)..' } ',"md",true)
end
local list = Redis:smembers(FDFGERB.."List:Manager:inline3am")
for k,v in pairs(list) do
Redis:del(FDFGERB.."Add:Rd:Manager:Gif:inline3am"..v) 
Redis:del(FDFGERB.."Add:Rd:Manager:Vico:inline3am"..v) 
Redis:del(FDFGERB.."Add:Rd:Manager:Stekrs:inline3am"..v) 
Redis:del(FDFGERB.."Add:Rd:Manager:Text:inline3am"..v) 
Redis:del(FDFGERB.."Add:Rd:Manager:Photo:inline3am"..v)
Redis:del(FDFGERB.."Add:Rd:Manager:Photoc:inline3am"..v)
Redis:del(FDFGERB.."Add:Rd:Manager:Video:inline3am"..v)
Redis:del(FDFGERB.."Add:Rd:Manager:Videoc:inline3am"..v)
Redis:del(FDFGERB.."Add:Rd:Manager:File:inline3am"..v)
Redis:del(FDFGERB.."Add:Rd:Manager:video_note:inline3am"..v)
Redis:del(FDFGERB.."Add:Rd:Manager:Audio:inline3am"..v)
Redis:del(FDFGERB.."Add:Rd:Manager:Audioc:inline3am"..v)
Redis:del(FDFGERB.."Rd:Manager:inline3am:v"..v)
Redis:del(FDFGERB.."Rd:Manager:inline3am:link"..v)
Redis:del(FDFGERB.."List:Manager:inline3am")
end
return LuaTele.sendText(msg_chat_id,msg_id,"• تم مسح قائمه الانلاين","md",true)
end
if text and Redis:get(FDFGERB.."Set:Manager:rd:inline3am"..msg.sender_id.user_id..":"..msg_chat_id) == "set_link" then
Redis:del(FDFGERB.."Set:Manager:rd:inline3am"..msg.sender_id.user_id..":"..msg_chat_id)
local anubis = Redis:get(FDFGERB.."Text:Manager:inline3am"..msg.sender_id.user_id..":")
Redis:set(FDFGERB.."Rd:Manager:inline3am:link"..anubis, text)
LuaTele.sendText(msg_chat_id,msg_id,"• تم اضافه الرد بنجاح","md",true)
return false
end
if text and Redis:get(FDFGERB.."Set:Manager:rd:inline3am"..msg.sender_id.user_id..":"..msg_chat_id) == "set_inline" then
Redis:set(FDFGERB.."Set:Manager:rd:inline3am"..msg.sender_id.user_id..":"..msg_chat_id, "set_link")
local anubis = Redis:get(FDFGERB.."Text:Manager:inline3am"..msg.sender_id.user_id..":")
Redis:set(FDFGERB.."Rd:Manager:inline3am:text"..anubis, text)
LuaTele.sendText(msg_chat_id,msg_id,"• الان ارسل الرابط","md",true)
return false
end
if Redis:get(FDFGERB.."Set:Manager:rd:inline3am"..msg.sender_id.user_id..":"..msg_chat_id) == "true1" and tonumber(msg.sender_id.user_id) ~= tonumber(FDFGERB) then
Redis:del(FDFGERB.."Set:Manager:rd:inline3am"..msg.sender_id.user_id..":"..msg_chat_id)
Redis:set(FDFGERB.."Set:Manager:rd:inline3am"..msg.sender_id.user_id..":"..msg_chat_id,"set_inline")
if text or msg.content.video_note or msg.content.document or msg.content.audio or msg.content.video or msg.content.voice_note or msg.content.sticker or msg.content.animation or msg.content.photo then
local anubis = Redis:get(FDFGERB.."Text:Manager:inline3am"..msg.sender_id.user_id..":")
if msg.content.text then 
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
Redis:set(FDFGERB.."Add:Rd:Manager:Text:inline3am"..anubis, text)
elseif msg.content.sticker then 
Redis:set(FDFGERB.."Add:Rd:Manager:Stekrs:inline3am"..anubis, msg.content.sticker.sticker.remote.id)
elseif msg.content.voice_note then
Redis:set(FDFGERB.."Add:Rd:Manager:Vico:inline3am"..anubis, msg.content.voice_note.voice.remote.id)
elseif msg.content.audio then
Redis:set(FDFGERB.."Add:Rd:Manager:Audio:inline3am"..anubis, msg.content.audio.audio.remote.id)
Redis:set(FDFGERB.."Add:Rd:Manager:Audioc:inline3am"..anubis, msg.content.caption.text)
elseif msg.content.document then
Redis:set(FDFGERB.."Add:Rd:Manager:File:inline3am"..anubis, msg.content.document.document.remote.id)
elseif msg.content.animation then
Redis:set(FDFGERB.."Add:Rd:Manager:Gif:inline3am"..anubis, msg.content.animation.animation.remote.id)
elseif msg.content.video_note then
Redis:set(FDFGERB.."Add:Rd:Manager:video_note:inline3am"..anubis, msg.content.video_note.video.remote.id)
elseif msg.content.video then
Redis:set(FDFGERB.."Add:Rd:Manager:Video:inline3am"..anubis, msg.content.video.video.remote.id)
Redis:set(FDFGERB.."Add:Rd:Manager:Videoc:inline3am"..anubis, msg.content.caption.text)
elseif msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
Redis:set(FDFGERB.."Add:Rd:Manager:Photo:inline3am"..anubis, idPhoto)
Redis:set(FDFGERB.."Add:Rd:Manager:Photoc:inline3am"..anubis, msg.content.caption.text)
end
LuaTele.sendText(msg_chat_id,msg_id,"• الان ارسل الكلام داخل الزر","md",true)
return false
end
end

if text and text:match("^(.*)$") then
if Redis:get(FDFGERB.."Set:Manager:rd:inline3am"..msg.sender_id.user_id..":"..msg_chat_id.."") == "true2" then
if not Redis:sismember(FDFGERB.."List:Manager:inline3am", text) then
 Redis:del(FDFGERB.."Set:Manager:rd:inline3am"..msg.sender_id.user_id..":"..msg_chat_id.."")
 return LuaTele.sendText(msg_chat_id,msg_id,"• لا يوجد رد لهذه الكلمه","md",true)
end
Redis:del(FDFGERB.."Add:Rd:Manager:Gif:inline3am"..text) 
Redis:del(FDFGERB.."Add:Rd:Manager:Vico:inline3am"..text) 
Redis:del(FDFGERB.."Add:Rd:Manager:Stekrs:inline3am"..text) 
Redis:del(FDFGERB.."Add:Rd:Manager:Text:inline3am"..text) 
Redis:del(FDFGERB.."Add:Rd:Manager:Photo:inline3am"..text)
Redis:del(FDFGERB.."Add:Rd:Manager:Photoc:inline3am"..text)
Redis:del(FDFGERB.."Add:Rd:Manager:Video:inline3am"..text)
Redis:del(FDFGERB.."Add:Rd:Manager:Videoc:inline3am"..text)
Redis:del(FDFGERB.."Add:Rd:Manager:File:inline3am"..text)
Redis:del(FDFGERB.."Add:Rd:Manager:video_note:inline3am"..text)
Redis:del(FDFGERB.."Add:Rd:Manager:Audio:inline3am"..text)
Redis:del(FDFGERB.."Add:Rd:Manager:Audioc:inline3am"..text)
Redis:del(FDFGERB.."Rd:Manager:inline3am:text"..text)
Redis:del(FDFGERB.."Rd:Manager:inline3am:link"..text)
Redis:del(FDFGERB.."Set:Manager:rd:inline3am"..msg.sender_id.user_id..":"..msg_chat_id.."")
Redis:srem(FDFGERB.."List:Manager:inline3am", text)
LuaTele.sendText(msg_chat_id,msg_id,"• تم حذف الرد من الردود الانلاين العامه","md",true)
return false
end
end
if text and text:match("^(.*)$") and tonumber(msg.sender_id.user_id) ~= tonumber(FDFGERB) then
if Redis:get(FDFGERB.."Set:Manager:rd:inline3am"..msg.sender_id.user_id..":"..msg_chat_id) == "true" then
Redis:set(FDFGERB.."Set:Manager:rd:inline3am"..msg.sender_id.user_id..":"..msg_chat_id,"true1")
Redis:set(FDFGERB.."Text:Manager:inline3am"..msg.sender_id.user_id..":", text)
Redis:del(FDFGERB.."Add:Rd:Manager:Gif:inline3am"..text) 
Redis:del(FDFGERB.."Add:Rd:Manager:Vico:inline3am"..text) 
Redis:del(FDFGERB.."Add:Rd:Manager:Stekrs:inline3am"..text) 
Redis:del(FDFGERB.."Add:Rd:Manager:Text:inline3am"..text) 
Redis:del(FDFGERB.."Add:Rd:Manager:Photo:inline3am"..text)
Redis:del(FDFGERB.."Add:Rd:Manager:Photoc:inline3am"..text)
Redis:del(FDFGERB.."Add:Rd:Manager:Video:inline3am"..text)
Redis:del(FDFGERB.."Add:Rd:Manager:Videoc:inline3am"..text)
Redis:del(FDFGERB.."Add:Rd:Manager:File:inline3am"..text)
Redis:del(FDFGERB.."Add:Rd:Manager:video_note:inline3am"..text)
Redis:del(FDFGERB.."Add:Rd:Manager:Audio:inline3am"..text)
Redis:del(FDFGERB.."Add:Rd:Manager:Audioc:inline3am"..text)
Redis:del(FDFGERB.."Rd:Manager:inline3am:text"..text)
Redis:del(FDFGERB.."Rd:Manager:inline3am:link"..text)
Redis:sadd(FDFGERB.."List:Manager:inline3am", text)
LuaTele.sendText(msg_chat_id,msg_id,[[
↯︙ارسل لي الرد سواء كان 
❨ ملف ، ملصق ، متحركه ، صوره
 ، فيديو ، بصمه الفيديو ، بصمه ، صوت ، رساله ❩
↯︙يمكنك اضافة الى النص •
ــــــــــــــــــــــ•ـــــــــــــــــــــ
 `#username` ↬ معرف المستخدم
 `#msgs` ↬ عدد الرسائل
 `#name` ↬ اسم المستخدم
 `#id` ↬ ايدي المستخدم
 `#stast` ↬ رتبة المستخدم
 `#edit` ↬ عدد التعديلات

]],"md",true)
return false
end
end
if text == "اضف رد انلاين عام" then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• هاذا الامر يخص { '..Controller_Num(1)..' } ',"md",true)
end
Redis:set(FDFGERB.."Set:Manager:rd:inline3am"..msg.sender_id.user_id..":"..msg_chat_id,true)
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = 'الغاء الامر', data = msg.sender_id.user_id..'/cancelrdd'},
},
}
}
return LuaTele.sendText(msg_chat_id,msg_id,"• ارسل الان الكلمه لاضافتها في الردود ","md",false, false, false, false, reply_markup)
end


if text and not Redis:get(FDFGERB.."Status:Reply:inline3am"..msg_chat_id) then
local btext = Redis:get(FDFGERB.."Rd:Manager:inline3am:text"..text)
local blink = Redis:get(FDFGERB.."Rd:Manager:inline3am:link"..text)
local anemi = Redis:get(FDFGERB.."Add:Rd:Manager:Gif:inline3am"..text) 
local veico = Redis:get(FDFGERB.."Add:Rd:Manager:Vico:inline3am"..text) 
local stekr = Redis:get(FDFGERB.."Add:Rd:Manager:Stekrs:inline3am"..text) 
local Texingt = Redis:get(FDFGERB.."Add:Rd:Manager:Text:inline3am"..text) 
local photo = Redis:get(FDFGERB.."Add:Rd:Manager:Photo:inline3am"..text)
local photoc = Redis:get(FDFGERB.."Add:Rd:Manager:Photoc:inline3am"..text)
local video = Redis:get(FDFGERB.."Add:Rd:Manager:Video:inline3am"..text)
local videoc = Redis:get(FDFGERB.."Add:Rd:Manager:Videoc:inline3am"..text)
local document = Redis:get(FDFGERB.."Add:Rd:Manager:File:inline3am"..text)
local audio = Redis:get(FDFGERB.."Add:Rd:Manager:Audio:inline3am"..text)
local audioc = Redis:get(FDFGERB.."Add:Rd:Manager:Audioc:inline3am"..text)
local video_note = Redis:get(FDFGERB.."Add:Rd:Manager:video_note:inline3am"..text)
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = btext , url = blink},
},
}
}
if Texingt then 
local UserInfo = LuaTele.getUser(msg.sender_id.user_id)
local NumMsg = Redis:get(FDFGERB..'Num:Message:User'..msg_chat_id..':'..msg.sender_id.user_id) or 0
local TotalMsg = Total_message(NumMsg) 
local Status_Gps = msg.Name_Controller
local NumMessageEdit = Redis:get(FDFGERB..'Num:Message:Edit'..msg_chat_id..msg.sender_id.user_id) or 0
local Texingt = Texingt:gsub('#username',(UserInfo.username or 'لا يوجد')) 
local Texingt = Texingt:gsub('#name',UserInfo.first_name)
local Texingt = Texingt:gsub('#id',msg.sender_id.user_id)
local Texingt = Texingt:gsub('#edit',NumMessageEdit)
local Texingt = Texingt:gsub('#msgs',NumMsg)
local Texingt = Texingt:gsub('#stast',Status_Gps)
LuaTele.sendText(msg_chat_id,msg_id,'['..Texingt..']',"md",false, false, false, false, reply_markup)
end
if video_note then
LuaTele.sendVideoNote(msg_chat_id, msg.id, video_note, nil, nil, nil, nil, nil, nil, nil, reply_markup)
end
if photo then
LuaTele.sendPhoto(msg.chat_id, msg.id, photo,photoc,"md", true, nil, nil, nil, nil, nil, nil, nil, nil, reply_markup )
end
if stekr then 
LuaTele.sendSticker(msg_chat_id, msg.id, stekr,nil,nil,nil,nil,nil,nil,nil,reply_markup)
end
if veico then 
LuaTele.sendVoiceNote(msg_chat_id, msg.id, veico, '', 'md',nil, nil, nil, nil, reply_markup)
end
if video then 
LuaTele.sendVideo(msg_chat_id, msg.id, video, videoc, "md", true, nil, nil, nil, nil, nil, nil, nil, nil, nil, reply_markup)
end
if anemi then 
LuaTele.sendAnimation(msg_chat_id,msg.id, anemi, '', 'md', nil, nil, nil, nil, nil, nil, nil, nil,reply_markup)
end
if document then
LuaTele.sendDocument(msg_chat_id, msg.id, document, '', 'md',nil, nil, nil, nil,nil, reply_markup)
end
if audio then
LuaTele.sendAudio(msg_chat_id, msg.id, audio, audioc, "md", nil, nil, nil, nil, nil, nil, nil, nil,reply_markup) 
end
end
if text == "حذف رد انلاين عام" then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• هاذا الامر يخص { '..Controller_Num(1)..' } ',"md",true)
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = 'الغاء الامر', data = msg.sender_id.user_id..'/cancelrdd'},
},
}
}
Redis:set(FDFGERB.."Set:Manager:rd:inline3am"..msg.sender_id.user_id..":"..msg_chat_id,"true2")
return LuaTele.sendText(msg_chat_id,msg_id,"• ارسل الان الكلمه لحذفها من الردود الانلاين","md",false, false, false, false, reply_markup)
end 

if text == ("الردود الانلاين العامه") then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• هاذا الامر يخص { '..Controller_Num(1)..' } ',"md",true)
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = 't.me/LDD7D'}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(FDFGERB.."List:Manager:inline3am")
text = "• قائمه الردود الانلاين \nــــــــــــــــــــــ•ـــــــــــــــــــــ\n"
for k,v in pairs(list) do
if Redis:get(FDFGERB.."Add:Rd:Manager:Gif:inline3am"..v) then
db = "متحركه •"
elseif Redis:get(FDFGERB.."Add:Rd:Manager:Vico:inline3am"..v) then
db = "بصمه •"
elseif Redis:get(FDFGERB.."Add:Rd:Manager:Stekrs:inline3am"..v) then
db = "ملصق •"
elseif Redis:get(FDFGERB.."Add:Rd:Manager:Text:inline3am"..v) then
db = "رساله •"
elseif Redis:get(FDFGERB.."Add:Rd:Manager:Photo:inline3am"..v) then
db = "صوره •"
elseif Redis:get(FDFGERB.."Add:Rd:Manager:Video:inline3am"..v) then
db = "فيديو •"
elseif Redis:get(FDFGERB.."Add:Rd:Manager:File:inline3am"..v) then
db = "ملف •"
elseif Redis:get(FDFGERB.."Add:Rd:Manager:Audio:inline3am"..v) then
db = "اغنيه •"
elseif Redis:get(FDFGERB.."Add:Rd:Manager:video_note:inline3am"..v) then
db = "بصمه فيديو •"
end
text = text..""..k.." → {"..v.."} → {"..db.."}\n"
end
if #list == 0 then
text = "• عذرا لا يوجد ردود انلاين عامه"
end
return LuaTele.sendText(msg_chat_id,msg_id,"["..text.."]","md",true)
end
if text == "حذف رد انلاين" then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = 't.me/LDD7D'}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = 'الغاء الامر', data = msg.sender_id.user_id..'/cancelrdd'},
},
}
}
Redis:set(FDFGERB.."Set:Manager:rd:inline"..msg.sender_id.user_id..":"..msg_chat_id,"true2")
return LuaTele.sendText(msg_chat_id,msg_id,"• حلو , الحين ارسل الكلمه لحذفها من الردود الانلاين","md",false, false, false, false, reply_markup)
end 
  if text and text:match("^(.*)$") then
  if Redis:get(FDFGERB.."Set:Manager:rd:inline"..msg.sender_id.user_id..":"..msg_chat_id.."") == "true2" then
Redis:del(FDFGERB.."Add:Rd:Manager:Gif:inline"..text..msg_chat_id)   
Redis:del(FDFGERB.."Add:Rd:Manager:Vico:inline"..text..msg_chat_id)   
Redis:del(FDFGERB.."Add:Rd:Manager:Stekrs:inline"..text..msg_chat_id) 
Redis:del(FDFGERB.."Add:Rd:Manager:Text:inline"..text..msg_chat_id)   
Redis:del(FDFGERB.."Add:Rd:Manager:Photo:inline"..text..msg_chat_id)
Redis:del(FDFGERB.."Add:Rd:Manager:Photoc:inline"..text..msg_chat_id)
Redis:del(FDFGERB.."Add:Rd:Manager:Video:inline"..text..msg_chat_id)
Redis:del(FDFGERB.."Add:Rd:Manager:Videoc:inline"..text..msg_chat_id)  
Redis:del(FDFGERB.."Add:Rd:Manager:File:inline"..text..msg_chat_id)
Redis:del(FDFGERB.."Add:Rd:Manager:video_note:inline"..text..msg_chat_id)
Redis:del(FDFGERB.."Add:Rd:Manager:Audio:inline"..text..msg_chat_id)
Redis:del(FDFGERB.."Add:Rd:Manager:Audioc:inline"..text..msg_chat_id)
Redis:del(FDFGERB.."Rd:Manager:inline:text"..text..msg_chat_id)
Redis:del(FDFGERB.."Rd:Manager:inline:link"..text..msg_chat_id)
  Redis:del(FDFGERB.."Set:Manager:rd:inline"..msg.sender_id.user_id..":"..msg_chat_id.."")
  Redis:srem(FDFGERB.."List:Manager:inline"..msg_chat_id.."", text)
  LuaTele.sendText(msg_chat_id,msg_id,"• ابشر حذفت الرد من الردود الانلاين ","md",true)  
  return false
  end
  end
  if text == ("مسح الردود الانلاين") then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【المدير】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = 't.me/LDD7D'}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(FDFGERB.."List:Manager:inline"..msg_chat_id.."")
for k,v in pairs(list) do
Redis:del(FDFGERB.."Add:Rd:Manager:Gif:inline"..v..msg_chat_id)   
Redis:del(FDFGERB.."Add:Rd:Manager:Vico:inline"..v..msg_chat_id)   
Redis:del(FDFGERB.."Add:Rd:Manager:Stekrs:inline"..v..msg_chat_id)     
Redis:del(FDFGERB.."Add:Rd:Manager:Text:inline"..v..msg_chat_id)   
Redis:del(FDFGERB.."Add:Rd:Manager:Photo:inline"..v..msg_chat_id)
Redis:del(FDFGERB.."Add:Rd:Manager:Photoc:inline"..v..msg_chat_id)
Redis:del(FDFGERB.."Add:Rd:Manager:Video:inline"..v..msg_chat_id)
Redis:del(FDFGERB.."Add:Rd:Manager:Videoc:inline"..v..msg_chat_id)  
Redis:del(FDFGERB.."Add:Rd:Manager:File:inline"..v..msg_chat_id)
Redis:del(FDFGERB.."Add:Rd:Manager:video_note:inline"..v..msg_chat_id)
Redis:del(FDFGERB.."Add:Rd:Manager:Audio:inline"..v..msg_chat_id)
Redis:del(FDFGERB.."Add:Rd:Manager:Audioc:inline"..v..msg_chat_id)
Redis:del(FDFGERB.."Rd:Manager:inline:v"..v..msg_chat_id)
Redis:del(FDFGERB.."Rd:Manager:inline:link"..v..msg_chat_id)
Redis:del(FDFGERB.."List:Manager:inline"..msg_chat_id)
end
return LuaTele.sendText(msg_chat_id,msg_id,"• تم مسح قائمه الانلاين","md",true)  
end
  if text == "اضف رد انلاين" then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
Redis:set(FDFGERB.."Set:Manager:rd:inline"..msg.sender_id.user_id..":"..msg_chat_id,true)
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '', data = msg.sender_id.user_id..'/cancelrdd'},
},
}
}
return LuaTele.sendText(msg_chat_id,msg_id,"• حلو , ارسل الرد الحين اكتب،الغاء الالغاء الامر ","md",false, false, false, false, reply_markup)
  end
  if text and text:match("^(.*)$") and tonumber(msg.sender_id.user_id) ~= tonumber(FDFGERB) then
if Redis:get(FDFGERB.."Set:Manager:rd:inline"..msg.sender_id.user_id..":"..msg_chat_id) == "true" then
Redis:set(FDFGERB.."Set:Manager:rd:inline"..msg.sender_id.user_id..":"..msg_chat_id,"true1")
Redis:set(FDFGERB.."Text:Manager:inline"..msg.sender_id.user_id..":"..msg_chat_id, text)
Redis:del(FDFGERB.."Add:Rd:Manager:Gif:inline"..text..msg_chat_id)   
Redis:del(FDFGERB.."Add:Rd:Manager:Vico:inline"..text..msg_chat_id)   
Redis:del(FDFGERB.."Add:Rd:Manager:Stekrs:inline"..text..msg_chat_id) 
Redis:del(FDFGERB.."Add:Rd:Manager:Text:inline"..text..msg_chat_id)   
Redis:del(FDFGERB.."Add:Rd:Manager:Photo:inline"..text..msg_chat_id)
Redis:del(FDFGERB.."Add:Rd:Manager:Photoc:inline"..text..msg_chat_id)
Redis:del(FDFGERB.."Add:Rd:Manager:Video:inline"..text..msg_chat_id)
Redis:del(FDFGERB.."Add:Rd:Manager:Videoc:inline"..text..msg_chat_id)  
Redis:del(FDFGERB.."Add:Rd:Manager:File:inline"..text..msg_chat_id)
Redis:del(FDFGERB.."Add:Rd:Manager:video_note:inline"..text..msg_chat_id)
Redis:del(FDFGERB.."Add:Rd:Manager:Audio:inline"..text..msg_chat_id)
Redis:del(FDFGERB.."Add:Rd:Manager:Audioc:inline"..text..msg_chat_id)
Redis:del(FDFGERB.."Rd:Manager:inline:text"..text..msg_chat_id)
Redis:del(FDFGERB.."Rd:Manager:inline:link"..text..msg_chat_id)
Redis:sadd(FDFGERB.."List:Manager:inline"..msg_chat_id.."", text)
LuaTele.sendText(msg_chat_id,msg_id,[[
• ارسل لي الرد سواء كان 
❨ ملف • ملصق • متحركه • صوره
 • فيديو • بصمه الفيديو • بصمه • صوت • رساله ❩
]],"md",true)  
return false
end
end
if Redis:get(FDFGERB.."Set:Manager:rd:inline"..msg.sender_id.user_id..":"..msg_chat_id) == "true1" and tonumber(msg.sender_id.user_id) ~= tonumber(FDFGERB) then
Redis:del(FDFGERB.."Set:Manager:rd:inline"..msg.sender_id.user_id..":"..msg_chat_id)
Redis:set(FDFGERB.."Set:Manager:rd:inline"..msg.sender_id.user_id..":"..msg_chat_id,"set_inline")
if text or msg.content.video_note or msg.content.document or msg.content.audio or msg.content.video or msg.content.voice_note or msg.content.sticker or msg.content.animation or msg.content.photo then
local anubis = Redis:get(FDFGERB.."Text:Manager:inline"..msg.sender_id.user_id..":"..msg_chat_id)
if msg.content.text then 
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
Redis:set(FDFGERB.."Add:Rd:Manager:Text:inline"..anubis..msg_chat_id, text)
elseif msg.content.sticker then 
Redis:set(FDFGERB.."Add:Rd:Manager:Stekrs:inline"..anubis..msg_chat_id, msg.content.sticker.sticker.remote.id)  
elseif msg.content.voice_note then
Redis:set(FDFGERB.."Add:Rd:Manager:Vico:inline"..anubis..msg_chat_id, msg.content.voice_note.voice.remote.id)
elseif msg.content.audio then
Redis:set(FDFGERB.."Add:Rd:Manager:Audio:inline"..anubis..msg_chat_id, msg.content.audio.audio.remote.id)
Redis:set(FDFGERB.."Add:Rd:Manager:Audioc:inline"..anubis..msg_chat_id, msg.content.caption.text)
elseif msg.content.document then
Redis:set(FDFGERB.."Add:Rd:Manager:File:inline"..anubis..msg_chat_id, msg.content.document.document.remote.id)
elseif msg.content.animation then
Redis:set(FDFGERB.."Add:Rd:Manager:Gif:inline"..anubis..msg_chat_id, msg.content.animation.animation.remote.id)
elseif msg.content.video_note then
Redis:set(FDFGERB.."Add:Rd:Manager:video_note:inline"..anubis..msg_chat_id, msg.content.video_note.video.remote.id)
elseif msg.content.video then
Redis:set(FDFGERB.."Add:Rd:Manager:Video:inline"..anubis..msg_chat_id, msg.content.video.video.remote.id)
Redis:set(FDFGERB.."Add:Rd:Manager:Videoc:inline"..anubis..msg_chat_id, msg.content.caption.text)
elseif msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
Redis:set(FDFGERB.."Add:Rd:Manager:Photo:inline"..anubis..msg_chat_id, idPhoto)
Redis:set(FDFGERB.."Add:Rd:Manager:Photoc:inline"..anubis..msg_chat_id, msg.content.caption.text)
end
LuaTele.sendText(msg_chat_id,msg_id,"• حلو , ارسل الكلام اللي داخل الزر","md",true)
return false
end
end
if text and Redis:get(FDFGERB.."Set:Manager:rd:inline"..msg.sender_id.user_id..":"..msg_chat_id) == "set_inline" then
Redis:set(FDFGERB.."Set:Manager:rd:inline"..msg.sender_id.user_id..":"..msg_chat_id, "set_link")
local anubis = Redis:get(FDFGERB.."Text:Manager:inline"..msg.sender_id.user_id..":"..msg_chat_id)
Redis:set(FDFGERB.."Rd:Manager:inline:text"..anubis..msg_chat_id, text)
LuaTele.sendText(msg_chat_id,msg_id,"• حلو , الحين ارسل الرابط","md",true)
return false
end
if text and Redis:get(FDFGERB.."Set:Manager:rd:inline"..msg.sender_id.user_id..":"..msg_chat_id) == "set_link" then
Redis:del(FDFGERB.."Set:Manager:rd:inline"..msg.sender_id.user_id..":"..msg_chat_id)
local anubis = Redis:get(FDFGERB.."Text:Manager:inline"..msg.sender_id.user_id..":"..msg_chat_id)
Redis:set(FDFGERB.."Rd:Manager:inline:link"..anubis..msg_chat_id, text)
LuaTele.sendText(msg_chat_id,msg_id,"• تم اضافه الرد بنجاح","md",true)
return false
end
if text and not Redis:get(FDFGERB.."Status:Reply:inline"..msg_chat_id) then
local btext = Redis:get(FDFGERB.."Rd:Manager:inline:text"..text..msg_chat_id)
local blink = Redis:get(FDFGERB.."Rd:Manager:inline:link"..text..msg_chat_id)
local anemi = Redis:get(FDFGERB.."Add:Rd:Manager:Gif:inline"..text..msg_chat_id) 
local veico = Redis:get(FDFGERB.."Add:Rd:Manager:Vico:inline"..text..msg_chat_id) 
local stekr = Redis:get(FDFGERB.."Add:Rd:Manager:Stekrs:inline"..text..msg_chat_id) 
local Texingt = Redis:get(FDFGERB.."Add:Rd:Manager:Text:inline"..text..msg_chat_id) 
local photo = Redis:get(FDFGERB.."Add:Rd:Manager:Photo:inline"..text..msg_chat_id)
local photoc = Redis:get(FDFGERB.."Add:Rd:Manager:Photoc:inline"..text..msg_chat_id)
local video = Redis:get(FDFGERB.."Add:Rd:Manager:Video:inline"..text..msg_chat_id)
local videoc = Redis:get(FDFGERB.."Add:Rd:Manager:Videoc:inline"..text..msg_chat_id)
local document = Redis:get(FDFGERB.."Add:Rd:Manager:File:inline"..text..msg_chat_id)
local audio = Redis:get(FDFGERB.."Add:Rd:Manager:Audio:inline"..text..msg_chat_id)
local audioc = Redis:get(FDFGERB.."Add:Rd:Manager:Audioc:inline"..text..msg_chat_id)
local video_note = Redis:get(FDFGERB.."Add:Rd:Manager:video_note:inline"..text..msg_chat_id)
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = btext , url = blink},
},
}
}
if Texingt then 
local UserInfo = LuaTele.getUser(msg.sender_id.user_id)
local NumMsg = Redis:get(FDFGERB..'Num:Message:User'..msg_chat_id..':'..msg.sender_id.user_id) or 0
local TotalMsg = Total_message(NumMsg) 
local Status_Gps = msg.Name_Controller
local NumMessageEdit = Redis:get(FDFGERB..'Num:Message:Edit'..msg_chat_id..msg.sender_id.user_id) or 0
local Texingt = Texingt:gsub('#username',(UserInfo.username or 'لا يوجد')) 
local Texingt = Texingt:gsub('#name',UserInfo.first_name)
local Texingt = Texingt:gsub('#id',msg.sender_id.user_id)
local Texingt = Texingt:gsub('#edit',NumMessageEdit)
local Texingt = Texingt:gsub('#msgs',NumMsg)
local Texingt = Texingt:gsub('#stast',Status_Gps)
LuaTele.sendText(msg_chat_id,msg_id,'['..Texingt..']',"md",false, false, false, false, reply_markup)
end
if video_note then
LuaTele.sendVideoNote(msg_chat_id, msg.id, video_note, nil, nil, nil, nil, nil, nil, nil, reply_markup)
end
if photo then
LuaTele.sendPhoto(msg.chat_id, msg.id, photo,photoc,"md", true, nil, nil, nil, nil, nil, nil, nil, nil, reply_markup )
end
if stekr then 
LuaTele.sendSticker(msg_chat_id, msg.id, stekr,nil,nil,nil,nil,nil,nil,nil,reply_markup)
end
if veico then 
LuaTele.sendVoiceNote(msg_chat_id, msg.id, veico, '', 'md',nil, nil, nil, nil, reply_markup)
end
if video then 
LuaTele.sendVideo(msg_chat_id, msg.id, video, videoc, "md", true, nil, nil, nil, nil, nil, nil, nil, nil, nil, reply_markup)
end
if anemi then 
LuaTele.sendAnimation(msg_chat_id,msg.id, anemi, '', 'md', nil, nil, nil, nil, nil, nil, nil, nil,reply_markup)
end
if document then
LuaTele.sendDocument(msg_chat_id, msg.id, document, '', 'md',nil, nil, nil, nil,nil, reply_markup)
end
if audio then
LuaTele.sendAudio(msg_chat_id, msg.id, audio, audioc, "md", nil, nil, nil, nil, nil, nil, nil, nil,reply_markup) 
end
end
if text == ("الردود الانلاين") then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• هاذا الامر يخص  '..Controller_Num(6)..'  ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = 't.me/LDD7D'}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(FDFGERB.."List:Manager:inline"..msg_chat_id.."")
text = "• قائمه الردود الانلاين \n━━━━━\n"
for k,v in pairs(list) do
if Redis:get(FDFGERB.."Add:Rd:Manager:Gif:inline"..v..msg_chat_id) then
db = "متحركه •"
elseif Redis:get(FDFGERB.."Add:Rd:Manager:Vico:inline"..v..msg_chat_id) then
db = "بصمه •"
elseif Redis:get(FDFGERB.."Add:Rd:Manager:Stekrs:inline"..v..msg_chat_id) then
db = "ملصق •"
elseif Redis:get(FDFGERB.."Add:Rd:Manager:Text:inline"..v..msg_chat_id) then
db = "رساله •"
elseif Redis:get(FDFGERB.."Add:Rd:Manager:Photo:inline"..v..msg_chat_id) then
db = "صوره •"
elseif Redis:get(FDFGERB.."Add:Rd:Manager:Video:inline"..v..msg_chat_id) then
db = "فيديو •"
elseif Redis:get(FDFGERB.."Add:Rd:Manager:File:inline"..v..msg_chat_id) then
db = "ملف •"
elseif Redis:get(FDFGERB.."Add:Rd:Manager:Audio:inline"..v..msg_chat_id) then
db = "اغنيه •"
elseif Redis:get(FDFGERB.."Add:Rd:Manager:video_note:inline"..v..msg_chat_id) then
db = "بصمه فيديو •"
end
text = text..""..k.." » {"..v.."} » {"..db.."}\n"
end
if #list == 0 then
text = "• مافيه ردود انلاين"
end
return LuaTele.sendText(msg_chat_id,msg_id,"["..text.."]","md",true)  
end


if text == ("مسح الردود") then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【المدير】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(FDFGERB.."FDFGERB:List:Manager"..msg_chat_id.."")
for k,v in pairs(list) do
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Manager:Gif"..v..msg_chat_id)   
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Manager:Vico"..v..msg_chat_id)   
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Manager:Stekrs"..v..msg_chat_id) 
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Manager:Text"..v..msg_chat_id)   
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Manager:Photo"..v..msg_chat_id)
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Manager:Video"..v..msg_chat_id)
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Manager:File"..v..msg_chat_id)
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Manager:video_note"..v..msg_chat_id)
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Manager:Audio"..v..msg_chat_id)
Redis:del(FDFGERB.."FDFGERB:List:Manager"..msg_chat_id)
end
return LuaTele.sendText(msg_chat_id,msg_id,"• تم مسح قائمه الردود","md",true)  
end
if text == ("الردود") then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【المدير】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(FDFGERB.."FDFGERB:List:Manager"..msg_chat_id.."")
text = "• قائمه الردود \n━━━━━\n"
for k,v in pairs(list) do
if Redis:get(FDFGERB.."FDFGERB:Add:Rd:Manager:Gif"..v..msg_chat_id) then
db = "متحركه 🎭"
elseif Redis:get(FDFGERB.."FDFGERB:Add:Rd:Manager:Vico"..v..msg_chat_id) then
db = "بصمه 📢"
elseif Redis:get(FDFGERB.."FDFGERB:Add:Rd:Manager:Stekrs"..v..msg_chat_id) then
db = "ملصق 🃏"
elseif Redis:get(FDFGERB.."FDFGERB:Add:Rd:Manager:Text"..v..msg_chat_id) then
db = "رساله ✉"
elseif Redis:get(FDFGERB.."FDFGERB:Add:Rd:Manager:Photo"..v..msg_chat_id) then
db = "صوره 🎇"
elseif Redis:get(FDFGERB.."FDFGERB:Add:Rd:Manager:Video"..v..msg_chat_id) then
db = "فيديو 📹"
elseif Redis:get(FDFGERB.."FDFGERB:Add:Rd:Manager:File"..v..msg_chat_id) then
db = "ملف • "
elseif Redis:get(FDFGERB.."FDFGERB:Add:Rd:Manager:Audio"..v..msg_chat_id) then
db = "اغنيه 🎵"
elseif Redis:get(FDFGERB.."FDFGERB:Add:Rd:Manager:video_note"..v..msg_chat_id) then
db = "بصمه فيديو 🎥"
end
text = text..""..k.." » ( "..v.." ) » ( "..db.." )\n"
end
if #list == 0 then
text = "• عذرا لا يوجد ردود للمدير في المجموعه"
end
return LuaTele.sendText(msg_chat_id,msg_id,""..text.."","md",true)  
end
if text == "اضف رد" then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Set:Manager:rd"..msg.sender_id.user_id..":"..msg_chat_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,"• ارسل الان الكلمه لاضافتها في الردود ","md",true)  
end
if text == "حذف رد" then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Set:Manager:rd"..msg.sender_id.user_id..":"..msg_chat_id,"true2")
return LuaTele.sendText(msg_chat_id,msg_id,"• ارسل الان الكلمه لحذفها من الردود","md",true)  
end
if text == ("مسح الردود العامه") then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(FDFGERB.."FDFGERB:List:Rd:Sudo")
for k,v in pairs(list) do
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Sudo:Gif"..v)   
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Sudo:vico"..v)   
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Sudo:stekr"..v)     
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Sudo:Text"..v)   
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Sudo:Photo"..v)
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Sudo:Video"..v)
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Sudo:File"..v)
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Sudo:Audio"..v)
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Sudo:video_note"..v)
Redis:del(FDFGERB.."FDFGERB:List:Rd:Sudo")
end
return LuaTele.sendText(msg_chat_id,msg_id,"• تم حذف الردود العامه","md",true)  
end
if text == ("الردود العامه") then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(FDFGERB.."FDFGERB:List:Rd:Sudo")
text = "\n📝|قائمه الردود العامه \n━━━━━\n"
for k,v in pairs(list) do
if Redis:get(FDFGERB.."FDFGERB:Add:Rd:Sudo:Gif"..v) then
db = "متحركه 🎭"
elseif Redis:get(FDFGERB.."FDFGERB:Add:Rd:Sudo:vico"..v) then
db = "بصمه 📢"
elseif Redis:get(FDFGERB.."FDFGERB:Add:Rd:Sudo:stekr"..v) then
db = "ملصق 🃏"
elseif Redis:get(FDFGERB.."FDFGERB:Add:Rd:Sudo:Text"..v) then
db = "رساله ✉"
elseif Redis:get(FDFGERB.."FDFGERB:Add:Rd:Sudo:Photo"..v) then
db = "صوره 🎇"
elseif Redis:get(FDFGERB.."FDFGERB:Add:Rd:Sudo:Video"..v) then
db = "فيديو 📹"
elseif Redis:get(FDFGERB.."FDFGERB:Add:Rd:Sudo:File"..v) then
db = "ملف • "
elseif Redis:get(FDFGERB.."FDFGERB:Add:Rd:Sudo:Audio"..v) then
db = "اغنيه 🎵"
elseif Redis:get(FDFGERB.."FDFGERB:Add:Rd:Sudo:video_note"..v) then
db = "بصمه فيديو 🎥"
end
text = text..""..k.." » ( "..v.." ) » ( "..db.." )\n"
end
if #list == 0 then
text = "• لا توجد الردود العامه"
end
return LuaTele.sendText(msg_chat_id,msg_id,""..text.."","md",true)  
end
if text == "اضف رد عام" then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Set:Rd"..msg.sender_id.user_id..":"..msg_chat_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,"• ارسل الان الكلمه لاضافتها في الردود العامه ","md",true)  
end
if text == "حذف رد عام" then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Set:On"..msg.sender_id.user_id..":"..msg_chat_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,"• ارسل الان الكلمه لحذفها من الردود العامه","md",true)  
end
if text=="اذاعه خاص" then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:setex(FDFGERB.."FDFGERB:Broadcasting:Users" .. msg_chat_id .. ":" .. msg.sender_id.user_id, 600, true) 
LuaTele.sendText(msg_chat_id,msg_id,[[
 • ارسل كليشه الاذاعه 
• الالغاء الامر ارسل (الغاء،الغاء الامر)
]],"md",true)  
return false
end

if text=="اذاعه" then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:setex(FDFGERB.."FDFGERB:Broadcasting:Groups" .. msg_chat_id .. ":" .. msg.sender_id.user_id, 600, true) 
LuaTele.sendText(msg_chat_id,msg_id,[[
 • ارسل كليشه الاذاعه 
• الالغاء الامر ارسل (الغاء،الغاء الامر)
]],"md",true)  
return false
end

if text=="اذاعه بالتثبيت" then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:setex(FDFGERB.."FDFGERB:Broadcasting:Groups:Pin" .. msg_chat_id .. ":" .. msg.sender_id.user_id, 600, true) 
LuaTele.sendText(msg_chat_id,msg_id,[[
 • ارسل كليشه الاذاعه 
• الالغاء الامر ارسل (الغاء،الغاء الامر)
]],"md",true)  
return false
end

if text=="اذاعه بالتوجيه" then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:setex(FDFGERB.."FDFGERB:Broadcasting:Groups:Fwd" .. msg_chat_id .. ":" .. msg.sender_id.user_id, 600, true) 
LuaTele.sendText(msg_chat_id,msg_id,"• ارسل لي التوجيه الان\n• ليتم نشره في المجموعات","md",true)  
return false
end

if text=="اذاعه خاص بالتوجيه" then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:setex(FDFGERB.."FDFGERB:Broadcasting:Users:Fwd" .. msg_chat_id .. ":" .. msg.sender_id.user_id, 600, true) 
LuaTele.sendText(msg_chat_id,msg_id,"• ارسل لي التوجيه الان\n• ليتم نشره الى المشتركين","md",true)  
return false
end
if text == 'كشف القيود' and msg.reply_to_message_id ~= 0 then
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender_id.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ما يمديك تستعمل الامر ع بوت يغبي  ","md",true)  
end
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• اعطيني صلاحيات كامله ي غبي ","md",true)  
end
local GetMemberStatus = LuaTele.getChatMember(msg_chat_id,Message_Reply.sender_id.user_id).status
if GetMemberStatus.luatele == "chatMemberStatusRestricted" then
Restricted = 'مقيد'
else
Restricted = 'غير مقيد'
end
if Statusrestricted(msg_chat_id,Message_Reply.sender_id.user_id).BanAll == true then
BanAll = 'محظور عام'
else
BanAll = 'غير محظور عام'
end
if Statusrestricted(msg_chat_id,Message_Reply.sender_id.user_id).BanGroup == true then
BanGroup = 'محظور'
else
BanGroup = 'غير محظور'
end
if Statusrestricted(msg_chat_id,Message_Reply.sender_id.user_id).SilentGroup == true then
SilentGroup = 'مكتوم'
else
SilentGroup = 'غير مكتوم'
end
LuaTele.sendText(msg_chat_id,msg_id,"\n• معلومات الكشف \n━━━━━"..'\n• الحظر العام : '..BanAll..'\n• الحظر : '..BanGroup..'\n• الكتم : '..SilentGroup..'\n• التقييد : '..Restricted..'',"md",true)  
end
if text and text:match('^كشف القيود @(%S+)$') then
local UserName = text:match('^كشف القيود @(%S+)$')
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• اعطيني صلاحيات كامله ي غبي ","md",true)  
end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• مافيه حساب بهذا اليوزر ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ما يمديك تستعمل الامر ع قناه او قروب !! ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ما يمديك تستعمل الامر ع بوت يغبي ","md",true)  
end
local GetMemberStatus = LuaTele.getChatMember(msg_chat_id,UserId_Info.id).status
if GetMemberStatus.luatele == "chatMemberStatusRestricted" then
Restricted = 'مقيد'
else
Restricted = 'غير مقيد'
end
if Statusrestricted(msg_chat_id,UserId_Info.id).BanAll == true then
BanAll = 'محظور عام'
else
BanAll = 'غير محظور عام'
end
if Statusrestricted(msg_chat_id,UserId_Info.id).BanGroup == true then
BanGroup = 'محظور'
else
BanGroup = 'غير محظور'
end
if Statusrestricted(msg_chat_id,UserId_Info.id).SilentGroup == true then
SilentGroup = 'مكتوم'
else
SilentGroup = 'غير مكتوم'
end
LuaTele.sendText(msg_chat_id,msg_id,"\n• معلومات الكشف \n━━━━━"..'\n• الحظر العام : '..BanAll..'\n• الحظر : '..BanGroup..'\n• الكتم : '..SilentGroup..'\n• التقييد : '..Restricted..'',"md",true)  
end
if text == 'رفع القيود' and msg.reply_to_message_id ~= 0 then
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender_id.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ما يمديك تستعمل الامر ع بوت يغبي  ","md",true)  
end
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• اعطيني صلاحيات كامله ي غبي ","md",true)  
end
local GetMemberStatus = LuaTele.getChatMember(msg_chat_id,Message_Reply.sender_id.user_id).status
if GetMemberStatus.luatele == "chatMemberStatusRestricted" then
Restricted = 'مقيد'
LuaTele.setChatMemberStatus(msg.chat_id,Message_Reply.sender_id.user_id,'restricted',{1,1,1,1,1,1,1,1})
else
Restricted = ''
end
if Statusrestricted(msg_chat_id,Message_Reply.sender_id.user_id).kkytmAll == true and msg.ControllerBot then
kkytmAll = 'مكتوم عام ,'
Redis:srem(FDFGERB.."FDFGERB:kkytmAll:Groups",Message_Reply.sender_id.user_id) 
else
kkytmAll = ''
end
if Statusrestricted(msg_chat_id,Message_Reply.sender_id.user_id).BanAll == true and msg.ControllerBot then
BanAll = 'محظور عام ,'
Redis:srem(FDFGERB.."FDFGERB:BanAll:Groups",Message_Reply.sender_id.user_id) 
else
BanAll = ''
end
if Statusrestricted(msg_chat_id,Message_Reply.sender_id.user_id).BanGroup == true then
BanGroup = 'محظور ,'
Redis:srem(FDFGERB.."FDFGERB:BanGroup:Group"..msg_chat_id,Message_Reply.sender_id.user_id) 
else
BanGroup = ''
end
if Statusrestricted(msg_chat_id,Message_Reply.sender_id.user_id).SilentGroup == true then
SilentGroup = 'مكتوم ,'
Redis:srem(FDFGERB.."FDFGERB:SilentGroup:Group"..msg_chat_id,Message_Reply.sender_id.user_id) 
else
SilentGroup = ''
end
LuaTele.sendText(msg_chat_id,msg_id,"\n• رفعت عنه القيود :【"..BanAll..BanGroup..SilentGroup..Restricted..'】',"md",true)  
end
if text and text:match('^رفع القيود @(%S+)$') then
local UserName = text:match('^رفع القيود @(%S+)$')
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• اعطيني صلاحيات كامله ي غبي ","md",true)  
end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• مافيه حساب بهذا اليوزر ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ما يمديك تستعمل الامر ع قناه او قروب !! ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ما يمديك تستعمل الامر ع بوت يغبي ","md",true)  
end
local GetMemberStatus = LuaTele.getChatMember(msg_chat_id,UserId_Info.id).status
if GetMemberStatus.luatele == "chatMemberStatusRestricted" then
Restricted = 'مقيد'
LuaTele.setChatMemberStatus(msg.chat_id,UserId_Info.id,'restricted',{1,1,1,1,1,1,1,1})
else
Restricted = ''
end
if Statusrestricted(msg_chat_id,UserId_Info.id).kkytmAll == true and msg.ControllerBot then
kkytmAll = 'مكتوم عام ,'
Redis:srem(FDFGERB.."FDFGERB:kkytmAll:Groups",UserId_Info.id) 
else
kkytmAll = ''
end
if Statusrestricted(msg_chat_id,UserId_Info.id).BanAll == true and msg.ControllerBot then
BanAll = 'محظور عام ,'
Redis:srem(FDFGERB.."FDFGERB:BanAll:Groups",UserId_Info.id) 
else
BanAll = ''
end
if Statusrestricted(msg_chat_id,UserId_Info.id).BanGroup == true then
BanGroup = 'محظور ,'
Redis:srem(FDFGERB.."FDFGERB:BanGroup:Group"..msg_chat_id,UserId_Info.id) 
else
BanGroup = ''
end
if Statusrestricted(msg_chat_id,UserId_Info.id).SilentGroup == true then
SilentGroup = 'مكتوم ,'
Redis:srem(FDFGERB.."FDFGERB:SilentGroup:Group"..msg_chat_id,UserId_Info.id) 
else
SilentGroup = ''
end
LuaTele.sendText(msg_chat_id,msg_id,"\n• رفعت عنه القيود : ( "..BanAll..BanGroup..SilentGroup..Restricted..'}',"md",true)  
end

if text == 'وضع كليشه المطور' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB..'FDFGERB:GetTexting:DevFDFGERB'..msg_chat_id..':'..msg.sender_id.user_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,'• ارسل لي الكليشه الان')
end
if text == 'مسح كليشة المطور' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB..'FDFGERB:Texting:DevFDFGERB')
return LuaTele.sendText(msg_chat_id,msg_id,'• تم حذف كليشه المطور')
end
if text == "همسه" or text == "بوت همسه" or text == "كيف اهمس" then
LuaTele.sendText(msg.chat_id,msg.id,[[
• اهلا بك عزيزي                              
• لارسال الهمسه اكتب يوزر البوت و الهمسه و يوزر الشخص    
• مثال `@p7gbot احبك @EE3WW`                      
]],"md",true)  
return
end
if text == 'مطور السورس'  then  
local UserId_Info = LuaTele.searchPublicChat("ee3ww")
if UserId_Info.id then
local UserInfo = LuaTele.getUser(UserId_Info.id)
local InfoUser = LuaTele.getUserFullInfo(UserId_Info.id)
if InfoUser.bio then
Bio = InfoUser.bio
else
Bio = ''
end
local photo = LuaTele.getUserProfilePhotos(UserId_Info.id)
if photo.total_count > 0 then
local TestText = "  ❲ 𝖲𝗈𝗎𝗋𝖼𝖾 ⁦ ❳\n— — — — — — — — —\n• Name ⇢  ["..UserInfo.first_name.."](tg://user?id="..UserId_Info.id..")\n• Bio ⇢ [❲ "..Bio.." ❳]"
keyboardd = {} 
keyboardd.inline_keyboard = {
{
{text = '❲ Crown  ❳', url = "https://t.me/EE3WW"},
},
}
local msg_id = msg.id/2097152/0.5 
return https.request("https://api.telegram.org/bot"..Token..'/sendPhoto?chat_id='..msg.chat_id..'&caption='..URL.escape(TestText)..'&photo='..photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id..'&reply_to_message_id='..msg_id..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboardd))
else
local TestText = "• معلومات مبرمج السورس : \\nn: name Dev . ["..UserInfo.first_name.."](tg://user?id="..UserId_Info.id..")\n\n ["..Bio.."]"
keyboardd = {} 
keyboardd.inline_keyboard = {
{
{text = '❲ Crown  ❳', url = "https://t.me/EE3WW"},
},
}
local msg_id = msg.id/2097152/0.5 
return https.request("https://api.telegram.org/bot"..Token..'/sendMessage?chat_id=' .. msg.chat_id .. '&text=' .. URL.escape(TestText).."&reply_to_message_id="..msg_id..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboardd))
end
end
end
if text == "اهمسلي" then
if not Redis:get(FDFGERB.."FDFGERB:Status:Entert"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id," • تم تعطيل التسليه من قبل المدراء","md",true)  
end
local UserInfo = LuaTele.getUser(msg.sender_id.user_id)
local Text_inline = "- الهمسة إلى ( "..UserInfo.first_name.." ) هو من يستطيع فتحها "
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- فتح الهَمسة', data = msg.sender_id.user_id..'/showwhisper'},
},
}
}
return LuaTele.sendText(msg.chat_id,msg.id,Text_inline,"md",false, false, false, false, reply_markup)
end

if text == 'جمالي' or text == 'نسبه جمالي' then
if not Redis:get(FDFGERB.."FDFGERB:Status:Entert"..msg_chat_id) then
return false
end
local ban = LuaTele.getUser(msg.sender_id.user_id)
local photo = LuaTele.getUserProfilePhotos(msg.sender_id.user_id)
local nspp = {"10","20","30","35","75","34","66","82","23","19","55","80","63","32","27","89","99","98","79","100","8","3","6","0",}
local rdbhoto = nspp[math.random(#nspp)]
if photo.total_count > 0 then
data = {} 
data.inline_keyboard = {
{
{text =' نسبه جمالك ⇠ '..rdbhoto..'',url = "https://t.me/"..ban.username..""}, 
},
}
local msgg = msg_id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id=" .. msg_chat_id .. "&photo="..photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id.."&photo=".. URL.escape(rdbhoto).."&reply_to_message_id="..msgg.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(data))
end
end
if text == 'انوثتي' or text == 'نسبه انوثتي' then
if not Redis:get(FDFGERB.."FDFGERB:Status:Entert"..msg_chat_id) then
return false
end
local ban = LuaTele.getUser(msg.sender_id.user_id)
local photo = LuaTele.getUserProfilePhotos(msg.sender_id.user_id)
local nspp = {"10","20","30","35","75","34","66","82","23","19","55","80","63","32","27","89","99","98","79","100","8","3","6","0",}
local rdbhoto = nspp[math.random(#nspp)]
if photo.total_count > 0 then
data = {} 
data.inline_keyboard = {
{
{text =' نسبه انوثتك ⇠ '..rdbhoto..'',url = "https://t.me/"..ban.username..""}, 
},
}
local msgg = msg_id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id=" .. msg_chat_id .. "&photo="..photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id.."&photo=".. URL.escape(rdbhoto).."&reply_to_message_id="..msgg.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(data))
end
end
if text == 'رجولتي' or text == 'نسبه رجولتي' then
if not Redis:get(FDFGERB.."FDFGERB:Status:Entert"..msg_chat_id) then
return false
end
local ban = LuaTele.getUser(msg.sender_id.user_id)
local photo = LuaTele.getUserProfilePhotos(msg.sender_id.user_id)
local nspp = {"10","20","30","35","75","34","66","82","23","19","55","80","63","32","27","89","99","98","79","100","8","3","6","0",}
local rdbhoto = nspp[math.random(#nspp)]
if photo.total_count > 0 then
data = {} 
data.inline_keyboard = {
{
{text =' نسبه رجولتك ⇠ '..rdbhoto..'',url = "https://t.me/"..ban.username..""}, 
},
}
local msgg = msg_id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id=" .. msg_chat_id .. "&photo="..photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id.."&photo=".. URL.escape(rdbhoto).."&reply_to_message_id="..msgg.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(data))
end
end
if text == "نسبه الحب" or text == "نسبه حب" then
if not Redis:get(FDFGERB.."FDFGERB:Status:Entert"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id," • تم تعطيل التسليه من قبل المدراء","md",true)  
end
Redis:set(FDFGERB.."FDFGERB:Love"..msg.sender_id.user_id..":"..msg_chat_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,"• حلو اسم الشخص الاول والثاني ","md",false, false, false, false, reply_markup)
end
if text and text:match("^(.*)$") then
Redis:set(FDFGERB.."FDFGERB:Text:Manager"..msg.sender_id.user_id..":"..msg_chat_id, text)
if Redis:get(FDFGERB.."FDFGERB:Love"..msg.sender_id.user_id..":"..msg_chat_id) == "true" then
Redis:set(FDFGERB.."FDFGERB:Love"..msg.sender_id.user_id..":"..msg_chat_id,"true1")
local Love = math.random(1,100);
return LuaTele.sendText(msg_chat_id,msg_id,"الحب بين "..text.." "..Love.."% بس","md",true)
end
end
if text == "نسبه الكراهيه" or text == "نسبه كراهيه" then
if not Redis:get(FDFGERB.."FDFGERB:Status:Entert"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id," • تم تعطيل التسليه من قبل المدراء","md",true)  
end
Redis:set(FDFGERB.."FDFGERB:karahi"..msg.sender_id.user_id..":"..msg_chat_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,"• حلو اسم الشخص الاول والثاني ","md",false, false, false, false, reply_markup)
end
if text and text:match("^(.*)$") then
Redis:set(FDFGERB.."FDFGERB:Text:Manager"..msg.sender_id.user_id..":"..msg_chat_id, text)
if Redis:get(FDFGERB.."FDFGERB:karahi"..msg.sender_id.user_id..":"..msg_chat_id) == "true" then
Redis:set(FDFGERB.."FDFGERB:karahi"..msg.sender_id.user_id..":"..msg_chat_id,"true1")
local karahi = math.random(1,100);
return LuaTele.sendText(msg_chat_id,msg_id,"الكراهيه بين "..text.." "..karahi.."% بس","md",true)
end
end
if text == "صورتي" or text == "افتاري"  then
if Redis:get(FDFGERB.."FDFGERB:Status:photo"..msg.chat_id) then
local photo = LuaTele.getUserProfilePhotos(msg.sender_id.user_id)
local ban = LuaTele.getUser(msg.sender_id.user_id)
local ban_ns = 'افتارك'
if photo.total_count > 0 then
data = {} 
data.inline_keyboard = {
{
{text = '', callback_data = msg.sender_id.user_id..'/delAmr'}, 
},
{
{text = 'تغيير الافتار', callback_data= msg.sender_id.user_id..'/ban1'}, 
},
}
local msgg = msg_id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id=" .. msg_chat_id .. "&photo="..photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id.."&caption=".. URL.escape(ban_ns).."&reply_to_message_id="..msgg.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(data))
end
end
end
if text == "تحويل" and msg.reply_to_message_id ~= 0 then
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
if Message_Reply.content.photo then
local File_Id = Message_Reply.content.photo.sizes[1].photo.remote.id
local File = json:decode(https.request('https://api.telegram.org/bot'..Token..'/getfile?file_id='..File_Id)) 
local download_ = download('https://api.telegram.org/file/bot'..Token..'/'..File.result.file_path,msg.sender_id.user_id..'.webp') 
LuaTele.sendSticker(msg_chat_id, msg.id, './'..msg.sender_id.user_id..'.webp') 
os.execute('rm -rf ./'..msg.sender_id.user_id..'.webp') 
end
end
if text == "تحويل" and msg.reply_to_message_id ~= 0 then
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
if Message_Reply.content.sticker then
local File_Id = Message_Reply.content.sticker.sticker.remote.id
local File = json:decode(https.request('https://api.telegram.org/bot'..Token..'/getfile?file_id='..File_Id)) 
local download_ = download('https://api.telegram.org/file/bot'..Token..'/'..File.result.file_path,msg.sender_id.user_id..'.jpg') 
LuaTele.sendPhoto(msg_chat_id, msg.id, './'..msg.sender_id.user_id..'.jpg','',"md") 
os.execute('rm -rf ./'..msg.sender_id.user_id..'.jpg') 
end
end
if text == "تحويل" and msg.reply_to_message_id ~= 0 then
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
if Message_Reply.content.audio then
local File_Id = Message_Reply.content.audio.audio.remote.id
local File = json:decode(https.request('https://api.telegram.org/bot'..Token..'/getfile?file_id='..File_Id)) 
local download_ = download('https://api.telegram.org/file/bot'..Token..'/'..File.result.file_path,msg.sender_id.user_id..'.ogg') 
LuaTele.sendAudio(msg_chat_id, msg.id, './'..msg.sender_id.user_id..'.ogg','',"md") 
curlm = 'curl "'..'https://api.telegram.org/bot'..Token..'/sendAudio'..'" -F "chat_id='.. msg_chat_id ..'" -F "audio=@'..''..msg.sender_id.user_id..'.ogg'..'"' io.popen(curlm) 
os.execute('rm -rf ./'..msg.sender_id.user_id..'.ogg') 
end
end
if text == "تحويل" and msg.reply_to_message_id ~= 0 then
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
if Message_Reply.content.content.voice_note  then
local File_Id = Message_Reply.content.voice_note.voice.remote.id
local File = json:decode(https.request('https://api.telegram.org/bot'..Token..'/getfile?file_id='..File_Id)) 
local download_ = download('https://api.telegram.org/file/bot'..Token..'/'..File.result.file_path,msg.sender_id.user_id..'.mp3') 
LuaTele.sendAudio(msg_chat_id, msg.id, './'..msg.sender_id.user_id..'.mp3','',"md") 
os.execute('rm -rf ./'..msg.sender_id.user_id..'.mp3') 
end
end
if text == 'الاوامر' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = ' ¹ ', data = msg.sender_id.user_id..'/help1'}, {text = ' ² ', data = msg.sender_id.user_id..'/help2'}, {text = ' ³ ', data = msg.sender_id.user_id..'/help3'},
},
{
{text = 'اوامر التسليه', data = msg.sender_id.user_id..'/help4'}, {text = ' الالعاب ', data = msg.sender_id.user_id..'/help6'}, 
},
{
{text = ' اوامر Dev   ', data = msg.sender_id.user_id..'/help5'},
},
}
}
return LuaTele.sendText(msg_chat_id,msg_id, [[
• اهلين عيني بـ اوامر البوت
ــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــ
• م1 ⇠ اوامر الرفع والتنزيل
• م2 ⇠ اوامر الوضع و الاعدادات 
• م3 ⇠ اوامر القفل - تعطيل 
• م4 ⇠ اوامر التسلية 
• م5 ⇠ اوامر Dev
• م6 ⇠ اوامر الالعاب
]],"md",false, false, false, false, reply_markup)
elseif text == 'م1' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = ' قائمه الاوامر ', data = msg.sender_id.user_id..'/helpall'},
},
}
}
return LuaTele.sendText(msg_chat_id,msg_id,'• عليك استخدام اوامر التحكم بالقوائم',"md",false, false, false, false, reply_markup)
elseif text == 'م2' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = ' قائمه الاوامر ', data = msg.sender_id.user_id..'/helpall'},
},
}
}
return LuaTele.sendText(msg_chat_id,msg_id,'• عليك استخدام اوامر التحكم بالقوائم',"md",false, false, false, false, reply_markup)
elseif text == 'م3' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = ' قائمه الاوامر ', data = msg.sender_id.user_id..'/helpall'},
},
}
}
return LuaTele.sendText(msg_chat_id,msg_id,'• عليك استخدام اوامر التحكم بالقوائم',"md",false, false, false, false, reply_markup)
elseif text == 'م4' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = ' قائمه الاوامر ', data = msg.sender_id.user_id..'/helpall'},
},
}
}
return LuaTele.sendText(msg_chat_id,msg_id,'• عليك استخدام اوامر التحكم بالقوائم',"md",false, false, false, false, reply_markup)
elseif text == 'م5' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = ' قائمه الاوامر ', data = msg.sender_id.user_id..'/helpall'},
},
}
}
return LuaTele.sendText(msg_chat_id,msg_id,'• عليك استخدام اوامر التحكم بالقوائم',"md",false, false, false, false, reply_markup)
elseif text == 'الالعاب' then
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = ' الالعاب ', data = msg.sender_id.user_id..'/help6'},
},
}
}
return LuaTele.sendText(msg_chat_id,msg_id,'• عليك استخدام اوامر التحكم بالقوائم',"md",false, false, false, false, reply_markup)
end
if text == 'معلومات السيرفر' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• هذا الامر يخص  '..Controller_Num(1)..' ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
 ioserver = io.popen([[
 linux_version=`lsb_release -ds`
 memUsedPrc=`free -m | awk 'NR==2{printf "%sMB/%sMB {%.2f%}\n", $3,$2,$3*100/$2 }'`
 HardDisk=`df -lh | awk '{if ($6 == "/") { print $3"/"$2" ~ {"$5"}" }}'`
 CPUPer=`top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`
 uptime=`uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes."}'`
 echo '• { نظام التشغيل } - \n»» '"$linux_version"'' 
 echo '------------------------------\n• { الذاكره العشوائيه } - \n»» '"$memUsedPrc"''
 echo '------------------------------\n• { وحـده الـتـخـزيـن } - \n»» '"$HardDisk"''
 echo '------------------------------\n• { الـمــعــالــج } - \n»» '"`grep -c processor /proc/cpuinfo`""Core ~ {$CPUPer%} "''
 echo '------------------------------\n• { موقـع الـسـيـرفـر } - \n»» '`curl http://th3boss.com/ip/location`''
 echo '------------------------------\n• { الــدخــول } - \n»» '`whoami`''
 echo '------------------------------\n• { مـده تـشغيـل الـسـيـرفـر } - \»» '"$uptime"''
 ]]):read('*all')
LuaTele.sendText(msg_chat_id,msg_id,ioserver,"md",true)
end
if text == 'تحديث' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
print('Chat Id : '..msg_chat_id)
print('User Id : '..msg_user_send_id)
LuaTele.sendText(msg_chat_id,msg_id, "• تم تحديث الملفات ","md",true)
dofile('FDFGERB.lua')  
end
if text == 'تيست' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
print('Chat Id : '..msg_chat_id)
print('User Id : '..msg_user_send_id)
LuaTele.sendText(msg_chat_id,msg_id, "• البوت شغال ","md",true)
dofile('FDFGERB.lua')  
end
if text == "تغيير اسم البوت" then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:setex(FDFGERB.."FDFGERB:Change:Name:Bot"..msg.sender_id.user_id,300,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"• ارسل لي الاسم الان ","md",true)  
end
if text == "حذف اسم البوت" then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:Name:Bot") 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم حذف اسم البوت ","md",true)   
end
if text == 'تنظيف المشتركين' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(FDFGERB.."FDFGERB:Num:User:Pv")   
local x = 0
for k,v in pairs(list) do  
local Get_Chat = LuaTele.getChat(v)
local ChatAction = LuaTele.sendChatAction(v,'Typing')
if ChatAction.luatele ~= "ok" then
x = x + 1
Redis:srem(FDFGERB..'FDFGERB:Num:User:Pv',v)
end
end
if x ~= 0 then
return LuaTele.sendText(msg_chat_id,msg_id,'• العدد الكلي ( '..#list..' \n• تم العثور على ( '..x..' ) من المشتركين حاظرين البوت',"md")
else
return LuaTele.sendText(msg_chat_id,msg_id,'• العدد الكلي ( '..#list..' \n• لم يتم العثور على وهميين',"md")
end
end
if text == 'تنظيف المجموعات' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
local list = Redis:smembers(FDFGERB.."FDFGERB:ChekBotAdd")   
local x = 0
for k,v in pairs(list) do  
local Get_Chat = LuaTele.getChat(v)
if Get_Chat.id then
local statusMem = LuaTele.getChatMember(Get_Chat.id,FDFGERB)
if statusMem.status.luatele == "chatMemberStatusMember" then
x = x + 1
LuaTele.sendText(Get_Chat.id,0,'• سيووو',"md")
Redis:srem(FDFGERB..'FDFGERB:ChekBotAdd',Get_Chat.id)
local keys = Redis:keys(FDFGERB..''..Get_Chat.id)
for i = 1, #keys do
Redis:del(keys[i])
end
LuaTele.leaveChat(Get_Chat.id)
end
else
x = x + 1
local keys = Redis:keys(FDFGERB..''..v)
for i = 1, #keys do
Redis:del(keys[i])
end
Redis:srem(FDFGERB..'FDFGERB:ChekBotAdd',v)
LuaTele.leaveChat(v)
end
end
if x ~= 0 then
return LuaTele.sendText(msg_chat_id,msg_id,'• العدد الكلي { '..#list..' } للمجموعات \n• تم العثور على { '..x..' } مجموعات البوت ليس ادمن \n• تم تعطيل المجموعه ومغادره البوت من الوهمي ',"md")
else
return LuaTele.sendText(msg_chat_id,msg_id,'• العدد الكلي { '..#list..' } للمجموعات \n• لا توجد مجموعات وهميه',"md")
end
end
if text and text:match('^اهداء @(%S+)$') then
local UserName = text:match('^اهداء @(%S+)$') 
mmsg = LuaTele.getMessage(msg.chat_id,msg.reply_to_message_id)
if mmsg and mmsg.content then
if mmsg.content.luatele ~= "messageVoiceNote" and mmsg.content.luatele ~= "messageAudio" then
return LuaTele.sendText(msg.chat_id,msg.id,'• ي غبي اهدي بصمه فقط .',"md",true)  
end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
return LuaTele.sendText(msg.chat_id,msg.id,"\n• مافي حساب بهدا اليوزر ي لاسع ","md",true)   end
local UserInfo = LuaTele.getUser(UserId_Info.id)
if UserInfo.first_name and UserInfo.first_name ~= "" then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '- رابط الهديه . ', url ="https://t.me/c/"..string.gsub(msg.chat_id,"-100",'').."/"..(msg.reply_to_message_id/2097152/0.5)}}}}
local UserInfom = LuaTele.getUser(msg.sender_id.user_id)
if UserInfom.username and UserInfom.username ~= "" then
Us = '@['..UserInfom.username..']' 
else 
Us = 'لا يوجد ' 
end
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
return LuaTele.sendText(msg.chat_id,msg.reply_to_message_id,'• هذي الهديه لك ( [@'..UserInfo.username..']  ) .️\n• وصلتك هديه اضغط ع رابط . \n• مرسل الهديه : '..Us..'',"md",true, false, false, false, reply_markup)  
end
end
end
if text == "اذكار" or text == "ادعيه" then
if Redis:get(FDFGERB.."FDFGERB:Status:Entert"..msg.chat_id) then
local texting = {"‏اللهم أتبع عُسرنا بيُسر وأبدل كسرنا بِجبر وأجعل لنا في كُل أمر خيرهِ", 
"‏عسىٰ ربكُم أَن يُبدِل أَحزانُكم فَرحاً", 
"‏اللّهم إني اسألك الطمأنينة في غمرة خوفي ", 
"اللهُم إني اسألك حسن الخاتمة", 
"‏اللهم لا تبتلينا فيما لا نستطيع عليه صبرا", 
"اللهّم لا تأخذنا من الدنيا إلا وأنت راضِ عنّا", 
" اللهُم⁩ بلغنا المُتسع واليُسر في كُل أمورنا.", 
"اللهُمَّ لا بأس ، ولا يأس ، ولا إنطفاء أبدًا", 
"لا يكلف الله نفساً ألا وسعها", 
"اللهُم اجعل قبر كُل من غادر الحياة نوراً وضياء", 
"‏اللهمَّ اروي أَيّامنا المُقبلة , حُبًا وفرح.", 
"اللهم فرحةٌ تدمع العين من أجلها", 
"سيُرضيك الله بعد وجعَك كأنك لم تتألم", 
"وَ أصلِحنَا فيمَا بقِيَ لنَا مِن العُمر يَالله", 
"‏اللهم أبعد عنا بؤس الحياة وكل ضيق", 
} 
return LuaTele.sendText(msg_chat_id,msg_id,texting[math.random(#texting)],'md')
end
end
if text == "اقتباسات" or text == "فصحى" then
if Redis:get(FDFGERB.."FDFGERB:Status:Entert"..msg.chat_id) then
local texting = {"‏يا بَهجةَ القلبِ يا كُلَّ الجَمال ‏يا نورَ الفؤادِ ويا سلوةَ الروحِ", 
"‏كم ضَمّتِ الجُدرانُ ريحَ أحبّةٍ رَحَلوا، وَحاشا حُبُّهُم أن يَرحَلا", 
"الطَّاهِرُونَ كَأَنَّهمْ مَاءُ السَّمَا لَم يَلْتَصِقْ دَرَنٌ بِهِمْ وَ عُيُوبُ ", 
"صومُ اللسانِ عن الرذائلِ واجبٌ ما نفعُ صومك واللسان طليقُ", 
"حقُّ الجمال عليك أن تزهُو بهِ ‏ ماجئت حُلوًا هكذا لتُعاني ! ", 
"شيءُ من الشّوق مرسومُ أُخبِّئهُ ‏سطْرُ بعيني وفي قلبي دواوين", 
" وجعلت مُعتمدي عليك توكلاً وبسطتُ كفي سائِلا أتضرّعُ اجعل لنا من كل ضيقٍ مخرجاً والطُف بنا يامن إليه المرجِعُ", 
"أرى الداءَ يشفيه الدواءُ وإنّني ‏أرى الحمق داءً ليس يُرجى شفاءهُ", 
"لَقد زدتَ هذا الدَّهرَ حُسناً وَ هَيبَةً ‏كَأنَّكَ في صَدرِ الزَّمانِ نِجَادُ", 
"رِفقًا عليْنا يا مليح إنَّنا ‏قومً إذا زادَ الْهُيامُ تَعذَّبوا", 
"فهل ترجعُ الدارُ بعد البُعدِ آنسةً ‏و هل تعودُ لنا أيَّامُنا الأُول", 
"قُلْ للبغالِ وإنْ تعالى صوتها ‏ما قَصَّ أجنحةَ الصقورِ، نهيقُ", 
"ولا تحسبنَّ حلو الكَلام دوماً صادِقٌ ‏ولا تُصدِقنَّ إلا الذِي بالأفعال يتكلم", 
"خَفِيفَةُ الرُّوح لو رامت لِخِفَّتِهَا ‏رَقصًا عَلَى المَاء ما ابْتَلَّت لها قَدَمُ", 
"يالَيلةً لَستُ أنسَى طِيبَها أبدًا ‏كَأنَّ كُلَّ سُرورٍ حاضِرٌ فِيهَا", 
} 
return LuaTele.sendText(msg_chat_id,msg_id,texting[math.random(#texting)],'md')
end
end
if text == "كت" or text == "كت تويت" then
if Redis:get(FDFGERB.."FDFGERB:Status:Games"..msg.chat_id) then
local texting = {"اخر افلام شاهدتها", 
"اخر افلام شاهدتها", 
"ما هي وظفتك الحياه", 
"اعز اصدقائك ?", 
"اخر اغنية سمعتها ?", 
"تكلم عن نفسك", 
"ليه انت مش سالك", 
"اخر كتاب قرآته", 
"روايتك المفضله ?", 
"اخر اكله اكلتها", 
"اخر كتاب قرآته", 
"ليش حسين ذكي؟ ", 
"افضل يوم ف حياتك", 
"ليه مضيفتش كل جهاتك", 
"حكمتك ف الحياه", 
"لون عيونك", 
"كتابك المفضل", 
"هوايتك المفضله", 
"علاقتك مع اهلك", 
" ما السيء في هذه الحياة ؟ ", 
"أجمل شيء حصل معك خلال هذا الاسبوع ؟ ", 
"سؤال ينرفزك ؟ ", 
" اكثر ممثل تحبه ؟ ", 
"قد تخيلت شي في بالك وصار ؟ ", 
"شيء عندك اهم من الناس ؟ ", 
"تفضّل النقاش الطويل او تحب الاختصار ؟ ", 
"وش أخر شي ضيعته؟ ", 
"كم مره حبيت؟ ", 
" اكثر المتابعين عندك باي برنامج؟", 
" آخر مره ضربت عشره كانت متى ؟", 
" نسبه الندم عندك للي وثقت فيهم ؟", 
"تحب ترتبط بكيرفي ولا فلات؟", 
" جربت شعور احد يحبك بس انت مو قادر تحبه؟", 
" تجامل الناس ولا اللي بقلبك على لسانك؟", 
" عمرك ضحيت باشياء لاجل شخص م يسوى ؟", 
"مغني تلاحظ أن صوته يعجب الجميع إلا أنت؟ ", 
" آخر غلطات عمرك؟ ", 
" مسلسل كرتوني له ذكريات جميلة عندك؟ ", 
" ما أكثر تطبيق تقضي وقتك عليه؟ ", 
" أول شيء يخطر في بالك إذا سمعت كلمة نجوم ؟ ", 
" قدوتك من الأجيال السابقة؟ ", 
" أكثر طبع تهتم بأن يتواجد في شريك/ة حياتك؟ ", 
"أكثر حيوان تخاف منه؟ ", 
" ما هي طريقتك في الحصول على الراحة النفسية؟ ", 
" إيموجي يعبّر عن مزاجك الحالي؟ ", 
" أكثر تغيير ترغب أن تغيّره في نفسك؟ ", 
"أكثر شيء أسعدك اليوم؟ ", 
"اي رايك في الدنيا دي ؟ ", 
"ما هو أفضل حافز للشخص؟ ", 
"ما الذي يشغل بالك في الفترة الحالية؟", 
"آخر شيء ندمت عليه؟ ", 
"شاركنا صورة احترافية من تصويرك؟ ", 
"تتابع انمي؟ إذا نعم ما أفضل انمي شاهدته ", 
"يرد عليك متأخر على رسالة مهمة وبكل برود، موقفك؟ ", 
"نصيحه تبدا ب -لا- ؟ ", 
"كتاب أو رواية تقرأها هذه الأيام؟ ", 
"فيلم عالق في ذهنك لا تنساه مِن روعته؟ ", 
"يوم لا يمكنك نسيانه؟ ", 
"شعورك الحالي في جملة؟ ", 
"كلمة لشخص بعيد؟ ", 
"صفة يطلقها عليك الشخص المفضّل؟ ", 
"أغنية عالقة في ذهنك هاليومين؟ ", 
"أكلة مستحيل أن تأكلها؟ ", 
"كيف قضيت نهارك؟ ", 
"تصرُّف ماتتحمله؟ ", 
"موقف غير حياتك؟ ", 
"اكثر مشروب تحبه؟ ", 
"القصيدة اللي تأثر فيك؟ ", 
"متى يصبح الصديق غريب ", 
"وين نلقى السعاده برايك؟ ", 
"تاريخ ميلادك؟ ", 
"قهوه و لا شاي؟ ", 
"من محبّين الليل أو الصبح؟ ", 
"حيوانك المفضل؟ ", 
"كلمة غريبة ومعناها؟ ", 
"كم تحتاج من وقت لتثق بشخص؟ ", 
"اشياء نفسك تجربها؟ ", 
"يومك ضاع على؟ ", 
"كل شيء يهون الا ؟ ", 
"اسم ماتحبه ؟ ", 
"وقفة إحترام للي إخترع ؟ ", 
"أقدم شيء محتفظ فيه من صغرك؟ ", 
"كلمات ماتستغني عنها بسوالفك؟ ", 
"وش الحب بنظرك؟ ", 
"حب التملك في شخصِيـتك ولا ؟ ", 
"تخطط للمستقبل ولا ؟ ", 
"موقف محرج ماتنساه ؟ ", 
"من طلاسم لهجتكم ؟ ", 
"اعترف باي حاجه ؟ ", 
"عبّر عن مودك بصوره ؟ ",
"آخر مره ضربت عشره كانت متى ؟", 
"اسم دايم ع بالك ؟ ", 
"اشياء تفتخر انك م سويتها ؟ ", 
" لو بكيفي كان ؟ ", 
  "أكثر جملة أثرت بك في حياتك؟ ",
  "إيموجي يوصف مزاجك حاليًا؟ ",
  "أجمل اسم بنت بحرف الباء؟ ",
  "كيف هي أحوال قلبك؟ ",
  "أجمل مدينة؟ ",
  "كيف كان أسبوعك؟ ",
  "شيء تشوفه اكثر من اهلك ؟ ",
  "اخر مره فضفضت؟ ",
  "قد كرهت احد بسبب اسلوبه؟ ",
  "قد حبيت شخص وخذلك؟ ",
  "كم مره حبيت؟ ",
  "اكبر غلطة بعمرك؟ ",
  "نسبة النعاس عندك حاليًا؟ ",
  "شرايكم بمشاهير التيك توك؟ ",
  "ما الحاسة التي تريد إضافتها للحواس الخمسة؟ ",
  "اسم قريب لقلبك؟ ",
  "مشتاق لمطعم كنت تزوره قبل الحظر؟ ",
  "أول شيء يخطر في بالك إذا سمعت كلمة (ابوي يبيك)؟ ",
  "ما أول مشروع تتوقع أن تقوم بإنشائه إذا أصبحت مليونير؟ ",
  "أغنية عالقة في ذهنك هاليومين؟ ",
  "متى اخر مره قريت قرآن؟ ",
  "كم صلاة فاتتك اليوم؟ ",
  "تفضل التيكن او السنقل؟ ",
  "وش أفضل بوت برأيك؟ ",
"كم لك بالتلي؟ ",
"وش الي تفكر فيه الحين؟ ",
"كيف تشوف الجيل ذا؟ ",
"منشن شخص وقوله، تحبني؟ ",
"لو جاء شخص وعترف لك كيف ترده؟ ",
"مر عليك موقف محرج؟ ",
"وين تشوف نفسك بعد سنتين؟ ",
"لو فزعت/ي لصديق/ه وقالك مالك دخل وش بتسوي/ين؟ ",
"وش اجمل لهجة تشوفها؟ ",
"قد سافرت؟ ",
"افضل مسلسل عندك؟ ",
"افضل فلم عندك؟ ",
"مين اكثر يخون البنات/العيال؟ ",
"متى حبيت؟ ",
  "بالعادة متى تنام؟ ",
  "شيء من صغرك ماتغيير فيك؟ ",
  "شيء بسيط قادر يعدل مزاجك بشكل سريع؟ ",
  "تشوف الغيره انانيه او حب؟ ",
"حاجة تشوف نفسك مبدع فيها؟ ",
  "مع او ضد : يسقط جمال المراة بسبب قبح لسانها؟ ",
  "عمرك بكيت على شخص مات في مسلسل ؟ ",
  "- هل تعتقد أن هنالك من يراقبك بشغف؟ ",
  "تدوس على قلبك او كرامتك؟ ",
  "اكثر لونين تحبهم مع بعض؟ ",
  "مع او ضد : النوم افضل حل لـ مشاكل الحياة؟ ",
  "سؤال دايم تتهرب من الاجابة عليه؟ ",
  "تحبني ولاتحب الفلوس؟ ",
  "العلاقه السريه دايماً تكون حلوه؟ ",
  "لو أغمضت عينيك الآن فما هو أول شيء ستفكر به؟ ",
"كيف ينطق الطفل اسمك؟ ",
  "ما هي نقاط الضعف في شخصيتك؟ ",
  "اكثر كذبة تقولها؟ ",
  "تيكن ولا اضبطك؟ ",
  "اطول علاقة كنت فيها مع شخص؟ ",
  "قد ندمت على شخص؟ ",
  "وقت فراغك وش تسوي؟ ",
  "عندك أصحاب كثير؟ ولا ينعد بالأصابع؟ ",
  "حاط نغمة خاصة لأي شخص؟ ",
  "وش اسم شهرتك؟ ",
  "أفضل أكلة تحبه لك؟ ",
"عندك شخص تسميه ثالث والدينك؟ ",
  "عندك شخص تسميه ثالث والدينك؟ ",
  "اذا قالو لك تسافر أي مكان تبيه وتاخذ معك شخص واحد وين بتروح ومين تختار؟ ",
  "أطول مكالمة كم ساعة؟ ",
  "تحب الحياة الإلكترونية ولا الواقعية؟ ",
  "كيف حال قلبك ؟ بخير ولا مكسور؟ ",
  "أطول مدة نمت فيها كم ساعة؟ ",
  "تقدر تسيطر على ضحكتك؟ ",
  "أول حرف من اسم الحب؟ ",
  "تحب تحافظ على الذكريات ولا تمسحه؟ ",
  "اسم اخر شخص زعلك؟ ",
"وش نوع الأفلام اللي تحب تتابعه؟ ",
  "أنت انسان غامض ولا الكل يعرف عنك؟ ",
  "لو الجنسية حسب ملامحك وش بتكون جنسيتك؟ ",
  "عندك أخوان او خوات من الرضاعة؟ ",
  "إختصار تحبه؟ ",
  "إسم شخص وتحس أنه كيف؟ ",
  "وش الإسم اللي دايم تحطه بالبرامج؟ ",
  "وش برجك؟ ",
  "لو يجي عيد ميلادك تتوقع يجيك هدية؟ ",
  "اجمل هدية جاتك وش هو؟ ",
  "الصداقة ولا الحب؟ ",
"الصداقة ولا الحب؟ ",
  "الغيرة الزائدة شك؟ ولا فرط الحب؟ ",
    "هل انت دي تويت باعت باندا؟ ",
  "قد حبيت شخصين مع بعض؟ وانقفطت؟ ",
  "وش أخر شي ضيعته؟ ",
  "قد ضيعت شي ودورته ولقيته بيدك؟ ",
  "تؤمن بمقولة اللي يبيك مايحتار فيك؟ ",
  "سبب وجوك بالتليجرام؟ ",
  "تراقب شخص حاليا؟ ",
  "عندك معجبين ولا محد درا عنك؟ ",
  "لو نسبة جمالك بتكون بعدد شحن جوالك كم بتكون؟ ",
  "أنت محبوب بين الناس؟ ولاكريه؟ ",
"كم عمرك؟ ",
  "لو يسألونك وش اسم امك تجاوبهم ولا تسفل فيهم؟ ",
  "تؤمن بمقولة الصحبة تغنيك الحب؟ ",
  "وش مشروبك المفضل؟ ",
  "قد جربت الدخان بحياتك؟ وانقفطت ولا؟ ",
  "أفضل وقت للسفر؟ الليل ولا النهار؟ ",
  "انت من النوع اللي تنام بخط السفر؟ ",
  "عندك حس فكاهي ولا نفسية؟ ",
  "تبادل الكراهية بالكراهية؟ ولا تحرجه بالطيب؟ ",
  "أفضل ممارسة بالنسبة لك؟ ",
  "لو قالو لك تتخلى عن شي واحد تحبه بحياتك وش يكون؟ ",
"لو احد تركك وبعد فتره يحاول يرجعك بترجع له ولا خلاص؟ ",
  "برأيك كم العمر المناسب للزواج؟ ",
  "اذا تزوجت بعد كم بتخلف عيال؟ ",
  "فكرت وش تسمي أول اطفالك؟ ",
  "من الناس اللي تحب الهدوء ولا الإزعاج؟ ",
  "الشيلات ولا الأغاني؟ ",
  "عندكم شخص مطوع بالعايلة؟ ",
  "تتقبل النصيحة من اي شخص؟ ",
  "اذا غلطت وعرفت انك غلطان تحب تعترف ولا تجحد؟ ",
  "جربت شعور احد يحبك بس انت مو قادر تحبه؟ ",
  "دايم قوة الصداقة تكون بإيش؟ ",
"أفضل البدايات بالعلاقة بـ وش؟ ",
  "وش مشروبك المفضل؟ او قهوتك المفضلة؟ ",
  "تحب تتسوق عبر الانترنت ولا الواقع؟ ",
  "انت من الناس اللي بعد ماتشتري شي وتروح ترجعه؟ ",
  "أخر مرة بكيت متى؟ وليش؟ ",
  "عندك الشخص اللي يقلب الدنيا عشان زعلك؟ ",
  "أفضل صفة تحبه بنفسك؟ ",
  "كلمة تقولها للوالدين؟ ",
  "أنت من الناس اللي تنتقم وترد الاذى ولا تحتسب الأجر وتسامح؟ ",
  "كم عدد سنينك بالتليجرام؟ ",
  "تحب تعترف ولا تخبي؟ ",
"انت من الناس الكتومة ولا تفضفض؟ ",
  "أنت بعلاقة حب الحين؟ ",
  "عندك اصدقاء غير جنسك؟ ",
  "أغلب وقتك تكون وين؟ ",
  "لو المقصود يقرأ وش بتكتب له؟ ",
  "تحب تعبر بالكتابة ولا بالصوت؟ ",
  "عمرك كلمت فويس احد غير جنسك؟ ",
  "لو خيروك تصير مليونير ولا تتزوج الشخص اللي تحبه؟ ",
  "لو عندك فلوس وش السيارة اللي بتشتريها؟ ",
  "كم أعلى مبلغ جمعته؟ ",
  "اذا شفت احد على غلط تعلمه الصح ولا تخليه بكيفه؟ ",
"قد جربت تبكي فرح؟ وليش؟ ",
"تتوقع إنك بتتزوج اللي تحبه؟ ",
  "ما هو أمنيتك؟ ",
  "وين تشوف نفسك بعد خمس سنوات؟ ",
  "هل انت حرامي تويت بتعت باندا؟ ",
  "لو خيروك تقدم الزمن ولا ترجعه ورا؟ ",
  "لعبة قضيت وقتك فيه بالحجر المنزلي؟ ",
  "تحب تطق الميانة ولا ثقيل؟ ",
  "باقي معاك للي وعدك ما بيتركك؟ ",
  "اول ماتصحى من النوم مين تكلمه؟ ",
  "عندك الشخص اللي يكتب لك كلام كثير وانت نايم؟ ",
  "قد قابلت شخص تحبه؟ وولد ولا بنت؟ ",
   "هل انت تحب باندا؟ ",
"اذا قفطت احد تحب تفضحه ولا تستره؟ ",
  "كلمة للشخص اللي يسب ويسطر؟ ",
  "آية من القران تؤمن فيه؟ ",
  "تحب تعامل الناس بنفس المعاملة؟ ولا تكون أطيب منهم؟ ",
"حاجة ودك تغييرها هالفترة؟ ",
  "كم فلوسك حاليا وهل يكفيك ام لا؟ ",
  "وش لون عيونك الجميلة؟ ",
  "من الناس اللي تتغزل بالكل ولا بالشخص اللي تحبه بس؟ ",
  "اذكر موقف ماتنساه بعمرك؟ ",
  "وش حاب تقول للاشخاص اللي بيدخل حياتك؟ ",
  "ألطف شخص مر عليك بحياتك؟ ",
   "هل باندا لطيف؟ ",
"انت من الناس المؤدبة ولا نص نص؟ ",
  "كيف الصيد معاك هالأيام ؟ وسنارة ولاشبك؟ ",
  "لو الشخص اللي تحبه قال بدخل حساباتك بتعطيه ولا تكرشه؟ ",
  "أكثر شي تخاف منه بالحياه وش؟ ",
  "اكثر المتابعين عندك باي برنامج؟ ",
  "متى يوم ميلادك؟ ووش الهدية اللي نفسك فيه؟ ",
  "قد تمنيت شي وتحقق؟ ",
  "قلبي على قلبك مهما صار لمين تقولها؟ ",
  "وش نوع جوالك؟ واذا بتغييره وش بتأخذ؟ ",
  "كم حساب عندك بالتليجرام؟ ",
  "متى اخر مرة كذبت؟ ",
"كذبت في الاسئلة اللي مرت عليك قبل شوي؟ ",
  "تجامل الناس ولا اللي بقلبك على لسانك؟ ",
  "قد تمصلحت مع أحد وليش؟ ",
  "وين تعرفت على الشخص اللي حبيته؟ ",
  "قد رقمت او احد رقمك؟ ",
  "وش أفضل لعبته بحياتك؟ ",
  "أخر شي اكلته وش هو؟ ",
  "حزنك يبان بملامحك ولا صوتك؟ ",
  "لقيت الشخص اللي يفهمك واللي يقرا افكارك؟ ",
  "فيه شيء م تقدر تسيطر عليه ؟ ",
  "منشن شخص متحلطم م يعجبه شيء؟ ",
"اكتب تاريخ مستحيل تنساه ",
  "شيء مستحيل انك تاكله ؟ ",
  "تحب تتعرف على ناس جدد ولا مكتفي باللي عندك ؟ ",
  "انسان م تحب تتعامل معاه ابداً ؟ ",
  "شيء بسيط تحتفظ فيه؟ ",
  "فُرصه تتمنى لو أُتيحت لك ؟ ",
   "ممكن نتعرف؟ ",
  "شيء مستحيل ترفضه ؟. ",
  "لو زعلت بقوة وش بيرضيك ؟ ",
  "تنام بـ اي مكان ، ولا بس غرفتك ؟ ",
  "ردك المعتاد اذا أحد ناداك ؟ ",
  "مين الي تحب يكون مبتسم دائما ؟ ",
" إحساسك في هاللحظة؟ ",
  "وش اسم اول شخص تعرفت عليه فالتلقرام ؟ ",
  "اشياء صعب تتقبلها بسرعه ؟ ",
  "شيء جميل صار لك اليوم ؟ ",
  "اذا شفت شخص يتنمر على شخص قدامك شتسوي؟ ",
  "يهمك ملابسك تكون ماركة ؟ ",
  "ردّك على شخص قال (أنا بطلع من حياتك)؟. ",
  "مين اول شخص تكلمه اذا طحت بـ مصيبة ؟ ",
  "تشارك كل شي لاهلك ولا فيه أشياء ما تتشارك؟ ",
  "كيف علاقتك مع اهلك؟ رسميات ولا ميانة؟ ",
  "عمرك ضحيت باشياء لاجل شخص م يسوى ؟ ",
"اكتب سطر من اغنية او قصيدة جا فـ بالك ؟ ",
  "شيء مهما حطيت فيه فلوس بتكون مبسوط ؟ ",
  "مشاكلك بسبب ؟ ",
  "نسبه الندم عندك للي وثقت فيهم ؟ ",
  "اول حرف من اسم شخص تقوله? بطل تفكر فيني ابي انام؟ ",
  "اكثر شيء تحس انه مات ف مجتمعنا؟ ",
  "لو صار سوء فهم بينك وبين شخص هل تحب توضحه ولا تخليه كذا  لان مالك خلق توضح ؟ ",
  "كم عددكم بالبيت؟ ",
  "عادي تتزوج من برا القبيلة؟ ",
  "أجمل شي بحياتك وش هو؟ ",
} 
return LuaTele.sendText(msg_chat_id,msg_id,texting[math.random(#texting)],'md')
end
end
if text == "خيرني" or text == "لو خيروك" or text == "خيروك" then 
if Redis:get(FDFGERB.."FDFGERB:Status:Games"..msg.chat_id) then
local texting = {"لو خيروك ⇠  بين الإبحار لمدة أسبوع كامل أو السفر على متن طائرة لـ 3 أيام متواصلة؟ ",
"لو خيروك ⇠  بين شراء منزل صغير أو استئجار فيلا كبيرة بمبلغ معقول؟ ",
"لو خيروك ⇠  أن تعيش قصة فيلم هل تختار الأكشن أو الكوميديا؟ ",
"لو خيروك ⇠  بين تناول البيتزا وبين الايس كريم وذلك بشكل دائم؟ ",
"لو خيروك ⇠  بين إمكانية تواجدك في الفضاء وبين إمكانية تواجدك في البحر؟ ",
"لو خيروك ⇠  بين تغيير وظيفتك كل سنة أو البقاء بوظيفة واحدة طوال حياتك؟ ",
"لو خيروك ⇠  أسئلة محرجة أسئلة صراحة ماذا ستختار؟ ",
"لو خيروك ⇠  بين الذهاب إلى الماضي والعيش مع جدك أو بين الذهاب إلى المستقبل والعيش مع أحفادك؟ ",
"لو كنت شخص اخر هل تفضل البقاء معك أم أنك ستبتعد عن نفسك؟ ",
"لو خيروك ⇠  بين الحصول على الأموال في عيد ميلادك أو على الهدايا؟ ",
"لو خيروك ⇠  بين القفز بمظلة من طائرة أو الغوص في أعماق البحر؟ ",
"لو خيروك ⇠  بين الاستماع إلى الأخبار الجيدة أولًا أو الاستماع إلى الأخبار السيئة أولًا؟ ",
"لو خيروك ⇠  بين أن تكون رئيس لشركة فاشلة أو أن تكون موظف في شركة ناجحة؟ ",
"لو خيروك ⇠  بين أن يكون لديك جيران صاخبون أو أن يكون لديك جيران فضوليون؟ ",
"لو خيروك ⇠  بين أن تكون شخص مشغول دائمًا أو أن تكون شخص يشعر بالملل دائمًا؟ ",
"لو خيروك ⇠  بين قضاء يوم كامل مع الرياضي الذي تشجعه أو نجم السينما الذي تحبه؟ ",
"لو خيروك ⇠  بين استمرار فصل الشتاء دائمًا أو بقاء فصل الصيف؟ ",
"لو خيروك ⇠  بين العيش في القارة القطبية أو العيش في الصحراء؟ ",
"لو خيروك ⇠  بين أن تكون لديك القدرة على حفظ كل ما تسمع أو تقوله وبين القدرة على حفظ كل ما تراه أمامك؟ ",
"لو خيروك ⇠  بين أن يكون طولك 150 سنتي متر أو أن يكون 190 سنتي متر؟ ",
"لو خيروك ⇠  بين إلغاء رحلتك تمامًا أو بقائها ولكن فقدان الأمتعة والأشياء الخاص بك خلالها؟ ",
"لو خيروك ⇠  بين أن تكون اللاعب الأفضل في فريق كرة فاشل أو أن تكون لاعب عادي في فريق كرة ناجح؟ ",
"لو خيروك ⇠  بين ارتداء ملابس البيت لمدة أسبوع كامل أو ارتداء البدلة الرسمية لنفس المدة؟ ",
"لو خيروك ⇠  بين امتلاك أفضل وأجمل منزل ولكن في حي سيء أو امتلاك أسوأ منزل ولكن في حي جيد وجميل؟ ",
"لو خيروك ⇠  بين أن تكون غني وتعيش قبل 500 سنة، أو أن تكون فقير وتعيش في عصرنا الحالي؟ ",
"لو خيروك ⇠  بين ارتداء ملابس الغوص ليوم كامل والذهاب إلى العمل أو ارتداء ملابس جدك/جدتك؟ ",
"لو خيروك ⇠  بين قص شعرك بشكل قصير جدًا أو صبغه باللون الوردي؟ ",
"لو خيروك ⇠  بين أن تضع الكثير من الملح على كل الطعام بدون علم أحد، أو أن تقوم بتناول شطيرة معجون أسنان؟ ",
"لو خيروك ⇠  بين قول الحقيقة والصراحة الكاملة مدة 24 ساعة أو الكذب بشكل كامل مدة 3 أيام؟ ",
"لو خيروك ⇠  بين تناول الشوكولا التي تفضلها لكن مع إضافة رشة من الملح والقليل من عصير الليمون إليها أو تناول ليمونة كاملة كبيرة الحجم؟ ",
"لو خيروك ⇠  بين وضع أحمر الشفاه على وجهك ما عدا شفتين أو وضع ماسكارا على شفتين فقط؟ ",
"لو خيروك ⇠  بين الرقص على سطح منزلك أو الغناء على نافذتك؟ ",
"لو خيروك ⇠  بين تلوين شعرك كل خصلة بلون وبين ارتداء ملابس غير متناسقة لمدة أسبوع؟ ",
"لو خيروك ⇠  بين تناول مياه غازية مجمدة وبين تناولها ساخنة؟ ",
"لو خيروك ⇠  بين تنظيف شعرك بسائل غسيل الأطباق وبين استخدام كريم الأساس لغسيل الأطباق؟ ",
"لو خيروك ⇠  بين تزيين طبق السلطة بالبرتقال وبين إضافة البطاطا لطبق الفاكهة؟ ",
"لو خيروك ⇠  بين اللعب مع الأطفال لمدة 7 ساعات أو الجلوس دون فعل أي شيء لمدة 24 ساعة؟ ",
"لو خيروك ⇠  بين شرب كوب من الحليب أو شرب كوب من شراب عرق السوس؟ ",
"لو خيروك ⇠  بين الشخص الذي تحبه وصديق الطفولة؟ ",
"لو خيروك ⇠  بين أمك وأبيك؟ ",
"لو خيروك ⇠  بين أختك وأخيك؟ ",
"لو خيروك ⇠  بين نفسك وأمك؟ ",
"لو خيروك ⇠  بين صديق قام بغدرك وعدوك؟ ",
"لو خيروك ⇠  بين خسارة حبيبك/حبيبتك أو خسارة أخيك/أختك؟ ",
"لو خيروك ⇠  بإنقاذ شخص واحد مع نفسك بين أمك أو ابنك؟ ",
"لو خيروك ⇠  بين ابنك وابنتك؟ ",
"لو خيروك ⇠  بين زوجتك وابنك/ابنتك؟ ",
"لو خيروك ⇠  بين جدك أو جدتك؟ ",
"لو خيروك ⇠  بين زميل ناجح وحده أو زميل يعمل كفريق؟ ",
"لو خيروك ⇠  بين لاعب كرة قدم مشهور أو موسيقي مفضل بالنسبة لك؟ ",
"لو خيروك ⇠  بين مصور فوتوغرافي جيد وبين مصور سيء ولكنه عبقري فوتوشوب؟ ",
"لو خيروك ⇠  بين سائق سيارة يقودها ببطء وبين سائق يقودها بسرعة كبيرة؟ ",
"لو خيروك ⇠  بين أستاذ اللغة العربية أو أستاذ الرياضيات؟ ",
"لو خيروك ⇠  بين أخيك البعيد أو جارك القريب؟ ",
"لو خيروك ⇠  يبن صديقك البعيد وبين زميلك القريب؟ ",
"لو خيروك ⇠  بين رجل أعمال أو أمير؟ ",
"لو خيروك ⇠  بين نجار أو حداد؟ ",
"لو خيروك ⇠  بين طباخ أو خياط؟ ",
"لو خيروك ⇠  بين أن تكون كل ملابس بمقاس واحد كبير الحجم أو أن تكون جميعها باللون الأصفر؟ ",
"لو خيروك ⇠  بين أن تتكلم بالهمس فقط طوال الوقت أو أن تصرخ فقط طوال الوقت؟ ",
"لو خيروك ⇠  بين أن تمتلك زر إيقاف موقت للوقت أو أن تمتلك أزرار للعودة والذهاب عبر الوقت؟ ",
"لو خيروك ⇠  بين أن تعيش بدون موسيقى أبدًا أو أن تعيش بدون تلفاز أبدًا؟ ",
"لو خيروك ⇠  بين أن تعرف متى سوف تموت أو أن تعرف كيف سوف تموت؟ ",
"لو خيروك ⇠  بين العمل الذي تحلم به أو بين إيجاد شريك حياتك وحبك الحقيقي؟ ",
"لو خيروك ⇠  بين معاركة دب أو بين مصارعة تمساح؟ ",
"لو خيروك ⇠  بين إما الحصول على المال أو على المزيد من الوقت؟ ",
"لو خيروك ⇠  بين امتلاك قدرة التحدث بكل لغات العالم أو التحدث إلى الحيوانات؟ ",
"لو خيروك ⇠  بين أن تفوز في اليانصيب وبين أن تعيش مرة ثانية؟ ",
"لو خيروك ⇠  بأن لا يحضر أحد إما لحفل زفافك أو إلى جنازتك؟ ",
"لو خيروك ⇠  بين البقاء بدون هاتف لمدة شهر أو بدون إنترنت لمدة أسبوع؟ ",
"لو خيروك ⇠  بين العمل لأيام أقل في الأسبوع مع زيادة ساعات العمل أو العمل لساعات أقل في اليوم مع أيام أكثر؟ ",
"لو خيروك ⇠  بين مشاهدة الدراما في أيام السبعينيات أو مشاهدة الأعمال الدرامية للوقت الحالي؟ ",
"لو خيروك ⇠  بين التحدث عن كل شيء يدور في عقلك وبين عدم التحدث إطلاقًا؟ ",
"لو خيروك ⇠  بين مشاهدة فيلم بمفردك أو الذهاب إلى مطعم وتناول العشاء بمفردك؟ ",
"لو خيروك ⇠  بين قراءة رواية مميزة فقط أو مشاهدتها بشكل فيلم بدون القدرة على قراءتها؟ ",
"لو خيروك ⇠  بين أن تكون الشخص الأكثر شعبية في العمل أو المدرسة وبين أن تكون الشخص الأكثر ذكاءً؟ ",
"لو خيروك ⇠  بين إجراء المكالمات الهاتفية فقط أو إرسال الرسائل النصية فقط؟ ",
"لو خيروك ⇠  بين إنهاء الحروب في العالم أو إنهاء الجوع في العالم؟ ",
"لو خيروك ⇠  بين تغيير لون عينيك أو لون شعرك؟ ",
"لو خيروك ⇠  بين امتلاك كل عين لون وبين امتلاك نمش على خديك؟ ",
"لو خيروك ⇠  بين الخروج بالمكياج بشكل مستمر وبين الحصول على بشرة صحية ولكن لا يمكن لك تطبيق أي نوع من المكياج؟ ",
"لو خيروك ⇠  بين أن تصبحي عارضة أزياء وبين ميك اب أرتيست؟ ",
"لو خيروك ⇠  بين مشاهدة كرة القدم أو متابعة الأخبار؟ ",
"لو خيروك ⇠  بين موت شخصية بطل الدراما التي تتابعينها أو أن يبقى ولكن يكون العمل الدرامي سيء جدًا؟ ",
"لو خيروك ⇠  بين العيش في دراما قد سبق وشاهدتها ماذا تختارين بين الكوميديا والتاريخي؟ ",
"لو خيروك ⇠  بين امتلاك القدرة على تغيير لون شعرك متى تريدين وبين الحصول على مكياج من قبل خبير تجميل وذلك بشكل يومي؟ ",
"لو خيروك ⇠  بين نشر تفاصيل حياتك المالية وبين نشر تفاصيل حياتك العاطفية؟ ",
"لو خيروك ⇠  بين البكاء والحزن وبين اكتساب الوزن؟ ",
"لو خيروك ⇠  بين تنظيف الأطباق كل يوم وبين تحضير الطعام؟ ",
"لو خيروك ⇠  بين أن تتعطل سيارتك في نصف الطريق أو ألا تتمكنين من ركنها بطريقة صحيحة؟ ",
"لو خيروك ⇠  بين إعادة كل الحقائب التي تملكينها أو إعادة الأحذية الجميلة الخاصة بك؟ ",
"لو خيروك ⇠  بين قتل حشرة أو متابعة فيلم رعب؟ ",
"لو خيروك ⇠  بين امتلاك قطة أو كلب؟ ",
"لو خيروك ⇠  بين الصداقة والحب ",
"لو خيروك ⇠  بين تناول الشوكولا التي تحبين طوال حياتك ولكن لا يمكنك الاستماع إلى الموسيقى وبين الاستماع إلى الموسيقى ولكن لا يمكن لك تناول الشوكولا أبدًا؟ ",
"لو خيروك ⇠  بين مشاركة المنزل مع عائلة من الفئران أو عائلة من الأشخاص المزعجين الفضوليين الذين يتدخلون في كل كبيرة وصغيرة؟ ",
} 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '', data = msg.sender_id.user_id..'/Haiw4'}, },}}
return LuaTele.sendText(msg_chat_id,msg_id, texting[math.random(#texting)],'md', false, false, false, false, reply_markup)
end
end
if text == "حروف" or text == "حرف" or text == "الحروف" then 
if Redis:get(FDFGERB.."FDFGERB:Status:Games"..msg.chat_id) then
local texting = {" جماد بحرف ⇠ ر  ", 
" مدينة بحرف ⇠ ع  ",
" حيوان ونبات بحرف ⇠ خ  ", 
" اسم بحرف ⇠ ح  ", 
" اسم ونبات بحرف ⇠ م  ", 
" دولة عربية بحرف ⇠ ق  ", 
" جماد بحرف ⇠ ي  ", 
" نبات بحرف ⇠ ج  ", 
" اسم بنت بحرف ⇠ ع  ", 
" اسم ولد بحرف ⇠ ع  ", 
" اسم بنت وولد بحرف ⇠ ث  ", 
" جماد بحرف ⇠ ج  ",
" حيوان بحرف ⇠ ص  ",
" دولة بحرف ⇠ س  ",
" نبات بحرف ⇠ ج  ",
" مدينة بحرف ⇠ ب  ",
" نبات بحرف ⇠ ر  ",
" اسم بحرف ⇠ ك  ",
" حيوان بحرف ⇠ ظ  ",
" جماد بحرف ⇠ ذ  ",
" مدينة بحرف ⇠ و  ",
" اسم بحرف ⇠ م  ",
" اسم بنت بحرف ⇠ خ  ",
" اسم و نبات بحرف ⇠ ر  ",
" نبات بحرف ⇠ و  ",
" حيوان بحرف ⇠ س  ",
" مدينة بحرف ⇠ ك  ",
" اسم بنت بحرف ⇠ ص  ",
" اسم ولد بحرف ⇠ ق  ",
" نبات بحرف ⇠ ز  ",
"  جماد بحرف ⇠ ز  ",
"  مدينة بحرف ⇠ ط  ",
"  جماد بحرف ⇠ ن  ",
"  مدينة بحرف ⇠ ف  ",
"  حيوان بحرف ⇠ ض  ",
"  اسم بحرف ⇠ ك  ",
"  نبات و حيوان و مدينة بحرف ⇠ س  ", 
"  اسم بنت بحرف ⇠ ج  ", 
"  مدينة بحرف ⇠ ت  ", 
"  جماد بحرف ⇠ ه  ", 
"  اسم بنت بحرف ⇠ ر  ", 
" اسم ولد بحرف ⇠ خ  ", 
" جماد بحرف ⇠ ع  ",
" حيوان بحرف ⇠ ح  ",
" نبات بحرف ⇠ ف  ",
" اسم بنت بحرف ⇠ غ  ",
" اسم ولد بحرف ⇠ و  ",
" نبات بحرف ⇠ ل  ",
"مدينة بحرف ⇠ ع  ",
"دولة واسم بحرف ⇠ ب  ",
} 
return LuaTele.sendText(msg_chat_id,msg_id,texting[math.random(#texting)],'md')
end
end
if text == "دول" then
if Redis:get(FDFGERB.."FDFGERB:Status:Games"..msg.chat_id) then
Country_Rand = {"مصر","العراق","السعوديه","المانيا","تونس","الجزائر","فلسطين","اليمن","المغرب","البحرين","فرنسا","سويسرا","تركيا","انجلترا","الولايات المتحده","كندا","الكويت","ليبيا","السودان","سوريا"}
name = Country_Rand[math.random(#Country_Rand)]
Redis:set(FDFGERB.."FDFGERB:Game:Countrygof"..msg.chat_id,name)
name = string.gsub(name,"مصر","🇪🇬")
name = string.gsub(name,"العراق","🇮🇶")
name = string.gsub(name,"السعوديه","🇸🇦")
name = string.gsub(name,"المانيا","🇩🇪")
name = string.gsub(name,"تونس","🇹🇳")
name = string.gsub(name,"الجزائر","🇩🇿")
name = string.gsub(name,"فلسطين","🇵🇸")
name = string.gsub(name,"اليمن","🇾🇪")
name = string.gsub(name,"المغرب","🇲🇦")
name = string.gsub(name,"البحرين","🇧🇭")
name = string.gsub(name,"فرنسا","🇫🇷")
name = string.gsub(name,"سويسرا","🇨🇭")
name = string.gsub(name,"انجلترا","🇬🇧")
name = string.gsub(name,"تركيا","🇹🇷")
name = string.gsub(name,"الولايات المتحده","🇱🇷")
name = string.gsub(name,"كندا","🇨🇦")
name = string.gsub(name,"الكويت","🇰🇼")
name = string.gsub(name,"ليبيا","🇱🇾")
name = string.gsub(name,"السودان","🇸🇩")
name = string.gsub(name,"سوريا","🇸🇾")
return LuaTele.sendText(msg_chat_id,msg_id," • دولة ⇠︎  ( "..name.." ) ","md",true)  
end
end
if text == 'اختبار' then
if Redis:get(FDFGERB.."FDFGERB:Status:Games"..msg.chat_id) then
kato = {'خطا','صح'};  --السؤال
name = kato[math.random(#kato)]
Redis:set(FDFGERB.."FDFGERB:Game:TrueFalse"..msg.chat_id,name)
name = string.gsub(name,'خطا','صحراء الربع الخالي هي اكثر الأماكن جفافا على سطح الارض؟') -- السؤال بطن والجواب بطون
name = string.gsub(name,'صح','زئير الاسد يمكن سماعه من على بعد 8 كيلومتر ؟')
name = string.gsub(name,'خطا','سور الصين العظيم هو الشي الذي  صنعه الانسان والذي يمكن رؤيته من القمر بالعين المجردة؟')
name = string.gsub(name,'صح','يولد الانسان وفي جسمه 300 عظمه الا ان ذلك العدد يتراجع الى 206 فقط عند سن البلوغ؟')
name = string.gsub(name,'صح','يوجد اكثر من 50 الف نهر في الصين؟')
name = string.gsub(name,'خطا','يستخدم الانسان 2٪؜ فقط من عقله؟')
name = string.gsub(name,'خطا','البرتقال هو اغنى الفواكه بفيتامين سي؟')
name = string.gsub(name,'صح','اطول عمر يمكن تعيشه ذبابة منزلية هو 14 يوم؟')
name = string.gsub(name,'خطا','القطط تحب اكل الفئران؟')
name = string.gsub(name,'صح','يمنع ان تكون سمينا في اليابان؟')
name = string.gsub(name,'خطا','يمتلك الاخطبوط قلبين؟')
name = string.gsub(name,'خطا','هناك مطاعم في الولايات المتحدة اكثر من المكتبات؟')
name = string.gsub(name,'خطا','دم الانسان في الاصل هو الازرق ولكن يصبح احمر عند اندماجه مع الاكسجين؟')
name = string.gsub(name,'صح','تمطر السماء جواهر على كوكب المشتري؟')
name = string.gsub(name,'صح','ملعقة صغيرة واحدة من العسل هي الكمية التي يمكن ل12 نحلة انتاجها طول حياتها؟')
name = string.gsub(name,'خطا','لا يجوز اخذ سيلفي في كوريا الجنوبية؟')
name = string.gsub(name,'صح','لا تستطيع التنفس من انفك بينما تتكلم؟')
name = string.gsub(name,'خطا','سيدني هي عاصمة استراليا؟ ')
name = string.gsub(name,'خطا','كلما كبر الانسان كلما زاد حجم عينه ؟ ')
name = string.gsub(name,'صح','لم تمطر 40 عام في مدينة كالاما؟')
name = string.gsub(name,'خطا','برج ايفل هو اطول برج في العالم؟')
name = string.gsub(name,'صح','اخترع الكرسي الكهربائي من قبل طبيب اسنان؟ ')
name = string.gsub(name,'خطا','اقدم لغة مكتوبة في التاريخ هي اليابانية؟')
name = string.gsub(name,'صح','عدد الدجاج في العالم اكثر من عدد البشر؟')
name = string.gsub(name,'خطا','برج خليفة هو الشي الوحيد الذي يمكن رؤيته من القمر بالعين المجردة ؟')
name = string.gsub(name,'خطا','اكبر جزيرة في البحر المتوسط هي جزر القمر؟')
name = string.gsub(name,'خطا','عدد السور المدنية هي 30 سورة؟ ')
name = string.gsub(name,'صح','القرد هو الحيوان الذي يصاب بالحصبة الالمانية كالانسان؟')
name = string.gsub(name,'صح','اصغر دولة في العالم هي الفاتيكان؟')
name = string.gsub(name,'خطا','هل عدد السجدات في القران 13؟')
name = string.gsub(name,'صح','الغاز الذي يستخدم في طيران المنطاد هو الهيليوم؟')
name = string.gsub(name,'خطا','هل كوكب المريخ هو اقرب كوكب للارض؟')
name = string.gsub(name,'صح','المكون الاساسي للزجاج هو الرمل؟')
name = string.gsub(name,'خطا','اصغر قارة في العالم هي اسيا؟')
name = string.gsub(name,'صح','الشوكولاته الداكنه تساعد على زيادة النشاط؟')
name = string.gsub(name,'صح','غاز الاوكسجين يسرع عملية الاحتراق؟')
name = string.gsub(name,'خطا','الكلية اكبر عضو بجسم الانسان؟')
name = string.gsub(name,'خطا','اطول نهر في العالم نهر الكونغو ؟')
name = string.gsub(name,'خطا','عملة الامارات هي الليرة؟') 
name = string.gsub(name,'خطا','عملة السعودية هي الدينار؟')
name = string.gsub(name,'خطا','يعتبر اللسان هو العضو في جسم الانسان المسؤول عن حاسة التذوق؟')
name = string.gsub(name,'خطا','الاردن هي اول دولة عربية تشرق عليها الشمس؟')
name = string.gsub(name,'خطا','الحوت الابيض هو الكائن الوحيد الي لا يمرض؟')
name = string.gsub(name,'خطا','ثعبان البحر هو الكائن الوحيد الذي يعيش للأبد؟')
name = string.gsub(name,'خطا','يعتبر الكوالا الحيوان الذي ذراعه اطول من جسمه؟')
name = string.gsub(name,'خطا','النعامة تدفن رأسها في الرمال خوفا من اعدائها؟')
name = string.gsub(name,'صح','عدد العضلات التي يستخدمها الانسان عند التحدث هي اربعة واربعون؟')
return LuaTele.sendText(msg_chat_id,msg_id,"• ارسل صح او غلط ⇠ ( "..name.." )","md",true)  
end
end
if text == "صور" or text == "ص" then
if Redis:get(FDFGERB.."FDFGERB:Status:Games"..msg.chat_id) then
KlamSpeed = {"نوتيلا","نسكفيه","شورما","ضب","قراند","ماك","قرش","ببجي","مسدس","برشلونه","كهف","قرفه","حلزون","قنديل","ماء","قاضي","نجار","شرطي","بولينق","بلياردو","تنس","مسبحه","فرشايه اسنان","معجون اسنان","فار","فهد","سجاده","مطرقه","فليك","مكسرات","قلب","عقال"};
name = KlamSpeed[math.random(#KlamSpeed)]
Redis:set(FDFGERB.."FDFGERB:shhseat"..msg.chat_id,name)
name = string.gsub(name,"نوتيلا","https://t.me/photoerin/26")
name = string.gsub(name,"نسكفيه","https://t.me/photoerin/37")
name = string.gsub(name,"ماك","https://t.me/photoerin/56")
name = string.gsub(name,"شورما","https://t.me/photoerin/57")
name = string.gsub(name,"ضب","https://t.me/photoerin/58")
name = string.gsub(name,"قراند","https://t.me/photoerin/59")
name = string.gsub(name,"قرش","https://t.me/photoerin/60")
name = string.gsub(name,"ببجي","https://t.me/photoerin/61")
name = string.gsub(name,"مسدس","https://t.me/photoerin/62")
name = string.gsub(name,"برشلونه","https://t.me/photoerin/63")
name = string.gsub(name,"كهف","https://t.me/photoerin/64")
name = string.gsub(name,"قرفه","https://t.me/photoerin/70")
name = string.gsub(name,"حلزون","https://t.me/photoerin/71")
name = string.gsub(name,"قنديل","https://t.me/photoerin/72")
name = string.gsub(name,"ماء","https://t.me/photoerin/73")
name = string.gsub(name,"قاضي","https://t.me/photoerin/74")
name = string.gsub(name,"نجار","https://t.me/photoerin/75")
name = string.gsub(name,"شرطي","https://t.me/photoerin/76")
name = string.gsub(name,"بولينق","https://t.me/photoerin/80")
name = string.gsub(name,"بلياردو","https://t.me/photoerin/81")
name = string.gsub(name,"تنس","https://t.me/photoerin/82")
name = string.gsub(name,"مسبحه","https://t.me/photoerin/85")
name = string.gsub(name,"فرشايه اسنان","https://t.me/photoerin/86")
name = string.gsub(name,"معجون اسنان","https://t.me/photoerin/87")
name = string.gsub(name,"فار","https://t.me/photoerin/88")
name = string.gsub(name,"فهد","https://t.me/photoerin/89")
name = string.gsub(name,"سجاده","https://t.me/photoerin/90")
name = string.gsub(name,"مطرقه","https://t.me/photoerin/91")
name = string.gsub(name,"فليك","https://t.me/photoerin/92")
name = string.gsub(name,"مكسرات","https://t.me/photoerin/93")
name = string.gsub(name,"قلب","https://t.me/photoerin/94")
name = string.gsub(name,"عقال","https://t.me/photoerin/95")
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id="..msg.chat_id.."&photo="..name.."&caption="..URL.escape("اسرع واحد يقول اسم ذا").."&reply_to_message_id="..(msg.id/2097152/0.5))
end
end
if text == "انقليزي" then
if Redis:get(FDFGERB.."FDFGERB:Status:Games"..msg.chat_id) then
KlamSpeed = {"دكتور","مدينة","راس","بنت","ولد","اغاني","غبي","القهوة","قبعة","لاعب","طاه","معلومة","زجاج","أمير","صادق","سائق","باص","شاعر","تفاحة","عسل","حزين","شاطئ","كلب","دب","جوعان","طيار","أسود","قرية","سجن","عائلة","كسول","شجاع","صندوق","دكتور","قناة","المعجب","سيارة","صغيرة","الآن","يد"};
name = KlamSpeed[math.random(#KlamSpeed)]
Redis:set(FDFGERB.."FDFGERB:Game:Englishlol"..msg.chat_id,name)
name = string.gsub(name,"دكتور","doctor")
name = string.gsub(name,"شرطي","policeman")
name = string.gsub(name,"راس","head")
name = string.gsub(name,"بنت","Girl")
name = string.gsub(name,"ولد","Boy")
name = string.gsub(name,"اغاني","song")
name = string.gsub(name,"غبي","stupid")
name = string.gsub(name,"القهوة","coffee")
name = string.gsub(name,"قبعة","hat")
name = string.gsub(name,"لاعب","player")
name = string.gsub(name,"طاه","Chef")
name = string.gsub(name,"معلومة","information")
name = string.gsub(name,"زجاج","glass")
name = string.gsub(name,"أمير","prince")
name = string.gsub(name,"صادق","Honest")
name = string.gsub(name,"سائق","driver")
name = string.gsub(name,"باص","bus")
name = string.gsub(name,"شاعر","Poet")
name = string.gsub(name,"تفاحة","Apple")
name = string.gsub(name,"عسل","honey")
name = string.gsub(name,"حزين","sad")
name = string.gsub(name,"شاطئ","Beach")
name = string.gsub(name,"كلب","dog")
name = string.gsub(name,"دب","bear")
name = string.gsub(name,"جوعان","hungry")
name = string.gsub(name,"طيار","Pilot")
name = string.gsub(name,"أسود","black")
name = string.gsub(name,"قرية","town")
name = string.gsub(name,"سجن","prison")
name = string.gsub(name,"عائلة","family")
name = string.gsub(name,"كسول","lazy")
name = string.gsub(name,"شجاع","Brave")
name = string.gsub(name,"صندوق","box")
name = string.gsub(name,"دكتور","doctor")
name = string.gsub(name,"قناة","Channel")
name = string.gsub(name,"المعجب","fan")
name = string.gsub(name,"سيارة","car")
name = string.gsub(name,"صغيرة","young")
name = string.gsub(name,"الآن","now")
name = string.gsub(name,"يد","Hand")
return LuaTele.sendText(msg_chat_id,msg_id,"•  معنى ⇠ ( "..name.." )","md",true)  
end
end
if text == "اعلام" then
if Redis:get(FDFGERB.."FDFGERB:Status:Games"..msg.chat_id) then
KlamSpeed = {"🇯🇴","🇰🇼","🇸🇦","🇧🇭","🇶🇦","🇦🇹","🇰🇵","🇵🇸","🇩🇪","🇨🇳","🇪🇹","🇸🇩","🇰🇪","🇷🇺","🇺🇦","🇳🇴","🇱🇧","🇲🇦","🇹🇳","🇪🇬","🇮🇹","🇦🇺","🏴󠁧󠁢󠁷󠁬󠁳󠁿","🇺🇸","🇫🇷","🇬🇧","🇳🇱","🇮🇳","🇵🇰","🇧🇪","🇯🇵","🇧🇷","🇦🇪","🇷🇴","🇨🇿","🇨🇺","🇹🇷","🇨🇱","🇪🇸","🇵🇹"};
name = KlamSpeed[math.random(#KlamSpeed)]
Redis:set(FDFGERB.."FDFGERB:Game:doll"..msg.chat_id,name)
name = string.gsub(name,"🇯🇴","الاردن")
name = string.gsub(name,"🇰🇼","الكويت")
name = string.gsub(name,"🇸🇦","السعودية")
name = string.gsub(name,"🇧🇭","البحرين")
name = string.gsub(name,"🇶🇦","قطر")
name = string.gsub(name,"🇦🇹","النمسا")
name = string.gsub(name,"🇰🇵","كوريا الشمالية")
name = string.gsub(name,"🇵🇸","فلسطين")
name = string.gsub(name,"🇩🇪","المانيا")
name = string.gsub(name,"🇨🇳","الصين")
name = string.gsub(name,"🇪🇹","اثيوبيا")
name = string.gsub(name,"🇸🇩","السودان")
name = string.gsub(name,"🇰🇪","كينيا")
name = string.gsub(name,"🇷🇺","روسيا")
name = string.gsub(name,"🇺🇦","اوكرانيا")
name = string.gsub(name,"🇳🇴","النرويج")
name = string.gsub(name,"🇱🇧","لبنان")
name = string.gsub(name,"🇲🇦","المغرب")
name = string.gsub(name,"🇹🇳","تونس")
name = string.gsub(name,"🇪🇬","مصر")
name = string.gsub(name,"🇮🇹","إيطاليا")
name = string.gsub(name,"🇦🇺","استراليا")
name = string.gsub(name,"🏴󠁧󠁢󠁷󠁬󠁳󠁿","ويلز")
name = string.gsub(name,"🇺🇸","أمريكا")
name = string.gsub(name,"🇫🇷","فرنسا")
name = string.gsub(name,"🇬🇧","بريطانيا")
name = string.gsub(name,"🇳🇱","هولندا")
name = string.gsub(name,"🇮🇳","الهند")
name = string.gsub(name,"🇵🇰","باكستان")
name = string.gsub(name,"🇧🇪","بلجيكا")
name = string.gsub(name,"🇯🇵","اليابان")
name = string.gsub(name,"🇧🇷","البرازيل")
name = string.gsub(name,"🇦🇪","الإمارات")
name = string.gsub(name,"🇷🇴","رومانيل")
name = string.gsub(name,"🇨🇿","التشيك")
name = string.gsub(name,"🇨🇺","كوبا")
name = string.gsub(name,"🇹🇷","تركيا")
name = string.gsub(name,"🇨🇱","تشيلي")
name = string.gsub(name,"🇪🇸","اسبانيا")
name = string.gsub(name,"🇵🇹","البرتغال")
return LuaTele.sendText(msg_chat_id,msg_id,"• علم ⇠ ( "..name.." )","md",true)  
end 
end
if text == "تفكيك" then
if Redis:get(FDFGERB.."FDFGERB:Status:Games"..msg.chat_id) then
KlamSpeed = {"س ح  و ر","س ي ا ر ه","م و س م ","ف ن ا ن","ا ي ف و ن","ح ل ا و ه","م ط ب خ","ك ر س ي ا ن و","د ج ا ج ه","م د ر س ه","ا ل و ا ن","غ ر ف ه","ث ل ا ج ه","ق ه و ه","س ف ي ن ه","ا ل س ر ا ج","م ح ط ه","ط ي ا ر ه","ر ا د ا ر","م ن ز ل","م س ت ش ف ى","ك ه ر ب ا ء","ت ف ا ح ه","ا خ ط ب و ط","س ل م و ن","ف ر ن س ا","ب ر ت ق ا ل ه","ت ف ا ح","م ط ر ق ه","س ر و ا ل","ق ط ا ر","ش ب ا ك","ب ا ص","س م ك ه","ذ ب ا ب","ت ل ف ا ز","ح ا س و ب","ا ن ت ر ن ي ت","س ا ح ه","ج س ر"};
name = KlamSpeed[math.random(#KlamSpeed)]
Redis:set(FDFGERB.."FDFGERB:Game:iui"..msg.chat_id,name)
name = string.gsub(name,"س ح و ر","سحور")
name = string.gsub(name,"س ي ا ر ه","سياره")
name = string.gsub(name,"م و س م","موسم")
name = string.gsub(name,"ف ن ا ن","فنان")
name = string.gsub(name,"ا ي ف و ن"," ايفون")
name = string.gsub(name,"ح ل ا و ه","حلاوه")
name = string.gsub(name,"م ط ب خ","مطبخ")
name = string.gsub(name,"ك ر س ت ي ا ن و","كرستيانو")
name = string.gsub(name,"د ج ا ج ه","دجاجه")
name = string.gsub(name,"م د ر س ه","مدرسه ")
name = string.gsub(name,"ا ل و ا ن","الوان")
name = string.gsub(name,"ع ر ف ه","غرفه ")
name = string.gsub(name,"ث ل ا ج ه","ثلاجه")
name = string.gsub(name,"ق ه و ه","قهوه")
name = string.gsub(name,"س ف ي ن ه","سفينه")
name = string.gsub(name,"ا ل س ر ا ج","السراج")
name = string.gsub(name,"م ح ط ه","محطه")
name = string.gsub(name,"ط ي ا ر ه"," طياره")
name = string.gsub(name,"ر ا د ا ر","رادار")
name = string.gsub(name,"م ن ز ل","منزل")
name = string.gsub(name,"م س ت ش ف ى"," مستشفى")
name = string.gsub(name,"ك ه ر ب ا ء","كهرباء")
name = string.gsub(name,"ت ف ا ح ه","تفاحه")
name = string.gsub(name,"ا خ ط ب و ط","اخطبوط")
name = string.gsub(name,"س ل م و ن","سلمون")
name = string.gsub(name,"ف ر ن س ا","فرنسا")
name = string.gsub(name,"ب ر ت ق ا ل ه","برتقاله")
name = string.gsub(name,"ت ف ا ح","تفاح")
name = string.gsub(name,"م ط ر ق ه","مطرقه")
name = string.gsub(name,"س ر و ا ل","سروال")
name = string.gsub(name,"ق ط ا ر","قطار")
name = string.gsub(name,"ش ب ا ك","شباك")
name = string.gsub(name,"ب ا ص","باص")
name = string.gsub(name,"س م ك ه","سمكه")
name = string.gsub(name,"ذ ب ا ب","ذباب")
name = string.gsub(name,"ت ل ف ا ز","تلفاز")
name = string.gsub(name,"ح ا س و ب","حاسوب")
name = string.gsub(name,"ا ن ت ر ن ي ت","انترنيت")
name = string.gsub(name,"س ا ح ه","ساحه")
name = string.gsub(name,"ج س ر","جسر")
return LuaTele.sendText(msg_chat_id,msg_id,"• فك الكلمه  ⇠ ( "..name.." )","md",true)  
end
end
if text == "كلمات" then
if Redis:get(FDFGERB.."FDFGERB:Status:Games"..msg.chat_id) then
KlamSpeed = {"كلب","جوال","مناكير","قلم","عام","توصيلة","رياضة","روبوتات","الوان","كمامة","بطانية","طفل","لوحة","ثعبان","طعام","سهم","بلاستيك","كوب","سماعة","سرير","دلفين","سلك","مفتاح","كورة","بيانو","قهوة","تماسيح","لمبة","القسطنطينية","دولاب","كرتون","مناديل","دزة","مسلسل","لعبة","كوب","عشب","ستارة","ورد","عصير"};
name = KlamSpeed[math.random(#KlamSpeed)]
Redis:set(FDFGERB.."FDFGERB:Game:ouo"..msg.chat_id,name)
name = string.gsub(name,"كلب","كلب")
name = string.gsub(name,"جوال","جوال")
name = string.gsub(name,"مناكير","مناكير")
name = string.gsub(name,"قلم","قلم")
name = string.gsub(name,"عام","عام")
name = string.gsub(name,"توصيلة","توصيلة")
name = string.gsub(name,"رياضة","رياضة")
name = string.gsub(name,"روبوتات","روبوتات")
name = string.gsub(name,"الوان","الوان")
name = string.gsub(name,"كمامة","كمامة")
name = string.gsub(name,"بطانية","بطانية")
name = string.gsub(name,"طفل","طفل")
name = string.gsub(name,"لوحة","لوحة")
name = string.gsub(name,"ثعبان","ثعبان")
name = string.gsub(name,"طعام","طعام")
name = string.gsub(name,"سهم","سهم")
name = string.gsub(name,"بلاستيك","بلاستيك")
name = string.gsub(name,"كوب","كوب")
name = string.gsub(name,"سماعة","سماعة")
name = string.gsub(name,"سرير","سرير")
name = string.gsub(name,"دلفين","دلفين")
name = string.gsub(name,"سلك","سلك")
name = string.gsub(name,"مفتاح","مفتاح")
name = string.gsub(name,"كورة","كورة")
name = string.gsub(name,"بيانو","بيانو")
name = string.gsub(name,"قهوة","قهوة")
name = string.gsub(name,"تماسيح","تماسيح")
name = string.gsub(name,"لمبة","لمبة")
name = string.gsub(name,"القسطنطينة","القسطنطية")
name = string.gsub(name,"دولاب","دولاب")
name = string.gsub(name,"كرتون","كرتون")
name = string.gsub(name,"مناديل","مناديل")
name = string.gsub(name,"دزة","دزة")
name = string.gsub(name,"مسلسل","مسلسل")
name = string.gsub(name,"لعبة","لعبة")
name = string.gsub(name,"كوب","كوب")
name = string.gsub(name,"عشب","عشب")
name = string.gsub(name,"ستارة","ستارة")
name = string.gsub(name,"ورد","ورد")
name = string.gsub(name,"عصير","عصير")
return LuaTele.sendText(msg_chat_id,msg_id,"• اكتب الكلمه ⇠ ( "..name.." )","md",true)  
end
end
if text == "رياضيات" or tect == "ري" then
if Redis:get(FDFGERB.."FDFGERB:Status:Games"..msg.chat_id) then
KlamSpeed = {"95","399","144","119","-2","9","8","55","511","114","877","153","509","932","211","7","67","143","515","515",};
name = KlamSpeed[math.random(#KlamSpeed)]
Redis:set(FDFGERB.."FDFGERB:Game:Math"..msg.chat_id,name)
name = string.gsub(name,"95","12+83")
name = string.gsub(name,"399","491-92")
name = string.gsub(name,"9","3+6")
name = string.gsub(name,"119","37+82")
name = string.gsub(name,"-2","5+18-25")
name = string.gsub(name,"877","300+827-250")
name = string.gsub(name,"8","2+7-1")
name = string.gsub(name,"55","36+19")
name = string.gsub(name,"114","6+8+100")
name = string.gsub(name,"143","62+72")
name = string.gsub(name,"144","62+82")
name = string.gsub(name,"153","72+81")
name = string.gsub(name,"932","566+566-200")
name = string.gsub(name,"211","139+72")
name = string.gsub(name,"7","6+7-6")
name = string.gsub(name,"67","55+12")
name = string.gsub(name,"515","514+1")
name = string.gsub(name,"515","100+415")
name = string.gsub(name,"511","500+11")
name = string.gsub(name,"509","500+9")
return LuaTele.sendText(msg_chat_id,msg_id,"• رياضيات ⇠ ( "..name.." )","md",true)  
end
end
if text == "تركيب" then
if Redis:get(FDFGERB.."FDFGERB:Status:Games"..msg.chat_id) then
KlamSpeed = {"سحور","سياره","استقبال","قنفه","ايفون","بزونه","مطبخ","كرستيانو","دجاجه","مدرسه","الوان","غرفه","ثلاجه","قهوه","سفينه","بريطانيا","محطه","طياره","رادار","منزل","مستشفى","كهرباء","تفاحه","اخطبوط","سلمون","فرنسا","برتقاله","تفاح","مطرقه","بتيته","لهانه","شباك","باص","سمكه","ذباب","تلفاز","حاسوب","انترنيت","ساحه","جسر"};
name = KlamSpeed[math.random(#KlamSpeed)]
Redis:set(FDFGERB.."FDFGERB:Game:karamece"..msg.chat_id,name)
name = string.gsub(name,"سحور","س ح و ر")
name = string.gsub(name,"سياره","س ي ا ر ه")
name = string.gsub(name,"استقبال","ا س ت ق ب ا ل")
name = string.gsub(name,"قنفه","ق ن ف ه")
name = string.gsub(name,"ايفون","ا ي ف و ن")
name = string.gsub(name,"بزونه","ب ز و ن ه")
name = string.gsub(name,"مطبخ","م ط ب خ")
name = string.gsub(name,"كرستيانو","ك ر س ت ي ا ن و")
name = string.gsub(name,"دجاجه","د ج ا ج ه")
name = string.gsub(name,"مدرسه","م د ر س ه")
name = string.gsub(name,"الوان","ا ل و ا ن")
name = string.gsub(name,"غرفه","غ ر ف ه")
name = string.gsub(name,"ثلاجه","ث ل ا ج ه")
name = string.gsub(name,"قهوه","ق ه و ه")
name = string.gsub(name,"سفينه","س ف ي ن ه")
name = string.gsub(name,"بريطانيا","ب ر ي ط ا ن ي ا")
name = string.gsub(name,"محطه","م ح ط خ")
name = string.gsub(name,"طياره","ط ي ا ر ه")
name = string.gsub(name,"رادار","ر ا د ا ر")
name = string.gsub(name,"منزل","م ن ز ل")
name = string.gsub(name,"مستشفى","م س ت ش ف ى")
name = string.gsub(name,"كهرباء","ك ه ر ب ا ء")
name = string.gsub(name,"تفاحه","ت ف ا ح خ")
name = string.gsub(name,"اخطبوط","ا خ ط ب و ط")
name = string.gsub(name,"سلمون","س ل م و ن")
name = string.gsub(name,"فرنسا","ف ر ن س ا")
name = string.gsub(name,"برتقاله","ب ر ت ق ا ل ه")
name = string.gsub(name,"تفاح","ت ف ا ك")
name = string.gsub(name,"مطرقه","م ط ر ق ه")
name = string.gsub(name,"بتيته","ب ت ي ت ه")
name = string.gsub(name,"لهانه","ل ه ا ن ه")
name = string.gsub(name,"شباك","ش ب ا ك")
name = string.gsub(name,"باص","ب ا ص")
name = string.gsub(name,"سمكه","س م ك ه")
name = string.gsub(name,"ذباب","ذ ب ا ب")
name = string.gsub(name,"تلفاز","ت ل ف ا ز")
name = string.gsub(name,"حاسوب","ح ا س و ب")
name = string.gsub(name,"انترنيت","ا ن ت ر ن ي ت")
name = string.gsub(name,"ساحه","س ا ح ه")
name = string.gsub(name,"جسر","ج س ر")
return LuaTele.sendText(msg_chat_id,msg_id,"تركيب ⇠ ( "..name.." )","md",true)  
end
end
if text == "عواصم" then
if Redis:get(FDFGERB.."FDFGERB:Status:Games"..msg.chat_id) then
katu = {"تيرانا","لواندا","كانبيرا","باكو","المنامة","بروكسل","تيمفو","القدس","الدوحة","الرياض","بغداد","دمشق","القاهرة","صنعاء","عمان","الكويت","برلين","الجزائر","باريس","طهران","روما","طوكيو","طرابلس","الرباط","مسقط"}
name = katu[math.random(#katu)]
Redis:set(FDFGERB.."FDFGERB:Game:gamsloner"..msg.chat_id,name)
name = string.gsub(name,"تيرانا","البانيا")
name = string.gsub(name,"لواندا","أنغولا")
name = string.gsub(name,"كانبيرا","استراليا")
name = string.gsub(name,"باكو","أذربيجان")
name = string.gsub(name,"المنامة","البحرين")
name = string.gsub(name,"بروكسل","بلجيكا")
name = string.gsub(name,"تيمفو","بوتان")
name = string.gsub(name,"القدس","فلسطين")
name = string.gsub(name,"الدوحة","قطر")
name = string.gsub(name,"الرياض","السعودية")
name = string.gsub(name,"بغداد","العراق")
name = string.gsub(name,"دمشق","سوريا")
name = string.gsub(name,"القاهرة","مصر")
name = string.gsub(name,"صنعاء","اليمن")
name = string.gsub(name,"عمان","الاردن")
name = string.gsub(name,"الكويت","الكويت")
name = string.gsub(name,"برلين","المانيا")
name = string.gsub(name,"الجزائر","الجزائر")
name = string.gsub(name,"باريس","فرنسا")
name = string.gsub(name,"طهران","ايران")
name = string.gsub(name,"روما","إيطاليا")
name = string.gsub(name,"طوكيو","اليابان")
name = string.gsub(name,"طرابلس","ليبيا")
name = string.gsub(name,"الرباط","المغرب")
name = string.gsub(name,"مسقط","سلطنة عمان")
return LuaTele.sendText(msg_chat_id,msg_id,"• عاصمه ⇠ "..name.."","md",true)  
end
end
if text == 'روليت' then
if not Redis:get(FDFGERB.."FDFGERB:Status:Games"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id," • تم تعطيل الالعاب من قبل المدراء","md",true)  
end
Redis:del(FDFGERB.."Add:friends"..msg.chat_id..msg.sender_id.user_id) 
Redis:del(FDFGERB..'listNum'..msg.chat_id)  
Redis:setex(FDFGERB.."str:rolet"..msg.chat_id..msg.sender_id.user_id,3600,true)  
LuaTele.sendText(msg.chat_id,msg.id,"• ارسل عدد اللاعبين للروليت","md",true)  
end
if text == 'المشاركين' and Redis:get(FDFGERB..":started:"..msg.chat_id..msg.sender_id.user_id) then
local list = Redis:smembers(FDFGERB..'listNum'..msg.chat_id) 
local Text = '\n  ---------------- \n'
if #list == 0 then 
LuaTele.sendText(msg.chat_id,msg.id,"• لا يوجد لاعبين","md",true)
return false
end  
for k, v in pairs(list) do 
Text = Text..k.."-  [" ..v.."] .\n"  
end 
return LuaTele.sendText(msg.chat_id,msg.id,Text,"md",true)  
end
if text == 'نعم' and Redis:get(FDFGERB..":started:"..msg.chat_id..msg.sender_id.user_id) then
local list = Redis:smembers(FDFGERB..'listNum'..msg.chat_id) 
if #list == 1 then 
LuaTele.sendText(msg.chat_id,msg.id,"• لم يكتمل العدد الكلي للاعبين","md",true)  
elseif #list == 0 then 
LuaTele.sendText(msg.chat_id,msg.id,"• عذرا لم تقوم باضافه اي لاعب","md",true)  
return false
end 
local UserName = list[math.random(#list)]
local User_ = UserName:match("^@(.*)$")
local UserId_Info = LuaTele.searchPublicChat(User_)
if (UserId_Info.id) then
local jjjo = math.random(200,1000);
Redis:incrby(FDFGERB.."boob"..msg.sender_id.user_id , jjjo)
Redis:del(FDFGERB..'listNum'..msg.chat_id) 
ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
Redis:del(FDFGERB..":started:"..msg.chat_id..msg.sender_id.user_id)
LuaTele.sendText(msg.chat_id,msg.id,"• مبروك يا "..UserName.." لقد فزت \n• اعطيتك : "..ballancee.."💸\n• ارسل مره اخرا روليت للعب وزيادة فلوسك 💸 .\n-","md",true)  
return false
end
end

if text and text:match('^(@[%a%d_]+)$') and Redis:get(FDFGERB.."Add:friends"..msg.chat_id..msg.sender_id.user_id) then
if Redis:sismember(FDFGERB..'listNum'..msg.chat_id,text) then
LuaTele.sendText(msg.chat_id,msg.id," • المعرف ["..text.." ] موجود سابقا ارسل معرف لم يشارك","md",true)  
return false
end 
Redis:sadd(FDFGERB..'listNum'..msg.chat_id,text)
local CountAdd = Redis:get(FDFGERB.."Add:friends"..msg.chat_id..msg.sender_id.user_id)
local CountAll = Redis:scard(FDFGERB..'listNum'..msg.chat_id)
local CountUser = CountAdd - CountAll
if tonumber(CountAll) == tonumber(CountAdd) then 
Redis:del(FDFGERB.."Add:friends"..msg.chat_id..msg.sender_id.user_id) 
Redis:setex(FDFGERB..":started:"..msg.chat_id..msg.sender_id.user_id,1400,true)  
LuaTele.sendText(msg.chat_id,msg.id,"• تم حفظ المعرف "..text.."\n• تم اكمال العدد الكلي\n• ارسل (نعم) للبدء","md",true)  
return false
end  
LuaTele.sendText(msg.chat_id,msg.id,"• تم حفظ المعرف "..text.."\n• تبقى "..CountUser.." لاعبين ليكتمل العدد\n• ارسل المعرف التالي","md",true)  
return false
end 
if text and text:match("^(%d+)$") and Redis:get(FDFGERB.."str:rolet"..msg.chat_id..msg.sender_id.user_id) then
if text == "1" then
LuaTele.sendText(msg.chat_id,msg.id,"• لا استطيع بدء اللعبه بلاعب واحد فقط","md",true)
elseif text ~= "1" then
Redis:set(FDFGERB.."Add:friends"..msg.chat_id..msg.sender_id.user_id,text)  
Redis:del(FDFGERB.."str:rolet"..msg.chat_id..msg.sender_id.user_id)  
LuaTele.sendText(msg.chat_id,msg.id,"• قم  بأرسال معرفات اللاعبين الان","md",true)
return false
end
end
if text == 'عقاب' then
if not Redis:get(FDFGERB.."FDFGERB:Status:Games"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id," • تم تعطيل الالعاب من قبل المدراء","md",true)  
end
Redis:del(FDFGERB..'List_Ahkamm'..msg.chat_id)  
Redis:set(FDFGERB.."raeahkamm"..msg.chat_id,msg.sender_id.user_id)
Redis:sadd(FDFGERB..'List_Ahkamm'..msg.chat_id,msg.sender_id.user_id)
Redis:setex(FDFGERB.."Start_Ahkamm"..msg.chat_id,3600,true)
return LuaTele.sendText(msg.chat_id,msg.id,"• تم بدء اللعبة وتم تسجيلك \n• اللي بيلعب يرسل ( انا ) .","md",true)
end
if text == 'نعم' and Redis:get(FDFGERB.."Witting_StartGamehh"..msg.chat_id) then
rarahkam = Redis:get(FDFGERB.."raeahkamm"..msg.chat_id)
if tonumber(rarahkam) == msg.sender_id.user_id then
local list = Redis:smembers(FDFGERB..'List_Ahkamm'..msg.chat_id) 
if #list == 1 then 
return LuaTele.sendText(msg.chat_id,msg.id,"• عذراً لم يشارك اي لاعب","md",true)  
end 
local UserName = list[math.random(#list)]

local UserId_Info = LuaTele.getUser(UserName)
if UserId_Info.username and UserId_Info.username ~= "" then
ls = '@['..UserId_Info.username..']'
else
ls = '['..UserId_Info.first_name..'](tg://user?id='..UserName..')'
end
Redis:incrby(FDFGERB..'Num:Add:Games'..msg.chat_id..UserId_Info.id,5)
Redis:del(FDFGERB..'raeahkamm'..msg.chat_id) 
Redis:del(FDFGERB..'List_Ahkamm'..msg.chat_id) 
Redis:del(FDFGERB.."Witting_StartGamehh"..msg.chat_id)
Redis:del(FDFGERB.."Start_Ahkamm"..msg.chat_id)
katu = {
"**صورة وجهك او رجلك او خشمك او يدك**.",
"**اصدر اي صوت يطلبه منك الاعبين**.",
"**سكر خشمك و قول كلمة من اختيار الاعبين الي معك**.",
"**روح الى اي قروب عندك في الواتس اب و اكتب اي شيء يطلبه منك الاعبين  الحد الاقصى 3 رسائل**.",
"**قول نكتة ولازم احد الاعبين يضحك اذا ضحك يعطونك ميوت الى ان يجي دورك مرة ثانية**.",
"**سمعنا صوتك و غن اي اغنية من اختيار الاعبين الي معك**.",
"**ذي المرة لك لا تعيدها**.",
"**ارمي جوالك على الارض بقوة و اذا انكسر صور الجوال و ارسله في الشات العام**.",
"**صور اي شيء يطلبه منك الاعبين**.",
"**اتصل على ابوك و قول له انك رحت مع بنت و احين هي حامل....**.",
"**سكر خشمك و قول كلمة من اختيار الاعبين الي معك**.",
"**اعطي اي احد جنبك كف اذا مافيه احد جنبك اعطي نفسك و نبي نسمع صوته**.",
"**ارمي جوالك على الارض بقوة و اذا انكسر صور الجوال و ارسله في الشات العام**.",
"**روح عند اي احد بالخاص و قول له انك تحبه و الخ**.",
"**اكتب في الشات اي شيء يطلبه منك الاعبين في الخاص**.",
"**قول نكتة اذا و لازم احد الاعبين يضحك اذا محد ضحك يعطونك ميوت الى ان يجي دورك مرة ثانية**.",
"**سامحتك خلاص مافيه عقاب لك **.",
"**اتصل على احد من اخوياك  خوياتك , و اطلب منهم مبلغ على اساس انك صدمت بسيارتك**.",
"**غير اسمك الى اسم من اختيار الاعبين الي معك**.",
"**اتصل على امك و قول لها انك تحبها **.",
"**لا يوجد سؤال لك سامحتك **.",
"**قل لواحد ماتعرفه عطني كف**.",
"**منشن الجميع وقل انا اكرهكم**.",
"**اتصل لاخوك و قول له انك سويت حادث و الخ....**.",
"**روح المطبخ و اكسر صحن **.",
"**اعطي اي احد جنبك كف اذا مافيه احد جنبك اعطي نفسك و نبي نسمع صوت الكف**.",
"**قول لاي بنت موجود في الروم كلمة حلوه**.",
"**تكلم باللغة الانجليزية الين يجي دورك مرة ثانية لازم تتكلم اذا ما تكلمت تنفذ عقاب ثاني**.",
"**لا تتكلم ولا كلمة الين يجي دورك مرة ثانية و اذا تكلمت يجيك باند لمدة يوم كامل من السيرفر**.",
"**قول قصيدة **.",
"**تكلم باللهجة السودانية الين يجي دورك مرة ثانية**.",
"**اتصل على احد من اخوياك  خوياتك , و اطلب منهم مبلغ على اساس انك صدمت بسيارتك**.",
"**اول واحد تشوفه عطه كف**.",
"**سو مشهد تمثيلي عن اي شيء يطلبه منك الاعبين**.",
"**سامحتك خلاص مافيه عقاب لك **.",
"**اتصل على ابوك و قول له انك رحت مع بنت و احين هي حامل....**.",
"**روح اكل ملح + ليمون اذا مافيه اكل اي شيء من اختيار الي معك**.",
"**تاخذ عقابين**.",
"**قول اسم امك افتخر بأسم امك**.",
"**ارمي اي شيء قدامك على اي احد موجود او على نفسك**.",
"**اذا انت ولد اكسر اغلى او احسن عطور عندك اذا انتي بنت اكسري الروج حقك او الميك اب حقك**.",
"**اذهب الى واحد ماتعرفه وقل له انا كيوت وابي بوسه**.",
"**تتصل على الوالده  و تقول لها خطفت شخص**.",
"** تتصل على الوالده  و تقول لها تزوجت با سر**.",
"**اتصل على الوالده  و تقول لها  احب وحده**.",
"**تتصل على شرطي تقول له عندكم مطافي**.",
"**خلاص سامحتك**.",
"** تصيح في الشارع انا  مجنوون**.",
"** تروح عند شخص وقول له احبك**."
}
name = katu[math.random(#katu)]
return LuaTele.sendText(msg.chat_id,msg.id,'• تم اختيار '..ls..' لمعاقبته\n• العقوبة هي ( '..name..' ) ',"md",true)
end
end

if text == 'احكام' or text == 'حكم' then
if not Redis:get(FDFGERB.."FDFGERB:Status:Games"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id," • تم تعطيل الالعاب من قبل المدراء","md",true)  
end
Redis:del(FDFGERB..'List_Ahkam'..msg.chat_id)  
Redis:set(FDFGERB.."raeahkam"..msg.chat_id,msg.sender_id.user_id)
Redis:sadd(FDFGERB..'List_Ahkam'..msg.chat_id,msg.sender_id.user_id)
Redis:setex(FDFGERB.."Start_Ahkam"..msg.chat_id,3600,true)
return LuaTele.sendText(msg.chat_id,msg.id,"• تم بدء اللعبة وتم تسجيلك \n• اللي بيلعب يرسل ( انا ) .","md",true)
end
if text == 'نعم' and Redis:get(FDFGERB.."Witting_StartGameh"..msg.chat_id) then
rarahkam = Redis:get(FDFGERB.."raeahkam"..msg.chat_id)
if tonumber(rarahkam) == msg.sender_id.user_id then
local list = Redis:smembers(FDFGERB..'List_Ahkam'..msg.chat_id) 
if #list == 1 then 
return LuaTele.sendText(msg.chat_id,msg.id,"• عذراً لم يشارك اي لاعب","md",true)  
end 
local UserName = list[math.random(#list)]

local UserId_Info = LuaTele.getUser(UserName)
if UserId_Info.username and UserId_Info.username ~= "" then
ls = '@['..UserId_Info.username..']'
else
ls = '['..UserId_Info.first_name..'](tg://user?id='..UserName..')'
end
Redis:incrby(FDFGERB..'Num:Add:Games'..msg.chat_id..UserId_Info.id,5)
Redis:del(FDFGERB..'raeahkam'..msg.chat_id) 
Redis:del(FDFGERB..'List_Ahkam'..msg.chat_id) 
Redis:del(FDFGERB.."Witting_StartGameh"..msg.chat_id)
Redis:del(FDFGERB.."Start_Ahkam"..msg.chat_id)
katu = {
"**صورة وجهك او رجلك او خشمك او يدك**.",
"**اصدر اي صوت يطلبه منك الاعبين**.",
"**سكر خشمك و قول كلمة من اختيار الاعبين الي معك**.",
"**روح الى اي قروب عندك في الواتس اب و اكتب اي شيء يطلبه منك الاعبين  الحد الاقصى 3 رسائل**.",
"**قول نكتة ولازم احد الاعبين يضحك اذا ضحك يعطونك ميوت الى ان يجي دورك مرة ثانية**.",
"**سمعنا صوتك و غن اي اغنية من اختيار الاعبين الي معك**.",
"**ذي المرة لك لا تعيدها**.",
"**ارمي جوالك على الارض بقوة و اذا انكسر صور الجوال و ارسله في الشات العام**.",
"**صور اي شيء يطلبه منك الاعبين**.",
"**اتصل على ابوك و قول له انك رحت مع بنت و احين هي حامل....**.",
"**سكر خشمك و قول كلمة من اختيار الاعبين الي معك**.",
"**اعطي اي احد جنبك كف اذا مافيه احد جنبك اعطي نفسك و نبي نسمع صوته**.",
"**ارمي جوالك على الارض بقوة و اذا انكسر صور الجوال و ارسله في الشات العام**.",
"**روح عند اي احد بالخاص و قول له انك تحبه و الخ**.",
"**اكتب في الشات اي شيء يطلبه منك الاعبين في الخاص**.",
"**قول نكتة اذا و لازم احد الاعبين يضحك اذا محد ضحك يعطونك ميوت الى ان يجي دورك مرة ثانية**.",
"**سامحتك خلاص مافيه عقاب لك **.",
"**اتصل على احد من اخوياك  خوياتك , و اطلب منهم مبلغ على اساس انك صدمت بسيارتك**.",
"**غير اسمك الى اسم من اختيار الاعبين الي معك**.",
"**اتصل على امك و قول لها انك تحبها **.",
"**لا يوجد سؤال لك سامحتك **.",
"**قل لواحد ماتعرفه عطني كف**.",
"**منشن الجميع وقل انا اكرهكم**.",
"**اتصل لاخوك و قول له انك سويت حادث و الخ....**.",
"**روح المطبخ و اكسر صحن **.",
"**اعطي اي احد جنبك كف اذا مافيه احد جنبك اعطي نفسك و نبي نسمع صوت الكف**.",
"**قول لاي بنت موجود في الروم كلمة حلوه**.",
"**تكلم باللغة الانجليزية الين يجي دورك مرة ثانية لازم تتكلم اذا ما تكلمت تنفذ عقاب ثاني**.",
"**لا تتكلم ولا كلمة الين يجي دورك مرة ثانية و اذا تكلمت يجيك باند لمدة يوم كامل من السيرفر**.",
"**قول قصيدة **.",
"**تكلم باللهجة السودانية الين يجي دورك مرة ثانية**.",
"**اتصل على احد من اخوياك  خوياتك , و اطلب منهم مبلغ على اساس انك صدمت بسيارتك**.",
"**اول واحد تشوفه عطه كف**.",
"**سو مشهد تمثيلي عن اي شيء يطلبه منك الاعبين**.",
"**سامحتك خلاص مافيه عقاب لك **.",
"**اتصل على ابوك و قول له انك رحت مع بنت و احين هي حامل....**.",
"**روح اكل ملح + ليمون اذا مافيه اكل اي شيء من اختيار الي معك**.",
"**تاخذ عقابين**.",
"**قول اسم امك افتخر بأسم امك**.",
"**ارمي اي شيء قدامك على اي احد موجود او على نفسك**.",
"**اذا انت ولد اكسر اغلى او احسن عطور عندك اذا انتي بنت اكسري الروج حقك او الميك اب حقك**.",
"**اذهب الى واحد ماتعرفه وقل له انا كيوت وابي بوسه**.",
"**تتصل على الوالده  و تقول لها خطفت شخص**.",
"** تتصل على الوالده  و تقول لها تزوجت با سر**.",
"**اتصل على الوالده  و تقول لها  احب وحده**.",
"**تتصل على شرطي تقول له عندكم مطافي**.",
"**خلاص سامحتك**.",
"** تصيح في الشارع انا  مجنوون**.",
"** تروح عند شخص وقول له احبك**."
}
name = katu[math.random(#katu)]
return LuaTele.sendText(msg.chat_id,msg.id,'• تم اختيار '..ls..' للحكم ليه\n• الحكم هوه ( '..name..' ) ',"md",true)
end
end
if text == "اغاني" then
if Redis:get(FDFGERB.."FDFGERB:Status:Games"..msg.chat_id) then
KlamSpeed = {"عبادي","بلقيس","خالد","ماجد","نايف","محمد","ماجد","فارس","راشد","عبادي","عبادي","شيرين","خالد","اليسا","عباس","عبادي","سعد","نوال","خالد","رابح","رابح","خالد","اصاله","ياسمين","ماجد","اصيل","وليد","ماجد","نوال","راشد","راشد","عبدالمجيد","عايض","نوال","عباس","اليسا","رابح","خالد","عصام","عايض","ماجد"};
name = KlamSpeed[math.random(#KlamSpeed)]
Redis:set(FDFGERB.."FDFGERB:Game:jhg"..msg.chat_id,name)
name = string.gsub(name,"عبادي","🎻 خلاص ارجع")
name = string.gsub(name,"بلقيس","🎻 شوف لي حل")
name = string.gsub(name,"خالد","🎻 بنساك")
name = string.gsub(name,"ماجد","🎻 انا حنيّت")
name = string.gsub(name,"نايف","🎻 ماعرفني")
name = string.gsub(name,"محمد","🎻 كفاني عذاب")
name = string.gsub(name,"ماجد","🎻 بدون أسماء")
name = string.gsub(name,"فارس","مات الوفاء")
name = string.gsub(name,"راشد","🎻 اكثر شخص بالدنيا")
name = string.gsub(name,"عبادي","🎻 قالوا ترى")
name = string.gsub(name,"شيرين","🎻 كلي ملكك")
name = string.gsub(name,"خالد","🎻 العطا")
name = string.gsub(name,"اليسا","🎻 يا مرايتي")
name = string.gsub(name,"عباس","🎻 جرح الهوى")
name = string.gsub(name,"عبادي","🎻 سامحيني")
name = string.gsub(name,"سعد","🎻 ياقلبي ابتسم")
name = string.gsub(name,"نوال","🎻 ابيك بجنبي")
name = string.gsub(name,"خالد","🎻 يوم كنتي مُغرمه")
name = string.gsub(name,"رابح","🎻 عامين احبك")
name = string.gsub(name,"رابح","🎻 وين انت")
name = string.gsub(name,"خالد","🎻 تقوى الهجر؟")
name = string.gsub(name,"اصاله","🎻 عقوبه")
name = string.gsub(name,"ياسمين","🎻 سلامات ياهوى")
name = string.gsub(name,"ماجد","🎻 حفيد العز")
name = string.gsub(name,"اصيل","🎻 خلك بحر")
name = string.gsub(name,"وليد","🎻 لنفترض")
name = string.gsub(name,"ماجد","🎻 ما للنجوم أوطان")
name = string.gsub(name,"نوال","🎻 انت طيب")
name = string.gsub(name,"راشد","🎻 يازين ايامي ياخلي")
name = string.gsub(name,"راشد","🎻 كل عام")
name = string.gsub(name,"عبدالمجيد","🎻 أستكثرك")
name = string.gsub(name,"عايض","🎻 تعبت اكذب")
name = string.gsub(name,"نوال","🎻 مثل النسيم")
name = string.gsub(name,"عباس","🎻 أنا مقدر")
name = string.gsub(name,"اليسا","🎻 نفسي اقوله")
name = string.gsub(name,"رابح","🎻 عشاني سامحه  ياقلب")
name = string.gsub(name,"خالد","🎻 صارحيني")
name = string.gsub(name,"عصام","🎻 حبيت ياهوى مره")
name = string.gsub(name,"عايض","🎻 استراحة محارب")
name = string.gsub(name,"ماجد","🎻 تناديك")
return LuaTele.sendText(msg_chat_id,msg_id,"• مين اللي غناها ؟ ( "..name.." )","md",true)  
end
end
if text == "الاسرع" or tect == "ترتيب" then
if Redis:get(FDFGERB.."FDFGERB:Status:Games"..msg.chat_id) then
KlamSpeed = {"سحور","سياره","استقبال","قنفه","ايفون","بزونه","مطبخ","كرستيانو","دجاجه","مدرسه","الوان","غرفه","ثلاجه","كهوه","سفينه","العراق","محطه","طياره","رادار","منزل","مستشفى","كهرباء","تفاحه","اخطبوط","سلمون","فرنسا","برتقاله","تفاح","مطرقه","بتيته","لهانه","شباك","باص","سمكه","ذباب","تلفاز","حاسوب","انترنيت","ساحه","جسر"};
name = KlamSpeed[math.random(#KlamSpeed)]
Redis:set(FDFGERB.."FDFGERB:Game:Monotonous"..msg.chat_id,name)
name = string.gsub(name,"سحور","س ر و ح")
name = string.gsub(name,"سياره","ه ر س ي ا")
name = string.gsub(name,"استقبال","ل ب ا ت ق س ا")
name = string.gsub(name,"قنفه","ه ق ن ف")
name = string.gsub(name,"ايفون","و ن ف ا")
name = string.gsub(name,"بزونه","ز و ه ن")
name = string.gsub(name,"مطبخ","خ ب ط م")
name = string.gsub(name,"كرستيانو","س ت ا ن و ك ر ي")
name = string.gsub(name,"دجاجه","ج ج ا د ه")
name = string.gsub(name,"مدرسه","ه م د ر س")
name = string.gsub(name,"الوان","ن ا و ا ل")
name = string.gsub(name,"غرفه","غ ه ر ف")
name = string.gsub(name,"ثلاجه","ج ه ت ل ا")
name = string.gsub(name,"كهوه","ه ك ه و")
name = string.gsub(name,"سفينه","ه ن ف ي س")
name = string.gsub(name,"العراق","ق ع ا ل ر ا")
name = string.gsub(name,"محطه","ه ط م ح")
name = string.gsub(name,"طياره","ر ا ط ي ه")
name = string.gsub(name,"رادار","ر ا ر ا د")
name = string.gsub(name,"منزل","ن ز م ل")
name = string.gsub(name,"مستشفى","ى ش س ف ت م")
name = string.gsub(name,"كهرباء","ر ب ك ه ا ء")
name = string.gsub(name,"تفاحه","ح ه ا ت ف")
name = string.gsub(name,"اخطبوط","ط ب و ا خ ط")
name = string.gsub(name,"سلمون","ن م و ل س")
name = string.gsub(name,"فرنسا","ن ف ر س ا")
name = string.gsub(name,"برتقاله","ر ت ق ب ا ه ل")
name = string.gsub(name,"تفاح","ح ف ا ت")
name = string.gsub(name,"مطرقه","ه ط م ر ق")
name = string.gsub(name,"بتيته","ب ت ت ي ه")
name = string.gsub(name,"لهانه","ه ن ل ه ل")
name = string.gsub(name,"شباك","ب ش ا ك")
name = string.gsub(name,"باص","ص ا ب")
name = string.gsub(name,"سمكه","ك س م ه")
name = string.gsub(name,"ذباب","ب ا ب ذ")
name = string.gsub(name,"تلفاز","ت ف ل ز ا")
name = string.gsub(name,"حاسوب","س ا ح و ب")
name = string.gsub(name,"انترنيت","ا ت ن ر ن ي ت")
name = string.gsub(name,"ساحه","ح ا ه س")
name = string.gsub(name,"جسر","ر ج س")
return LuaTele.sendText(msg_chat_id,msg_id,"• اسرع واحد يرتبها ⇠ ( "..name.." )","md",true)  
end
end
if text == "حزوره" then
if Redis:get(FDFGERB.."FDFGERB:Status:Games"..msg.chat_id) then
Hzora = {"الجرس","عقرب الساعه","السمك","المطر","5","الكتاب","البسمار","7","الكعبه","بيت الشعر","لهانه","انا","امي","الابره","الساعه","22","غلط","كم الساعه","البيتنجان","البيض","المرايه","الضوء","الهواء","الضل","العمر","القلم","المشط","الحفره","البحر","الثلج","الاسفنج","الصوت","بلم"};
name = Hzora[math.random(#Hzora)]
Redis:set(FDFGERB.."FDFGERB:Game:Riddles"..msg.chat_id,name)
name = string.gsub(name,"الجرس","شيئ اذا لمسته صرخ ما هوه ؟")
name = string.gsub(name,"عقرب الساعه","اخوان لا يستطيعان تمضيه اكثر من دقيقه معا فما هما ؟")
name = string.gsub(name,"السمك","ما هو الحيوان الذي لم يصعد الى سفينة نوح عليه السلام ؟")
name = string.gsub(name,"المطر","شيئ يسقط على رأسك من الاعلى ولا يجرحك فما هو ؟")
name = string.gsub(name,"5","ما العدد الذي اذا ضربته بنفسه واضفت عليه 5 يصبح ثلاثين ")
name = string.gsub(name,"الكتاب","ما الشيئ الذي له اوراق وليس له جذور ؟")
name = string.gsub(name,"البسمار","ما هو الشيئ الذي لا يمشي الا بالضرب ؟")
name = string.gsub(name,"7","عائله مؤلفه من 6 بنات واخ لكل منهن .فكم عدد افراد العائله ")
name = string.gsub(name,"الكعبه","ما هو الشيئ الموجود وسط مكة ؟")
name = string.gsub(name,"بيت الشعر","ما هو البيت الذي ليس فيه ابواب ولا نوافذ ؟ ")
name = string.gsub(name,"لهانه","وحده حلوه ومغروره تلبس مية تنوره .من هيه ؟ ")
name = string.gsub(name,"انا","ابن امك وابن ابيك وليس باختك ولا باخيك فمن يكون ؟")
name = string.gsub(name,"امي","اخت خالك وليست خالتك من تكون ؟ ")
name = string.gsub(name,"الابره","ما هو الشيئ الذي كلما خطا خطوه فقد شيئا من ذيله ؟ ")
name = string.gsub(name,"الساعه","ما هو الشيئ الذي يقول الصدق ولكنه اذا جاع كذب ؟")
name = string.gsub(name,"22","كم مره ينطبق عقربا الساعه على بعضهما في اليوم الواحد ")
name = string.gsub(name,"غلط","ما هي الكلمه الوحيده التي تلفض غلط دائما ؟ ")
name = string.gsub(name,"كم الساعه","ما هو السؤال الذي تختلف اجابته دائما ؟")
name = string.gsub(name,"البيتنجان","جسم اسود وقلب ابيض وراس اخظر فما هو ؟")
name = string.gsub(name,"البيض","ماهو الشيئ الذي اسمه على لونه ؟")
name = string.gsub(name,"المرايه","ارى كل شيئ من دون عيون من اكون ؟ ")
name = string.gsub(name,"الضوء","ما هو الشيئ الذي يخترق الزجاج ولا يكسره ؟")
name = string.gsub(name,"الهواء","ما هو الشيئ الذي يسير امامك ولا تراه ؟")
name = string.gsub(name,"الضل","ما هو الشيئ الذي يلاحقك اينما تذهب ؟ ")
name = string.gsub(name,"العمر","ما هو الشيء الذي كلما طال قصر ؟ ")
name = string.gsub(name,"القلم","ما هو الشيئ الذي يكتب ولا يقرأ ؟")
name = string.gsub(name,"المشط","له أسنان ولا يعض ما هو ؟ ")
name = string.gsub(name,"الحفره","ما هو الشيئ اذا أخذنا منه ازداد وكبر ؟")
name = string.gsub(name,"البحر","ما هو الشيئ الذي يرفع اثقال ولا يقدر يرفع مسمار ؟")
name = string.gsub(name,"الثلج","انا ابن الماء فان تركوني في الماء مت فمن انا ؟")
name = string.gsub(name,"الاسفنج","كلي ثقوب ومع ذالك احفض الماء فمن اكون ؟")
name = string.gsub(name,"الصوت","اسير بلا رجلين ولا ادخل الا بالاذنين فمن انا ؟")
name = string.gsub(name,"بلم","حامل ومحمول نصف ناشف ونصف مبلول فمن اكون ؟ ")
return LuaTele.sendText(msg_chat_id,msg_id,"• اسرع واحد يحل الحزوره ↓\n ( "..name.." )","md",true)  
end
end
if text == "معاني" then
if Redis:get(FDFGERB.."FDFGERB:Status:Games"..msg.chat_id) then
Redis:del(FDFGERB.."FDFGERB:Set:Maany"..msg.chat_id)
Maany_Rand = {"قرد","دجاجه","بطريق","ضفدع","بومه","نحله","ديك","جمل","بقره","دولفين","تمساح","قرش","نمر","اخطبوط","سمكه","خفاش","اسد","فأر","ذئب","فراشه","عقرب","زرافه","قنفذ","تفاحه","باذنجان"}
name = Maany_Rand[math.random(#Maany_Rand)]
Redis:set(FDFGERB.."FDFGERB:Game:Meaningof"..msg.chat_id,name)
name = string.gsub(name,"قرد","🐒")
name = string.gsub(name,"دجاجه","🐔")
name = string.gsub(name,"بطريق","🐧")
name = string.gsub(name,"ضفدع","🐸")
name = string.gsub(name,"بومه","🦉")
name = string.gsub(name,"نحله","🐝")
name = string.gsub(name,"ديك","🐓")
name = string.gsub(name,"جمل","🐫")
name = string.gsub(name,"بقره","🐄")
name = string.gsub(name,"دولفين","🐬")
name = string.gsub(name,"تمساح","🐊")
name = string.gsub(name,"قرش","🦈")
name = string.gsub(name,"نمر","🐅")
name = string.gsub(name,"اخطبوط","🐙")
name = string.gsub(name,"سمكه","🐟")
name = string.gsub(name,"خفاش","??")
name = string.gsub(name,"اسد","🦁")
name = string.gsub(name,"فأر","🐭")
name = string.gsub(name,"ذئب","🐺")
name = string.gsub(name,"فراشه","🦋")
name = string.gsub(name,"عقرب","🦂")
name = string.gsub(name,"زرافه","🦒")
name = string.gsub(name,"قنفذ","🦔")
name = string.gsub(name,"تفاحه","🍎")
name = string.gsub(name,"باذنجان","🍆")
return LuaTele.sendText(msg_chat_id,msg_id,"• اسرع واحد يرسل معنى السمايل ~ ( "..name.." )","md",true)  
end
end
--البنك بدايه
if text == 'بنك' or text == 'البنك' then
LuaTele.sendText(msg.chat_id,msg.id,[[
• اوامر البنك

- انشاء حساب بنكي  ⇠ تفتح حساب وتقدر تحول فلوس مع مزايا ثانيه

- مسح حساب بنكي  ⇠ تلغي حسابك البنكي

- تحويل ⇠ تطلب رقم حساب الشخص وتحول له فلوس

- حسابي  ⇠ يطلع لك رقم حسابك عشان تعطيه للشخص اللي بيحول لك

- فلوسي ⇠ يعلمك كم فلوسك

- راتب ⇠ يعطيك راتب كل ١٠ دقائق

- بخشيش ⇠ يعطيك بخشيش كل ١٠ دقايق

- زرف ⇠ تزرف فلوس اشخاص كل ١٠ دقايق

- استثمار ⇠ تستثمر بالمبلغ اللي تبيه مع نسبة ربح مضمونه من ١٪؜ الى ١٥٪؜

- حظ ⇠ تلعبها بأي مبلغ ياتدبله ياتخسره انت وحظك

- مضاربه ⇠ تضارب بأي مبلغ تبيه والنسبة من ٩٠٪؜ الى -٩٠٪؜ انت وحظك

- قرض ⇠ تاخذ قرض من البنك

- تسديد القرض ⇠ بتسدد القرض اذا عليك 

- هجوم ⇠ تهجم عالخصم مع زيادة نسبة كل هجوم

- كنز ⇠ يعطيك كنز بسعر مختلف انتا وحظك

- مراهنه ⇠ تحط مبلغ وتراهن عليه

- توب الفلوس ⇠ يطلع توب اكثر ناس معهم فلوس بكل القروبات

- توب الحراميه ⇠ يطلع لك اكثر ناس زرفوا

- زواج  ⇠ تكتبه بالرد على رسالة شخص مع المهر ويزوجك

- زواجي  ⇠ يطلع وثيقة زواجك اذا متزوج

- طلاق ⇠ يطلقك اذا متزوج

- خلع  ⇠ يخلع زوجك ويرجع له المهر

- زواجات ⇠ يطلع اغلى ٣٠ زواجات

- ترتيبي ⇠ يطلع ترتيبك باللعبة

-
]],"md",true)  
return false
end
if text == 'انشاء حساب بنكي' or text == 'انشاء حساب البنكي' or text =='انشاء الحساب بنكي' or text =='انشاء الحساب البنكي' or text == "انشاء حساب" or text == "فتح حساب بنكي" then
cobnum = tonumber(Redis:get(FDFGERB.."bandid"..msg.sender_id.user_id))
if cobnum == msg.sender_id.user_id then
return LuaTele.sendText(msg.chat_id,msg.id, "• حسابك محظور من لعبة البنك","md",true)
end
local F_Name = LuaTele.getUser(msg.sender_id.user_id).first_name
Redis:set(msg.sender_id.user_id.."first_name:", F_Name)
creditcc = math.random(500000000000,599999999999);
creditvi = math.random(400000000000,499999999999);
creditex = math.random(600000000000,699999999999);
balas = 50
if Redis:sismember(FDFGERB.."booob",msg.sender_id.user_id) then
return LuaTele.sendText(msg.chat_id,msg.id, "• لديك حساب بنكي مسبقاً\n\n-› لعرض معلومات حسابك اكتب\n⇠ `حسابي`","md",true)
end
Redis:setex(FDFGERB.."booobb" .. msg.chat_id .. ":" .. msg.sender_id.user_id,60, true)
LuaTele.sendText(msg.chat_id,msg.id,[[
• عشان تسوي حساب لازم تختار نوع البطاقة

⇠ `الاهلي`
⇠ `الراجحي`
⇠ `الانماء`

- اضغط للنسخ

]],"md",true)  
return false
end
if Redis:get(FDFGERB.."booobb" .. msg.chat_id .. ":" .. msg.sender_id.user_id) then
if text == "الاهلي" then
local ban = LuaTele.getUser(msg.sender_id.user_id)
if ban.first_name then
news = ""..ban.first_name..""
else
news = " لا يوجد"
end
local banid = msg.sender_id.user_id
Redis:set(FDFGERB.."bobna"..msg.sender_id.user_id,news)
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id,balas)
Redis:set(FDFGERB.."boobb"..msg.sender_id.user_id,creditcc)
Redis:set(FDFGERB.."bbobb"..msg.sender_id.user_id,text)
Redis:set(FDFGERB.."boballname"..creditcc,news)
Redis:set(FDFGERB.."boballbalc"..creditcc,balas)
Redis:set(FDFGERB.."boballcc"..creditcc,creditcc)
Redis:set(FDFGERB.."boballban"..creditcc,text)
Redis:set(FDFGERB.."boballid"..creditcc,banid)
Redis:sadd(FDFGERB.."booob",msg.sender_id.user_id)
Redis:del(FDFGERB.."booobb" .. msg.chat_id .. ":" .. msg.sender_id.user_id) 
LuaTele.sendText(msg.chat_id,msg.id, "\n• وسوينا لك حساب في البنك\n• وعطيناك 50﷼ 💵 هدية \n\n• رقم حسابك ⇠ ( `"..creditcc.."` )\n• نوع البطاقة ⇠ ( الاهلي 💳 ) \n• فلوسك ⇠ ( 50 ريال 💸 )","md",true)  
end 
if text == "الراجحي" then
local ban = LuaTele.getUser(msg.sender_id.user_id)
if ban.first_name then
news = ""..ban.first_name..""
else
news = " لا يوجد"
end
local banid = msg.sender_id.user_id
Redis:set(FDFGERB.."bobna"..msg.sender_id.user_id,news)
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id,balas)
Redis:set(FDFGERB.."boobb"..msg.sender_id.user_id,creditvi)
Redis:set(FDFGERB.."bbobb"..msg.sender_id.user_id,text)
Redis:set(FDFGERB.."boballname"..creditvi,news)
Redis:set(FDFGERB.."boballbalc"..creditvi,balas)
Redis:set(FDFGERB.."boballcc"..creditvi,creditvi)
Redis:set(FDFGERB.."boballban"..creditvi,text)
Redis:set(FDFGERB.."boballid"..creditvi,banid)
Redis:sadd(FDFGERB.."booob",msg.sender_id.user_id)
Redis:del(FDFGERB.."booobb" .. msg.chat_id .. ":" .. msg.sender_id.user_id) 
LuaTele.sendText(msg.chat_id,msg.id, "\n• وسوينا لك حساب في البنك\n• وعطيناك 50﷼ 💵 هدية \n\n• رقم حسابك ⇠ ( `"..creditvi.."` )\n• نوع البطاقة ⇠ ( الراجحي 💳 ) \n• فلوسك ⇠ ( 50 ريال 💸 )","md",true)   
end 
if text == "الانماء" then
local ban = LuaTele.getUser(msg.sender_id.user_id)
if ban.first_name then
news = ""..ban.first_name..""
else
news = " لا يوجد"
end
local banid = msg.sender_id.user_id
Redis:set(FDFGERB.."bobna"..msg.sender_id.user_id,news)
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id,balas)
Redis:set(FDFGERB.."boobb"..msg.sender_id.user_id,creditex)
Redis:set(FDFGERB.."bbobb"..msg.sender_id.user_id,text)
Redis:set(FDFGERB.."boballname"..creditex,news)
Redis:set(FDFGERB.."boballbalc"..creditex,balas)
Redis:set(FDFGERB.."boballcc"..creditex,creditex)
Redis:set(FDFGERB.."boballban"..creditex,text)
Redis:set(FDFGERB.."boballid"..creditex,banid)
Redis:sadd(FDFGERB.."booob",msg.sender_id.user_id)
Redis:del(FDFGERB.."booobb" .. msg.chat_id .. ":" .. msg.sender_id.user_id) 
LuaTele.sendText(msg.chat_id,msg.id, "\n• وسوينا لك حساب في البنك\n• وعطيناك 50﷼ 💵 هدية\n\n• رقم حسابك ⇠  ( `"..creditex.."` )\n• نوع البطاقة ⇠ ( الانماء 💳 ) \n• فلوسك ⇠ ( 50 ريال 💸 )","md",true)   
end 
end
if text == 'مسح حساب بنكي' or text == 'مسح حساب البنكي' or text =='مسح الحساب بنكي' or text =='مسح الحساب البنكي' or text == "مسح حسابي البنكي" or text == "مسح حسابي بنكي" or text == "مسح حسابي" then
local F_Name = LuaTele.getUser(msg.sender_id.user_id).first_name
Redis:set(msg.sender_id.user_id.."first_name:", F_Name)
if Redis:sismember(FDFGERB.."booob",msg.sender_id.user_id) then
Redis:srem(FDFGERB.."booob", msg.sender_id.user_id)
Redis:del(FDFGERB.."boob"..msg.sender_id.user_id)
Redis:del(FDFGERB.."boobb"..msg.sender_id.user_id)
Redis:del(FDFGERB.."rrfff"..msg.sender_id.user_id)
Redis:srem(FDFGERB.."rrfffid", msg.sender_id.user_id)
Redis:srem(FDFGERB.."roogg1", msg.sender_id.user_id)
Redis:srem(FDFGERB.."roogga1", msg.sender_id.user_id)
Redis:del(FDFGERB.."roog1"..msg.sender_id.user_id)
Redis:del(FDFGERB.."rooga1"..msg.sender_id.user_id)
Redis:del(FDFGERB.."rahr1"..msg.sender_id.user_id)
Redis:del(FDFGERB.."rahrr1"..msg.sender_id.user_id)
LuaTele.sendText(msg.chat_id,msg.id, "• تم حذف حسابك البنكي","md",true)
else
LuaTele.sendText(msg.chat_id,msg.id, "• ماعندك حساب بنكي ارسل ( `انشاء حساب بنكي` )","md",true)
end
end

if text == 'تثبيت النتائج' or text == 'تثبيت نتائج' then
if tonumber(msg.sender_id.user_id) == tonumber(5271603990) then
time = os.date("*t")
month = time.month
day = time.day
local_time = month.."/"..day
local bank_users = Redis:smembers(FDFGERB.."booob")
if #bank_users == 0 then
return LuaTele.sendText(msg.chat_id,msg.id,"• ياعيني مافيه حسابات في البنك","md",true)
end
mony_list = {}
for k,v in pairs(bank_users) do
local mony = Redis:get(FDFGERB.."boob"..v)
table.insert(mony_list, {tonumber(mony) , v})
end
table.sort(mony_list, function(a, b) return a[1] > b[1] end)
num = 1
emoji ={ 
"🥇",
"🥈",
"🥉"
}
for k,v in pairs(mony_list) do
local user_name = LuaTele.getUser(v[2]).first_name or Redis:get(v[2].."first_name:") or "لا يوجد اسم"
local mony = v[1]
local convert_mony = string.format("%.0f",mony)
local emo = emoji[k]
num = num + 1
Redis:set(FDFGERB.."medal"..v[2],convert_mony)
Redis:set(FDFGERB.."medal2"..v[2],emo)
Redis:set(FDFGERB.."medal3"..v[2],local_time)
Redis:sadd(FDFGERB.."medalid",v[2])
Redis:set(FDFGERB.."medal"..v[2],convert_mony)
Redis:set(FDFGERB.."medal2"..v[2],emo)
Redis:set(FDFGERB.."medal3"..v[2],local_time)
Redis:sadd(FDFGERB.."medalid",v[2])
local user_name = LuaTele.getUser(v[2]).first_name or Redis:get(v[2].."first_name:") or "لا يوجد اسم"
local user_tag = '['..user_name..'](tg://user?id='..v[2]..')'
local mony = v[1]
local convert_mony = string.format("%.0f",mony)
local emo = emoji[k]
num = num + 1
Redis:set(FDFGERB.."medal"..v[2],convert_mony)
Redis:set(FDFGERB.."medal2"..v[2],emo)
Redis:set(FDFGERB.."medal3"..v[2],local_time)
Redis:sadd(FDFGERB.."medalid",v[2])
if num == 4 then
return end
end
LuaTele.sendText(msg.chat_id,msg.id, "• تمام عيني ثبت النتائج","md",true)
else
LuaTele.sendText(msg.chat_id,msg.id, "•ggggggggج","md",true)
end
end
if text == '.مسح فلوس all' or text == 'مسح فلوس all' then
if tonumber(msg.sender_id.user_id) == tonumber(5271603990) then
local bank_users = Redis:smembers(FDFGERB.."booob")
for k,v in pairs(bank_users) do
Redis:del(FDFGERB.."boob"..v)
Redis:del(FDFGERB.."kreednum"..v)
Redis:del(FDFGERB.."kreed"..v)
Redis:del(FDFGERB.."rrfff"..v)
end
local bank_usersr = Redis:smembers(FDFGERB.."rrfffid")
for k,v in pairs(bank_usersr) do
Redis:del(FDFGERB.."boob"..v)
Redis:del(FDFGERB.."rrfff"..v)
end
LuaTele.sendText(msg.chat_id,msg.id, "• ابشر مسحت كل فلوس اللعبه 💸","md",true)
end
end

if text == 'Tsfer' or text == '.Tsfer' then
if tonumber(msg.sender_id.user_id) == tonumber(5271603990) then
local bank_users = Redis:smembers(FDFGERB.."booob")
for k,v in pairs(bank_users) do
Redis:del(FDFGERB.."boob"..v)
Redis:del(FDFGERB.."kreednum"..v)
Redis:del(FDFGERB.."kreed"..v)
Redis:del(FDFGERB.."rrfff"..v)
Redis:del(FDFGERB.."numattack"..v)
end
local bank_usersr = Redis:smembers(FDFGERB.."rrfffid")
for k,v in pairs(bank_usersr) do
Redis:del(FDFGERB.."boob"..v)
Redis:del(FDFGERB.."rrfff"..v)
end
Redis:del(FDFGERB.."rrfffid")
Redis:del(FDFGERB.."booob")
LuaTele.sendText(msg.chat_id,msg.id, "• ابشر مسحت لعبه البنك ","md",true)
end
end
if text == 'ميدالياتي' or text == 'ميداليات' then
local F_Name = LuaTele.getUser(msg.sender_id.user_id).first_name
Redis:set(msg.sender_id.user_id.."first_name:", F_Name)
if Redis:sismember(FDFGERB.."medalid",msg.sender_id.user_id) then
local medaa2 = Redis:get(FDFGERB.."medal2"..msg.sender_id.user_id)
if medaa2 == "🥇" then
local medaa = Redis:get(FDFGERB.."medal"..msg.sender_id.user_id)
local medaa2 = Redis:get(FDFGERB.."medal2"..msg.sender_id.user_id)
local medaa3 = Redis:get(FDFGERB.."medal3"..msg.sender_id.user_id)
LuaTele.sendText(msg.chat_id,msg.id, "ميدالياتك :\n\nالتاريخ : "..medaa3.." \nالفلوس : "..medaa.." 💵\nالمركز : "..medaa2.." كونكر "..medaa2.."\n-","md",true)
elseif medaa2 == "🥈" then
local medaa = Redis:get(FDFGERB.."medal"..msg.sender_id.user_id)
local medaa2 = Redis:get(FDFGERB.."medal2"..msg.sender_id.user_id)
local medaa3 = Redis:get(FDFGERB.."medal3"..msg.sender_id.user_id)
LuaTele.sendText(msg.chat_id,msg.id, "ميدالياتك :\n\nالتاريخ : "..medaa3.." \nالفلوس : "..medaa.." 💵\nالمركز : "..medaa2.." ايس "..medaa2.."\n-","md",true)
else
local medaa = Redis:get(FDFGERB.."medal"..msg.sender_id.user_id)
local medaa2 = Redis:get(FDFGERB.."medal2"..msg.sender_id.user_id)
local medaa3 = Redis:get(FDFGERB.."medal3"..msg.sender_id.user_id)
LuaTele.sendText(msg.chat_id,msg.id, "ميدالياتك :\n\nالتاريخ : "..medaa3.." \nالفلوس : "..medaa.." 💵\nالمركز : "..medaa2.." تاج "..medaa2.."\n-","md",true)
end
else
LuaTele.sendText(msg.chat_id,msg.id, "• ماعندك ميداليات","md",true)
end
end

if text == 'فلوسي' or text == 'فلوس' and tonumber(msg.reply_to_message_id) == 0 then
local F_Name = LuaTele.getUser(msg.sender_id.user_id).first_name
Redis:set(msg.sender_id.user_id.."first_name:", F_Name)
if Redis:sismember(FDFGERB.."booob",msg.sender_id.user_id) then
ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
if tonumber(ballancee) < 1 then
return LuaTele.sendText(msg.chat_id,msg.id, "• ماعندك فلوس ارسل الالعاب وابدا جمع الفلوس \n-","md",true)
end
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id, "• فلوسك `"..convert_mony.."` ريال 💸","md",true)
else
LuaTele.sendText(msg.chat_id,msg.id, "• ماعندك حساب بنكي ارسل ⇠ ( `انشاء حساب بنكي` )","md",true)
end
end

if text == 'فلوسه' or text == 'فلوس' and tonumber(msg.reply_to_message_id) ~= 0 then
local F_Name = LuaTele.getUser(msg.sender_id.user_id).first_name
Redis:set(msg.sender_id.user_id.."first_name:", F_Name)
local Remsg = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Remsg.sender_id.user_id)
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeLuaTele" then
LuaTele.sendText(msg.chat_id,msg.id,"\n• ماعنده حساب في البنك ","md",true)  
return false
end
if Redis:sismember(FDFGERB.."booob",Remsg.sender_id.user_id) then
ballanceed = Redis:get(FDFGERB.."boob"..Remsg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballanceed)
LuaTele.sendText(msg.chat_id,msg.id, "• فلوسه `"..convert_mony.."` ريال 💸","md",true)
else
LuaTele.sendText(msg.chat_id,msg.id, "• ماعنده حساب بنكي ","md",true)
end
end

if text == 'حسابي' or text == 'حسابي البنكي' or text == 'رقم حسابي' then
local F_Name = LuaTele.getUser(msg.sender_id.user_id).first_name
Redis:set(msg.sender_id.user_id.."first_name:", F_Name)
local ban = LuaTele.getUser(msg.sender_id.user_id)
if ban.first_name then
news = ""..ban.first_name..""
else
news = " لا يوجد"
end
if Redis:sismember(FDFGERB.."booob",msg.sender_id.user_id) then
cccc = Redis:get(FDFGERB.."boobb"..msg.sender_id.user_id)
uuuu = Redis:get(FDFGERB.."bbobb"..msg.sender_id.user_id)
pppp = Redis:get(FDFGERB.."rrfff"..msg.sender_id.user_id) or 0
ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id, "• الاسم ⇠ "..news.."\n• الحساب ⇠ `"..cccc.."`\n• بنك ⇠ ( الاهلي )\n• نوع ⇠ ( "..uuuu.." )\n• الرصيد ⇠ ( "..convert_mony.." ريال 💸 )\n• الزرف ⇠ ( "..pppp.." ريال 💸 )\n-","md",true)
else
LuaTele.sendText(msg.chat_id,msg.id, "• ماعندك حساب بنكي ارسل ⇠ ( `انشاء حساب بنكي` )","md",true)
end
end

if text == 'مسح حسابه' and tonumber(msg.reply_to_message_id) ~= 0 then
if tonumber(msg.sender_id.user_id) == tonumber(5271603990) then
local Remsg = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Remsg.sender_id.user_id)
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
LuaTele.sendText(msg.chat_id,msg.id,"\n• ماعنده حساب في البنك ","md",true)  
return false
end
local ban = LuaTele.getUser(Remsg.sender_id.user_id)
if ban.first_name then
news = ""..ban.first_name..""
else
news = " لا يوجد"
end
if Redis:sismember(FDFGERB.."booob",Remsg.sender_id.user_id) then
ccccc = Redis:get(FDFGERB.."boobb"..Remsg.sender_id.user_id)
uuuuu = Redis:get(FDFGERB.."bbobb"..Remsg.sender_id.user_id)
ppppp = Redis:get(FDFGERB.."rrfff"..Remsg.sender_id.user_id) or 0
ballanceed = Redis:get(FDFGERB.."boob"..Remsg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballanceed)
Redis:srem(FDFGERB.."booob", Remsg.sender_id.user_id)
Redis:del(FDFGERB.."boob"..Remsg.sender_id.user_id)
Redis:del(FDFGERB.."boobb"..Remsg.sender_id.user_id)
Redis:del(FDFGERB.."rrfff"..Remsg.sender_id.user_id)
Redis:del(FDFGERB.."numattack"..Remsg.sender_id.user_id)
Redis:srem(FDFGERB.."rrfffid", Remsg.sender_id.user_id)
Redis:srem(FDFGERB.."roogg1", Remsg.sender_id.user_id)
Redis:srem(FDFGERB.."roogga1", Remsg.sender_id.user_id)
Redis:del(FDFGERB.."roog1"..Remsg.sender_id.user_id)
Redis:del(FDFGERB.."rooga1"..Remsg.sender_id.user_id)
Redis:del(FDFGERB.."rahr1"..Remsg.sender_id.user_id)
Redis:del(FDFGERB.."rahrr1"..Remsg.sender_id.user_id)
LuaTele.sendText(msg.chat_id,msg.id, "• الاسم ⇠ "..news.."\n• الحساب ⇠ `"..ccccc.."`\n• نوع ⇠ ( "..uuuuu.." )\n• الرصيد ⇠ ( "..convert_mony.." ريال 💸 )\n• الزرف ⇠ ( "..ppppp.." ريال 💸 )\n• مسكين مسحت حسابه \n-","md",true)
else
LuaTele.sendText(msg.chat_id,msg.id, "• ماعنده حساب بنكي اصلاً ","md",true)
end
end
end

if text == 'حسابه' and tonumber(msg.reply_to_message_id) ~= 0 then
local F_Name = LuaTele.getUser(msg.sender_id.user_id).first_name
Redis:set(msg.sender_id.user_id.."first_name:", F_Name)
local Remsg = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Remsg.sender_id.user_id)
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
LuaTele.sendText(msg.chat_id,msg.id,"\n• ماعنده حساب في البنك ","md",true)  
return false
end
local ban = LuaTele.getUser(Remsg.sender_id.user_id)
if ban.first_name then
news = ""..ban.first_name..""
else
news = " لا يوجد"
end
if Redis:sismember(FDFGERB.."booob",Remsg.sender_id.user_id) then
ccccc = Redis:get(FDFGERB.."boobb"..Remsg.sender_id.user_id)
uuuuu = Redis:get(FDFGERB.."bbobb"..Remsg.sender_id.user_id)
ppppp = Redis:get(FDFGERB.."rrfff"..Remsg.sender_id.user_id) or 0
ballanceed = Redis:get(FDFGERB.."boob"..Remsg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballanceed)
LuaTele.sendText(msg.chat_id,msg.id, "• الاسم ⇠ "..news.."\n• الحساب ⇠ `"..ccccc.."`\n• نوع ⇠ ( "..uuuuu.." )\n• الرصيد ⇠ ( "..convert_mony.." ريال 💸 )\n• الزرف ⇠ ( "..ppppp.." ريال 💸 )\n-","md",true)
else
LuaTele.sendText(msg.chat_id,msg.id, "• ماعنده حساب بنكي","md",true)
end
end

if text and text:match('^مسح حساب (.*)$') or text and text:match('^مسح حسابه (.*)$') then
if tonumber(msg.sender_id.user_id) == tonumber(5271603990) then
local UserName = text:match('^مسح حساب (.*)$') or text:match('^مسح حسابه (.*)$')
local coniss = (UserName)
local ban = LuaTele.getUser(coniss)
if ban.first_name then
news = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
news = " لا يوجد "
end
if Redis:sismember(FDFGERB.."booob",coniss) then
ccccc = Redis:get(FDFGERB.."boobb"..coniss)
uuuuu = Redis:get(FDFGERB.."bbobb"..coniss)
ppppp = Redis:get(FDFGERB.."rrfff"..coniss) or 0
ballanceed = Redis:get(FDFGERB.."boob"..coniss) or 0
local convert_mony = string.format("%.0f",ballanceed)
Redis:srem(FDFGERB.."booob", coniss)
Redis:del(FDFGERB.."boob"..coniss)
Redis:del(FDFGERB.."boobb"..coniss)
Redis:del(FDFGERB.."rrfff"..coniss)
Redis:srem(FDFGERB.."roogg1", coniss)
Redis:srem(FDFGERB.."roogga1", coniss)
Redis:del(FDFGERB.."roog1"..coniss)
Redis:del(FDFGERB.."rooga1"..coniss)
Redis:del(FDFGERB.."rahr1"..coniss)
Redis:del(FDFGERB.."rahrr1"..coniss)
Redis:del(FDFGERB.."numattack"..coniss)
Redis:srem(FDFGERB.."rrfffid", coniss)
LuaTele.sendText(msg.chat_id,msg.id, "• الاسم ⇠ "..news.."\n• الحساب ⇠ `"..ccccc.."`\n• نوع ⇠ ( "..uuuuu.." )\n• الرصيد ⇠ ( "..convert_mony.." ريال 💵 )\n• الزرف ⇠ ( "..ppppp.." ريال 💵 )\n• مسكين مسحت حسابه \n-","md",true)
else
LuaTele.sendText(msg.chat_id,msg.id, "• ماعنده حساب بنكي اصلاً ","md",true)
end
end
end

if text and text:match('^حساب (.*)$') or text and text:match('^حسابه (.*)$') then
local F_Name = LuaTele.getUser(msg.sender_id.user_id).first_name
Redis:set(msg.sender_id.user_id.."first_name:", F_Name)
local UserName = text:match('^حساب (.*)$') or text:match('^حسابه (.*)$')
local coniss = (UserName)
if Redis:get(FDFGERB.."boballcc"..coniss) then
local yty = Redis:get(FDFGERB.."boballname"..coniss)
local bobpkh = Redis:get(FDFGERB.."boballid"..coniss)
ballancee = Redis:get(FDFGERB.."boob"..bobpkh) or 0
local convert_mony = string.format("%.0f",ballancee)
local dfhb = Redis:get(FDFGERB.."boballbalc"..coniss)

local fsvhh = Redis:get(FDFGERB.."boballban"..coniss)
LuaTele.sendText(msg.chat_id,msg.id, "• الاسم ⇠ "..yty.."\n• الحساب ⇠ `"..coniss.."`\n• نوع ⇠ ( "..fsvhh.." )\n• الرصيد ⇠ ( "..convert_mony.." ريال 💸 )\n-","md",true)
else
LuaTele.sendText(msg.chat_id,msg.id, "• ياعيني مافيه حساب بنكي كذا ","md",true)
end
end
if text == 'مضاربه' then
ballanceed = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
krses = tonumber(Redis:get(FDFGERB.."kreednum"..msg.sender_id.user_id))
if Redis:get(FDFGERB.."kreed"..msg.sender_id.user_id) and tonumber(ballanceed) > 5000000 then
return LuaTele.sendText(msg.chat_id,msg.id, "• عليك قرض بقيمة "..krses.." ريال 💵 \nقم بسداده بالامر `تسديد القرض` ","md",true)
end
if Redis:ttl(FDFGERB.."iiooooo" .. msg.sender_id.user_id) >= 60 then
local time = Redis:ttl(FDFGERB.."iiooooo" .. msg.sender_id.user_id)
return LuaTele.sendText(msg.chat_id,msg.id,"• مايمديك تضارب الحين !\n• تعال بعد ( "..time.." ثانية)","md",true)
end
LuaTele.sendText(msg.chat_id,msg.id, "استعمل الامر كذا :\n\n`مضاربه` المبلغ","md",true)
end

if text and text:match('^مضاربه (.*)$') or text and text:match('^مضاربة (.*)$') then
ballanceed = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
krses = tonumber(Redis:get(FDFGERB.."kreednum"..msg.sender_id.user_id))
if Redis:get(FDFGERB.."kreed"..msg.sender_id.user_id) and tonumber(ballanceed) > 5000000 then
return LuaTele.sendText(msg.chat_id,msg.id, "• عليك قرض بقيمة "..krses.." ريال 💵 \nقم بسداده بالامر `تسديد القرض` ","md",true)
end
local F_Name = LuaTele.getUser(msg.sender_id.user_id).first_name
Redis:set(msg.sender_id.user_id.."first_name:", F_Name)
local UserName = text:match('^مضاربه (.*)$') or text:match('^مضاربة (.*)$')
local coniss = (UserName)
if Redis:sismember(FDFGERB.."booob",msg.sender_id.user_id) then
if Redis:ttl(FDFGERB.."iiooooo" .. msg.sender_id.user_id) >= 60 then
  local time = Redis:ttl(FDFGERB.."iiooooo" .. msg.sender_id.user_id)
return LuaTele.sendText(msg.chat_id,msg.id,"• ما يمديك تضارب الحين ! \n• تعال بعد ( "..time.." ثانية)","md",true)
end
ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
if tonumber(coniss) < 99 then
return LuaTele.sendText(msg.chat_id,msg.id, "• ياعيني الحد الاكثر المسموح فيه 100 ريال 💸\n-","md",true)
end
if tonumber(ballancee) < tonumber(coniss) then
return LuaTele.sendText(msg.chat_id,msg.id, "• فلوسك ما تكفي \n-","md",true)
end
local modarba = {"1", "2", "3", "4️",}
local Descriptioontt = modarba[math.random(#modarba)]
local modarbaa = math.random(1,90);
if Descriptioontt == "1" or Descriptioontt == "3" then
ballanceekku = coniss / 100 * modarbaa
ballanceekkku = ballancee - ballanceekku
local convert_mony = string.format("%.0f",ballanceekku)
local convert_mony1 = string.format("%.0f",ballanceekkku)
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , math.floor(ballanceekkku))
Redis:setex(FDFGERB.."iiooooo" .. msg.sender_id.user_id,900, true)
LuaTele.sendText(msg.chat_id,msg.id, "• للاسف خسرت بالحظ \n• فلوسك قبل ⇠ "..modarbaa.."%\n• الخساره ⇠ ( "..convert_mony.." ريال 💸 )\n• فلوسك الحين ⇠ ( "..convert_mony1.." ريال 💸 )\n-","md",true)
elseif Descriptioontt == "2" or Descriptioontt == "4" then
ballanceekku = coniss / 100 * modarbaa
ballanceekkku = ballancee + ballanceekku
local convert_mony = string.format("%.0f",ballanceekku)
local convert_mony1 = string.format("%.0f",ballanceekkku)
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , math.floor(ballanceekkku))
Redis:setex(FDFGERB.."iiooooo" .. msg.sender_id.user_id,900, true)
LuaTele.sendText(msg.chat_id,msg.id, "• كفو فزت بالمضاربه !\n• نسبة الربح ⇠ "..modarbaa.."%\n• المبلغ الذي ربحته ⇠ ( "..convert_mony.." ريال 💸 )\n• فلوسك صارت ⇠ ( "..convert_mony1.." ريال 💸 )\n-","md",true)
end
else
LuaTele.sendText(msg.chat_id,msg.id, "• ماعندك حساب بنكي ارسل ⇠ ( `انشاء حساب بنكي` )","md",true)
end
end

if text == 'استثمار' then
ballanceed = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
krses = tonumber(Redis:get(FDFGERB.."kreednum"..msg.sender_id.user_id))
if Redis:get(FDFGERB.."kreed"..msg.sender_id.user_id) and tonumber(ballanceed) > 5000000 then
return LuaTele.sendText(msg.chat_id,msg.id, "• عليك قرض بقيمة "..krses.." ريال 💵 \nقم بسداده بالامر `تسديد القرض` ","md",true)
end
if Redis:ttl("iioooo" .. msg.sender_id.user_id) >= 60 then
local time = Redis:ttl("iioooo" .. msg.sender_id.user_id)
return LuaTele.sendText(msg.chat_id,msg.id,"• مايمديك تستثمر الحين !\n• تعال بعد ( "..time.." ثانية)","md",true)
end
LuaTele.sendText(msg.chat_id,msg.id, "استعمل الامر كذا :\n\n`استثمار` المبلغ","md",true)
end

if text and text:match('^استثمار (.*)$') then
ballanceed = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
krses = tonumber(Redis:get(FDFGERB.."kreednum"..msg.sender_id.user_id))
if Redis:get(FDFGERB.."kreed"..msg.sender_id.user_id) and tonumber(ballanceed) > 5000000 then
return LuaTele.sendText(msg.chat_id,msg.id, "• عليك قرض بقيمة "..krses.." ريال 💵 \nقم بسداده بالامر `تسديد القرض` ","md",true)
end
local F_Name = LuaTele.getUser(msg.sender_id.user_id).first_name
Redis:set(msg.sender_id.user_id.."first_name:", F_Name)
local UserName = text:match('^استثمار (.*)$')
local coniss = (UserName)
if Redis:sismember(FDFGERB.."booob",msg.sender_id.user_id) then
if Redis:ttl("iioooo" .. msg.sender_id.user_id) >= 60 then
local time = Redis:ttl("iioooo" .. msg.sender_id.user_id)
return LuaTele.sendText(msg.chat_id,msg.id,"• مايمديك تستثمر الحين !\n• تعال بعد( "..time.." ثانية)","md",true)
end
ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
if tonumber(coniss) < 99 then
return LuaTele.sendText(msg.chat_id,msg.id, "• ياعيني الحد المسموح فيه 100 ريال 💸\n-","md",true)
end
if tonumber(ballancee) < tonumber(coniss) then
return LuaTele.sendText(msg.chat_id,msg.id, "• فلوسك ما تكفي \n-","md",true)
end
if tonumber(ballancee) < 100000 then
local hadddd = math.random(10,15);
ballanceekk = coniss / 100 * hadddd
ballanceekkk = ballancee + ballanceekk
local convert_mony = string.format("%.0f",ballanceekk)
local convert_mony1 = string.format("%.0f",ballanceekkk)
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , math.floor(ballanceekkk))
Redis:setex("iioooo" .. msg.sender_id.user_id,1200, true)
LuaTele.sendText(msg.chat_id,msg.id, "• استثمار ناجح ! 💰\n• نسبة الربح ⇠ "..hadddd.."%\n• مبلغ الربح ⇠ ( "..convert_mony.." ريال 💸 )\n• فلوسك صارت ⇠ ( "..convert_mony1.." ريال 💸 )\n-","md",true)
else
local hadddd = math.random(1,9);
ballanceekk = coniss / 100 * hadddd
ballanceekkk = ballancee + ballanceekk
local convert_mony = string.format("%.0f",ballanceekk)
local convert_mony1 = string.format("%.0f",ballanceekkk)
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , math.floor(ballanceekkk))
Redis:setex("iioooo" .. msg.sender_id.user_id,1200, true)
LuaTele.sendText(msg.chat_id,msg.id, "• استثمار ناجح ! 💰\n• نسبة الربح ⇠ "..hadddd.."%\n• مبلغ الربح ⇠ ( "..convert_mony.." ريال 💸 )\n• فلوسك صارت ⇠ ( "..convert_mony1.." ريال 💸 )\n-","md",true)
end
else
LuaTele.sendText(msg.chat_id,msg.id, "• ماعندك حساب بنكي ارسل ⇠ ( `انشاء حساب بنكي` )","md",true)
end
end

if text == 'حظ' then
ballanceed = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
krses = tonumber(Redis:get(FDFGERB.."kreednum"..msg.sender_id.user_id))
if Redis:get(FDFGERB.."kreed"..msg.sender_id.user_id) and tonumber(ballanceed) > 5000000 then
return LuaTele.sendText(msg.chat_id,msg.id, "• عليك قرض بقيمة "..krses.." ريال 💸 \nقم بسداده بالامر `تسديد القرض` ","md",true)
end
if Redis:ttl(FDFGERB.."iiooo" .. msg.sender_id.user_id) >= 60 then
local time = Redis:ttl(FDFGERB.."iiooo" .. msg.sender_id.user_id)
return LuaTele.sendText(msg.chat_id,msg.id,"• مايمديك تلعب لعبة الحظ الحين !\n• تعال بعد ( "..time.." ثانية)","md",true)
end
LuaTele.sendText(msg.chat_id,msg.id, "استعمل الامر كذا :\n\n`حظ` المبلغ","md",true)
end

if text and text:match('^حظ (.*)$') then
ballanceed = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
krses = tonumber(Redis:get(FDFGERB.."kreednum"..msg.sender_id.user_id))
if Redis:get(FDFGERB.."kreed"..msg.sender_id.user_id) and tonumber(ballanceed) > 5000000 then
return LuaTele.sendText(msg.chat_id,msg.id, "• عليك قرض بقيمة "..krses.." ريال 💵 \nقم بسداده بالامر `تسديد القرض` ","md",true)
end
local F_Name = LuaTele.getUser(msg.sender_id.user_id).first_name
Redis:set(msg.sender_id.user_id.."first_name:", F_Name)
local UserName = text:match('^حظ (.*)$')
local coniss = (UserName)
if Redis:sismember(FDFGERB.."booob",msg.sender_id.user_id) then
if Redis:ttl(FDFGERB.."iiooo" .. msg.sender_id.user_id) >= 60 then
local time = Redis:ttl(FDFGERB.."iiooo" .. msg.sender_id.user_id)
return LuaTele.sendText(msg.chat_id,msg.id,"• مايمديك تلعب لعبه الحظ الحين !\n• تعال بعد ( "..time.." ثانية)","md",true)
end
ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
if tonumber(ballancee) < tonumber(coniss) then
return LuaTele.sendText(msg.chat_id,msg.id, "• فلوسك ما تكفي \n-","md",true)
end
local daddd = {"1", "2",}
local haddd = daddd[math.random(#daddd)]
if haddd == "1" then
local ballanceek = ballancee + coniss
local convert_mony = string.format("%.0f",ballancee)
local convert_mony1 = string.format("%.0f",ballanceek)
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , math.floor(ballanceek))
Redis:setex(FDFGERB.."iiooo" .. msg.sender_id.user_id,900, true)
LuaTele.sendText(msg.chat_id,msg.id, "• كفو فزت بالحظ ! \n• فلوسك قبل ⇠ ( "..convert_mony.." ريال 💸 )\n• فلوسك الحين ⇠ ( "..convert_mony1.." ريال 💸 )\n-","md",true)
else
local ballanceekk = ballancee - coniss
local convert_mony = string.format("%.0f",ballancee)
local convert_mony1 = string.format("%.0f",ballanceekk)
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , math.floor(ballanceekk))
Redis:setex(FDFGERB.."iiooo" .. msg.sender_id.user_id,900, true)
LuaTele.sendText(msg.chat_id,msg.id, "• واك واك خسرت بالحظ\n• فلوسك قبل ⇠ ( "..convert_mony.." ريال 💸 )\n• فلوسك الحين ⇠ ( "..convert_mony1.." ريال 💸 )\n-","md",true)
end
else
LuaTele.sendText(msg.chat_id,msg.id, "• ماعندك حساب بنكي ارسل ⇠ ( `انشاء حساب بنكي` )","md",true)
end
end

if text == 'تحويل' then
LuaTele.sendText(msg.chat_id,msg.id, "استعمل الامر كذا :\n\n`تحويل` المبلغ","md",true)
end

if text and text:match('^تحويل (.*)$') then
ballanceed = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
krses = tonumber(Redis:get(FDFGERB.."kreednum"..msg.sender_id.user_id))
if Redis:get(FDFGERB.."kreed"..msg.sender_id.user_id) then
return LuaTele.sendText(msg.chat_id,msg.id, "• عليك قرض بقيمة "..krses.." ريال 💵 \nقم بسداده بالامر `تسديد القرض` لكي تستطيع التحويل","md",true)
end
local F_Name = LuaTele.getUser(msg.sender_id.user_id).first_name
Redis:set(msg.sender_id.user_id.."first_name:", F_Name)
local UserName = text:match('^تحويل (.*)$')
local coniss = (UserName)
if not Redis:sismember(FDFGERB.."booob",msg.sender_id.user_id) then
return LuaTele.sendText(msg.chat_id,msg.id, "• ماعندك حساب بنكي ","md",true)
end
if tonumber(coniss) < 100 then
return LuaTele.sendText(msg.chat_id,msg.id, "• ياعيني اكثر شي المسموح فيه 100 ريال 💸 \n-","md",true)
end
ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
if tonumber(ballancee) < 100 then
return LuaTele.sendText(msg.chat_id,msg.id, "• فلوسك ما تكفي \n-","md",true)
end

if tonumber(coniss) > tonumber(ballancee) then
return LuaTele.sendText(msg.chat_id,msg.id, "• فلوسك ما تكفي \n-","md",true)
end

Redis:set("transn"..msg.sender_id.user_id,coniss)
Redis:setex("trans" .. msg.chat_id .. ":" .. msg.sender_id.user_id,60, true)
LuaTele.sendText(msg.chat_id,msg.id,[[
• ارسل الحين رقم الحساب البنكي الي تبي تحول له

– معاك دقيقة وحدة والغي طلب التحويل .
-
]],"md",true)  
return false
end
if Redis:get("trans" .. msg.chat_id .. ":" .. msg.sender_id.user_id) then
cccc = Redis:get(FDFGERB.."boobb"..msg.sender_id.user_id)
uuuu = Redis:get(FDFGERB.."bbobb"..msg.sender_id.user_id)
if text ~= text:match('^(%d+)$') then
Redis:del("trans" .. msg.chat_id .. ":" .. msg.sender_id.user_id) 
Redis:del("transn" .. msg.sender_id.user_id)
return LuaTele.sendText(msg.chat_id,msg.id,"• ارسل رقم حساب بنكي  ","md",true)
end
if text == cccc then
Redis:del("trans" .. msg.chat_id .. ":" .. msg.sender_id.user_id) 
Redis:del("transn" .. msg.sender_id.user_id)
return LuaTele.sendText(msg.chat_id,msg.id,"• مايمديك تحول لنفسك !! ","md",true)
end
if Redis:get(FDFGERB.."boballcc"..text) then
local UserNamey = Redis:get("transn"..msg.sender_id.user_id)
local ban = LuaTele.getUser(msg.sender_id.user_id)
if ban.first_name then
news = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
news = " لا يوجد "
end
local fsvhhh = Redis:get(FDFGERB.."boballid"..text)
local bann = LuaTele.getUser(fsvhhh)
if bann.first_name then
newss = "["..bann.first_name.."](tg://user?id="..bann.id..")"
else
newss = " لا يوجد "
end
local fsvhh = Redis:get(FDFGERB.."boballban"..text)
UserNameyr = UserNamey / 10
UserNameyy = UserNamey - UserNameyr
local convert_mony = string.format("%.0f",UserNameyy)
ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
deccde = ballancee - UserNamey
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , math.floor(deccde))
-----------
decdecb = Redis:get(FDFGERB.."boob"..fsvhhh) or 0
deccde2 = decdecb + UserNameyy
Redis:set(FDFGERB.."boob"..fsvhhh , math.floor(deccde2))

LuaTele.sendText(msg.chat_id,msg.id, "حوالة صادرة من البنك\n\nالمرسل : "..news.."\nالحساب رقم : `"..cccc.."`\nنوع البطاقة : "..uuuu.."\nالمستلم : "..newss.."\nالحساب رقم : `"..text.."`\nنوع البطاقة : "..fsvhh.."\nخصمت 10% رسوم تحويل\nالمبلغ : "..convert_mony.." ريال 💵","md",true)
LuaTele.sendText(fsvhhh,0, "حوالة واردة من البنك\n\nالمرسل : "..news.."\nالحساب رقم : `"..cccc.."`\nنوع البطاقة : "..uuuu.."\nالمبلغ : "..convert_mony.." ريال 💵","md",true)
Redis:del("trans" .. msg.chat_id .. ":" .. msg.sender_id.user_id) 
Redis:del("transn" .. msg.sender_id.user_id)
else
LuaTele.sendText(msg.chat_id,msg.id, "• لا يوجده حساب بنكي كذا","md",true)
Redis:del("trans" .. msg.chat_id .. ":" .. msg.sender_id.user_id) 
Redis:del("transn" .. msg.sender_id.user_id)
end
end


if text == "ترتيبي" then
if Redis:sismember(FDFGERB.."booob",msg.sender_id.user_id) then
local bank_users = Redis:smembers(FDFGERB.."booob")
my_num_in_bank = {}
for k,v in pairs(bank_users) do
local mony = Redis:get(FDFGERB.."boob"..v)
table.insert(my_num_in_bank, {math.floor(tonumber(mony)) , v})
end
table.sort(my_num_in_bank, function(a, b) return a[1] > b[1] end)
for k,v in pairs(my_num_in_bank) do
if tonumber(v[2]) == tonumber(msg.sender_id.user_id) then
local mony = v[1]
return LuaTele.sendText(msg.chat_id,msg.id,"• ترتيبك ( "..k.." )","md",true)
end
end
else
LuaTele.sendText(msg.chat_id,msg.id, "• ماعندك حساب بنكي ارسل ( `انشاء حساب بنكي` )","md",true)
end
end

if text == "توب فلوس" or text == "توب الفلوس" then
local F_Name = LuaTele.getUser(msg.sender_id.user_id).first_name
Redis:set(msg.sender_id.user_id.."first_name:", F_Name)
local bank_users = Redis:smembers(FDFGERB.."booob")
if #bank_users == 0 then
return LuaTele.sendText(msg.chat_id,msg.id,"• ياعيني مافي حسابات في البنك","md",true)
end
top_mony = "توب اغنى 30 شخص :\n\n"
mony_list = {}
for k,v in pairs(bank_users) do
local mony = Redis:get(FDFGERB.."boob"..v)
table.insert(mony_list, {tonumber(mony) , v})
end
table.sort(mony_list, function(a, b) return a[1] > b[1] end)
num = 1
emoji ={ 
"🥇" ,
"🥈",
"🥉",
"4)",
"5)",
"6)",
"7)",
"8)",
"9)",
"10)",
"11)",
"12)",
"13)",
"14)",
"15)",
"16)",
"17)",
"18)",
"19)",
"20)",
"21)",
"22)",
"23)",
"24)",
"25)",
"26)",
"27)",
"28)",
"29)",
"30)"
}
for k,v in pairs(mony_list) do
if num <= 30 then
local user_name = LuaTele.getUser(v[2]).first_name or Redis:get(v[2].."first_name:") or "لا يوجد اسم"
local mony = v[1]
local convert_mony = string.format("%.0f",mony)
local emo = emoji[k]
num = num + 1
top_mony = top_mony..emo.." "..convert_mony.." 💵 ꗝ "..user_name.."\n"
end
end
top_monyy = top_mony.."\n\nاي اسم مخالف او غش باللعب راح يتصفر وينحظر اللاعب"
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = 'Source loner⁦', url="t.me/LDD7D"},
},
}
}
return LuaTele.sendText(msg.chat_id,msg.id,top_monyy,"html",false, false, false, false, reply_markup)
end

if text == "توب الحراميه" or text == "توب الحرامية" or text == "توب حراميه" or text == "توب الزرف" or text == "توب زرف" then
local F_Name = LuaTele.getUser(msg.sender_id.user_id).first_name
Redis:set(msg.sender_id.user_id.."first_name:", F_Name)
local ty_users = Redis:smembers(FDFGERB.."rrfffid")
if #ty_users == 0 then
return LuaTele.sendText(msg.chat_id,msg.id,"• ياعيني مافي احد","md",true)
end
ty_anubis = "توب 20 شخص زرفوا فلوس :\n\n"
ty_list = {}
for k,v in pairs(ty_users) do
local mony = Redis:get(FDFGERB.."rrfff"..v)
table.insert(ty_list, {tonumber(mony) , v})
end
table.sort(ty_list, function(a, b) return a[1] > b[1] end)
num_ty = 1
emojii ={ 
"🥇" ,
"🥈",
"🥉",
"4)",
"5)",
"6)",
"7)",
"8)",
"9)",
"10)",
"11)",
"12)",
"13)",
"14)",
"15)",
"16)",
"17)",
"18)",
"19)",
"20)"
}
for k,v in pairs(ty_list) do
if num_ty <= 20 then
local user_name = LuaTele.getUser(v[2]).first_name or Redis:get(v[2].."first_name:") or "لا يوجد اسم"
local mony = v[1]
local convert_mony = string.format("%.0f",mony)
local emoo = emojii[k]
num_ty = num_ty + 1
ty_anubis = ty_anubis..emoo.." "..convert_mony.." 💵 ꗝ "..user_name.."\n"
end
end
ty_anubiss = ty_anubis.."\n\nاي اسم مخالف او غش باللعب راح يتصفر وينحظر اللاعب"
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = 'Source loner', url="t.me/LDD7D"},
},
}
}
return LuaTele.sendText(msg.chat_id,msg.id,ty_anubiss,"html",false, false, false, false, reply_markup)
end

if text == 'تسديد قرضه' and tonumber(msg.reply_to_message_id) ~= 0 then
local F_Name = LuaTele.getUser(msg.sender_id.user_id).first_name
Redis:set(msg.sender_id.user_id.."first_name:", F_Name)
local Remsg = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Remsg.sender_id.user_id)
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
LuaTele.sendText(msg.chat_id,msg.id,"\n• ماعنده حساب في البنك","md",true)  
return false
end
if Redis:sismember(FDFGERB.."booob",Remsg.sender_id.user_id) then
if Redis:get(FDFGERB.."kreed"..msg.sender_id.user_id) then
return LuaTele.sendText(msg.chat_id,msg.id, "• سدد قرضك اول شي بعدين اعمل راعي النشامى ","md",true)
end
if not Redis:get(FDFGERB.."kreed"..Remsg.sender_id.user_id) then
return LuaTele.sendText(msg.chat_id,msg.id, "• ماعليه قرض ","md",true)
else
local ban = LuaTele.getUser(Remsg.sender_id.user_id)
if ban.first_name then
news = ""..ban.first_name..""
else
news = " لا يوجد"
end
ballanceed = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
krses = tonumber(Redis:get(FDFGERB.."kreednum"..Remsg.sender_id.user_id))
if tonumber(ballanceed) < tonumber(krses) then
return LuaTele.sendText(msg.chat_id,msg.id, "• فلوسك ما تكفي  \n-","md",true)
end
nshme = ballanceed - krses
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id,math.floor(nshme))
ballanceed = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
Redis:del(FDFGERB.."kreed"..Remsg.sender_id.user_id)
Redis:del(FDFGERB.."kreednum"..Remsg.sender_id.user_id)
local convert_mony = string.format("%.0f",ballanceed)
LuaTele.sendText(msg.chat_id,msg.id, "• اشعار تسديد قرض عن "..news.."\n\nالقرض : "..krses.." ريال 💵\nتم اقتطاع المبلغ من فلوسك\nفلوسك حاليا : "..convert_mony.." ريال 💵 ","md",true)
end
else
LuaTele.sendText(msg.chat_id,msg.id, "• ماعنده حساب بنكي  ","md",true)
end
end

if text == 'تسديد قرض' or text == 'تسديد القرض' or text == 'تسديد قرضي' and tonumber(msg.reply_to_message_id) == 0 then
local F_Name = LuaTele.getUser(msg.sender_id.user_id).first_name
Redis:set(msg.sender_id.user_id.."first_name:", F_Name)
if Redis:sismember(FDFGERB.."booob",msg.sender_id.user_id) then
if not Redis:get(FDFGERB.."kreed"..msg.sender_id.user_id) then
return LuaTele.sendText(msg.chat_id,msg.id, "• ماعليك قرض ","md",true)
end
ballanceed = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
krses = tonumber(Redis:get(FDFGERB.."kreednum"..msg.sender_id.user_id))
if tonumber(ballanceed) < tonumber(krses) then
return LuaTele.sendText(msg.chat_id,msg.id, "• فلوسك ما تكفي \n-","md",true)
end
tsded = ballanceed - krses
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id,math.floor(tsded))
ballanceed = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
Redis:del(FDFGERB.."kreed"..msg.sender_id.user_id)
Redis:del(FDFGERB.."kreednum"..msg.sender_id.user_id)
local convert_mony = string.format("%.0f",ballanceed)
LuaTele.sendText(msg.chat_id,msg.id, "• اشعار تسديد قرض\n\nالقرض : "..krses.." ريال 💵\nتم اقتطاع المبلغ من فلوسك\nفلوسك حاليا : "..convert_mony.." ريال 💵","md",true)
else
LuaTele.sendText(msg.chat_id,msg.id, "• ماعندك حساب بنكي ارسل ⇠ ( `انشاء حساب بنكي` )","md",true)
end
end

if text == 'القرض' or text == 'قرض' then
local F_Name = LuaTele.getUser(msg.sender_id.user_id).first_name
Redis:set(msg.sender_id.user_id.."first_name:", F_Name)
krses = tonumber(Redis:get(FDFGERB.."kreednum"..msg.sender_id.user_id))
if Redis:get(FDFGERB.."kreed"..msg.sender_id.user_id) then
return LuaTele.sendText(msg.chat_id,msg.id, "• سحبت قرض بقيمة "..krses.." ريال 💸","md",true)
end
if Redis:sismember(FDFGERB.."booob",msg.sender_id.user_id) then
ballanceed = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
if tonumber(ballanceed) < 100000 then
kredd = tonumber(ballanceed) + 900000
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id,kredd)
Redis:set(FDFGERB.."kreednum"..msg.sender_id.user_id,900000)
Redis:set(FDFGERB.."kreed"..msg.sender_id.user_id,true)
LuaTele.sendText(msg.chat_id,msg.id, "• تم إصدار قرض بقيمة 900000 ريال 💸","md",true)
elseif tonumber(ballanceed) < 200000 then
kredd = tonumber(ballanceed) + 800000
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id,kredd)
Redis:set(FDFGERB.."kreednum"..msg.sender_id.user_id,800000)
Redis:set(FDFGERB.."kreed"..msg.sender_id.user_id,true)
LuaTele.sendText(msg.chat_id,msg.id, "• تم إصدار قرض بقيمة 800000 ريال 💸","md",true)
elseif tonumber(ballanceed) < 300000 then
kredd = tonumber(ballanceed) + 700000
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id,kredd)
Redis:set(FDFGERB.."kreednum"..msg.sender_id.user_id,700000)
Redis:set(FDFGERB.."kreed"..msg.sender_id.user_id,true)
LuaTele.sendText(msg.chat_id,msg.id, "• تم إصدار قرض بقيمة 700000 ريال 💸","md",true)
elseif tonumber(ballanceed) < 400000 then
kredd = tonumber(ballanceed) + 600000
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id,kredd)
Redis:set(FDFGERB.."kreednum"..msg.sender_id.user_id,600000)
Redis:set(FDFGERB.."kreed"..msg.sender_id.user_id,true)
LuaTele.sendText(msg.chat_id,msg.id, "• تم إصدار قرض بقيمة 600000 ريال 💸","md",true)
elseif tonumber(ballanceed) < 500000 then
kredd = tonumber(ballanceed) + 500000
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id,kredd)
Redis:set(FDFGERB.."kreednum"..msg.sender_id.user_id,500000)
Redis:set(FDFGERB.."kreed"..msg.sender_id.user_id,true)
LuaTele.sendText(msg.chat_id,msg.id, "• تم إصدار قرض بقيمة 500000 ريال 💸","md",true)
elseif tonumber(ballanceed) < 600000 then
kredd = tonumber(ballanceed) + 400000
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id,kredd)
Redis:set(FDFGERB.."kreednum"..msg.sender_id.user_id,400000)
Redis:set(FDFGERB.."kreed"..msg.sender_id.user_id,true)
LuaTele.sendText(msg.chat_id,msg.id, "• تم إصدار قرض بقيمة 400000 ريال 💸","md",true)
elseif tonumber(ballanceed) < 700000 then
kredd = tonumber(ballanceed) + 300000
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id,kredd)
Redis:set(FDFGERB.."kreednum"..msg.sender_id.user_id,300000)
Redis:set(FDFGERB.."kreed"..msg.sender_id.user_id,true)
LuaTele.sendText(msg.chat_id,msg.id, "• تم إصدار قرض بقيمة 300000 ريال 💸","md",true)
elseif tonumber(ballanceed) < 800000 then
kredd = tonumber(ballanceed) + 200000
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id,kredd)
Redis:set(FDFGERB.."kreednum"..msg.sender_id.user_id,200000)
Redis:set(FDFGERB.."kreed"..msg.sender_id.user_id,true)
LuaTele.sendText(msg.chat_id,msg.id, "• تم إصدار قرض بقيمة 200000 ريال 💸","md",true)
elseif tonumber(ballanceed) < 900000 then
kredd = tonumber(ballanceed) + 100000
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id,kredd)
Redis:set(FDFGERB.."kreednum"..msg.sender_id.user_id,100000)
Redis:set(FDFGERB.."kreed"..msg.sender_id.user_id,true)
LuaTele.sendText(msg.chat_id,msg.id, "• تم إصدار قرض بقيمة 100000 ريال 💸","md",true)
else
LuaTele.sendText(msg.chat_id,msg.id, "• فلوسك فوق الـ مليون ما يطلع لك قرض ","md",true)
end
else
LuaTele.sendText(msg.chat_id,msg.id, "• ماعندك حساب بنكي ارسل ⇠ ( `انشاء حساب بنكي` )","md",true)
end
end

if text == 'بخشيش' or text == 'بقشيش' then
ballanceed = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
krses = tonumber(Redis:get(FDFGERB.."kreednum"..msg.sender_id.user_id))
if Redis:get(FDFGERB.."kreed"..msg.sender_id.user_id) and tonumber(ballanceed) > 5000000 then
return LuaTele.sendText(msg.chat_id,msg.id, "• عليك قرض بقيمة "..krses.." ريال 💸 \nقم بسداده بالامر `تسديد القرض` ","md",true)
end
local F_Name = LuaTele.getUser(msg.sender_id.user_id).first_name
Redis:set(msg.sender_id.user_id.."first_name:", F_Name)
if Redis:sismember(FDFGERB.."booob",msg.sender_id.user_id) then
if Redis:ttl(FDFGERB.."iioo" .. msg.sender_id.user_id) >=1 then
local hours = Redis:ttl(FDFGERB.."iioo" .. msg.sender_id.user_id) / 60
return LuaTele.sendText(msg.chat_id,msg.id,"• مايمدي اعطيك بخشيش الحين "..math.floor(hours).." ثانية","md",true)
end

local jjjo = math.random(200,1000);
ballanceed = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
bakigcj = ballanceed + jjjo
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , bakigcj)
LuaTele.sendText(msg.chat_id,msg.id,"• دلعتك وعطيتك "..jjjo.." ريال 💸","md",true)
Redis:setex(FDFGERB.."iioo" .. msg.sender_id.user_id,600, true)
else
LuaTele.sendText(msg.chat_id,msg.id, "• ماعندك حساب بنكي ارسل ⇠ ( `انشاء حساب بنكي` )","md",true)
end
end

if text == 'زرف' and tonumber(msg.reply_to_message_id) == 0 then
ballanceed = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
krses = tonumber(Redis:get(FDFGERB.."kreednum"..msg.sender_id.user_id))
if Redis:get(FDFGERB.."kreed"..msg.sender_id.user_id) and tonumber(ballanceed) > 5000000 then
return LuaTele.sendText(msg.chat_id,msg.id, "• عليك قرض بقيمة  "..krses.." ريال 💵 \nقم بسداده بالامر `تسديد القرض` ","md",true)
end
LuaTele.sendText(msg.chat_id,msg.id, "استعمل الامر كذا :\n\n`زرف` بالرد","md",true)
end

if text == 'زرف' or text == 'زرفو' or text == 'زرفه' and tonumber(msg.reply_to_message_id) ~= 0 then
ballanceed = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
krses = tonumber(Redis:get(FDFGERB.."kreednum"..msg.sender_id.user_id))
if Redis:get(FDFGERB.."kreed"..msg.sender_id.user_id) and tonumber(ballanceed) > 5000000 then
return LuaTele.sendText(msg.chat_id,msg.id, "• عليك قرض بقيمة "..krses.." ريال 💵 \nقم بسداده بالامر `تسديد القرض` ","md",true)
end
local F_Name = LuaTele.getUser(msg.sender_id.user_id).first_name
Redis:set(msg.sender_id.user_id.."first_name:", F_Name)
if Redis:sismember(FDFGERB.."booob",msg.sender_id.user_id) then
local Remsg = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Remsg.sender_id.user_id)
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
LuaTele.sendText(msg.chat_id,msg.id,"\n• ماعنده حساب في البنك","md",true)  
return false
end
if Remsg.sender_id.user_id == msg.sender_id.user_id then
LuaTele.sendText(msg.chat_id,msg.id,"\nقلنا انك حمار بس تزرف نفسك! جديده هذي","md",true)  
return false
end
if Redis:ttl(FDFGERB.."iioopolic" .. msg.sender_id.user_id) >= 280 then
return LuaTele.sendText(msg.chat_id,msg.id,"• ياعيني انت بالسجن استنى  ( 5 دقائق )","md",true)
elseif Redis:ttl(FDFGERB.."iioopolic" .. msg.sender_id.user_id) >= 240 then
return LuaTele.sendText(msg.chat_id,msg.id,"• ياعيني انت بالسجن استنى  ( 4 دقائق )","md",true)
elseif Redis:ttl(FDFGERB.."iioopolic" .. msg.sender_id.user_id) >= 180 then
return LuaTele.sendText(msg.chat_id,msg.id,"• ياعيني انت بالسجن استنى  ( 3 دقائق )","md",true)
elseif Redis:ttl(FDFGERB.."iioopolic" .. msg.sender_id.user_id) >= 120 then
return LuaTele.sendText(msg.chat_id,msg.id,"• ياعيني انت بالسجن استنى  ( 2 ثانية)","md",true)
elseif Redis:ttl(FDFGERB.."iioopolic" .. msg.sender_id.user_id) >= 60 then
return LuaTele.sendText(msg.chat_id,msg.id,"• ياعيني انت بالسجن استنى  ( 1 ثانية)","md",true)
end
if Redis:ttl(FDFGERB.."hrame" .. Remsg.sender_id.user_id) >= 60 then
local time = Redis:ttl(FDFGERB.."hrame" .. Remsg.sender_id.user_id)
return LuaTele.sendText(msg.chat_id,msg.id,"• ذا المسكين مزروف قبل شوي \n• يمديك تزرفه بعد ( "..time.." ثانية)","md",true)
end
if Redis:sismember(FDFGERB.."booob",Remsg.sender_id.user_id) then
ballanceed = Redis:get(FDFGERB.."boob"..Remsg.sender_id.user_id) or 0
if tonumber(ballanceed) < 199 then
return LuaTele.sendText(msg.chat_id,msg.id, "• مايمديك تزرفه لان فلوسه اقل من 200 ريال","md",true)
end
local hrame = math.floor(math.random() * 200) + 1;
local hramee = math.floor(math.random() * 5) + 1;
if hramee == 1 or hramee == 2 or hramee == 3 or hramee == 4 then
local ballanceed = Redis:get(FDFGERB.."boob"..Remsg.sender_id.user_id) or 0
local ballancope = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
zrfne = ballanceed - hrame
zrfnee = ballancope + hrame
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , math.floor(zrfnee))
Redis:set(FDFGERB.."boob"..Remsg.sender_id.user_id , math.floor(zrfne))
Redis:setex(FDFGERB.."hrame" .. Remsg.sender_id.user_id,900, true)
local zoropeo = Redis:get(FDFGERB.."rrfff"..msg.sender_id.user_id) or 0
zoroprod = zoropeo + hrame
Redis:set(FDFGERB.."rrfff"..msg.sender_id.user_id,zoroprod)
Redis:sadd(FDFGERB.."rrfffid",msg.sender_id.user_id)
LuaTele.sendText(msg.chat_id,msg.id, "• خذ يالحرامي زرفته "..hrame.." ريال 💸\n-","md",true)
else
Redis:setex(FDFGERB.."iioopolic" .. msg.sender_id.user_id,300, true)
LuaTele.sendText(msg.chat_id,msg.id, "• ي ظالم توك زارف \n-","md",true)
end
else
LuaTele.sendText(msg.chat_id,msg.id, "• ماعنده حساب في بنكي","md",true)
end
else
LuaTele.sendText(msg.chat_id,msg.id, "• ماعندك حساب بنكي ارسل ⇠ ( `انشاء حساب بنكي` )","md",true)
end
end

if text == 'راتب' or text == 'راتبي' then
ballanceed = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
krses = tonumber(Redis:get(FDFGERB.."kreednum"..msg.sender_id.user_id))
if Redis:get(FDFGERB.."kreed"..msg.sender_id.user_id) and tonumber(ballanceed) > 5000000 then
return LuaTele.sendText(msg.chat_id,msg.id, "• عليك قرض بقيمة  "..krses.." ريال 💵 \nقم بسداده بالامر `تسديد القرض` ","md",true)
end
local F_Name = LuaTele.getUser(msg.sender_id.user_id).first_name
Redis:set(msg.sender_id.user_id.."first_name:", F_Name)
if Redis:sismember(FDFGERB.."booob",msg.sender_id.user_id) then
if Redis:ttl(FDFGERB.."iiioo" .. msg.sender_id.user_id) >= 60 then
local time = Redis:ttl(FDFGERB.."iiioo" .. msg.sender_id.user_id)
return LuaTele.sendText(msg.chat_id,msg.id,"• راتبك بينزل بعد  ( "..time.." ثانية )","md",true)
end

local Textinggt = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52",}
local Descriptioont = Textinggt[math.random(#Textinggt)]
local ban = LuaTele.getUser(msg.sender_id.user_id)
if ban.first_name then
neews = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
neews = " لا يوجد "
end
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
if Descriptioont == "1" then
local ratpep = ballancee + 3000
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 3000 ريال 💵\nوظيفتك : كابتن كريم 🚙\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." ريال 💵","md",true)
Redis:setex(FDFGERB.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "2" then
local ratpep = ballancee + 3500
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 3500 ريال 💵\nوظيفتك : شرطي 👮🏻‍♂️\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." ريال 💵","md",true)
Redis:setex(FDFGERB.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "3" then
local ratpep = ballancee + 3500
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 3500 ريال 💵\nوظيفتك : بياع حبوب 🍻\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." ريال 💵","md",true)
Redis:setex(FDFGERB.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "4" then
local ratpep = ballancee + 3000
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 3000 ريال 💵\nوظيفتك : سواق تاكسي 🚕\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." ريال 💵","md",true)
Redis:setex(FDFGERB.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "5" then
local ratpep = ballancee + 5000
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 5000 ريال 💵\nوظيفتك : قاضي 👨\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." ريال 💵","md",true)
Redis:setex(FDFGERB.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "6" then
local ratpep = ballancee + 2500
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 2500 ريال 💵\nوظيفتك : نوم 🛌\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." ريال 💵","md",true)
Redis:setex(FDFGERB.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "7" then
local ratpep = ballancee + 2700
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 2700 ريال 💵\nوظيفتك : مغني 🎤\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." ريال 💵","md",true)
Redis:setex(FDFGERB.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "8" then
local ratpep = ballancee + 2900
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 2900 ريال 💵\nوظيفتك : كوفيره 💆\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." ريال 💵","md",true)
Redis:setex(FDFGERB.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "9" then
local ratpep = ballancee + 2500
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 2500 ريال 💵\nوظيفتك : ربة منزل 🤷\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." ريال 💵","md",true)
Redis:setex(FDFGERB.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "10" then
local ratpep = ballancee + 2900
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 2900 ريال 💵\nوظيفتك : مربيه اطفال 💁\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." ريال 💵","md",true)
Redis:setex(FDFGERB.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "11" then
local ratpep = ballancee + 3700
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 3700 ريال 💵\nوظيفتك : كهربائي 💡\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." ريال 💵","md",true)
Redis:setex(FDFGERB.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "12" then
local ratpep = ballancee + 3600
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 3600 ريال 💵\nوظيفتك : نجار ⛏\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." ريال 💵","md",true)
Redis:setex(FDFGERB.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "13" then
local ratpep = ballancee + 2400
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 2400 ريال 💵\nوظيفتك : متذوق طعام 🍕\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." ريال 💵","md",true)
Redis:setex(FDFGERB.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "14" then
local ratpep = ballancee + 3000
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 3000 ريال 💵\nوظيفتك : فلاح 👨\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." ريال 💵","md",true)
Redis:setex(FDFGERB.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "15" then
local ratpep = ballancee + 5000
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 5000 ريال 💵\nوظيفتك : كاشير بنده 🙋\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." ريال 💵","md",true)
Redis:setex(FDFGERB.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "16" then
local ratpep = ballancee + 6000
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 6000 ريال 💵\nوظيفتك : ممرض 👨\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." ريال 💵","md",true)
Redis:setex(FDFGERB.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "17" then
local ratpep = ballancee + 3100
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 3100 ريال 💵\nوظيفتك : مهرج 🤹\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." ريال 💵","md",true)
Redis:setex(FDFGERB.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "18" then
local ratpep = ballancee + 3300
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 3300 ريال 💵\nوظيفتك : عامل توصيل 🚴\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." ريال 💵","md",true)
Redis:setex(FDFGERB.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "19" then
local ratpep = ballancee + 4800
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 4800 ريال 💵\nوظيفتك : عسكري 👮\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." ريال 💵","md",true)
Redis:setex(FDFGERB.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "20" then
local ratpep = ballancee + 6000
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 6000 ريال 💵\nوظيفتك : مهندس 👨\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." ريال 💵","md",true)
Redis:setex(FDFGERB.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "21" then
local ratpep = ballancee + 8000
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 8000 ريال 💵\nوظيفتك : وزير 👨\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." ريال 💵","md",true)
Redis:setex(FDFGERB.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "22" then
local ratpep = ballancee + 5500
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 5500 ريال 💵\nوظيفتك : محامي ⚖️\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." ريال 💵","md",true)
Redis:setex(FDFGERB.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "23" then
local ratpep = ballancee + 5500
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 5500 ريال 💵\nوظيفتك : تاجر 💵\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." ريال 💵","md",true)
Redis:setex(FDFGERB.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "24" then
local ratpep = ballancee + 7000
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 7000 ريال 💵\nوظيفتك : دكتور 👨\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." ريال 💵","md",true)
Redis:setex(FDFGERB.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "25" then
local ratpep = ballancee + 2600
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 2600 ريال 💵\nوظيفتك : حفار قبور ⚓\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." ريال 💵","md",true)
Redis:setex(FDFGERB.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "26" then
local ratpep = ballancee + 3000
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 3000 ريال 💵\nوظيفتك : حلاق ✂\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." ريال 💵","md",true)
Redis:setex(FDFGERB.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "27" then
local ratpep = ballancee + 5000
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 5000 ريال 💵\nوظيفتك : إمام مسجد 📿\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." ريال 💵","md",true)
Redis:setex(FDFGERB.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "28" then
local ratpep = ballancee + 3000
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 3000 ريال 💵\nوظيفتك : صياد 🎣\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." ريال 💵","md",true)
Redis:setex(FDFGERB.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "29" then
local ratpep = ballancee + 2300
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 2300 ريال 💵\nوظيفتك : خياط 🧵\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." ريال 💵","md",true)
Redis:setex(FDFGERB.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "30" then
local ratpep = ballancee + 7100
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 7100 ريال 💵\nوظيفتك : طيار 🛩\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." ريال 💵","md",true)
Redis:setex(FDFGERB.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "31" then
local ratpep = ballancee + 5300
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 5300 ريال 💵\nوظيفتك : مودل 🕴\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." ريال 💵","md",true)
Redis:setex(FDFGERB.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "32" then
local ratpep = ballancee + 10000
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 10000 ريال 💵\nوظيفتك : ملك 👑\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." ريال 💵","md",true)
Redis:setex(FDFGERB.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "33" then
local ratpep = ballancee + 2700
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 2700 ريال 💵\nوظيفتك : سباك 🔧\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." ريال 💵","md",true)
Redis:setex(FDFGERB.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "34" then
local ratpep = ballancee + 3900
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 3900 ريال 💵\nوظيفتك : موزع 🗺\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." ريال 💵","md",true)
Redis:setex(FDFGERB.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "35" then
local ratpep = ballancee + 4100
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 4100 ريال 💵\nوظيفتك : سكيورتي 👮\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." ريال 💵","md",true)
Redis:setex(FDFGERB.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "36" then
local ratpep = ballancee + 3500
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 3500 ريال 💵\nوظيفتك : معلم شاورما 🌯\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." ريال ??","md",true)
Redis:setex(FDFGERB.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "37" then
local ratpep = ballancee + 6700
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 6700 ريال 💵\nوظيفتك : دكتور ولاده 👨\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." ريال 💵","md",true)
Redis:setex(FDFGERB.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "38" then
local ratpep = ballancee + 6600
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 6600 ريال 💵\nوظيفتك : مذيع 🗣\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." ريال 💵","md",true)
Redis:setex(FDFGERB.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "39" then
local ratpep = ballancee + 3400
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 3400 ريال 💵\nوظيفتك : عامل مساج 💆\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." ريال 💵","md",true)
Redis:setex(FDFGERB.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "40" then
local ratpep = ballancee + 6300
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 6300 ريال 💵\nوظيفتك : ممثل 🤵\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." ريال 💵","md",true)
Redis:setex(FDFGERB.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "41" then
local ratpep = ballancee + 3000
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 3000 ريال 💵\nوظيفتك : جزار 🥩\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." ريال 💵","md",true)
Redis:setex(FDFGERB.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "42" then
local ratpep = ballancee + 7000
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 7000 ريال 💵\nوظيفتك : مدير بنك 💳\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." ريال 💵","md",true)
Redis:setex(FDFGERB.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "43" then
local ratpep = ballancee + 6000
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 6000 ريال 💵\nوظيفتك : مبرمج 👨\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." ريال 💵","md",true)
Redis:setex(FDFGERB.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "44" then
local ratpep = ballancee + 5000
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 5000 ريال 💵\nوظيفتك : رقاصه 💃\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." ريال 💵","md",true)
Redis:setex(FDFGERB.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "45" then
local ratpep = ballancee + 4900
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 4900 ريال 💵\nوظيفتك : 👩🏼‍💻 صحفي\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." ريال 💵","md",true)
Redis:setex(FDFGERB.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "46" then
local ratpep = ballancee + 5300
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 5300 ريال 💵\nوظيفتك : 🥷 حرامي\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." ريال 💵","md",true)
Redis:setex(FDFGERB.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "47" then
local ratpep = ballancee + 6000
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 6000 ريال 💵\nوظيفتك : 🔮 ساحر\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." ريال 💵","md",true)
Redis:setex(FDFGERB.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "48" then
local ratpep = ballancee + 6500
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 6500 ريال 💵\nوظيفتك : ⚽ لاعب️\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." ريال 💵","md",true)
Redis:setex(FDFGERB.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "49" then
local ratpep = ballancee + 4000
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 4000 ريال 💵\nوظيفتك : 🖼 مصور\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." ريال 💵","md",true)
Redis:setex(FDFGERB.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "50" then
local ratpep = ballancee + 3000
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 3000 ريال 💵\nوظيفتك : ☎️ عامل مقسم\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." ريال 💵","md",true)
Redis:setex(FDFGERB.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "51" then
local ratpep = ballancee + 3200
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 3200 ريال 💵\nوظيفتك : 📖 كاتب\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." ريال 💵","md",true)
Redis:setex(FDFGERB.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "52" then
local ratpep = ballancee + 4000
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 4000 ريال 💵\nوظيفتك : 🧪 مخبري\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." ريال 💵","md",true)
Redis:setex(FDFGERB.."iiioo" .. msg.sender_id.user_id,600, true)
end
else
LuaTele.sendText(msg.chat_id,msg.id, "• ماعندك حساب بنكي ارسل ⇠ ( `انشاء حساب بنكي` )","md",true)
end
end

if text == 'هجوم' then
LuaTele.sendText(msg.chat_id,msg.id, "استعمل الامر كذا :\n\n`هجوم` المبلغ ( بالرد )","md",true)
end
if text and text:match("^هجوم (%d+)$") and msg.reply_to_message_id == 0 then
LuaTele.sendText(msg.chat_id,msg.id, "استعمل الامر كذا :\n\n`هجوم` المبلغ ( بالرد )","md",true)
end

if text and text:match('^هجوم (.*)$') and tonumber(msg.reply_to_message_id) ~= 0 then
local UserName = text:match('^هجوم (.*)$')
local coniss = (UserName)
ballanceed = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
krses = tonumber(Redis:get(FDFGERB.."kreednum"..msg.sender_id.user_id))
if Redis:get(FDFGERB.."kreed"..msg.sender_id.user_id) and tonumber(ballanceed) > 5000000 then
return LuaTele.sendText(msg.chat_id,msg.id, "• عليك قرض بقيمة  "..krses.." ريال 💵 \nقم بسداده بالامر `تسديد القرض` ","md",true)
end
local F_Name = LuaTele.getUser(msg.sender_id.user_id).first_name
Redis:set(msg.sender_id.user_id.."first_name:", F_Name)
if Redis:sismember(FDFGERB.."booob",msg.sender_id.user_id) then
local Remsg = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Remsg.sender_id.user_id)
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
LuaTele.sendText(msg.chat_id,msg.id,"\n• ماعنده حساب في البنك","md",true)  
return false
end
if Remsg.sender_id.user_id == msg.sender_id.user_id then
LuaTele.sendText(msg.chat_id,msg.id,"\nقلنا انك حمار بس تهجم على نفسك! جديده هذي","md",true)  
return false
end
if Redis:ttl(FDFGERB.."attack" .. msg.sender_id.user_id) >= 60 then
  local time = Redis:ttl(FDFGERB.."attack" .. msg.sender_id.user_id)
return LuaTele.sendText(msg.chat_id,msg.id,"• خسرت بأخر معركة استنى ( "..time.." ثانية)","md",true)
end
if Redis:ttl(FDFGERB.."defen" .. Remsg.sender_id.user_id) >= 60 then
local time = Redis:ttl(FDFGERB.."defen" .. Remsg.sender_id.user_id)
return LuaTele.sendText(msg.chat_id,msg.id,"• الخصم خسر بأخر معركة \n• يمديك تهاجمه بعد ( "..time.." ثانية)","md",true)
end
if Redis:sismember(FDFGERB.."booob",Remsg.sender_id.user_id) then
ballancope = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
ballanceed = Redis:get(FDFGERB.."boob"..Remsg.sender_id.user_id) or 0
if tonumber(ballancope) < 100000 then
return LuaTele.sendText(msg.chat_id,msg.id, "• ما يمديك تهجم فلوسك اقل من 100000 ريال 💸","md",true)
end
if tonumber(ballanceed) < 100000 then
return LuaTele.sendText(msg.chat_id,msg.id, "• ما يمديك تهجم عليه فلوسك اقل من 100000 ريال 💸","md",true)
end
if tonumber(coniss) < 9999 then
return LuaTele.sendText(msg.chat_id,msg.id, "• ياعيني اكثر شي المسموح فيه 10000 ريال 💸\n-","md",true)
end
if tonumber(ballancope) < tonumber(coniss) then
return LuaTele.sendText(msg.chat_id,msg.id, "• فلوسك لا تكفي \n-","md",true)
end
if tonumber(ballanceed) < tonumber(coniss) then
return LuaTele.sendText(msg.chat_id,msg.id, "• فلوسك ما تكفي\n-","md",true)
end
local Textinggt = {"1", "2", "3", "4", "5", "6", "7", "8",}
local Descriptioont = Textinggt[math.random(#Textinggt)]
local ban = LuaTele.getUser(msg.sender_id.user_id)
if ban.first_name then
neews = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
neews = " لا يوجد "
end
local bann = LuaTele.getUser(Remsg.sender_id.user_id)
if bann.first_name then
neewss = "["..bann.first_name.."](tg://user?id="..bann.id..")"
else
neewss = " لا يوجد "
end
if Descriptioont == "1" or Descriptioont == "3" then
local ballanceed = Redis:get(FDFGERB.."boob"..Remsg.sender_id.user_id) or 0
local ballancope = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
zrfne = ballancope - coniss
zrfnee = ballanceed + coniss
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , math.floor(zrfne))
Redis:set(FDFGERB.."boob"..Remsg.sender_id.user_id , math.floor(zrfnee))
Redis:setex(FDFGERB.."attack" .. msg.sender_id.user_id,600, true)
local convert_mony = string.format("%.0f",coniss)
LuaTele.sendText(msg.chat_id,msg.id, "• واك واك خسرت بالمعركه "..neews.." 🛡\n• الفائز : "..neewss.."\n• الخاسر :  "..neews.."\n• الجائزة :  "..convert_mony.." ريال 💸\n-","md",true)
elseif Descriptioont == "2" or Descriptioont == "4" or Descriptioont == "5" or  Descriptioont == "6" or Descriptioont == "8" then
local ballanceed = Redis:get(FDFGERB.."boob"..Remsg.sender_id.user_id) or 0
local ballancope = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
begaatt = Redis:get(FDFGERB.."numattack"..msg.sender_id.user_id) or 1000
numattackk = tonumber(begaatt) - 1
if numattackk == 0 then
numattackk = 1
end
attack = coniss / numattackk
zrfne = ballancope + math.floor(attack)
zrfnee = ballanceed - math.floor(attack)
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , math.floor(zrfne))
Redis:set(FDFGERB.."boob"..Remsg.sender_id.user_id , math.floor(zrfnee))
Redis:setex(FDFGERB.."defen" .. Remsg.sender_id.user_id,1800, true)
Redis:set(FDFGERB.."numattack"..msg.sender_id.user_id , math.floor(numattackk))
local convert_mony = string.format("%.0f",math.floor(attack))
LuaTele.sendText(msg.chat_id,msg.id, "• لقد فزت في المعركة\nودمرت قلعة "..neewss.." 🏰\nالفائز : "..neews.."\nالخاسر : "..neewss.."\nالجائزة : "..convert_mony.." ريال 💵\nنسبة قوة المهاجم اصبحت "..numattackk.." 🩸\n-","md",true)
elseif Descriptioont == "7" then
local ballanceed = Redis:get(FDFGERB.."boob"..Remsg.sender_id.user_id) or 0
local ballancope = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
halfzrf = coniss / 2
zrfne = ballancope - halfzrf
zrfnee = ballanceed + halfzrf
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , math.floor(zrfne))
Redis:set(FDFGERB.."boob"..Remsg.sender_id.user_id , math.floor(zrfnee))
Redis:setex(FDFGERB.."attack" .. msg.sender_id.user_id,600, true)
local convert_mony = string.format("%.0f",math.floor(halfzrf))
LuaTele.sendText(msg.chat_id,msg.id, "• واك واك خسرت بالمعركه "..neews.." 🛡\n• ولكن قدرت اعاده نصف الموارد \n• الفائز : "..neewss.."\n• الخاسر : "..neews.."\n• الجائزة : "..convert_mony.." ريال 💸\n-","md",true)
end
else
LuaTele.sendText(msg.chat_id,msg.id, "• ماعنده حساب بنكي ","md",true)
end
else
LuaTele.sendText(msg.chat_id,msg.id, "• ماعندك حساب بنكي ارسل ⇠ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == 'مسح لعبه الزواج' then
if tonumber(msg.sender_id.user_id) == tonumber(5271603990) then
local zwag_users = Redis:smembers(FDFGERB.."roogg1")
for k,v in pairs(zwag_users) do
Redis:del(FDFGERB.."roog1"..v)
Redis:del(FDFGERB.."rooga1"..v)
Redis:del(FDFGERB.."rahr1"..v)
Redis:del(FDFGERB.."rahrr1"..v)
Redis:del(FDFGERB.."roogte1"..v)
end
local zwaga_users = Redis:smembers(FDFGERB.."roogga1")
for k,v in pairs(zwaga_users) do
Redis:del(FDFGERB.."roog1"..v)
Redis:del(FDFGERB.."rooga1"..v)
Redis:del(FDFGERB.."rahr1"..v)
Redis:del(FDFGERB.."rahrr1"..v)
Redis:del(FDFGERB.."roogte1"..v)
end
Redis:del(FDFGERB.."roogga1")
Redis:del(FDFGERB.."roogg1")
LuaTele.sendText(msg.chat_id,msg.id, "• ابشر مسحت لعبه الزواج ","md",true)
end
end
if text == 'زواج' then
LuaTele.sendText(msg.chat_id,msg.id, "استعمل الامر كذا :\n\n`زواج` المهر","md",true)
end
if text and text:match("^زواج (%d+)$") and msg.reply_to_message_id == 0 then
LuaTele.sendText(msg.chat_id,msg.id, "استعمل الامر كذا :\n\n`زواج` المهر ( بالرد )","md",true)
end
if text and text:match("^زواج (.*)$") and msg.reply_to_message_id ~= 0 then
ballanceed = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
krses = tonumber(Redis:get(FDFGERB.."kreednum"..msg.sender_id.user_id))
if Redis:get(FDFGERB.."kreed"..msg.sender_id.user_id) and tonumber(ballanceed) > 5000000 then
return LuaTele.sendText(msg.chat_id,msg.id, "• عليك قرض بقيمة "..krses.." ريال 💵 \nقم بسداده بالامر `تسديد القرض` ","md",true)
end
local F_Name = LuaTele.getUser(msg.sender_id.user_id).first_name
Redis:set(msg.sender_id.user_id.."first_name:", F_Name)
local UserName = text:match('^زواج (.*)$')
local coniss = (UserName)
local Remsg = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Remsg.sender_id.user_id)
if msg.sender_id.user_id == Remsg.sender_id.user_id then
LuaTele.sendText(msg.chat_id,msg.id,"\n• غبي تبي تتزوج نفسك!","md",true)  
return false
end
if tonumber(coniss) < 10000 then
return LuaTele.sendText(msg.chat_id,msg.id, "• ياعيني اكثر شي المسموح فيه 10000 ريال 💸 \n-","md",true)
end
ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
if tonumber(ballancee) < 10000 then
return LuaTele.sendText(msg.chat_id,msg.id, "• فلوسك ما تكفي \n-","md",true)
end
if tonumber(coniss) > tonumber(ballancee) then
return LuaTele.sendText(msg.chat_id,msg.id, "• فلوسك ما تكفي \n-","md",true)
end
local Remsg = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Remsg.sender_id.user_id)
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
LuaTele.sendText(msg.chat_id,msg.id,"\n• مب للزواج ","md",true)  
return false
end
if Redis:get(FDFGERB.."roog1"..msg.sender_id.user_id) then
LuaTele.sendText(msg.chat_id,msg.id, "• ياهطف انت متزوج !!","md",true)
return false
end
if Redis:get(FDFGERB.."rooga1"..msg.sender_id.user_id) then
LuaTele.sendText(msg.chat_id,msg.id, "• ياهطف انت متزوج !! ","md",true)
return false
end
if Redis:get(FDFGERB.."roog1"..Remsg.sender_id.user_id) then
LuaTele.sendText(msg.chat_id,msg.id, "• ابعد بعيد متلفش وتدور حول المتزوجين","md",true)
return false
end
if Redis:get(FDFGERB.."rooga1"..Remsg.sender_id.user_id) then
LuaTele.sendText(msg.chat_id,msg.id, "• ابعد بعيد لا تلف وتدور حول المتزوجين","md",true)
return false
end
local bandd = LuaTele.getUser(msg.sender_id.user_id)
if bandd.first_name then
neews = "["..bandd.first_name.."](tg://user?id="..bandd.id..")"
else
neews = " لا يوجد"
end
local ban = LuaTele.getUser(Remsg.sender_id.user_id)
if ban.first_name then
newws = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
newws = " لا يوجد"
end
if Redis:sismember(FDFGERB.."booob",msg.sender_id.user_id) then
local hadddd = tonumber(coniss)
ballanceekk = tonumber(coniss) / 100 * 15
ballanceekkk = tonumber(coniss) - ballanceekk
local convert_mony = string.format("%.0f",ballanceekkk)
ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
ballanceea = Redis:get(FDFGERB.."boob"..Remsg.sender_id.user_id) or 0
zogtea = ballanceea + ballanceekkk
zeugh = ballancee - tonumber(coniss)
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , math.floor(zeugh))
Redis:set(FDFGERB.."boob"..Remsg.sender_id.user_id , math.floor(zogtea))
Redis:sadd(FDFGERB.."roogg1",msg.sender_id.user_id)
Redis:sadd(FDFGERB.."roogga1",Remsg.sender_id.user_id)
Redis:set(FDFGERB.."roog1"..msg.sender_id.user_id,msg.sender_id.user_id)
Redis:set(FDFGERB.."rooga1"..msg.sender_id.user_id,Remsg.sender_id.user_id)
Redis:set(FDFGERB.."roogte1"..Remsg.sender_id.user_id,Remsg.sender_id.user_id)
Redis:set(FDFGERB.."rahr1"..msg.sender_id.user_id,tonumber(coniss))
Redis:set(FDFGERB.."rahr1"..Remsg.sender_id.user_id,tonumber(coniss))
Redis:set(FDFGERB.."roog1"..Remsg.sender_id.user_id,msg.sender_id.user_id)
Redis:set(FDFGERB.."rahrr1"..msg.sender_id.user_id,math.floor(ballanceekkk))
Redis:set(FDFGERB.."rooga1"..Remsg.sender_id.user_id,Remsg.sender_id.user_id)
Redis:set(FDFGERB.."rahrr1"..Remsg.sender_id.user_id,math.floor(ballanceekkk))
LuaTele.sendText(msg.chat_id,msg.id, "كولولولولويششش\nاليوم عقدنا قران :\n\nالزوج "..neews.." 🤵🏻\n   💗\nالزوجة "..newws.." 👰🏻‍♀️\nالمهر : "..convert_mony.." ريال بعد الضريبة 15%\nعشان تشوفون وثيقة زواجكم اكتبوا : *زواجي*","md",true)
else
LuaTele.sendText(msg.chat_id,msg.id, "• ماعندك حساب بنكي ارسل ⇠ ( `انشاء حساب بنكي` )","md",true)
end
end

if text == "توب زواج" or text == "توب متزوجات" or text == "توب زوجات" or text == "توب زواجات" or text == "زواجات" or text == "الزواجات" then
local F_Name = LuaTele.getUser(msg.sender_id.user_id).first_name
Redis:set(msg.sender_id.user_id.."first_name:", F_Name)
  local zwag_users = Redis:smembers(FDFGERB.."roogg1")
  if #zwag_users == 0 then
  return LuaTele.sendText(msg.chat_id,msg.id,"• ياعيني مافي زواجات حالياً","md",true)
  end
  top_zwag = "توب 30 اغلى زواجات :\n\n"
  zwag_list = {}
  for k,v in pairs(zwag_users) do
  local mahr = Redis:get(FDFGERB.."rahr1"..v)
  local zwga = Redis:get(FDFGERB.."rooga1"..v)
  table.insert(zwag_list, {tonumber(mahr) , v , zwga})
  end
  table.sort(zwag_list, function(a, b) return a[1] > b[1] end)
  znum = 1
  zwag_emoji ={ 
"🥇" ,
"🥈",
"🥉",
"4)",
"5)",
"6)",
"7)",
"8)",
"9)",
"10)",
"11)",
"12)",
"13)",
"14)",
"15)",
"16)",
"17)",
"18)",
"19)",
"20)",
"21)",
"22)",
"23)",
"24)",
"25)",
"26)",
"27)",
"28)",
"29)",
"30)"
  }
  for k,v in pairs(zwag_list) do
  if znum <= 30 then
  local zwg_name = LuaTele.getUser(v[2]).first_name or Redis:get(v[2].."first_name:") or "لا يوجد اسم"
  local zwga_name = LuaTele.getUser(v[3]).first_name or Redis:get(v[3].."first_name:") or "لا يوجد اسم"
  local mahr = v[1]
  local convert_mony = string.format("%.0f",mahr)
  local emo = zwag_emoji[k]
  znum = znum + 1
  top_zwag = top_zwag..emo.." "..convert_mony.." 💵 ꗝ "..zwg_name.." 👫 "..zwga_name.."\n"
  end
  end
  local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = 'Source Loner', url="t.me/LDD7D"},
},
}
}
return LuaTele.sendText(msg.chat_id,msg.id,top_zwag,"html",false, false, false, false, reply_markup)
  end

if text == 'زواجي' then
local F_Name = LuaTele.getUser(msg.sender_id.user_id).first_name
Redis:set(msg.sender_id.user_id.."first_name:", F_Name)
if Redis:sismember(FDFGERB.."roogg1",msg.sender_id.user_id) or Redis:sismember(FDFGERB.."roogga1",msg.sender_id.user_id) then
local zoog = Redis:get(FDFGERB.."roog1"..msg.sender_id.user_id)
local zooga = Redis:get(FDFGERB.."rooga1"..msg.sender_id.user_id)
local mahr = Redis:get(FDFGERB.."rahr1"..msg.sender_id.user_id)
local convert_mony = string.format("%.0f",mahr)
local bandd = LuaTele.getUser(zoog)
if bandd.first_name then
neews = "["..bandd.first_name.."](tg://user?id="..bandd.id..")"
else
neews = " لا يوجد"
end
local ban = LuaTele.getUser(zooga)
if ban.first_name then
newws = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
newws = " لا يوجد"
end
LuaTele.sendText(msg.chat_id,msg.id, "وثيقة الزواج حقتك :\n\nالزوج "..neews.." 🤵🏻\nالزوجة "..newws.." 👰🏻‍♀️\nالمهر : "..convert_mony.." ريال 💵","md",true)
else
LuaTele.sendText(msg.chat_id,msg.id, "• أنت اعزب ","md",true)
end
end

if text == 'زوجها' or text == "زوجته" or text == "جوزها" or text == "زوجتو" or text == "زواجه" and msg.reply_to_message_id ~= 0 then
local F_Name = LuaTele.getUser(msg.sender_id.user_id).first_name
Redis:set(msg.sender_id.user_id.."first_name:", F_Name)
local Remsg = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Remsg.sender_id.user_id)
if msg.sender_id.user_id == Remsg.sender_id.user_id then
LuaTele.sendText(msg.chat_id,msg.id,"\n• خذها مني لا تكشف نفسك وتخسر فلوس \n اكتب `زواجي`*","md",true)  
return false
end
if Redis:sismember(FDFGERB.."roogg1",Remsg.sender_id.user_id) or Redis:sismember(FDFGERB.."roogga1",Remsg.sender_id.user_id) then
if Redis:sismember(FDFGERB.."booob",msg.sender_id.user_id) then
ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
if tonumber(ballancee) < 100 then
return LuaTele.sendText(msg.chat_id,msg.id, "• فلوسك ما تكفي  \n-","md",true)
end
local Remsg = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Remsg.sender_id.user_id)
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
LuaTele.sendText(msg.chat_id,msg.id,"\n• هذا الحلو مو متزوج ","md",true)  
return false
end
local zoog = Redis:get(FDFGERB.."roog1"..Remsg.sender_id.user_id)
local zooga = Redis:get(FDFGERB.."rooga1"..Remsg.sender_id.user_id)
local mahr = Redis:get(FDFGERB.."rahr1"..Remsg.sender_id.user_id)
local bandd = LuaTele.getUser(zoog)
if bandd.first_name then
neews = "["..bandd.first_name.."](tg://user?id="..bandd.id..")"
else
neews = " لا يوجد"
end
local ban = LuaTele.getUser(zooga)
if ban.first_name then
newws = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
newws = " لا يوجد"
end
local otheka = ballancee - 100
local convert_mony = string.format("%.0f",mahr)
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , math.floor(otheka))
LuaTele.sendText(msg.chat_id,msg.id, "وثيقة الزواج حقته :\n\nالزوج "..neews.." 🤵🏻\nالزوجة "..newws.." 👰🏻‍♀️\nالمهر : "..convert_mony.." ريال 💵","md",true)
else
LuaTele.sendText(msg.chat_id,msg.id, "• ماعندك حساب بنكي ارسل ⇠ ( `انشاء حساب بنكي` )","md",true)
end
else
LuaTele.sendText(msg.chat_id,msg.id, "• واك يا أعزب انت مو متزوج ","md",true)
end
end

if text == 'طلاق' then
local F_Name = LuaTele.getUser(msg.sender_id.user_id).first_name
Redis:set(msg.sender_id.user_id.."first_name:", F_Name)
if Redis:sismember(FDFGERB.."roogg1",msg.sender_id.user_id) or Redis:sismember(FDFGERB.."roogga1",msg.sender_id.user_id) then
local zoog = Redis:get(FDFGERB.."roog1"..msg.sender_id.user_id)
local zooga = tonumber(Redis:get(FDFGERB.."rooga1"..msg.sender_id.user_id))
if tonumber(zoog) == msg.sender_id.user_id then
local bandd = LuaTele.getUser(zoog)
if bandd.first_name then
neews = "["..bandd.first_name.."](tg://user?id="..bandd.id..")"
else
neews = " لا يوجد"
end
local ban = LuaTele.getUser(zooga)
if ban.first_name then
newws = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
newws = " لا يوجد"
end
Redis:srem(FDFGERB.."roogg1", msg.sender_id.user_id)
Redis:srem(FDFGERB.."roogga1", msg.sender_id.user_id)
Redis:del(FDFGERB.."roog1"..msg.sender_id.user_id)
Redis:del(FDFGERB.."rooga1"..msg.sender_id.user_id)
Redis:del(FDFGERB.."rahr1"..msg.sender_id.user_id)
Redis:del(FDFGERB.."rahrr1"..msg.sender_id.user_id)
Redis:srem(FDFGERB.."roogg1", zooga)
Redis:srem(FDFGERB.."roogga1", zooga)
Redis:del(FDFGERB.."roog1"..zooga)
Redis:del(FDFGERB.."rooga1"..zooga)
Redis:del(FDFGERB.."rahr1"..zooga)
Redis:del(FDFGERB.."rahrr1"..zooga)
return LuaTele.sendText(msg.chat_id,msg.id, "• وطلقناك من زوجتك "..newws.."","md",true)
else
LuaTele.sendText(msg.chat_id,msg.id, "• الطلاق للزوج بس ","md",true)
end
else
LuaTele.sendText(msg.chat_id,msg.id, "• أنت اعزب ","md",true)
end
end
if text == 'خلع' then
local F_Name = LuaTele.getUser(msg.sender_id.user_id).first_name
Redis:set(msg.sender_id.user_id.."first_name:", F_Name)
if Redis:sismember(FDFGERB.."roogg1",msg.sender_id.user_id) or Redis:sismember(FDFGERB.."roogga1",msg.sender_id.user_id) then
local zoog = Redis:get(FDFGERB.."roog1"..msg.sender_id.user_id)
local zooga = Redis:get(FDFGERB.."rooga1"..msg.sender_id.user_id)
if tonumber(zooga) == msg.sender_id.user_id then
local mahrr = Redis:get(FDFGERB.."rahrr1"..msg.sender_id.user_id)
local bandd = LuaTele.getUser(zoog)
if bandd.first_name then
neews = "["..bandd.first_name.."](tg://user?id="..bandd.id..")"
else
neews = " لا يوجد"
end
local ban = LuaTele.getUser(zooga)
if ban.first_name then
newws = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
newws = " لا يوجد"
end
ballancee = Redis:get(FDFGERB.."boob"..zoog) or 0
kalea = ballancee + mahrr
Redis:set(FDFGERB.."boob"..zoog , kalea)
local convert_mony = string.format("%.0f",mahrr)
LuaTele.sendText(msg.chat_id,msg.id, "• خلعت زوجك  "..neews.."\n• ورجعت له المهر ( "..convert_mony.." ريال 💸 )","md",true)
Redis:srem(FDFGERB.."roogg1", zoog)
Redis:srem(FDFGERB.."roogga1", zoog)
Redis:del(FDFGERB.."roog1"..zoog)
Redis:del(FDFGERB.."rooga1"..zoog)
Redis:del(FDFGERB.."rahr1"..zoog)
Redis:del(FDFGERB.."rahrr1"..zoog)
Redis:srem(FDFGERB.."roogg1", msg.sender_id.user_id)
Redis:srem(FDFGERB.."roogga1", msg.sender_id.user_id)
Redis:del(FDFGERB.."roog1"..msg.sender_id.user_id)
Redis:del(FDFGERB.."rooga1"..msg.sender_id.user_id)
Redis:del(FDFGERB.."rahr1"..msg.sender_id.user_id)
Redis:del(FDFGERB.."rahrr1"..msg.sender_id.user_id)
else
LuaTele.sendText(msg.chat_id,msg.id, "• الخلع للزوجات بس ","md",true)
end
else
LuaTele.sendText(msg.chat_id,msg.id, "• أنت اعزب ","md",true)
end
end
if text == 'مراهنه' or text == 'مراهنة' then
LuaTele.sendText(msg.chat_id,msg.id, "استعمل الامر كذا :\n\n`مراهنه` المبلغ","md",true)
end
if text and text:match('^مراهنه (.*)$') or text and text:match('^مراهنة (.*)$') then
local UserName = text:match('^مراهنه (.*)$') or text:match('^مراهنة (.*)$')
krses = tonumber(Redis:get(FDFGERB.."kreednum"..msg.sender_id.user_id))
if Redis:get(FDFGERB.."kreed"..msg.sender_id.user_id) and tonumber(ballanceed) > 5000000 then
return LuaTele.sendText(msg.chat_id,msg.id, "• عليك قرض بقيمة "..krses.." ريال 💵 \nقم بسداده بالامر `تسديد القرض` ","md",true)
end
local coniss = (UserName)
ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
if tonumber(ballancee) < tonumber(coniss) then
return LuaTele.sendText(msg.chat_id,msg.id, "• فلوسك لا تكفي \n-","md",true)
end
Redis:del(FDFGERB..'List_rhan'..msg.chat_id)  
Redis:set(FDFGERB.."playerrhan"..msg.chat_id,msg.sender_id.user_id)
Redis:set(FDFGERB.."playercoins"..msg.chat_id..msg.sender_id.user_id,coniss)
Redis:set(FDFGERB.."raeahkam"..msg.chat_id,msg.sender_id.user_id)
Redis:sadd(FDFGERB..'List_rhan'..msg.chat_id,msg.sender_id.user_id)
Redis:setex(FDFGERB.."Start_rhan"..msg.chat_id,3600,true)
Redis:set(FDFGERB.."allrhan"..msg.chat_id..12345 , coniss)
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
rehan = tonumber(ballancee) - tonumber(coniss)
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , rehan)
return LuaTele.sendText(msg.chat_id,msg.id,"• بدينا المراهنة وتم تسجيلك  \n• الي يبي يشارك يرسل ( انا والمبلغ ) ","md",true)
end
if text == 'نعم' and Redis:get(FDFGERB.."Witting_Startrhan"..msg.chat_id) then
rarahkam = Redis:get(FDFGERB.."raeahkam"..msg.chat_id)
if tonumber(rarahkam) == msg.sender_id.user_id then
local list = Redis:smembers(FDFGERB..'List_rhan'..msg.chat_id) 
if #list == 1 then 
return LuaTele.sendText(msg.chat_id,msg.id,"• اسف محد شارك بالرهان ","md",true)  
end 
local UserName = list[math.random(#list)]
local UserId_Info = LuaTele.getUser(UserName)
if UserId_Info.username and UserId_Info.username ~= "" then
ls = '['..UserId_Info.first_name..'](tg://user?id='..UserName..')'
else
ls = '@['..UserId_Info.username..']'
end
benrahan = Redis:get(FDFGERB.."allrhan"..msg.chat_id..12345) or 0
local ballancee = Redis:get(FDFGERB.."boob"..UserName) or 0
rehan = tonumber(ballancee) + tonumber(benrahan)
Redis:set(FDFGERB.."boob"..UserName , rehan)

local rhan_users = Redis:smembers(FDFGERB.."List_rhan"..msg.chat_id)
for k,v in pairs(rhan_users) do
Redis:del(FDFGERB..'playercoins'..msg.chat_id..v)
end
Redis:del(FDFGERB..'allrhan'..msg.chat_id..12345) 
Redis:del(FDFGERB..'playerrhan'..msg.chat_id) 
Redis:del(FDFGERB..'raeahkam'..msg.chat_id) 
Redis:del(FDFGERB..'List_rhan'..msg.chat_id) 
Redis:del(FDFGERB.."Witting_Startrhan"..msg.chat_id)
Redis:del(FDFGERB.."Start_rhan"..msg.chat_id)
local ballancee = Redis:get(FDFGERB.."boob"..UserName) or 0
local convert_mony = string.format("%.0f",benrahan)
local convert_monyy = string.format("%.0f",ballancee)
return LuaTele.sendText(msg.chat_id,msg.id,'• فاز '..ls..' بالرهان 🎊\n• المبلغ : '..convert_mony..' ريال 💸\n• رصيدك الحين : '..convert_monyy..' ريال 💸\n-',"md",true)
end
end
if text == 'كنز' then
ballanceed = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
krses = tonumber(Redis:get(FDFGERB.."kreednum"..msg.sender_id.user_id))
if Redis:get(FDFGERB.."kreed"..msg.sender_id.user_id) and tonumber(ballanceed) > 5000000 then
return LuaTele.sendText(msg.chat_id,msg.id, "• عليك قرض بقيمة "..krses.." ريال 💸 \nقم بسداده بالامر `تسديد القرض` ","md",true)
end
local F_Name = LuaTele.getUser(msg.sender_id.user_id).first_name
Redis:set(msg.sender_id.user_id.."first_name:", F_Name)
if Redis:sismember(FDFGERB.."booob",msg.sender_id.user_id) then
if Redis:ttl(FDFGERB.."yiioooo" .. msg.sender_id.user_id) >= 60 then
local time = Redis:ttl(FDFGERB.."yiioooo" .. msg.sender_id.user_id)
return LuaTele.sendText(msg.chat_id,msg.id,"• فرصة الحصول على الكنز بعد ( "..time.." ثانية)","md",true)
end
local Textinggt = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22","23",}
local Descriptioont = Textinggt[math.random(#Textinggt)]
local ban = LuaTele.getUser(msg.sender_id.user_id)
if ban.first_name then
neews = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
neews = " لا يوجد "
end
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
if Descriptioont == "1" then
local knez = ballancee + 40000
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\n• الكنز : قطعة اثرية 🗳\n• المبلغ : 40000 ريال 💸\n• رصيدك الحين : "..convert_mony.." ريال 💸\n-","md",true)
Redis:setex(FDFGERB.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "2" then
local knez = ballancee + 35000
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\n• الكنز : حجر الليدري 💎\n• المبلغ : 35000 ريال 💸\n• رصيدك الحين : "..convert_mony.." ريال 💸\n-","md",true)
Redis:setex(FDFGERB.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "3" then
local knez = ballancee + 10000
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\n• الكنز : لباس قديم 🥻\n• المبلغ : 10000 ريال 💸\n• رصيدك الحين : "..convert_mony.." ريال 💸\n-","md",true)
Redis:setex(FDFGERB.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "4" then
local knez = ballancee + 23000
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\n• الكنز : عصى سحرية 🪄\n• المبلغ : 23000 ريال 💸\n• رصيدك الحين : "..convert_mony.." ريال 💸\n-","md",true)
Redis:setex(FDFGERB.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "5" then
local knez = ballancee + 8000
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\n• الكنز : جوال نوكيا 📱\n• المبلغ : 8000 ريال 💸\n• رصيدك الحين : "..convert_mony.." ريال 💸\n-","md",true)
Redis:setex(FDFGERB.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "6" then
local knez = ballancee + 27000
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\n• الكنز : صدف 🦪 \n• المبلغ : 27000 ريال 💸\n• رصيدك الحين : "..convert_mony.." ريال 💸\n-","md",true)
Redis:setex(FDFGERB.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "7" then
local knez = ballancee + 18000
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\n• الكنز : ابريق صدئ ⚗️\n• المبلغ : 18000 ريال 💸\n• رصيدك الحين :: "..convert_mony.." ريال 💸\n-","md",true)
Redis:setex(FDFGERB.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "8" then
local knez = ballancee + 100000
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : قناع فرعوني 🗿\nسعره : 100000 ريال 💵\nرصيدك حاليا : "..convert_mony.." ريال 💵\n-","md",true)
Redis:setex(FDFGERB.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "9" then
local knez = ballancee + 50000
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\n• الكنز : جرة ذهب 💰\n• المبلغ : 50000 ريال 💸\nرصيدك حاليا : "..convert_mony.." ريال 💵\n-","md",true)
Redis:setex(FDFGERB.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "10" then
local knez = ballancee + 36000
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\n• الكنز : مصباح فضي 🔦\n• المبلغ : 36000 ريال 💸\n• رصيدك الحين : "..convert_mony.." ريال 💸\n-","md",true)
Redis:setex(FDFGERB.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "11" then
local knez = ballancee + 29000
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\n• الكنز : لوحة نحاسية 🎇\n• المبلغ : 29000 ريال 💸\n• رصيدك الحين : "..convert_mony.." ريال 💸\n-","md",true)
Redis:setex(FDFGERB.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "12" then
local knez = ballancee + 1000
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\n• الكنز : جوارب قديمة 🧦\n• المبلغ : 1000 ريال 💸\n• رصيدك الحين : "..convert_mony.." ريال 💸\n-","md",true)
Redis:setex(FDFGERB.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "13" then
local knez = ballancee + 16000
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\n• الكنز : اناء فخاري⚱️\n• المبلغ : 16000 ريال 💸\n• رصيدك الحين : "..convert_mony.." ريال 💸\n-","md",true)
Redis:setex(FDFGERB.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "14" then
local knez = ballancee + 12000
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\n• الكنز : خوذة محارب 🪖\n• المبلغ : 12000 ريال 💸\n• رصيدك الحين : "..convert_mony.." ريال 💸\n-","md",true)
Redis:setex(FDFGERB.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "15" then
local knez = ballancee + 19000
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\n• الكنز : سيف جدي مرزوق 🗡\n• المبلغ : 19000 ريال 💸\n• رصيدك الحين : "..convert_mony.." ريال 💸\n-","md",true)
Redis:setex(FDFGERB.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "16" then
local knez = ballancee + 14000
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\n• الكنز : مكنسة جدتي رقية 🧹\n• المبلغ : 14000 ريال 💸\n• رصيدك الحين : "..convert_mony.." ريال 💸\n-","md",true)
Redis:setex(FDFGERB.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "17" then
local knez = ballancee + 26000
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\n• الكنز : فأس ارطغرل 🪓\n• المبلغ : 26000 ريال 💸\n• رصيدك الحين : "..convert_mony.." ريال 💸\n-","md",true)
Redis:setex(FDFGERB.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "18" then
local knez = ballancee + 22000
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\n• الكنز : مسدس 🔫 \n• المبلغ : 22000 ريال 💸\n• رصيدك الحين : : "..convert_mony.." ريال 💸\n-","md",true)
Redis:setex(FDFGERB.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "19" then
local knez = ballancee + 11000
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\n• الكنز : كبريت ناري 🪔\n• المبلغ : 11000 ريال 💸\n• رصيدك الحين : "..convert_mony.." ريال 💸\n-","md",true)
Redis:setex(FDFGERB.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "20" then
local knez = ballancee + 33000
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\n• الكنز : فرو ثعلب 🦊\n• المبلغ : 33000 ريال 💸\n• رصيدك الحين : "..convert_mony.." ريال 💵\n-","md",true)
Redis:setex(FDFGERB.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "21" then
local knez = ballancee + 40000
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\n• الكنز : جلد تمساح 🐊 \n• المبلغ : 40000 ريال 💸\n• رصيدك الحين : : "..convert_mony.." ريال 💸\n-","md",true)
Redis:setex(FDFGERB.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "22" then
local knez = ballancee + 17000
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\n• الكنز : باقة ورود 💐\n• المبلغ : 17000 ريال 💸\n• رصيدك الحين : "..convert_mony.." ريال 💸\n-","md",true)
Redis:setex(FDFGERB.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "23" then
local Textinggtt = {"1", "2",}
local Descriptioontt = Textinggtt[math.random(#Textinggtt)]
if Descriptioontt == "1" then
local knez = ballancee + 17000
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\n• الكنز : باقة ورود 💐\n• المبلغ : 17000 ريال 💸\n• رصيدك الحين : "..convert_mony.." ريال 💸\n-","md",true)
Redis:setex(FDFGERB.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioontt == "2" then
local Textinggttt = {"1", "2",}
local Descriptioonttt = Textinggttt[math.random(#Textinggttt)]
if Descriptioonttt == "1" then
local knez = ballancee + 40000
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\n• الكنز : جلد تمساح 🐊\n• المبلغ : 40000 ريال 💸\n• رصيدك الحين : "..convert_mony.." ريال 💸\n-","md",true)
Redis:setex(FDFGERB.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioonttt == "2" then
local knez = ballancee + 10000000
Redis:set(FDFGERB.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(FDFGERB.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\n• الكنز :  حقيبة محاسب البنك 💼\n• المبلغ : 10000000 ريال 💸\n• رصيدك الحين : "..convert_mony.." ريال 💸\n-","md",true)
Redis:setex(FDFGERB.."yiioooo" .. msg.sender_id.user_id,1800, true)
end
end
end
else
LuaTele.sendText(msg.chat_id,msg.id, "• انت لا تمتلك حساب بنكي ارسل ⇠ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^حظر حساب (.*)$') then
local UserName = text:match('^حظر حساب (.*)$')
local coniss = (UserName)
if tonumber(msg.sender_id.user_id) == tonumber(5271603990) then
Redis:set(FDFGERB.."bandid"..coniss,coniss)
LuaTele.sendText(msg.chat_id,msg.id, "• تم حظر الحساب "..coniss.." من لعبة البنك\n-","md",true)
end
end
if text and text:match('^الغاء حظر حساب (.*)$') then
local UserName = text:match('^الغاء حظر حساب (.*)$')
local coniss = (UserName)
if tonumber(msg.sender_id.user_id) == tonumber(5271603990) then
Redis:del(FDFGERB.."bandid"..coniss)
LuaTele.sendText(msg.chat_id,msg.id, "• تم الغاء حظر الحساب "..coniss.." من لعبة البنك\n-","md",true)
end
end
if text and text:match("^اضف فلوس (.*)$") and msg.reply_to_message_id ~= 0 then
local UserName = text:match('^اضف فلوس (.*)$')
local coniss = tostring(UserName)
local coniss = coniss:gsub('٠','0')
local coniss = coniss:gsub('١','1')
local coniss = coniss:gsub('٢','2')
local coniss = coniss:gsub('٣','3')
local coniss = coniss:gsub('٤','4')
local coniss = coniss:gsub('٥','5')
local coniss = coniss:gsub('٦','6')
local coniss = coniss:gsub('٧','7')
local coniss = coniss:gsub('٨','8')
local coniss = coniss:gsub('٩','9')
local coniss = coniss:gsub('-','')
local coniss = tonumber(coniss)
if msg.ControllerBot then
local Remsg = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Remsg.sender_id.user_id)
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
LuaTele.sendText(msg.chat_id,msg.id,"\n•  ماعنده حساب بنكي ","md",true)  
return false
end
local ban = LuaTele.getUser(Remsg.sender_id.user_id)
if ban.first_name then
news = ""..ban.first_name..""
else
news = " لا يوجد"
end
if Redis:sismember(FDFGERB.."booob",Remsg.sender_id.user_id) then
Redis:incrby(FDFGERB.."boob"..Remsg.sender_id.user_id , coniss)
ccccc = Redis:get(FDFGERB.."boobb"..Remsg.sender_id.user_id)
uuuuu = Redis:get(FDFGERB.."bbobb"..Remsg.sender_id.user_id)
ppppp = Redis:get(FDFGERB.."zrfff"..Remsg.sender_id.user_id) or 0
ballanceed = Redis:get(FDFGERB.."boob"..Remsg.sender_id.user_id) or 0
LuaTele.sendText(msg.chat_id,msg.id, "•  الاسم ⇠ "..news.."\n•  الحساب ⇠ `"..ccccc.."`\n•  نوع ⇠ ( "..uuuuu.." )\n•  الزرف ⇠ ( "..ppppp.." ريال 💸 )\n•  صار رصيده ⇠ ( "..ballanceed.." ريال 💸 )\n-","md",true)
else
LuaTele.sendText(msg.chat_id,msg.id, "• ماعنده حساب بنكي ","md",true)
end
end
end
if text and text:match("^خصم فلوس (.*)$") and msg.reply_to_message_id ~= 0 then
local UserName = text:match('^خصم فلوس (.*)$')
local coniss = tostring(UserName)
local coniss = coniss:gsub('٠','0')
local coniss = coniss:gsub('١','1')
local coniss = coniss:gsub('٢','2')
local coniss = coniss:gsub('٣','3')
local coniss = coniss:gsub('٤','4')
local coniss = coniss:gsub('٥','5')
local coniss = coniss:gsub('٦','6')
local coniss = coniss:gsub('٧','7')
local coniss = coniss:gsub('٨','8')
local coniss = coniss:gsub('٩','9')
local coniss = coniss:gsub('-','')
local coniss = tonumber(coniss)
if msg.ControllerBot then
local Remsg = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Remsg.sender_id.user_id)
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
LuaTele.sendText(msg.chat_id,msg.id,"\n• ماعنده حساب بنكي","md",true)  
return false
end
local ban = LuaTele.getUser(Remsg.sender_id.user_id)
if ban.first_name then
news = ""..ban.first_name..""
else
news = " لا يوجد"
end
if Redis:sismember(FDFGERB.."booob",Remsg.sender_id.user_id) then
Redis:decrby(FDFGERB.."boob"..Remsg.sender_id.user_id , coniss)
ccccc = Redis:get(FDFGERB.."boobb"..Remsg.sender_id.user_id)
uuuuu = Redis:get(FDFGERB.."bbobb"..Remsg.sender_id.user_id)
ppppp = Redis:get(FDFGERB.."zrfff"..Remsg.sender_id.user_id) or 0
ballanceed = Redis:get(FDFGERB.."boob"..Remsg.sender_id.user_id) or 0
LuaTele.sendText(msg.chat_id,msg.id, "•  الاسم ⇠ "..news.."\n•  الحساب ⇠ `"..ccccc.."`\n•  نوع ⇠ ( "..uuuuu.." )\n•  الزرف ⇠ ( "..ppppp.." ريال 💸 )\n•  صار رصيده ⇠ ( "..ballanceed.." ريال 💸 )\n-","md",true)
else
LuaTele.sendText(msg.chat_id,msg.id, "•  ماعنده حساب بنكي ","md",true)
end
end
end
if text == "توب" or text == "التوب" then
local toptop = "• اهلين فيك في قوائم التوب\n• تحكّم عن طريق الازرار .\n-"
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = 'توب الحراميه 💰', data = msg.sender_id.user_id..'/topzrf'},{text = 'توب الفلوس 💸', data = msg.sender_id.user_id..'/topmon'},
},
{
{text = 'Source loner', url="t.me/LDD7D"},
},
}
}
return LuaTele.sendText(msg.chat_id,msg.id,toptop,"md",false, false, false, false, reply_markup)
end
--البنك نهايه

if text == "العكس" then
if Redis:get(FDFGERB.."FDFGERB:Status:Games"..msg.chat_id) then
Redis:del(FDFGERB.."FDFGERB:Set:Aks"..msg.chat_id)
katu = {"باي","فهمت","موزين","اسمعك","احبك","موحلو","نضيف","حاره","واطي","جوه","سريع","ونسه","طويل","سمين","ضعيف","متربي","شجاع","رحت","عايش","نشيط","شبعان","موعطشان","ولد","حيوان","هادي"}
name = katu[math.random(#katu)]
Redis:set(FDFGERB.."FDFGERB:Game:Reflection"..msg.chat_id,name)
name = string.gsub(name,"باي","هلو")
name = string.gsub(name,"فهمت","مافهمت")
name = string.gsub(name,"موزين","زين")
name = string.gsub(name,"اسمعك","ماسمعك")
name = string.gsub(name,"احبك","ماحبك")
name = string.gsub(name,"موحلو","حلو")
name = string.gsub(name,"نضيف","وصخ")
name = string.gsub(name,"حاره","بارده")
name = string.gsub(name,"واطي","عالي")
name = string.gsub(name,"تحت","فوك")
name = string.gsub(name,"سريع","بطيء")
name = string.gsub(name,"ونسه","طفش")
name = string.gsub(name,"طويل","قصير")
name = string.gsub(name,"سمين","ضعيف")
name = string.gsub(name,"ضعيف","قوي")
name = string.gsub(name,"متربي","مش متربي")
name = string.gsub(name,"شجاع","جبان")
name = string.gsub(name,"رحت","اجيت")
name = string.gsub(name,"عايش","ميت")
name = string.gsub(name,"نشيط","كسول")
name = string.gsub(name,"شبعان","جوعان")
name = string.gsub(name,"موعطشان","عطشان")
name = string.gsub(name,"بنت","ولد")
name = string.gsub(name,"انسان","حيوان")
name = string.gsub(name,"هادي","عصبي")
return LuaTele.sendText(msg_chat_id,msg_id,"• اسرع واحد يرسل العكس ~ ( "..name.." )","md",true)  
end
end
if text == "حجره" then   
if Redis:get(FDFGERB.."FDFGERB:Status:Games"..msg.chat_id) then 
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '🪨', data = '/loner1'}, {text = '📄', data = '/loner2'}, {text = '✂️', data = '/loner3'}, 
},
}
}
return LuaTele.sendText(msg_chat_id,msg_id, [[
• اختار حجره - ورقه - مقص
]],"md",false, false, false, false, reply_markup)
end
end
if text == "بات" or text == "محيبس" then   
if Redis:get(FDFGERB.."FDFGERB:Status:Games"..msg.chat_id) then 
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '⑴ »  👊 ', data = '/Mahibes1'}, {text = '⑵ »  👊 ', data = '/Mahibes2'}, 
},
{
{text = '⑶ »  👊 ', data = '/Mahibes3'}, {text = '⑷ »  👊 ', data = '/Mahibes4'}, 
},
{
{text = '⑸ »  👊 ', data = '/Mahibes5'}, {text = '𝟔 »  👊 ', data = '/Mahibes6'}, 
},
}
}
return LuaTele.sendText(msg_chat_id,msg_id, [[
• لعبه المحيبس هي لعبة الحظ 
• جرب حظك ويه البوت وتسلى 
• كل ما عليك هوا الضغط على احدى الارقام في الازرار
]],"md",false, false, false, false, reply_markup)
end
end
if text == "المختلف" then
if Redis:get(FDFGERB.."FDFGERB:Status:Games"..msg.chat_id) then
mktlf = {"😸","☠","🐼","🐇","🌑","🌚","⭐️","✨","⛈","🌥","⛄️","👨‍🔬","👨‍💻","👨‍🔧","🧚‍♀","??‍♂","🧝‍♂","🙍‍♂","🧖‍♂","👬","🕒","🕤","⌛️","📅",};
name = mktlf[math.random(#mktlf)]
Redis:set(FDFGERB.."FDFGERB:Game:Difference"..msg.chat_id,name)
name = string.gsub(name,"😸","😹😹😹😹😹😹😹😹😸😹😹😹😹")
name = string.gsub(name,"☠","💀💀💀💀💀💀💀☠💀💀💀💀💀")
name = string.gsub(name,"🐼","👻👻👻🐼👻👻👻👻👻👻👻")
name = string.gsub(name,"🐇","🕊🕊🕊🕊🕊🐇🕊🕊🕊🕊")
name = string.gsub(name,"🌑","🌚🌚🌚🌚🌚🌑🌚🌚🌚")
name = string.gsub(name,"🌚","🌑🌑🌑🌑🌑🌚🌑🌑🌑")
name = string.gsub(name,"⭐️","🌟🌟🌟🌟🌟🌟🌟🌟⭐️🌟🌟🌟")
name = string.gsub(name,"✨","💫💫💫💫💫✨💫💫💫💫")
name = string.gsub(name,"⛈","🌨🌨🌨🌨🌨⛈🌨🌨🌨🌨")
name = string.gsub(name,"🌥","⛅️⛅️⛅️⛅️⛅️⛅️🌥⛅️⛅️⛅️⛅️")
name = string.gsub(name,"⛄️","☃☃☃☃☃☃⛄️☃☃☃☃")
name = string.gsub(name,"👨‍🔬","👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👨‍🔬👩‍🔬👩‍🔬👩‍🔬")
name = string.gsub(name,"👨‍💻","👩‍💻👩‍??👩‍‍💻👩‍‍??👩‍‍💻👨‍💻??‍💻👩‍💻👩‍💻")
name = string.gsub(name,"👨‍🔧","👩‍🔧👩‍🔧👩‍🔧👩‍🔧👩‍🔧👩‍🔧👨‍🔧👩‍🔧")
name = string.gsub(name,"👩‍🍳","👨‍🍳👨‍🍳👨‍🍳👨‍🍳👨‍🍳👩‍🍳👨‍🍳👨‍🍳??‍🍳")
name = string.gsub(name,"🧚‍♀","🧚‍♂🧚‍♂🧚‍♂🧚‍♂🧚‍♀🧚‍♂🧚‍♂")
name = string.gsub(name,"🧜‍♂","🧜‍♀🧜‍♀🧜‍♀🧜‍♀🧜‍♀🧚‍♂🧜‍♀🧜‍♀🧜‍♀")
name = string.gsub(name,"🧝‍♂","🧝‍♀🧝‍♀🧝‍♀🧝‍♀🧝‍♀🧝‍♂🧝‍♀🧝‍♀🧝‍♀")
name = string.gsub(name,"🙍‍♂️","🙎‍♂️🙎‍♂️🙎‍♂️🙎‍♂️🙎‍♂️🙍‍♂️🙎‍♂️🙎‍♂️🙎‍♂️")
name = string.gsub(name,"🧖‍♂️","🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♂️🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♀️")
name = string.gsub(name,"👬","👭👭👭👭👭👬👭👭👭")
name = string.gsub(name,"👨‍👨‍👧","👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👧👨‍👨‍👦👨‍👨‍👦")
name = string.gsub(name,"🕒","🕒🕒🕒🕒🕒🕒🕓🕒🕒🕒")
name = string.gsub(name,"🕤","🕥🕥🕥🕥🕥🕤🕥🕥🕥")
name = string.gsub(name,"⌛️","⏳⏳⏳⏳⏳⏳⌛️⏳⏳")
name = string.gsub(name,"📅","📆📆📆📆📆📆📅📆📆")
return LuaTele.sendText(msg_chat_id,msg_id,"• اسرع واحد يرسل الاختلاف ~ ( "..name.." )","md",true)  
end
end
if text == "امثله" then
if Redis:get(FDFGERB.."FDFGERB:Status:Games"..msg.chat_id) then
mthal = {"جوز","ضراطه","الحبل","الحافي","شقره","بيدك","سلايه","النخله","الخيل","حداد","المبلل","يركص","قرد","العنب","العمه","الخبز","بالحصاد","شهر","شكه","يكحله",};
name = mthal[math.random(#mthal)]
Redis:set(FDFGERB.."FDFGERB:Game:Example"..msg.chat_id,name)
name = string.gsub(name,"جوز","ينطي____للماعده سنون")
name = string.gsub(name,"ضراطه","الي يسوق المطي يتحمل___")
name = string.gsub(name,"بيدك","اكل___محد يفيدك")
name = string.gsub(name,"الحافي","تجدي من___نعال")
name = string.gsub(name,"شقره","مع الخيل يا___")
name = string.gsub(name,"النخله","الطول طول___والعقل عقل الصخلة")
name = string.gsub(name,"سلايه","بالوجه امراية وبالظهر___")
name = string.gsub(name,"الخيل","من قلة___شدو على الچلاب سروج")
name = string.gsub(name,"حداد","موكل من صخم وجهه كال آني___")
name = string.gsub(name,"المبلل","___ما يخاف من المطر")
name = string.gsub(name,"الحبل","اللي تلدغة الحية يخاف من جرة___")
name = string.gsub(name,"يركص","المايعرف___يكول الكاع عوجه")
name = string.gsub(name,"العنب","المايلوح___يكول حامض")
name = string.gsub(name,"العمه","___إذا حبت الچنة ابليس يدخل الجنة")
name = string.gsub(name,"الخبز","انطي___للخباز حتى لو ياكل نصه")
name = string.gsub(name,"باحصاد","اسمة___ومنجله مكسور")
name = string.gsub(name,"شهر","امشي__ولا تعبر نهر")
name = string.gsub(name,"شكه","يامن تعب يامن__يا من على الحاضر لكة")
name = string.gsub(name,"القرد","__بعين امه غزال")
name = string.gsub(name,"يكحله","اجه___عماها")
return LuaTele.sendText(msg_chat_id,msg_id,"• اسرع واحد يكمل المثل ~ ( "..name.." )","md",true)  
end
end
if text and text:match("^بيع مجوهراتي (%d+)$") then
local NumGame = text:match("^بيع مجوهراتي (%d+)$") 
if tonumber(NumGame) == tonumber(0) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• لا استطيع البيع اقل من 1 ","md",true)  
end
local NumberGame = Redis:get(FDFGERB.."FDFGERB:Num:Add:Games"..msg.chat_id..msg.sender_id.user_id)
if tonumber(NumberGame) == tonumber(0) then
return LuaTele.sendText(msg_chat_id,msg_id,"• ليس لديك جواهر من الالعاب \n• اذا كنت تريد ربح الجواهر \n• ارسل الالعاب وابدأ اللعب ! ","md",true)  
end
if tonumber(NumGame) > tonumber(NumberGame) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• ليس لديك جواهر بهاذا العدد \n• لزيادة مجوهراتك في اللعبه \n• ارسل الالعاب وابدأ اللعب !","md",true)   
end
local NumberGet = (NumGame * 50)
Redis:decrby(FDFGERB.."FDFGERB:Num:Add:Games"..msg.chat_id..msg.sender_id.user_id,NumGame)  
Redis:incrby(FDFGERB.."FDFGERB:Num:Message:User"..msg.chat_id..":"..msg.sender_id.user_id,NumGame)  
return LuaTele.sendText(msg_chat_id,msg_id,"• تم خصم •  "..NumGame.."  من مجوهراتك \n• وتم اضافة-  "..(NumGame * 50).."  رساله الى رسالك ","md",true)  
end 
if text and text:match("^اضف مجوهرات (%d+)$") and msg.reply_to_message_id ~= 0 then
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender_id.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
Redis:incrby(FDFGERB.."FDFGERB:Num:Add:Games"..msg.chat_id..Message_Reply.sender_id.user_id, text:match("^اضف مجوهرات (%d+)$"))  
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"• تم اضافه له  "..text:match("^اضف مجوهرات (%d+)$").."  من المجوهرات").Reply,"md",true)  
end
if text and text:match("^اضف رسائل (%d+)$") and msg.reply_to_message_id ~= 0 then
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 الادمن】 فقط ',"md",true)  
end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender_id.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
Redis:incrby(FDFGERB.."FDFGERB:Num:Message:User"..msg.chat_id..":"..Message_Reply.sender_id.user_id, text:match("^اضف رسائل (%d+)$"))  
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"• تم اضافه له  "..text:match("^اضف رسائل (%d+)$").."  من الرسائل").Reply,"md",true)  
end
if text == "مجوهراتي" then 
local Num = Redis:get(FDFGERB.."FDFGERB:Num:Add:Games"..msg.chat_id..msg.sender_id.user_id) or 0
if Num == 0 then 
return LuaTele.sendText(msg_chat_id,msg_id, "• لم تفز بأي مجوهره ","md",true)  
else
return LuaTele.sendText(msg_chat_id,msg_id, "• عدد الجواهر التي ربحتها ⇠ "..Num.." ","md",true)  
end
end



end -- GroupBot
if chat_type(msg.chat_id) == "UserBot" then 
if text == 'تحديث الملفات •' or text == 'تحديث' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
print('Chat Id : '..msg_chat_id)
print('User Id : '..msg_user_send_id)
LuaTele.sendText(msg_chat_id,msg_id, "• تم تحديث الملفات ","md",true)
dofile('FDFGERB.lua')  
end
if text == 'قسم الافتارات' then 
local reply_markup = LuaTele.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{
{text = 'افتار شباب',type = 'text'},{text = 'افتار بنات',type = 'text'},
},
{
{text = 'انمي', type = 'text'},{text = 'BTS', type = 'text'},
},
{
{text = 'اسود وابيض', type = 'text'},{text = 'كلاسيك', type = 'text'},
},
{
{text = 'حب', type = 'text'},{text = 'تيكن', type = 'text'},
},
{ 
{text = 'رجوع',type = 'text'}, 
},
}
}
return LuaTele.sendText(msg_chat_id,msg_id,'• اختار الي تبيه من الافتارات .', 'md', false, false, false, false, reply_markup)
end
------------------------------------ كود لوحة الاعضاء  -------------------
if text == 'افتار شباب' then 
Abs = math.random(2,67); 
local Text ='• تم اختيار افتار ولد لك'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '❲ Source loner ❳', url = 't.me/LDD7D'}
},
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/xxjsjsssss/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
------------------------------------ كود لوحة الاعضاء  -------------------
if text == 'افتار بنات' then 
Abs = math.random(22,90); 
local Text ='• تم اختيار افتار بنت .'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '❲ Source loner ❳', url = 't.me/LDD7D'}
},
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/fffuxuzzs/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
------------------------------------ كود لوحة الاعضاء  -------------------
if text == 'انمي' then 
Abs = math.random(69,279); 
local Text ='• تم اختيار انمي لك .'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '❲ Source loner ❳', url = 't.me/LDD7D'}
},
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/cxaee/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
------------------------------------ كود لوحة الاعضاء  ---------------------
if text == "BTS" then 
Abs = math.random(10,92); 
local Text ='• تم اختيار افتار BTS '
keyboardd = {} 
keyboardd.inline_keyboard = {
{
{text = '❲ Source loner ❳', url = 't.me/LDD7D'}
},
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/xcososss/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
------------------------------------ كود لوحة الاعضاء  -------------------
if text == 'اسود وابيض' then 
Abs = math.random(2,32); 
local Text ='• تم اختيار صوره لك'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '❲ Source loner ❳', url = 't.me/LDD7D'}
},
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/zzz7z7ss7aa/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
------------------------------------ كود لوحة الاعضاء  -------------------
if text == 'حب' then 
Abs = math.random(2,24); 
local Text ='• تم اختيار صوره لك'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '❲ Source loner ❳', url = 't.me/LDD7D'}
},
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/zzuauwwuaisz/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
------------------------------------ كود لوحة الاعضاء  -------------------
if text == 'تيكن' then 
Abs = math.random(2,24); 
local Text ='• تم اختيار صوره لك'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '❲ Source loner ❳', url = 't.me/LDD7D'}
},
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/zzuauwwuaisz/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
------------------------------------ كود لوحة الاعضاء  -------------------
if text == 'كلاسيك' then 
Abs = math.random(2,35); 
local Text ='• تم اختيار صوره لك'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '❲ Source loner ❳', url = 't.me/LDD7D'}
},
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/klaseekd/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
------------------------------------ كود لوحة الاعضاء  -------------------
if text == 'قسم الاغاني و القران' then 
local reply_markup = LuaTele.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{
{text = 'قران',type = 'text'}, 
},
{ 
{text = 'غنيلي',type = 'text'},{text = 'ميمز',type = 'text'},
},
{
{text = 'شعر',type = 'text'},{text = 'اطربني',type = 'text'},
},
{ 
{text = 'رجوع',type = 'text'}, 
},
}
}
return LuaTele.sendText(msg_chat_id,msg_id,'• اختار ماتريده من الاغاني و القران  .', 'md', false, false, false, false, reply_markup)
end
------------------------------------ كود لوحة الاعضاء  -------------------
if text == 'ميمز' then 
Abs = math.random(2,140); 
local Text ='• تم اختيار الميمز لك فقط'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '❲ Source loner ❳', url = 't.me/LDD7D'}
},
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendVoice?chat_id=' .. msg.chat_id .. '&voice=https://t.me/MemzWaTaN/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
------------------------------------ كود لوحة الاعضاء  -------------------
if text == 'شعر' then 
Abs = math.random(7,592); 
local Text ='• تم اختيار الشعر لك فقط .'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '❲ Source loner ❳', url = 't.me/LDD7D'}
},
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendVoice?chat_id=' .. msg.chat_id .. '&voice=https://t.me/L1BBBL/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
------------------------------------ كود لوحة الاعضاء  -------------------
if text == 'غنيلي' then 
Abs = math.random(53,269); 
local Text ='• تم اختيار الاغنيه لك .'
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '❲ Source loner ❳', url = 't.me/LDD7D'}},
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendVoice?chat_id=' .. msg.chat_id .. '&voice=https://t.me/xoxoo/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
------------------------------------ كود لوحة الاعضاء  -------------------
if text == 'اطربني' then 
Abs = math.random(3,59); 
local Text ='• تم اختيار طرب لك . '
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '❲ Source loner ❳', url = 't.me/LDD7D'}
},
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendVoice?chat_id=' .. msg.chat_id .. '&voice=https://t.me/singFOT/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
------------------------------------ كود لوحة الاعضاء  -------------------
if text == 'قران' then 
Abs = math.random(2,140); 
local Text ='• تم اختيار قران لك . '
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '❲ Source loner ❳', url = 't.me/LDD7D'}
},
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendVoice?chat_id=' .. msg.chat_id .. '&voice=https://t.me/lonervoo/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
------------------------------------ كود لوحة الاعضاء  -------------------
if text == 'قسم المتحركات' then 
local reply_markup = LuaTele.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{ 
{text = 'حب',type = 'text'}, 
},
{
{text = 'بنات',type = 'text'},{text = 'عيال',type = 'text'},
},
{ 
{text = 'قطط',type = 'text'}, {text = 'اطفال',type = 'text'},
},
{ 
{text = 'رجوع',type = 'text'}, 
},
}
}
return LuaTele.sendText(msg_chat_id,msg_id,'• اختار الي تبيه من المتحركه . ', 'md', false, false, false, false, reply_markup)
end
------------------------------------ كود لوحة الاعضاء  -------------------
if text == 'قطط' then 
Abs = math.random(2,101); 
local Text ='• تم اختيار متحركه لك'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '❲ Source loner ❳', url = 't.me/LDD7D'}
},
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendanimation?chat_id=' .. msg.chat_id .. '&animation=https://t.me/gsgjituops/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
------------------------------------ كود لوحة الاعضاء  -------------------
if text == 'حب' then 
Abs = math.random(37,72); 
local Text ='• تم اختيار متحركه لك'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '❲ Source loner ❳', url = 't.me/LDD7D'}
},
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendanimation?chat_id=' .. msg.chat_id .. '&animation=https://t.me/sxiaiqiqiqqaa/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
------------------------------------ كود لوحة الاعضاء  -------------------
if text == 'اطفال' then 
Abs = math.random(2,64); 
local Text ='• تم اختيار متحركه لك'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '❲ Source loner ❳', url = 't.me/LDD7D'}
},
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendanimation?chat_id=' .. msg.chat_id .. '&animation=https://t.me/zziaidixxzzz/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
------------------------------------ كود لوحة الاعضاء  -------------------
if text == 'بنات' then 
Abs = math.random(2,52); 
local Text ='• تم اختيار متحركه لك'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '❲ Source loner ❳', url = 't.me/LDD7D'}
},
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendanimation?chat_id=' .. msg.chat_id .. '&animation=https://t.me/cdisidizzdss/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
------------------------------------ كود لوحة الاعضاء  -------------------
if text == 'عيال' then 
Abs = math.random(2,36); 
local Text ='• تم اختيار متحركه لك'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '❲ Source loner ❳', url = 't.me/LDD7D'}
},
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendanimation?chat_id=' .. msg.chat_id .. '&animation=https://t.me/asziaiwisiaa/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
------------------------------------ كود لوحة الاعضاء  -------------------
if text == 'قسم الهالات' then 
local reply_markup = LuaTele.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{ 
{text = 'هيدرات ♡',type = 'text'}, 
},
{
{text = 'اقتباس',type = 'text'},{text = 'عباره',type = 'text'},
},
{ 
{text = 'رجوع',type = 'text'}, 
},
}
}
return LuaTele.sendText(msg_chat_id,msg_id,'• اختار الي تبيه من الهالات .', 'md', false, false, false, false, reply_markup)
end
------------------------------------ كود لوحة الاعضاء  -------------------
if text == 'هيدرات ♡' then 
Abs = math.random(2,152); 
local Text ='• تم اختيار هيدرات'
keyboardd = {} 
keyboardd.inline_keyboard = {
{
{text = '❲ Source loner ❳', url = 't.me/LDD7D'}
},
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/flflfldld/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
------------------------------------ كود لوحة الاعضاء  -------------------
if text == 'اقتباس' then 
Abs = math.random(3,101); 
local Text ='• تم اختيار اقتباس'
keyboardd = {} 
keyboardd.inline_keyboard = {
{
{text = '❲ Source loner ❳', url = 't.me/LDD7D'}
},
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/SSSSDIBOTZ/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
------------------------------------ كود لوحة الاعضاء  -------------------
if text == 'عباره' then 
Abs = math.random(3,102); 
local Text ='• تم اختيار عباره'
keyboardd = {} 
keyboardd.inline_keyboard = {
{
{text = '❲ Source loner ❳', url = 't.me/LDD7D'}
},
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/sjsissss/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
------------------------------------ كود لوحة الاعضاء  -------------------
if text == 'ضيفني ل مجموعتك  .' then 
local CmdStart = '\n • اهلين انا '..(Redis:get(FDFGERB.."FDFGERB:Name:Bot") or "اريك")..
'\n• اختصاصي ادارة المجموعات من السبام والخ'..
'\n• كت تويت, يوتيوب, واشياء كثير'..
'\n• عشان تفعلني ارفعني اشراف وارسل تفعيل'..
'\n• Dev →[@'..UserSudo..' ]'
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = 'ضيفني ل مجموعتك  .', url = 't.me/'..UserBot..'?startgroup=new'}, 
},
}
}
return LuaTele.sendText(msg_chat_id,msg_id,CmdStart,"md",false, false, false, false, reply_markup)
end
------------------------------------ لوحة الاعضاء  ----------------------
if text == 'رجوع' then
local reply_markup = LuaTele.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{
{text = 'ضيفني ل مجموعتك  .',type = 'text'},
},
{ 
{text = 'قسم الافتارات',type = 'text'},{text = 'قسم الاغاني و القران', type = 'text'},
},
{ 
{text = 'قسم المتحركات',type = 'text'},{text = 'قسم الهالات', type = 'text'},
},
}
}
return LuaTele.sendText(msg_chat_id,msg_id,'• اختار الي تبيه من الازرار  .', 'md', false, false, false, false, reply_markup)
end
-------------------------------------------------------------------------
if text == '/start' then
Redis:sadd(FDFGERB..'FDFGERB:Num:User:Pv',msg.sender_id.user_id)  
if not msg.ControllerBot then
if not Redis:get(FDFGERB.."FDFGERB:Start:Bot") then
local reply_markup = LuaTele.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{
{text = 'ضيفني ل مجموعتك  .',type = 'text'},
},
{ 
{text = 'قسم الافتارات',type = 'text'},{text = 'قسم الاغاني و القران', type = 'text'},
},
{ 
{text = 'قسم المتحركات',type = 'text'},{text = 'قسم الهالات', type = 'text'},
},
}
}
return LuaTele.sendText(msg_chat_id,msg_id,'• اختار الي تبيه من الازرار  .', 'md', false, false, false, false, reply_markup)
end
else
local reply_markup = LuaTele.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{
{text = 'تفعيل التواصل •',type = 'text'},{text = 'تعطيل التواصل •', type = 'text'},
},
{
{text = 'تفعيل بلمجموعات •',type = 'text'},{text = 'تعطيل البوت الخدمي •', type = 'text'},
},
{
{text = 'اذاعه للمجموعات •',type = 'text'},{text = 'اذاعه خاص •', type = 'text'},
},
{
{text = 'اذاعه بالتوجيه •',type = 'text'},{text = 'اذاعه بالتوجيه خاص •', type = 'text'},
},
{
{text = 'اذاعه بالتثبيت •',type = 'text'},
},
{
{text = 'قائمه MY',type = 'text'},{text = 'قائمه M',type = 'text'},{text = 'قائمه العام •', type = 'text'},
},
{
{text = 'المكتومين العام •',type = 'text'},{text = 'مسح المكتومين العام •',type = 'text'},
},
{
{text = 'مسح قائمه MY',type = 'text'},{text = 'مسح قائمه M',type = 'text'},{text = 'مسح قائمه العام •', type = 'text'},
},
{
{text = 'تغيير اسم البوت •',type = 'text'},{text = 'حذف اسم البوت •', type = 'text'},
},
{
{text = 'الاشتراك الاجباري •',type = 'text'},{text = 'تغيير الاشتراك الاجباري •',type = 'text'},
},
{
{text = 'تفعيل الاشتراك الاجباري •',type = 'text'},{text = 'تعطيل الاشتراك الاجباري •',type = 'text'},
},
{
{text = 'الاحصائيات •',type = 'text'},{text = 'القروبات •',type = 'text'},
},
{
{text = 'تغغير كليشه المطور •',type = 'text'},{text = 'حذف كليشه المطور •', type = 'text'},
},
{
{text = 'تغيير كليشه ستارت •',type = 'text'},{text = 'حذف كليشه ستارت •', type = 'text'},
},
{
{text = 'تنظيف المجموعات •',type = 'text'},{text = 'تنظيف المشتركين •', type = 'text'},
},
{
{text = 'جلب النسخه الاحتياطيه •',type = 'text'},
},
{
{text = 'اضف رد عام •',type = 'text'},{text = 'حذف رد عام •', type = 'text'},
},
{
{text = '• الردود العامه',type = 'text'},{text = '• مسح الردود العامه', type = 'text'},
},
{
{text = 'تحديث الملفات •',type = 'text'},{text = 'تحديث السورس •', type = 'text'},
},
{
{text = 'الغاء الامر •',type = 'text'},
},
}
}
return LuaTele.sendText(msg_chat_id,msg_id,' • اهلا بك عزيزي 【 Dev🎖️】 ', 'md', false, false, false, false, reply_markup)
end
end
if text == 'تنظيف المشتركين •' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(FDFGERB.."FDFGERB:Num:User:Pv")   
local x = 0
for k,v in pairs(list) do  
local Get_Chat = LuaTele.getChat(v)
local ChatAction = LuaTele.sendChatAction(v,'Typing')
if ChatAction.luatele ~= "ok" then
x = x + 1
Redis:srem(FDFGERB..'FDFGERB:Num:User:Pv',v)
end
end
if x ~= 0 then
return LuaTele.sendText(msg_chat_id,msg_id,'• العدد الكلي ( '..#list..' \n• تم العثور على ( '..x..' ) من المشتركين حاظرين البوت',"md")
else
return LuaTele.sendText(msg_chat_id,msg_id,'• العدد الكلي ( '..#list..' \n• لم يتم العثور على وهميين',"md")
end
end
if text == 'تنظيف المجموعات •' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(FDFGERB.."FDFGERB:ChekBotAdd")   
local x = 0
for k,v in pairs(list) do  
local Get_Chat = LuaTele.getChat(v)
if Get_Chat.id then
local statusMem = LuaTele.getChatMember(Get_Chat.id,FDFGERB)
if statusMem.status.luatele == "chatMemberStatusMember" then
x = x + 1
LuaTele.sendText(Get_Chat.id,0,'• منزلني من الاشراف الحين بغادر انقلع ',"md")
Redis:srem(FDFGERB..'FDFGERB:ChekBotAdd',Get_Chat.id)
local keys = Redis:keys(FDFGERB..''..Get_Chat.id)
for i = 1, #keys do
Redis:del(keys[i])
end
LuaTele.leaveChat(Get_Chat.id)
end
else
x = x + 1
local keys = Redis:keys(FDFGERB..''..v)
for i = 1, #keys do
Redis:del(keys[i])
end
Redis:srem(FDFGERB..'FDFGERB:ChekBotAdd',v)
LuaTele.leaveChat(v)
end
end
if x ~= 0 then
return LuaTele.sendText(msg_chat_id,msg_id,'• العدد الكلي ( '..#list..' ) للمجموعات \n• تم العثور على ( '..x..' ) مجموعات البوت ليس ادمن \n• تم تعطيل المجموعه ومغادره البوت من الوهمي ',"md")
else
return LuaTele.sendText(msg_chat_id,msg_id,'• العدد الكلي ( '..#list..' ) للمجموعات \n• لا توجد مجموعات وهميه',"md")
end
end
if text == 'تغيير كليشه ستارت •' then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:setex(FDFGERB.."FDFGERB:Change:Start:Bot"..msg.sender_id.user_id,300,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"• ارسل لي كليشه Start الان ","md",true)  
end
if text == 'حذف كليشه ستارت •' then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:Start:Bot") 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم حذف كليشه Start ","md",true)   
end
if text == 'تغيير اسم البوت •' then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:setex(FDFGERB.."FDFGERB:Change:Name:Bot"..msg.sender_id.user_id,300,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"• ارسل لي الاسم الان ","md",true)  
end
if text == 'حذف اسم البوت •' then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:Name:Bot") 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم حذف اسم البوت ","md",true)   
end
if text and text:match("^تعين عدد الاعضاء (%d+)$") then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB..'FDFGERB:Num:Add:Bot',text:match("تعين عدد الاعضاء (%d+)$") ) 
LuaTele.sendText(msg_chat_id,msg_id,'• تم تعيين عدد اعضاء تفعيل البوت اكثر من : '..text:match("تعين عدد الاعضاء (%d+)$")..' عضو ',"md",true)  
elseif text =='الاحصائيات •' then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
LuaTele.sendText(msg_chat_id,msg_id,'• عدد احصائيات البوت الكامله \n━━━━━\n• عدد المجموعات : '..(Redis:scard(FDFGERB..'FDFGERB:ChekBotAdd') or 0)..'\n• عدد المشتركين : '..(Redis:scard(FDFGERB..'FDFGERB:Num:User:Pv') or 0)..'',"md",true)  
end
if text == 'تغغير كليشه المطور •' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB..'FDFGERB:GetTexting:DevFDFGERB'..msg_chat_id..':'..msg.sender_id.user_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,'• ارسل لي الكليشه الان')
end
if text == 'حذف كليشه المطور •' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB..'FDFGERB:Texting:DevFDFGERB')
return LuaTele.sendText(msg_chat_id,msg_id,'• تم حذف كليشه المطور')
end
if text == 'اضف رد عام •' then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Set:Rd"..msg.sender_id.user_id..":"..msg_chat_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,"• ارسل الان الكلمه لاضافتها في الردود العامه ","md",true)  
end
if text == 'حذف رد عام •' then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:Set:On"..msg.sender_id.user_id..":"..msg_chat_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,"• ارسل الان الكلمه لحذفها من الردود العامه","md",true)  
end
if text=='اذاعه خاص •' then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:setex(FDFGERB.."FDFGERB:Broadcasting:Users" .. msg_chat_id .. ":" .. msg.sender_id.user_id, 600, true) 
LuaTele.sendText(msg_chat_id,msg_id,[[
 • ارسل كليشه الاذاعه 
• الالغاء الامر ارسل (الغاء،الغاء الامر)
]],"md",true)  
return false
end

if text=='اذاعه للمجموعات •' then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:setex(FDFGERB.."FDFGERB:Broadcasting:Groups" .. msg_chat_id .. ":" .. msg.sender_id.user_id, 600, true) 
LuaTele.sendText(msg_chat_id,msg_id,[[
 • ارسل كليشه الاذاعه 
• الالغاء الامر ارسل (الغاء،الغاء الامر)
]],"md",true)  
return false
end

if text=="اذاعه بالتثبيت •" then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:setex(FDFGERB.."FDFGERB:Broadcasting:Groups:Pin" .. msg_chat_id .. ":" .. msg.sender_id.user_id, 600, true) 
LuaTele.sendText(msg_chat_id,msg_id,[[
 • ارسل كليشه الاذاعه 
• الالغاء الامر ارسل (الغاء،الغاء الامر)
]],"md",true)  
return false
end

if text=="اذاعه بالتوجيه •" then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:setex(FDFGERB.."FDFGERB:Broadcasting:Groups:Fwd" .. msg_chat_id .. ":" .. msg.sender_id.user_id, 600, true) 
LuaTele.sendText(msg_chat_id,msg_id,"• ارسل لي التوجيه الان\n• ليتم نشره في المجموعات","md",true)  
return false
end

if text=='اذاعه بالتوجيه خاص •' then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:setex(FDFGERB.."FDFGERB:Broadcasting:Users:Fwd" .. msg_chat_id .. ":" .. msg.sender_id.user_id, 600, true) 
LuaTele.sendText(msg_chat_id,msg_id,"• ارسل لي التوجيه الان\n• ليتم نشره الى المشتركين","md",true)  
return false
end

if text == ("الردود العامه •") then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(FDFGERB.."FDFGERB:List:Rd:Sudo")
text = "\n📝|قائمه الردود العامه \n━━━━━\n"
for k,v in pairs(list) do
if Redis:get(FDFGERB.."FDFGERB:Add:Rd:Sudo:Gif"..v) then
db = "متحركه 🎭"
elseif Redis:get(FDFGERB.."FDFGERB:Add:Rd:Sudo:vico"..v) then
db = "بصمه 📢"
elseif Redis:get(FDFGERB.."FDFGERB:Add:Rd:Sudo:stekr"..v) then
db = "ملصق 🃏"
elseif Redis:get(FDFGERB.."FDFGERB:Add:Rd:Sudo:Text"..v) then
db = "رساله ✉"
elseif Redis:get(FDFGERB.."FDFGERB:Add:Rd:Sudo:Photo"..v) then
db = "صوره 🎇"
elseif Redis:get(FDFGERB.."FDFGERB:Add:Rd:Sudo:Video"..v) then
db = "فيديو 📹"
elseif Redis:get(FDFGERB.."FDFGERB:Add:Rd:Sudo:File"..v) then
db = "ملف • "
elseif Redis:get(FDFGERB.."FDFGERB:Add:Rd:Sudo:Audio"..v) then
db = "اغنيه 🎵"
elseif Redis:get(FDFGERB.."FDFGERB:Add:Rd:Sudo:video_note"..v) then
db = "بصمه فيديو 🎥"
end
text = text..""..k.." » ( "..v.." ) » ( "..db.." )\n"
end
if #list == 0 then
text = "• لا توجد الردود العامه"
end
return LuaTele.sendText(msg_chat_id,msg_id,""..text.."","md",true)  
end
if text == ("مسح الردود العامه •") then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(FDFGERB.."FDFGERB:List:Rd:Sudo")
for k,v in pairs(list) do
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Sudo:Gif"..v)   
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Sudo:vico"..v)   
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Sudo:stekr"..v)     
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Sudo:Text"..v)   
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Sudo:Photo"..v)
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Sudo:Video"..v)
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Sudo:File"..v)
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Sudo:Audio"..v)
Redis:del(FDFGERB.."FDFGERB:Add:Rd:Sudo:video_note"..v)
Redis:del(FDFGERB.."FDFGERB:List:Rd:Sudo")
end
return LuaTele.sendText(msg_chat_id,msg_id,"• تم حذف الردود العامه","md",true)  
end
if text == 'مسح قائمه M' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(FDFGERB.."FDFGERB:Developers:Groups") 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"• لا يوجد Myth حاليا , ","md",true)  
end
Redis:del(FDFGERB.."FDFGERB:Developers:Groups") 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم مسح ( "..#Info_Members.." ) من Myth ","md",true)
end
if text == 'مسح قائمه MY' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(FDFGERB.."FDFGERB:DevelopersQ:Groups") 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"• لا يوجد Myth🎖 حاليا , ","md",true)  
end
Redis:del(FDFGERB.."FDFGERB:DevelopersQ:Groups") 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم مسح ( "..#Info_Members.." ) من Myth🎖 ","md",true)
end
if text == 'مسح قائمه العام •' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(FDFGERB.."FDFGERB:BanAll:Groups") 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"• لا يوجد محظورين عام حاليا , ","md",true)  
end
Redis:del(FDFGERB.."FDFGERB:BanAll:Groups") 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم مسح ( "..#Info_Members.." ) من المحظورين عام ","md",true)
end
if text == 'مسح المكتومين العام •' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(FDFGERB.."FDFGERB:kkytmAll:Groups") 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"• لا يوجد مكتومين عام . ","md",true)  
end
Redis:del(FDFGERB.."FDFGERB:kkytmAll:Groups") 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم مسح { "..#Info_Members.." } من المكتومين عام ","md",true)
end
if text == 'المكتومين العام •' then
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Myth🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(FDFGERB.."FDFGERB:kkytmAll:Groups") 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"• لا يوجد محظورين عام .","md",true)  
end
ListMembers = '\n• قائمه المكتومين عام : \n━━━━━\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
var(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers..""..k.." •  [ @"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers..""..k.." • ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {{{text = 'مسح المكتومين عام', data = msg.sender_id.user_id..'/kktmAll'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'تعطيل البوت الخدمي •' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:BotFree") 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل البوت الخدمي ","md",true)
end
if text == 'تعطيل التواصل •' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(FDFGERB.."FDFGERB:TwaslBot") 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تعطيل التواصل داخل البوت ","md",true)
end
if text == 'تفعيل بلمجموعات •' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:BotFree",true) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تفعيل البوت بلقروبات ","md",true)
end
if text == 'تفعيل التواصل •' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(FDFGERB.."FDFGERB:TwaslBot",true) 
return LuaTele.sendText(msg_chat_id,msg_id,"• تم تفعيل التواصل داخل البوت ","md",true)
end
if text == 'قائمه العام •' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(FDFGERB.."FDFGERB:BanAll:Groups") 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"• لا يوجد محظورين عام حاليا , ","md",true)  
end
ListMembers = '\n• قائمه المحظورين عام  \n ━━━━━\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
var(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers..""..k.." •  [ @"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers..""..k.." • ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {{{text = '• مسح المحظورين عام', data = msg.sender_id.user_id..'/BanAll'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'قائمه M' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(FDFGERB.."FDFGERB:Developers:Groups") 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"• لا يوجد Myth حاليا , ","md",true)  
end
ListMembers = '\n• قائمه Myth البوت \n ━━━━━\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers..""..k.." •  [ @"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers..""..k.." • ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {{{text = '• مسح Myth', data = msg.sender_id.user_id..'/Developers'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'قائمه MY' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n• عذرآ الامر يخص ⇠【 Dev🎖️】 فقط ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(FDFGERB..'FDFGERB:Channel:Join:Name')..'', url = 't.me/'..Redis:get(FDFGERB..'FDFGERB:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(FDFGERB.."FDFGERB:DevelopersQ:Groups") 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"• لا يوجد Myth🎖 حاليا , ","md",true)  
end
ListMembers = '\n• قائمه Myth🎖 البوت \n ━━━━━\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers..""..k.." •  [ @"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers..""..k.." • ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {{{text = '• مسح MY', data = msg.sender_id.user_id..'/Developers'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if not msg.ControllerBot then
if Redis:get(FDFGERB.."FDFGERB:TwaslBot") and not Redis:sismember(FDFGERB.."FDFGERB:BaN:In:Tuasl",msg.sender_id.user_id) then
local ListGet = {Sudo_Id,msg.sender_id.user_id}
local IdSudo = LuaTele.getChat(ListGet[1]).id
local IdUser = LuaTele.getChat(ListGet[2]).id
local FedMsg = LuaTele.sendForwarded(IdSudo, 0, IdUser, msg_id)
Redis:setex(FDFGERB.."FDFGERB:Twasl:UserId"..msg.date,172800,IdUser)
if FedMsg.content.luatele == "messageSticker" then
LuaTele.sendText(IdSudo,0,Reply_Status(IdUser,'• قام بارسال الملصق').Reply,"md",true)  
end
return LuaTele.sendText(IdUser,msg_id,Reply_Status(IdUser,'• تم ارسال رسالتك الى Dev🎖️  ').Reply,"md",true)  
end
else 
if msg.reply_to_message_id ~= 0 then
local Message_Get = LuaTele.getMessage(msg_chat_id, msg.reply_to_message_id)
if Message_Get.forward_info then
local Info_User = Redis:get(FDFGERB.."FDFGERB:Twasl:UserId"..Message_Get.forward_info.date) or 46899864
if text == 'حظر' then
Redis:sadd(FDFGERB..'FDFGERB:BaN:In:Tuasl',Info_User)  
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Info_User,'• تم حظره من تواصل البوت ').Reply,"md",true)  
end 
if text =='الغاء الحظر' or text =='الغاء حظر' then
Redis:srem(FDFGERB..'FDFGERB:BaN:In:Tuasl',Info_User)  
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Info_User,'• تم الغاء حظره من تواصل البوت ').Reply,"md",true)  
end 
local ChatAction = LuaTele.sendChatAction(Info_User,'Typing')
if not Info_User or ChatAction.message == "USER_IS_BLOCKED" then
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Info_User,'• قام بحظر البوت لا استطيع ارسال رسالتك ').Reply,"md",true)  
end
if msg.content.video_note then
LuaTele.sendVideoNote(Info_User, 0, msg.content.video_note.video.remote.id)
elseif msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
LuaTele.sendPhoto(Info_User, 0, idPhoto,'')
elseif msg.content.sticker then 
LuaTele.sendSticker(Info_User, 0, msg.content.sticker.sticker.remote.id)
elseif msg.content.voice_note then 
LuaTele.sendVoiceNote(Info_User, 0, msg.content.voice_note.voice.remote.id, '', 'md')
elseif msg.content.video then 
LuaTele.sendVideo(Info_User, 0, msg.content.video.video.remote.id, '', "md")
elseif msg.content.animation then 
LuaTele.sendAnimation(Info_User,0, msg.content.animation.animation.remote.id, '', 'md')
elseif msg.content.document then
LuaTele.sendDocument(Info_User, 0, msg.content.document.document.remote.id, '', 'md')
elseif msg.content.audio then
LuaTele.sendAudio(Info_User, 0, msg.content.audio.audio.remote.id, '', "md") 
elseif text then
LuaTele.sendText(Info_User,0,text,"md",true)
end 
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Info_User,'• تم ارسال رسالتك اليه ').Reply,"md",true)  
end
end
end 
end --UserBot
end -- File_Bot_Run
function CallBackLua(data) --- هذا الكالباك بي الابديت
if data and data.luatele and data.luatele == "updateNewInlineQuery" then
local Text = data.query 
if Text == '' then
local input_message_content = {message_text = " • اهلا بك عزيزي\n • لارسال الهمسه اكتب يوزر البوت و الهمسه و يوزر شخص\n • مثال @يوزر البوت احبك @EE3WW"}	
local resuult = {{
type = 'article',
id = math.random(1,64),
title = 'اضغط هنا لمعرفه كيفيه ارسال الهمسه',
input_message_content = input_message_content,
reply_markup = {
inline_keyboard ={
{{text ="❲ 𝑺𝒐𝒖𝒓𝒄𝒆 𝑳𝒐𝒏𝒆𝒓 .  ❳", url= "https://t.me/LDD7D"}},
}
},
},
}
https.request("https://api.telegram.org/bot"..Token..'/answerInlineQuery?inline_query_id='..data.id..'&switch_pm_text=اضغط لارسال الهمسه&switch_pm_parameter=start&results='..JSON.encode(resuult))
end
if Text and Text:match("(.*)@(.*)") then
local hm = {string.match(Text,"(.*)@(.*)")}
local user = hm[2]
local hms = hm[1]
UserId_Info = LuaTele.searchPublicChat(user)
local idd = UserId_Info.id
local key = math.random(1,999999)
Redis:set(idd..key.."hms",hms)
local us = LuaTele.getUser(idd)
local name = us.first_name
local input_message_content = {message_text = "- الهمسة إلى ( ["..name.."](tg://user?id="..idd..") ) هو فقط من يستطيع فتحها 👨🏻‍💻", parse_mode = 'Markdown'} 
local resuult = {{
type = 'article',
id = math.random(1,64),
title = 'هذه همسه سريه الي '..name..'',
input_message_content = input_message_content,
reply_markup = {
inline_keyboard ={
{{text ="فتح الهمسه 🗞 ", callback_data = idd.."hmsaa"..data.sender_user_id.."/"..key}},
}
},
},
}
https.request("https://api.telegram.org/bot"..Token..'/answerInlineQuery?inline_query_id='..data.id..'&switch_pm_text=اضغط لارسال الهمسه&switch_pm_parameter=start&results='..JSON.encode(resuult))
end
end
if data and data.luatele and data.luatele == "updateNewInlineCallbackQuery" then
var(data)
local Text = LuaTele.base64_decode(data.payload.data)
if Text and Text:match('(.*)hmsaa(.*)/(.*)')  then
local mk = {string.match(Text,"(.*)hmsaa(.*)/(.*)")}
local hms = Redis:get(mk[1]..mk[3].."hms")
if tonumber(mk[1]) == tonumber(data.sender_user_id) or tonumber(mk[2]) == tonumber(data.sender_user_id) then
https.request("https://api.telegram.org/bot"..Token.."/answerCallbackQuery?callback_query_id="..data.id.."&text="..URL.escape(hms).."&show_alert=true")
end
if tonumber(mk[1]) ~= tonumber(data.sender_user_id) or tonumber(mk[2]) ~= tonumber(data.sender_user_id) then
https.request("https://api.telegram.org/bot"..Token.."/answerCallbackQuery?callback_query_id="..data.id.."&text="..URL.escape("الهمسه ليست لك").."&show_alert=true")
end
end
end
--var(data) 
if data and data.luatele and data.luatele == "updateSupergroup" then
local Get_Chat = LuaTele.getChat('-100'..data.supergroup.id)
if data.supergroup.status.luatele == "chatMemberStatusBanned" then
Redis:srem(FDFGERB.."FDFGERB:ChekBotAdd",'-100'..data.supergroup.id)
local keys = Redis:keys(FDFGERB..''..'-100'..data.supergroup.id)
for i = 1, #keys do
Redis:del(keys[i])
end
return LuaTele.sendText(Sudo_Id,0,'\n• تم طرد البوت من مجموعه جديده \n• اسم المجموعه : '..Get_Chat.title..'\n• ايدي المجموعه :`-100'..data.supergroup.id..'`\n• تم مسح جميع البيانات المتعلقه بالمجموعه',"md")
end
elseif data and data.luatele and data.luatele == "updateMessageSendSucceeded" then
local msg = data.message
local Chat = msg.chat_id
if msg.content.text then
text = msg.content.text.text
end
if msg.content.video_note then
if msg.content.video_note.video.remote.id == Redis:get(FDFGERB.."FDFGERB:PinMsegees:"..msg.chat_id) then
LuaTele.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(FDFGERB.."FDFGERB:PinMsegees:"..msg.chat_id)
end
elseif msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
if idPhoto == Redis:get(FDFGERB.."FDFGERB:PinMsegees:"..msg.chat_id) then
LuaTele.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(FDFGERB.."FDFGERB:PinMsegees:"..msg.chat_id)
end
elseif msg.content.sticker then 
if msg.content.sticker.sticker.remote.id == Redis:get(FDFGERB.."FDFGERB:PinMsegees:"..msg.chat_id) then
LuaTele.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(FDFGERB.."FDFGERB:PinMsegees:"..msg.chat_id)
end
elseif msg.content.voice_note then 
if msg.content.voice_note.voice.remote.id == Redis:get(FDFGERB.."FDFGERB:PinMsegees:"..msg.chat_id) then
LuaTele.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(FDFGERB.."FDFGERB:PinMsegees:"..msg.chat_id)
end
elseif msg.content.video then 
if msg.content.video.video.remote.id == Redis:get(FDFGERB.."FDFGERB:PinMsegees:"..msg.chat_id) then
LuaTele.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(FDFGERB.."FDFGERB:PinMsegees:"..msg.chat_id)
end
elseif msg.content.animation then 
if msg.content.animation.animation.remote.id ==  Redis:get(FDFGERB.."FDFGERB:PinMsegees:"..msg.chat_id) then
LuaTele.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(FDFGERB.."FDFGERB:PinMsegees:"..msg.chat_id)
end
elseif msg.content.document then
if msg.content.document.document.remote.id == Redis:get(FDFGERB.."FDFGERB:PinMsegees:"..msg.chat_id) then
LuaTele.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(FDFGERB.."FDFGERB:PinMsegees:"..msg.chat_id)
end
elseif msg.content.audio then
if msg.content.audio.audio.remote.id == Redis:get(FDFGERB.."FDFGERB:PinMsegees:"..msg.chat_id) then
LuaTele.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(FDFGERB.."FDFGERB:PinMsegees:"..msg.chat_id)
end
elseif text then
if text == Redis:get(FDFGERB.."FDFGERB:PinMsegees:"..msg.chat_id) then
LuaTele.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(FDFGERB.."FDFGERB:PinMsegees:"..msg.chat_id)
end
end

elseif data and data.luatele and data.luatele == "updateNewMessage" then
if data.message.content.luatele == "messageChatDeleteMember" or data.message.content.luatele == "messageChatAddMembers" or data.message.content.luatele == "messagePinMessage" or data.message.content.luatele == "messageChatChangeTitle" or data.message.content.luatele == "messageChatJoinByLink" then
if Redis:get(FDFGERB.."FDFGERB:Lock:tagservr"..data.message.chat_id) then
LuaTele.deleteMessages(data.message.chat_id,{[1]= data.message.id})
end
end 
if tonumber(data.message.sender_id.user_id) == tonumber(FDFGERB) then
return false
end
if data.message.content.luatele == "messageChatJoinByLink" and Redis:get(FDFGERB..'FDFGERB:Status:joinet'..data.message.chat_id) == 'true' then
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = ' انا لست بوت ', data = data.message.sender_id.user_id..'/UnKed'},
},
}
} 
LuaTele.setChatMemberStatus(data.message.chat_id,data.message.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
return LuaTele.sendText(data.message.chat_id, data.message.id, '• عليك اختيار انا لست بوت لتخطي نضام التحقق', 'md',false, false, false, false, reply_markup)
end

File_Bot_Run(data.message,data.message)

elseif data and data.luatele and data.luatele == "updateMessageEdited" then
-- data.chat_id -- data.message_id
local Message_Edit = LuaTele.getMessage(data.chat_id, data.message_id)
if Message_Edit.sender_id.user_id == FDFGERB then
print('This is Edit for Bot')
return false
end
File_Bot_Run(Message_Edit,Message_Edit)
Redis:incr(FDFGERB..'FDFGERB:Num:Message:Edit'..data.chat_id..Message_Edit.sender_id.user_id)
if Message_Edit.content.luatele == "messageContact" or Message_Edit.content.luatele == "messageVideoNote" or Message_Edit.content.luatele == "messageDocument" or Message_Edit.content.luatele == "messageAudio" or Message_Edit.content.luatele == "messageVideo" or Message_Edit.content.luatele == "messageVoiceNote" or Message_Edit.content.luatele == "messageAnimation" or Message_Edit.content.luatele == "messagePhoto" then
if Redis:get(FDFGERB.."FDFGERB:Lock:edit"..data.chat_id) then
LuaTele.deleteMessages(data.chat_id,{[1]= data.message_id})
end
end
elseif data and data.luatele and data.luatele == "updateNewCallbackQuery" then
-- data.chat_id
-- data.payload.data
-- data.sender_user_id
Text = LuaTele.base64_decode(data.payload.data)
IdUser = data.sender_user_id
ChatId = data.chat_id
Msg_id = data.message_id

if Text and Text:match('(%d+)/UnKed') then
local UserId = Text:match('(%d+)/UnKed')
if tonumber(UserId) ~= tonumber(IdUser) then
return LuaTele.answerCallbackQuery(data.id, "• الامر لا يخصك", true)
end
LuaTele.setChatMemberStatus(ChatId,UserId,'restricted',{1,1,1,1,1,1,1,1})
return LuaTele.editMessageText(ChatId,Msg_id,"• تم التحقق منك اجابتك صحيحه يمكنك الدردشه الان", 'md', false)
end


if Text and Text:match('(%d+)/unbanktmkid@(%d+)') then
local listYt = {Text:match('(%d+)/unbanktmkid@(%d+)')}
if tonumber(listYt[1]) == tonumber(IdUser) then
Redis:srem(FDFGERB.."FDFGERB:SilentGroup:Group"..ChatId,listYt[2]) 
Redis:srem(FDFGERB.."FDFGERB:BanGroup:Group"..ChatId,listYt[2]) 
LuaTele.setChatMemberStatus(ChatId,listYt[2],'restricted',{1,1,1,1,1,1,1,1,1})
LuaTele.setChatMemberStatus(ChatId,listYt[2],'restricted',{1,1,1,1,1,1,1,1})
LuaTele.editMessageText(ChatId,Msg_id,"• رفعت عنه القيود", 'md')
end
end
if Text and Text:match('(%d+)/besso1') then
local sendrr = Text:match('(%d+)/besso1')
if tonumber(IdUser) ~= tonumber(sendrr) then
return LuaTele.answerCallbackQuery(data.id, "• الامر لا يخصك", true)
end
local editMedia = {
type = "photo",
media = "https://t.me/beiu5/4",
caption = "• اطفئ النور وارفع الصوت",
parse_mode = "MARKDOWN"
}
local reply_markup = {
inline_keyboard = {
{{text = "•  فعلت ذلك ", callback_data = IdUser.."/besso2"}}
}
}
return https.request("https://api.telegram.org/bot"..Token.."/editMessageMedia?chat_id="..ChatId.."&message_id="..(Msg_id/2097152/0.5).."&media="..JSON.encode(editMedia).."&reply_markup="..JSON.encode(reply_markup))
end
if Text and Text:match('(%d+)/besso2') then
local sendrr = Text:match('(%d+)/besso2')
if tonumber(IdUser) ~= tonumber(sendrr) then
return LuaTele.answerCallbackQuery(data.id, "• الامر لا يخصك", true)
end
local editMedia = {
type = "video",
media = "https://t.me/beiu5/5",
caption = "•  تحذير اللعبة للكبار فوق 12 سنة",
parse_mode = "MARKDOWN"
}
local reply_markup = {
inline_keyboard = {
{{text = " •  حسناً", callback_data = IdUser.."/besso3"}},
}
}
return https.request("https://api.telegram.org/bot"..Token.."/editMessageMedia?chat_id="..ChatId.."&message_id="..(Msg_id/2097152/0.5).."&media="..JSON.encode(editMedia).."&reply_markup="..JSON.encode(reply_markup))
end
if Text and Text:match('(%d+)/besso3') then
local sendrr = Text:match('(%d+)/besso3')
if tonumber(IdUser) ~= tonumber(sendrr) then
return LuaTele.answerCallbackQuery(data.id, "• الامر لا يخصك", true)
end
local editMedia = {
type = "video",
media = "https://t.me/beiu5/6",
caption = "•  اهلا بك انا لم استطيع العودة الى المنزل",
parse_mode = "MARKDOWN"
}
local reply_markup = {
inline_keyboard = {
{{text = " •  حسناً", callback_data = IdUser.."/besso4"}}
}
}
return https.request("https://api.telegram.org/bot"..Token.."/editMessageMedia?chat_id="..ChatId.."&message_id="..(Msg_id/2097152/0.5).."&media="..JSON.encode(editMedia).."&reply_markup="..JSON.encode(reply_markup))
end
if Text and Text:match('(%d+)/besso4') then
local sendrr = Text:match('(%d+)/besso4')
if tonumber(IdUser) ~= tonumber(sendrr) then
return LuaTele.answerCallbackQuery(data.id, "• الامر لا يخصك", true)
end
local editMedia = {
type = "video",
media = "https://t.me/beiu5/7",
caption = "•  هل تود مساعدتي",
parse_mode = "MARKDOWN"
}
local reply_markup = {
inline_keyboard = {
{{text = " •  لا", callback_data = IdUser.."/besso5"},{text = " •  نعم", callback_data = IdUser.."/besso6"}}
}
}
return https.request("https://api.telegram.org/bot"..Token.."/editMessageMedia?chat_id="..ChatId.."&message_id="..(Msg_id/2097152/0.5).."&media="..JSON.encode(editMedia).."&reply_markup="..JSON.encode(reply_markup))
end
if Text and Text:match('(%d+)/besso5') then
local sendrr = Text:match('(%d+)/besso5')
if tonumber(IdUser) ~= tonumber(sendrr) then
return LuaTele.answerCallbackQuery(data.id, "• الامر لا يخصك", true)
end
local editMedia = {
type = "video",
media = "https://t.me/beiu5/8",
caption = "•  لماذا هل انت قاسي القلب",
parse_mode = "MARKDOWN"
}
local reply_markup = {
inline_keyboard = {
{{text = " •  لا", callback_data = IdUser.."/besso7"},{text = " •  نعم", callback_data = IdUser.."/besso6"}}
}
}
return https.request("https://api.telegram.org/bot"..Token.."/editMessageMedia?chat_id="..ChatId.."&message_id="..(Msg_id/2097152/0.5).."&media="..JSON.encode(editMedia).."&reply_markup="..JSON.encode(reply_markup))
end
if Text and Text:match('(%d+)/besso6') then
local sendrr = Text:match('(%d+)/besso6')
if tonumber(IdUser) ~= tonumber(sendrr) then
return LuaTele.answerCallbackQuery(data.id, "• الامر لا يخصك", true)
end
local editMedia = {
type = "video",
media = "https://t.me/beiu5/9",
caption = "•  انك شخصاً رائع",
parse_mode = "MARKDOWN"
}
local reply_markup = {
inline_keyboard = {
{{text = " •  حسناً", callback_data = IdUser.."/besso0"}}
}
}
return https.request("https://api.telegram.org/bot"..Token.."/editMessageMedia?chat_id="..ChatId.."&message_id="..(Msg_id/2097152/0.5).."&media="..JSON.encode(editMedia).."&reply_markup="..JSON.encode(reply_markup))
end
if Text and Text:match('(%d+)/besso0') then
local sendrr = Text:match('(%d+)/besso0')
if tonumber(IdUser) ~= tonumber(sendrr) then
return LuaTele.answerCallbackQuery(data.id, "• الامر لا يخصك", true)
end
local editMedia = {
type = "video",
media = "https://t.me/beiu5/10",
caption = "•  ابحث معي عن منزلي لقد كان قريباً من هنا",
parse_mode = "MARKDOWN"
}
local reply_markup = {
inline_keyboard = {
{{text = " •  حسناً", callback_data = IdUser.."/s"}}
}
}
return https.request("https://api.telegram.org/bot"..Token.."/editMessageMedia?chat_id="..ChatId.."&message_id="..(Msg_id/2097152/0.5).."&media="..JSON.encode(editMedia).."&reply_markup="..JSON.encode(reply_markup))
end
if Text and Text:match('(%d+)/s') then
local sendrr = Text:match('(%d+)/s')
if tonumber(IdUser) ~= tonumber(sendrr) then
return LuaTele.answerCallbackQuery(data.id, "• الامر لا يخصك", true)
end
local editMedia = {
type = "video",
media = "https://t.me/beiu5/11",
caption = "•  ولكن عندما حل الليل لم اعد ارى اي شيء",
parse_mode = "MARKDOWN"
}
local reply_markup = {
inline_keyboard = {
{{text = " •  حسناً", callback_data = IdUser.."/besso000"}}
}
}
return https.request("https://api.telegram.org/bot"..Token.."/editMessageMedia?chat_id="..ChatId.."&message_id="..(Msg_id/2097152/0.5).."&media="..JSON.encode(editMedia).."&reply_markup="..JSON.encode(reply_markup))
end
if Text and Text:match('(%d+)/besso000') then
local sendrr = Text:match('(%d+)/besso000')
if tonumber(IdUser) ~= tonumber(sendrr) then
return LuaTele.answerCallbackQuery(data.id, "• الامر لا يخصك", true)
end
local editMedia = {
type = "video",
media = "https://t.me/beiu5/12",
caption = "•  ماذا تظن اين يوجد",
parse_mode = "MARKDOWN"
}
local reply_markup = {
inline_keyboard = {
{{text = " •  اتجاه الغابة", callback_data = IdUser.."/besso7"},{text = " •  في الاتجاه الاخر", callback_data = IdUser.."/besso6"}}
}
}
return https.request("https://api.telegram.org/bot"..Token.."/editMessageMedia?chat_id="..ChatId.."&message_id="..(Msg_id/2097152/0.5).."&media="..JSON.encode(editMedia).."&reply_markup="..JSON.encode(reply_markup))
end
if Text and Text:match('(%d+)/topzrf') then
local UserId = Text:match('(%d+)/topzrf')
if tonumber(IdUser) == tonumber(UserId) then
local ty_users = Redis:smembers(FDFGERB.."rrfffid")
if #ty_users == 0 then
return send(ChatId,Msg_id,"⇜ لا يوجد احد","md",true)
end
ty_anubis = "توب 20 شخص زرفوا فلوس :\n\n"
ty_list = {}
for k,v in pairs(ty_users) do
local mony = Redis:get(FDFGERB.."rrfff"..v)
table.insert(ty_list, {tonumber(mony) , v})
end
table.sort(ty_list, function(a, b) return a[1] > b[1] end)
num_ty = 1
emojii ={ 
"🥇" ,
"🥈",
"🥉",
"4)",
"5)",
"6)",
"7)",
"8)",
"9)",
"10)",
"11)",
"12)",
"13)",
"14)",
"15)",
"16)",
"17)",
"18)",
"19)",
"20)"
}
for k,v in pairs(ty_list) do
if num_ty <= 20 then
local user_name = LuaTele.getUser(v[2]).first_name or Redis:get(v[2].."first_name:") or "لا يوجد اسم"
local mony = v[1]
local convert_mony = string.format("%.0f",mony)
local emoo = emojii[k]
num_ty = num_ty + 1
ty_anubis = ty_anubis..emoo.." "..convert_mony.." 💵 | "..user_name.."\n"
end
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '𝖲𝗈𝗎𝗋𝖼𝖾 Eric',url="t.me/LDD7D"}, 
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,ty_anubis, "md", true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/topmon') then
local UserId = Text:match('(%d+)/topmon')
if tonumber(data.sender_user_id) == tonumber(UserId) then
local bank_users = Redis:smembers(FDFGERB.."booob")
if #bank_users == 0 then
return send(ChatId,Msg_id,"⇜ لا يوجد حسابات في البنك","md",true)
end
top_mony = "توب اغنى 20 شخص :\n\n"
mony_list = {}
for k,v in pairs(bank_users) do
local mony = Redis:get(FDFGERB.."boob"..v)
table.insert(mony_list, {tonumber(mony) , v})
end
table.sort(mony_list, function(a, b) return a[1] > b[1] end)
num = 1
emoji ={ 
"🥇" ,
"🥈",
"🥉",
"4)",
"5)",
"6)",
"7)",
"8)",
"9)",
"10)",
"11)",
"12)",
"13)",
"14)",
"15)",
"16)",
"17)",
"18)",
"19)",
"20)"
}
for k,v in pairs(mony_list) do
if num <= 20 then
local user_name = LuaTele.getUser(v[2]).first_name or Redis:get(v[2].."first_name:") or "لا يوجد اسم"
local mony = v[1]
local convert_mony = string.format("%.0f",mony)
local emo = emoji[k]
num = num + 1
top_mony = top_mony..emo.." "..convert_mony.." 💵 | "..user_name.."\n"
end
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '𝖲𝗈𝗎𝗋𝖼𝖾 Eric',url="t.me/LDD7D"}, 
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,top_mony, "md", true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/showwhisper') then
local UserId = Text:match('(%d+)/showwhisper')
if tonumber(IdUser) == tonumber(UserId) then
local Uphms = {
"احبك","بقول لك شي تدري اني احياناً انام وجيعان لان مالي خلق اقوم واسوي اكل",
"في شي ببالي بقولك اياه تدري اني ما احب الفلفل","تدري وانا صغير كنت ما اعرف اكل زين وكانو الناس يتنمرون علي ويقولون لي خويجه ومسكوها علي لين ما طفشت 💔",
"دامك تبي همسه اعرف اني احبك","احبك 😔👈👉","بقولك سر بس تكفى لا تقوله للمشرفين ولا المالك عشان ما يطردوني تدري ان مالك قروبكم كريه وما ادانيه",
"بقولك ذبه مرا واحد كويتي خبط رجله في الباب قال i relly"
,"بقولك سر انا تخصصي طب بيطري المهم ذاك اليوم خويي كان تعبان وقال يبي علاج عشانك خيره وكذا قلت تم وعطيته علاج حق حمير وبعدها جلس متنوم بالمستشفى شهر وكل يوم يدعي علي وبس",
"لونر عمنا جميعا 🙈"
}
hmsa = Uphms[math.random(#Uphms)]
return LuaTele.answerCallbackQuery(data.id,hmsa, true)
end
end

if Text and Text:match('(%d+)/delamrredis') then
local listYt = Text:match('(%d+)/delamrredis')
if tonumber(listYt) == tonumber(IdUser) then
Redis:del(FDFGERB.."FDFGERB:Redis:Id:Group"..ChatId..""..IdUser) 
Redis:del(FDFGERB.."FDFGERB1:Set:Rd"..IdUser..":"..ChatId)
Redis:del(FDFGERB.."FDFGERB:Set:Manager:rd"..IdUser..":"..ChatId)
Redis:del(FDFGERB.."FDFGERB:Redis:Id:all"..ChatId..""..IdUser) 
Redis:del(FDFGERB.."FDFGERB:Set:Rd"..IdUser..":"..ChatId)
LuaTele.editMessageText(ChatId,Msg_id,"• من عيوني لغيت كلشي", 'md')
end
end
if Text and Text:match('(%d+)/chenidam') then
local listYt = Text:match('(%d+)/chenidam')
if tonumber(listYt) == tonumber(IdUser) then
Redis:set(FDFGERB.."FDFGERB:Redis:Id:all"..ChatId..""..IdUser,true) 
LuaTele.editMessageText(ChatId,Msg_id,"• ارسل لي الايدي عام الان", 'md', true)
end
end
if Text and Text:match('(%d+)/chenid') then
local listYt = Text:match('(%d+)/chenid')
if tonumber(listYt) == tonumber(IdUser) then
Redis:set(FDFGERB.."FDFGERB:Redis:Id:Group"..ChatId..""..IdUser,true) 
LuaTele.editMessageText(ChatId,Msg_id,"• ارسل لي الايدي الان", 'md', true)
end
end
if Text and Text:match('(%d+)/chengreplygg') then
local listYt = Text:match('(%d+)/chengreplygg')
if tonumber(listYt) == tonumber(IdUser) then
Redis:set(FDFGERB.."FDFGERB1:Set:Rd"..IdUser..":"..ChatId, "true")
LuaTele.editMessageText(ChatId,Msg_id,"• ارسل لي الرد الان", 'md', true)
end
end
if Text and Text:match('(%d+)/chengreplyg') then
local listYt = Text:match('(%d+)/chengreplyg')
if tonumber(listYt) == tonumber(IdUser) then
Redis:set(FDFGERB.."FDFGERB:Set:Manager:rd"..IdUser..":"..ChatId,"true")
LuaTele.editMessageText(ChatId,Msg_id,"• ارسل لي الرد الان", 'md', true)
end
end
if Text and Text:match('(%d+)/chengreplys') then
local listYt = Text:match('(%d+)/chengreplys')
if tonumber(listYt) == tonumber(IdUser) then
Redis:set(FDFGERB.."FDFGERB:Set:Rd"..IdUser..":"..ChatId,true)
LuaTele.editMessageText(ChatId,Msg_id,"• ارسل لي الرد الان", 'md', true)
end
end

if Text and Text:match('(%d+)/marriageloner') then
local UserId = Text:match('(%d+)/marriageloner')
if tonumber(IdUser) == tonumber(UserId) then
local bain = LuaTele.getUser(IdUser)
if bain.first_name then
loneriusername = '• تقدرون تفلونها الحين ولا تنسون ليلة الدخله .  \n• مبروك ل العريس ⇠ ['..bain.first_name..'](tg://user?id='..bain.id..')*\n*'
else
loneriusername = 'لا يوجد'
end
LuaTele.editMessageText(ChatId,Msg_id,loneriusername, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/marriageloner2') then
local UserId = Text:match('(%d+)/marriageloner2')
if tonumber(IdUser) == tonumber(UserId) then
LuaTele.editMessageText(ChatId,Msg_id,"دور غيرها ","md",true) 
end
end

if Text and Text:match('(%d+)/ban0') then
local UserId = Text:match('(%d+)/ban0')
if tonumber(IdUser) == tonumber(UserId) then
local photo = LuaTele.getUserProfilePhotos(IdUser)
local ban = LuaTele.getUser(IdUser)
if photo.total_count > 0 then
local ban_ns = 'افتارك'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '', callback_data =IdUser..'/delAmr'}, 
},
{
{text = ' صورتك القادمه ', callback_data =IdUser..'/ban1'},{text = ' صورتك السابقه ', callback_data =IdUser..'/delAmr'}, 
},
}
LuaTele.deleteMessages(ChatId,{[1]= Msg_id})
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id=" .. ChatId .. "&photo="..photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id.."&caption=".. URL.escape(ban_ns).."&reply_to_message_id=0&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return LuaTele.sendText(ChatId,Msg_id,'• لا توجد صوره ب حسابك',"md",true) 
end
end
end
if Text and Text:match('(%d+)/ban89') then
local UserId = Text:match('(%d+)/ban89')
if tonumber(IdUser) == tonumber(UserId) then
local photo = LuaTele.getUserProfilePhotos(IdUser)
local ban_ns = 'افتارك'
if photo.total_count > 1 then
GH = '* '..photo.photos[2].sizes[#photo.photos[1].sizes].photo.remote.id..'* '
ban = JSON.encode(GH)
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '', callback_data =IdUser..'/delAmr'}, 
},
}
https.request("https://api.telegram.org/bot"..Token.."/editMessageMedia?chat_id="..ChatId.."&reply_to_message_id=0&media="..ban.."&caption=".. URL.escape(ban_ns).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return LuaTele.sendText(ChatId,Msg_id,'• لا توجد صوره ب حسابك',"md",true) 
end
end
end
if Text and Text:match('(%d+)/ban1') then
local UserId = Text:match('(%d+)/ban1')
if tonumber(IdUser) == tonumber(UserId) then
local photo = LuaTele.getUserProfilePhotos(IdUser)
local ban = LuaTele.getUser(IdUser)
if photo.total_count > 1 then
local ban_ns = 'افتارك'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '', callback_data =IdUser..'/delAmr'}, 
},
{
{text = ' صورتك القادمه ', callback_data =IdUser..'/ban2'},{text = ' صورتك السابقه ', callback_data =IdUser..'/ban0'}, 
},
}
LuaTele.deleteMessages(ChatId,{[1]= Msg_id})
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id=" .. ChatId .. "&photo="..photo.photos[2].sizes[#photo.photos[1].sizes].photo.remote.id.."&caption=".. URL.escape(ban_ns).."&reply_to_message_id=0&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return LuaTele.sendText(ChatId,Msg_id,'• لا توجد صوره ب حسابك',"md",true) 
end
end
end
if Text and Text:match('(%d+)/ban2') then
local UserId = Text:match('(%d+)/ban2')
if tonumber(IdUser) == tonumber(UserId) then
local photo = LuaTele.getUserProfilePhotos(IdUser)
local ban = LuaTele.getUser(IdUser)
if photo.total_count > 1 then
local ban_ns = 'افتارك'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '', callback_data =IdUser..'/delAmr'}, 
},
{
{text = ' صورتك القادمه ', callback_data =IdUser..'/ban3'},{text = ' صورتك السابقه ', callback_data =IdUser..'/ban1'}, 
},
}
LuaTele.deleteMessages(ChatId,{[1]= Msg_id})
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id=" .. ChatId .. "&photo="..photo.photos[3].sizes[#photo.photos[1].sizes].photo.remote.id.."&caption=".. URL.escape(ban_ns).."&reply_to_message_id=0&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return LuaTele.sendText(ChatId,Msg_id,'• لا توجد صوره ب حسابك',"md",true) 
end
end
end
if Text and Text:match('(%d+)/ban3') then
local UserId = Text:match('(%d+)/ban3')
if tonumber(IdUser) == tonumber(UserId) then
local photo = LuaTele.getUserProfilePhotos(IdUser)
local ban = LuaTele.getUser(IdUser)
if photo.total_count > 1 then
local ban_ns = 'افتارك'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '', callback_data =IdUser..'/delAmr'}, 
},
{
{text = ' صورتك القادمه ', callback_data =IdUser..'/ban4'},{text = ' صورتك السابقه ', callback_data =IdUser..'/ban2'}, 
},
}
LuaTele.deleteMessages(ChatId,{[1]= Msg_id})
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id=" .. ChatId .. "&photo="..photo.photos[4].sizes[#photo.photos[1].sizes].photo.remote.id.."&caption=".. URL.escape(ban_ns).."&reply_to_message_id=0&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return LuaTele.sendText(ChatId,Msg_id,'• لا توجد صوره ب حسابك',"md",true) 
end
end
end
if Text and Text:match('(%d+)/ban4') then
local UserId = Text:match('(%d+)/ban4')
if tonumber(IdUser) == tonumber(UserId) then
local photo = LuaTele.getUserProfilePhotos(IdUser)
local ban = LuaTele.getUser(IdUser)
if photo.total_count > 1 then
local ban_ns = 'افتارك'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '', callback_data =IdUser..'/delAmr'}, 
},
{
{text = ' صورتك القادمه ', callback_data =IdUser..'/ban5'},{text = ' صورتك السابقه ', callback_data =IdUser..'/ban3'}, 
},
}
LuaTele.deleteMessages(ChatId,{[1]= Msg_id})
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id=" .. ChatId .. "&photo="..photo.photos[5].sizes[#photo.photos[1].sizes].photo.remote.id.."&caption=".. URL.escape(ban_ns).."&reply_to_message_id=0&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return LuaTele.sendText(ChatId,Msg_id,'• لا توجد صوره ب حسابك',"md",true) 
end
end
end
if Text and Text:match('(%d+)/ban5') then
local UserId = Text:match('(%d+)/ban5')
if tonumber(IdUser) == tonumber(UserId) then
local photo = LuaTele.getUserProfilePhotos(IdUser)
local ban = LuaTele.getUser(IdUser)
if photo.total_count > 1 then
local ban_ns = '𝚑𝚎??𝚎 𝚊𝚛𝚎 𝚢𝚘𝚞𝚛 𝚙𝚑𝚘𝚝𝚘𝚜'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '', callback_data =IdUser..'/delAmr'}, 
},
{
{text = ' صورتك القادمه ', callback_data =IdUser..'/ban6'},{text = ' صورتك السابقه ', callback_data =IdUser..'/ban4'}, 
},
}
LuaTele.deleteMessages(ChatId,{[1]= Msg_id})
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id=" .. ChatId .. "&photo="..photo.photos[6].sizes[#photo.photos[1].sizes].photo.remote.id.."&caption=".. URL.escape(ban_ns).."&reply_to_message_id=0&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return LuaTele.sendText(ChatId,Msg_id,'• لا توجد صوره ب حسابك',"md",true) 
end
end
end
if Text and Text:match('(%d+)/ban6') then
local UserId = Text:match('(%d+)/ban6')
if tonumber(IdUser) == tonumber(UserId) then
local photo = LuaTele.getUserProfilePhotos(IdUser)
local ban = LuaTele.getUser(IdUser)
if photo.total_count > 1 then
local ban_ns = 'افتارك'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '', callback_data =IdUser..'/delAmr'}, 
},
{
{text = ' صورتك القادمه ', callback_data =IdUser..'/ban7'},{text = ' صورتك السابقه ', callback_data =IdUser..'/ban5'}, 
},
}
LuaTele.deleteMessages(ChatId,{[1]= Msg_id})
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id=" .. ChatId .. "&photo="..photo.photos[7].sizes[#photo.photos[1].sizes].photo.remote.id.."&caption=".. URL.escape(ban_ns).."&reply_to_message_id=0&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return LuaTele.sendText(ChatId,Msg_id,'• لا توجد صوره ب حسابك',"md",true) 
end
end
end
if Text and Text:match('(%d+)/Re@') then
local UserId = Text:match('(%d+)/Re@')
if tonumber(IdUser) == tonumber(UserId) then
Abs = math.random(2,140); 
local Text ='اضغط الزر لتغيير'
local msg_id = Msg_id/2097152/0.5
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'تغيير', callback_data = IdUser..'/Re@'},
},
}
https.request("https://api.telegram.org/bot"..Token..'/sendVoice?chat_id=' .. ChatId .. '&voice=https://t.me/lonervo/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
LuaTele.deleteMessages(ChatId,{[1]= Msg_id})
end
end
if Text and Text:match('(%d+)/KJ@') then
local UserId = Text:match('(%d+)/KJ@')
if tonumber(IdUser) == tonumber(UserId) then
Abs = math.random(2,140); 
local Text ='اضغط الزر لتغيير'
local msg_id = Msg_id/2097152/0.5
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'تغيير', callback_data = IdUser..'/KJ@'},
},
}
https.request("https://api.telegram.org/bot"..Token..'/sendVoice?chat_id=' .. ChatId .. '&voice=https://t.me/singFOT/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
LuaTele.deleteMessages(ChatId,{[1]= Msg_id})
end
end
if Text and Text:match('(%d+)/Ro@') then
local UserId = Text:match('(%d+)/Ro@')
if tonumber(IdUser) == tonumber(UserId) then
Abs = math.random(2,140); 
local Text ='اضغط الزر لتغيير'
local msg_id = Msg_id/2097152/0.5
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'تغيير', callback_data = IdUser..'/Ro@'},
},
}
https.request("https://api.telegram.org/bot"..Token..'/sendVoice?chat_id=' .. ChatId .. '&voice=https://t.me/lonervoo/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
LuaTele.deleteMessages(ChatId,{[1]= Msg_id})
end
end

if Text and Text:match('/loner(%d+)') then
local Getloner = Text:match('/loner(%d+)') 
local Numloner = math.random(1,6)
if tonumber(Getloner) == tonumber(Numloner) then
Redis:incrby(FDFGERB.."nool:flotysb"..ChatId..IdUser , 300)
lonerText = 'كفو عليك فزت علي يا حلو'
else
lonerText = 'هييه ما يمديك تفوز علي '
end
if Numloner == 1 then
loner1 = '🪨' else loner1 = '🪨'
end
if Numloner == 2 then
loner2 = '📄' else loner2 = '📄'
end
if Numloner == 3 then
loner3 = '✂️' else loner3 = '✂️' 
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = ''..loner1..'', data = '/*'}, {text = ''..loner2..'', data = '/*'}, {text = ''..loner3..'', data = '/*'}, 
},
{
{text = 'اللعب مره اخرى', data = '/lonerAgane'},
},
}
}
return LuaTele.editMessageText(ChatId,Msg_id,lonerText, 'md', true, false, reply_markup)
end
if Text == "/lonerAgane" then
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '🪨', data = '/loner1'}, {text = '📄', data = '/loner2'}, {text = '✂️', data = '/loner3'}, 
},
}
}
local TextlonerAgane = [[‎• اختار حجره - ورقه - مقص
]]
return LuaTele.editMessageText(ChatId,Msg_id,TextlonerAgane, 'md', true, false, reply_markup)
end
if Text and Text:match('/Mahibes(%d+)') then
local GetMahibes = Text:match('/Mahibes(%d+)') 
local NumMahibes = math.random(1,6)
if tonumber(GetMahibes) == tonumber(NumMahibes) then
Redis:incrby(FDFGERB.."FDFGERB:Num:Add:Games"..ChatId..IdUser, 1)  
MahibesText = '• الف مبروك حظك حلو اليوم\n• فزت  وطلعت المحيبس بل عظمه رقم {'..NumMahibes..'}'
else
MahibesText = '• للاسف لقد خسرت المحيبس بالعظمه رقم {'..NumMahibes..'}\n• جرب حضك  مره اخره'
end
if NumMahibes == 1 then
Mahibes1 = '🤚' else Mahibes1 = '👊'
end
if NumMahibes == 2 then
Mahibes2 = '🤚' else Mahibes2 = '👊'
end
if NumMahibes == 3 then
Mahibes3 = '🤚' else Mahibes3 = '👊' 
end
if NumMahibes == 4 then
Mahibes4 = '🤚' else Mahibes4 = '👊'
end
if NumMahibes == 5 then
Mahibes5 = '🤚' else Mahibes5 = '👊'
end
if NumMahibes == 6 then
Mahibes6 = '🤚' else Mahibes6 = '👊'
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '⑴ » ( '..Mahibes1..' ', data = '/'}, {text = '² » ( '..Mahibes2..' ', data = '/'}, 
},
{
{text = '⑶ » ( '..Mahibes3..' ', data = '/'}, {text = '⑷ » ( '..Mahibes4..' ', data = '/'}, 
},
{
{text = '⑸ » ( '..Mahibes5..' ', data = '/'}, {text = '𝟔 » ( '..Mahibes6..' ', data = '/'}, 
},
{
{text = ' اللعب مره اخرى ', data = '/MahibesAgane'},
},
}
}
return LuaTele.editMessageText(ChatId,Msg_id,MahibesText, 'md', true, false, reply_markup)
end
if Text == "/MahibesAgane" then
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '⑴ »  👊 ', data = '/Mahibes1'}, {text = '⑵ »  👊 ', data = '/Mahibes2'}, 
},
{
{text = '⑶ »  👊 ', data = '/Mahibes3'}, {text = '⑷ »  👊 ', data = '/Mahibes4'}, 
},
{
{text = '⑸ »  👊 ', data = '/Mahibes5'}, {text = '𝟔 »  👊 ', data = '/Mahibes6'}, 
},
}
}
local TextMahibesAgane = [[
• لعبه المحيبس هي لعبة الحظ 
• جرب حظك ويه البوت وتسلى 
• كل ما عليك هوا الضغط على احدى الارقام في الازرار
]]
return LuaTele.editMessageText(ChatId,Msg_id,TextMahibesAgane, 'md', true, false, reply_markup)
end
if Text and Text:match('(%d+)/help1') then
local UserId = Text:match('(%d+)/help1')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = 'التالي', data = IdUser..'/help2'}, {text = 'رجوع', data = IdUser..'/help6'}, 
},
{
{text = 'القائمه الرئيسية', data = IdUser..'/helpall'},
},
}
}
local TextHelp = [[
✯ اهلا بك في قائمه اوامر الاداريين
•••••••••••••••••••
•  رفع - تنزيل مالك اساسي
• رفع - تنزيل مشرف
• رفع - تنزيل منشى
• رفع - تنزيل مدير
• رفع - تنزيل ادمن
• رفع - تنزيل مميز
• تنزيل الكل - لازاله جميع الرتب اعلاه
• مسح الكل - لتنزيل جميع الرتب الموجوده بلمجموعه

- اوامر المسح 
•••••••••••••••••••
• مسح الرتب 
• مسح المالكين الاساسين
• مسح المالكين
• مسح المدراء
• مسح الادمنيه
• مسح المميزين
• مسح المحظورين
• مسح المكتومين
• مسح قائمه العام
• مسح قائمه المنع
• مسح الردود
• مسح الاوامر
• مسح + عدد
• مسح بالرد
 • حذف الايدي 
• حذف الترحيب
• مسح الرابط

- اوامر الطرد الحظر الكتم
•••••••••••••••••••
•  حظر - بالرد ، بالمعرف ، بالايدي
• طرد - بالرد ، بالمعرف ، بالايدي 
• كتم - بالرد ، بالمعرف ، بالايدي
• تقيد - بالرد ، بالمعرف ، بالايدي
• رفع القيود - لألغاء -> كتم ، حظر ، عام ، تقييد
• منع + الكلمه
• الغاء منع + الكلمه
• طرد البوتات
• طرد المحذوفين
• كشف البوتات
]]
LuaTele.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/help2') then
local UserId = Text:match('(%d+)/help2')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = 'التالي', data = IdUser..'/help3'}, {text = 'رجوع', data = IdUser..'/help1'}, 
},
{
{text = 'القائمه الرئيسية', data = IdUser..'/helpall'},
},
}
}
local TextHelp = [[
✯ اهلا بك في قائمه اوامر المجموعه

- اوامر الوضع
•••••••••••••••••••
• ضع الترحيب
• ضع القوانين
• ضع وصف
• ضع رابط
• اضف امر
• اضف رد 
• تعين الايدي 
• تغيير الايدي
• اضف رد انلاين
• مسح رد انلاين 

- اوامر رؤية الاعدادات
•••••••••••••••••••
• المطور
• المالكين الاساسين
• المالكين 
• الادمنيه
• المدراء
• المميزين
• المحظورين
• القوانين
• المكتومين
• معلوماتي 
• الحمايه  
• الوسائط
• الاعدادت
• المجموعه
]]
LuaTele.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/help3') then
local UserId = Text:match('(%d+)/help3')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = 'التالي', data = IdUser..'/help4'}, {text = 'رجوع', data = IdUser..'/help2'}, 
},
{
{text = 'القائمه الرئيسية', data = IdUser..'/helpall'},
},
}
}
local TextHelp = [[
✯ اهلا بك في قائمه الحماية

- اوامر القفل والفتح بالمسح 
- الاضهار الاوامر اونلاين
- اكتب (الاعدادات)
•••••••••••••••••••
• قفل - فتح التعديل  
• قفل - فتح القنوات 
• قفل - فتح الصوت 
• قفل - فتح الفيديو 
• قفل - فتح الصور 
• قفل - فتح الملصقات 
• قفل - فتح المتحركه 
• قفل - فتح الدردشه 
• قفل - فتح الروابط 
• قفل - فتح التاك 
• قفل - فتح البوتات 
• قفل - فتح المعرفات 
• قفل - فتح البوتات بالطرد 
• قفل - فتح الكلايش 
• قفل - فتح التكرار 
• قفل - فتح التوجيه 
• قفل - فتح الانلاين 
• قفل - فتح الجهات 
• قفل - فتح الكل 
• قفل - فتح السب
• قفل - فتح الاضافه
• قفل - فتح الصوت
• قفل - فتح الالعاب
• قفل - فتح الويب

- اوامر الفتح والقفل بالتقييد
•••••••••••••••••••
 • قفل - فتح التوجيه بالتقيد
• قفل - فتح الروابط بالتقيد 
• قفل - فتح المتحركه بالتقيد 
• قفل - فتح الصور بالتقيد 
• قفل - فتح الفيديو بالتقيد 

- اوامر التفعيل والتعطيل 
- الاظهار اوامر تفعيل وتعطيل انلاين 
- اكتب (الحمايه)
•••••••••••••••••••
• تفعيل - تعطيل الترحيب 
• تفعيل - تعطيل الردود 
• تفعيل - تعطيل التحذير 
• تفعيل - تعطيل العضو مسكين 
• تفعيل - تعطيل الرابط
• تفعيل - تعطيل الحظر
• تفعيل - تعطيل الحمايه
• تفعيل - تعطيل الايدي بالصوره
• تفعيل - تعطيل التحقق 
• تفعيل - تعطيل ردود السورس 
• تفعيل - تعطيل التنظيف التلقائي
]]
LuaTele.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/help4') then
local UserId = Text:match('(%d+)/help4')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = 'التالي', data = IdUser..'/help5'}, {text = 'رجوع', data = IdUser..'/help3'}, 
},
{
{text = 'القائمه الرئيسية', data = IdUser..'/helpall'},
},
}
}
local TextHelp = [[
اهلا بك بقائمة التسليه            ↓↓↓
ــــــــــــــــــــــــ
• غنيلي
• قران 
• اطربني
• اقتباسات
• اذكار
• افتار عيال
• افتار بنات
• جمالي
• زواج
• رجولتي
• انوثتي
• اهمسلي
• زوجني
• نسبه الحب
• نسبه الكره
ــــــــــــــــــــــــ
• زخرفه + الاسم
• العمر + تاريخ ميلادك كامل 
• معنى اسم  
• كيف اهمس
• ترند
• ثنائي
]]
LuaTele.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/help5') then
local UserId = Text:match('(%d+)/help5')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = 'التالي', data = IdUser..'/help6'}, {text = 'رجوع', data = IdUser..'/help4'}, 
},
{
{text = 'القائمه الرئيسية', data = IdUser..'/helpall'},
},
}
}
local TextHelp = [[
✯ اهلا بك عزيزي Dev🎖️  
━━━━━━━━━━━━
• تفعيل
• تعطيل
• غادر
• مسح قائمه M
• مسح قائمه MY
• قائمه MY
• قائمه M
•رفع M
• رفع MY
• حذف الرابط
• ضع عدد التفعيل + العدد
• مسح المالكين الاساسيين
• اذاعه خاص
• اذاعه للمجموعات
• اذاعه بالتثبيت
• اذاعه بالتوجيه للمجموعات
• اذاعه بالتوجيه للخاص
• تعيين الايدي عام 
 • حذف الايدي عام
• رفع - تنزيل MY = مطور ثانوي
• حظر - كتم عام
• حظر - الغاء حظر بالرد للتواصل
• مسح المحظورين - المحظورين للتواصل
• قائمه العام
• الغاء كتم العام - الغاء العام
• مسح المكتومين عام
• مسح المحظورين عام
• تنظيف المجموعات 
• تنظيف المشتركين 
• الردود العامه
• الردود المتعدده العامه 
• مسح الردود العامه 
• مسح الردود المتعدده العامه
• اضف رد عام 
• اضف رد متعدد عام
• تحديث - تحديث السورس
]]
LuaTele.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/help6') then
local UserId = Text:match('(%d+)/help6')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = 'التالي', data = IdUser..'/help1'}, {text = 'رجوع', data = IdUser..'/help5'}, 
},
{
{text = 'القائمه الرئيسية', data = IdUser..'/helpall'},
},
}
}
local TextHelp = [[
• الالعاب للبوت 🎖.
↓ ↓ ↓ ↓ 
• المختلف 
• امثله 
• العكس
• حزوره 
• معاني 
• الاسرع
• كت تويت 
• لو خيروك
• دول
• حروف
• صور
• اعلام
• انقليزي
• كلمات
• تفكيك
• رياضيات
• تركيب
• عواصم
• احكام 
• عقاب
• اغاني
]]
LuaTele.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/helpall') then
local UserId = Text:match('(%d+)/helpall')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = ' ¹ ', data = IdUser..'/help1'}, {text = ' ² ', data = IdUser..'/help2'}, {text = ' ³ ', data = IdUser..'/help3'},
},
{
{text = 'اوامر التسليه', data = IdUser..'/help4'}, {text = ' الالعاب ', data = IdUser..'/help6'}, 
},
{
{text = ' اوامر Dev   ', data = IdUser..'/help5'},
},
}
}
local TextHelp = [[
• اهلين عيني بـ اوامر البوت
ــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــ
• م1 ⇠ اوامر الرفع والتنزيل
• م2 ⇠ اوامر الوضع و الاعدادات 
• م3 ⇠ اوامر القفل - تعطيل 
• م4 ⇠ اوامر التسلية 
• م5 ⇠ اوامر Dev
• م6 ⇠ اوامر الالعاب
]]
LuaTele.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/lock_link') then
local UserId = Text:match('(%d+)/lock_link')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Link"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الروابط").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_spam') then
local UserId = Text:match('(%d+)/lock_spam')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Spam"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الكلايش").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_keypord') then
local UserId = Text:match('(%d+)/lock_keypord')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Keyboard"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الكيبورد").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_voice') then
local UserId = Text:match('(%d+)/lock_voice')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:vico"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الاغاني").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_gif') then
local UserId = Text:match('(%d+)/lock_gif')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Animation"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل المتحركات").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_files') then
local UserId = Text:match('(%d+)/lock_files')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Document"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الملفات").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_text') then
local UserId = Text:match('(%d+)/lock_text')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:text"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الدردشه").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock:Fshar') then
local UserId = Text:match('(%d+)/lock:Fshar')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:lock:Fshar"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفل السب").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_video') then
local UserId = Text:match('(%d+)/lock_video')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Video"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الفيديو").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_photo') then
local UserId = Text:match('(%d+)/lock_photo')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Photo"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• ابشر تم قفلت صور").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_username') then
local UserId = Text:match('(%d+)/lock_username')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:User:Name"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل المعرفات").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_tags') then
local UserId = Text:match('(%d+)/lock_tags')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:hashtak"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل التاك").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_bots') then
local UserId = Text:match('(%d+)/lock_bots')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Bot:kick"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل البوتات").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_fwd') then
local UserId = Text:match('(%d+)/lock_fwd')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:forward"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل التوجيه").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_audio') then
local UserId = Text:match('(%d+)/lock_audio')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Audio"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الصوت").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_stikear') then
local UserId = Text:match('(%d+)/lock_stikear')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Sticker"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الملصقات").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_phone') then
local UserId = Text:match('(%d+)/lock_phone')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Contact"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الجهات").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_joine') then
local UserId = Text:match('(%d+)/lock_joine')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Join"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الدخول").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_addmem') then
local UserId = Text:match('(%d+)/lock_addmem')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:AddMempar"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الاضافه").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_videonote') then
local UserId = Text:match('(%d+)/lock_videonote')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Unsupported"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل بصمه الفيديو").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_pin') then
local UserId = Text:match('(%d+)/lock_pin')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:lockpin"..ChatId,(LuaTele.getChatPinnedMessage(ChatId).id or true)) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل التثبيت").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_tgservir') then
local UserId = Text:match('(%d+)/lock_tgservir')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:tagservr"..ChatId,true)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الاشعارات").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_markdaun') then
local UserId = Text:match('(%d+)/lock_markdaun')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Markdaun"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الماركدون").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_edits') then
local UserId = Text:match('(%d+)/lock_edits')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:edit"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل التعديل").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_games') then
local UserId = Text:match('(%d+)/lock_games')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:geam"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الالعاب").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_flood') then
local UserId = Text:match('(%d+)/lock_flood')
if tonumber(IdUser) == tonumber(UserId) then
Redis:hset(FDFGERB.."FDFGERB:Spam:Group:User"..ChatId ,"Spam:User","del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل التكرار").Lock, 'md', true, false, reply_markup)
end
end

if Text and Text:match('(%d+)/lock_linkkid') then
local UserId = Text:match('(%d+)/lock_linkkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Link"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الروابط").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_spamkid') then
local UserId = Text:match('(%d+)/lock_spamkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Spam"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الكلايش").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_keypordkid') then
local UserId = Text:match('(%d+)/lock_keypordkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Keyboard"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الكيبورد").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_voicekid') then
local UserId = Text:match('(%d+)/lock_voicekid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:vico"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الاغاني").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_gifkid') then
local UserId = Text:match('(%d+)/lock_gifkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Animation"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل المتحركات").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_fileskid') then
local UserId = Text:match('(%d+)/lock_fileskid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Document"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الملفات").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_videokid') then
local UserId = Text:match('(%d+)/lock_videokid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Video"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الفيديو").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_photokid') then
local UserId = Text:match('(%d+)/lock_photokid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Photo"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• ابشر تم قفلت صور").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_usernamekid') then
local UserId = Text:match('(%d+)/lock_usernamekid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:User:Name"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل المعرفات").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_tagskid') then
local UserId = Text:match('(%d+)/lock_tagskid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:hashtak"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل التاك").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_fwdkid') then
local UserId = Text:match('(%d+)/lock_fwdkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:forward"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل التوجيه").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_audiokid') then
local UserId = Text:match('(%d+)/lock_audiokid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Audio"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الصوت").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_stikearkid') then
local UserId = Text:match('(%d+)/lock_stikearkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Sticker"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الملصقات").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_phonekid') then
local UserId = Text:match('(%d+)/lock_phonekid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Contact"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الجهات").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_videonotekid') then
local UserId = Text:match('(%d+)/lock_videonotekid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Unsupported"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل بصمه الفيديو").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_markdaunkid') then
local UserId = Text:match('(%d+)/lock_markdaunkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Markdaun"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الماركدون").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_gameskid') then
local UserId = Text:match('(%d+)/lock_gameskid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:geam"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الالعاب").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_floodkid') then
local UserId = Text:match('(%d+)/lock_floodkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:hset(FDFGERB.."FDFGERB:Spam:Group:User"..ChatId ,"Spam:User","keed")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل التكرار").lockKid, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/lock_linkktm') then
local UserId = Text:match('(%d+)/lock_linkktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Link"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الروابط").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_spamktm') then
local UserId = Text:match('(%d+)/lock_spamktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Spam"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الكلايش").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_keypordktm') then
local UserId = Text:match('(%d+)/lock_keypordktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Keyboard"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الكيبورد").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_voicektm') then
local UserId = Text:match('(%d+)/lock_voicektm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:vico"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الاغاني").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_gifktm') then
local UserId = Text:match('(%d+)/lock_gifktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Animation"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل المتحركات").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_filesktm') then
local UserId = Text:match('(%d+)/lock_filesktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Document"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الملفات").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_videoktm') then
local UserId = Text:match('(%d+)/lock_videoktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Video"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الفيديو").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_photoktm') then
local UserId = Text:match('(%d+)/lock_photoktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Photo"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• ابشر تم قفلت صور").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_usernamektm') then
local UserId = Text:match('(%d+)/lock_usernamektm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:User:Name"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل المعرفات").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_tagsktm') then
local UserId = Text:match('(%d+)/lock_tagsktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:hashtak"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل التاك").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_fwdktm') then
local UserId = Text:match('(%d+)/lock_fwdktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:forward"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل التوجيه").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_audioktm') then
local UserId = Text:match('(%d+)/lock_audioktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Audio"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الصوت").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_stikearktm') then
local UserId = Text:match('(%d+)/lock_stikearktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Sticker"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الملصقات").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_phonektm') then
local UserId = Text:match('(%d+)/lock_phonektm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Contact"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الجهات").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_videonotektm') then
local UserId = Text:match('(%d+)/lock_videonotektm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Unsupported"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل بصمه الفيديو").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_markdaunktm') then
local UserId = Text:match('(%d+)/lock_markdaunktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Markdaun"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الماركدون").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_gamesktm') then
local UserId = Text:match('(%d+)/lock_gamesktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:geam"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الالعاب").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_floodktm') then
local UserId = Text:match('(%d+)/lock_floodktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:hset(FDFGERB.."FDFGERB:Spam:Group:User"..ChatId ,"Spam:User","mute")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل التكرار").lockKtm, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/lock_linkkick') then
local UserId = Text:match('(%d+)/lock_linkkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Link"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الروابط").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_spamkick') then
local UserId = Text:match('(%d+)/lock_spamkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Spam"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الكلايش").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_keypordkick') then
local UserId = Text:match('(%d+)/lock_keypordkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Keyboard"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الكيبورد").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_voicekick') then
local UserId = Text:match('(%d+)/lock_voicekick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:vico"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الاغاني").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_gifkick') then
local UserId = Text:match('(%d+)/lock_gifkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Animation"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل المتحركات").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_fileskick') then
local UserId = Text:match('(%d+)/lock_fileskick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Document"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الملفات").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_videokick') then
local UserId = Text:match('(%d+)/lock_videokick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Video"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الفيديو").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_photokick') then
local UserId = Text:match('(%d+)/lock_photokick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Photo"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• ابشر تم قفلت صور").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_usernamekick') then
local UserId = Text:match('(%d+)/lock_usernamekick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:User:Name"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل المعرفات").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_tagskick') then
local UserId = Text:match('(%d+)/lock_tagskick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:hashtak"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل التاك").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_fwdkick') then
local UserId = Text:match('(%d+)/lock_fwdkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:forward"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل التوجيه").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_audiokick') then
local UserId = Text:match('(%d+)/lock_audiokick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Audio"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الصوت").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_stikearkick') then
local UserId = Text:match('(%d+)/lock_stikearkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Sticker"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الملصقات").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_phonekick') then
local UserId = Text:match('(%d+)/lock_phonekick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Contact"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الجهات").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_videonotekick') then
local UserId = Text:match('(%d+)/lock_videonotekick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Unsupported"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل بصمه الفيديو").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_markdaunkick') then
local UserId = Text:match('(%d+)/lock_markdaunkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:Markdaun"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الماركدون").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_gameskick') then
local UserId = Text:match('(%d+)/lock_gameskick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Lock:geam"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الالعاب").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_floodkick') then
local UserId = Text:match('(%d+)/lock_floodkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:hset(FDFGERB.."FDFGERB:Spam:Group:User"..ChatId ,"Spam:User","kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل التكرار").lockKick, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/unmute_link') then
local UserId = Text:match('(%d+)/unmute_link')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Status:Link"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم تعطيل امر الرابط").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_welcome') then
local UserId = Text:match('(%d+)/unmute_welcome')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Status:Welcome"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم تعطيل امر الترحيب").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_Id') then
local UserId = Text:match('(%d+)/unmute_Id')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Status:Id"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم تعطيل امر الايدي").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_IdPhoto') then
local UserId = Text:match('(%d+)/unmute_IdPhoto')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Status:IdPhoto"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم تعطيل امر الايدي بالصوره").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_ryple') then
local UserId = Text:match('(%d+)/unmute_ryple')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Status:Reply"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم تعطيل امر الردود").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_ryplesudo') then
local UserId = Text:match('(%d+)/unmute_ryplesudo')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Status:ReplySudo"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم تعطيل امر الردود العامه").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_setadmib') then
local UserId = Text:match('(%d+)/unmute_setadmib')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Status:SetId"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم تعطيل امر الرفع").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_kickmembars') then
local UserId = Text:match('(%d+)/unmute_kickmembars')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Status:BanId"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم تعطيل امر الطرد • الحظر").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_games') then
local UserId = Text:match('(%d+)/unmute_games')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Status:Games"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم تعطيل امر الالعاب").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_kickme') then
local UserId = Text:match('(%d+)/unmute_kickme')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Status:KickMe"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم تعطيل امر اطردني").unLock, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/mute_link') then
local UserId = Text:match('(%d+)/mute_link')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Status:Link"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم تفعيل امر الرابط").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_welcome') then
local UserId = Text:match('(%d+)/mute_welcome')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Status:Welcome"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم تفعيل امر الترحيب").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_Id') then
local UserId = Text:match('(%d+)/mute_Id')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Status:Id"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم تفعيل امر الايدي").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_IdPhoto') then
local UserId = Text:match('(%d+)/mute_IdPhoto')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Status:IdPhoto"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم تفعيل امر الايدي بالصوره").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_ryple') then
local UserId = Text:match('(%d+)/mute_ryple')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Status:Reply"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم تفعيل امر الردود").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_ryplesudo') then
local UserId = Text:match('(%d+)/mute_ryplesudo')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Status:ReplySudo"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم تفعيل امر الردود العامه").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_setadmib') then
local UserId = Text:match('(%d+)/mute_setadmib')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Status:SetId"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم تفعيل امر الرفع").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_kickmembars') then
local UserId = Text:match('(%d+)/mute_kickmembars')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Status:BanId"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم تفعيل امر الطرد • الحظر").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_games') then
local UserId = Text:match('(%d+)/mute_games')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Status:Games"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم تفعيل امر الالعاب").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_kickme') then
local UserId = Text:match('(%d+)/mute_kickme')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(FDFGERB.."FDFGERB:Status:KickMe"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم تفعيل امر اطردني").unLock, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/addAdmins@(.*)') then
local UserId = {Text:match('(%d+)/addAdmins@(.*)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
local Info_Members = LuaTele.getSupergroupMembers(UserId[2], "Administrators", "", 0, 200)
local List_Members = Info_Members.members
x = 0
y = 0
for k, v in pairs(List_Members) do
if Info_Members.members[k].bot_info == nil then
if Info_Members.members[k].status.luatele == "chatMemberStatusCreator" then
Redis:sadd(FDFGERB.."FDFGERB:TheBasics:Group"..UserId[2],v.member_id.user_id) 
x = x + 1
else
Redis:sadd(FDFGERB.."FDFGERB:Addictive:Group"..UserId[2],v.member_id.user_id) 
y = y + 1
end
end
end
LuaTele.answerCallbackQuery(data.id, "• تم ترقيه ( "..y.." ) ادمنيه \n• تم ترقية المالك ", true)
end
end
if Text and Text:match('(%d+)/LockAllGroup@(.*)') then
local UserId = {Text:match('(%d+)/LockAllGroup@(.*)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
Redis:set(FDFGERB.."FDFGERB:Lock:tagservrbot"..UserId[2],true)   
list ={"Lock:Bot:kick","Lock:User:Name","Lock:hashtak","Lock:Cmd","Lock:Link","Lock:forward","Lock:Keyboard","Lock:geam","Lock:Photo","Lock:Animation","Lock:Video","Lock:Audio","Lock:vico","Lock:Sticker","Lock:Document","Lock:Unsupported","Lock:Markdaun","Lock:Contact","Lock:Spam"}
for i,lock in pairs(list) do 
Redis:set(FDFGERB..'FDFGERB:'..lock..UserId[2],"del")    
end
LuaTele.answerCallbackQuery(data.id, "• ابشر قفلت لك جميع الاوامر.    ", true)
end
end
if Text and Text:match('/Zxchq(.*)') then
local UserId = Text:match('/Zxchq(.*)')
LuaTele.answerCallbackQuery(data.id, "• تم من بس خليك قدها", true)
LuaTele.leaveChat(UserId)
end
if Text and Text:match('(%d+)/Redis') then
local UserId = Text:match('(%d+)/Redis')
LuaTele.answerCallbackQuery(data.id, "• تم الغاء الامر بنجاح", true)
if tonumber(IdUser) == tonumber(UserId) then
return LuaTele.deleteMessages(ChatId,{[1]= Msg_id})
end
end
if Text and Text:match('/leftgroup@(.*)') then
local UserId = Text:match('/leftgroup@(.*)')
LuaTele.answerCallbackQuery(data.id, "• تم مغادره البوت من المجموعه", true)
LuaTele.leaveChat(UserId)
end


if Text and Text:match('(%d+)/groupNumseteng//(%d+)') then
local UserId = {Text:match('(%d+)/groupNumseteng//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
return GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id)
end
end
if Text and Text:match('(%d+)/groupNum1//(%d+)') then
local UserId = {Text:match('(%d+)/groupNum1//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if tonumber(GetAdminsNum(ChatId,UserId[2]).change_info) == 1 then
LuaTele.answerCallbackQuery(data.id, "• تم تعطيل صلاحيه تغيير المعلومات", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,'❬ لا ❭',nil,nil,nil,nil,nil)
LuaTele.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,0, 0, 0, 0,0,0,1,0})
else
LuaTele.answerCallbackQuery(data.id, "• تم تفعيل صلاحيه تغيير المعلومات", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,'❬ نعم ❭',nil,nil,nil,nil,nil)
LuaTele.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,1, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, GetAdminsNum(ChatId,UserId[2]).invite_users, GetAdminsNum(ChatId,UserId[2]).restrict_members ,GetAdminsNum(ChatId,UserId[2]).pin_messages, GetAdminsNum(ChatId,UserId[2]).promote})
end
end
end
if Text and Text:match('(%d+)/groupNum2//(%d+)') then
local UserId = {Text:match('(%d+)/groupNum2//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if tonumber(GetAdminsNum(ChatId,UserId[2]).pin_messages) == 1 then
LuaTele.answerCallbackQuery(data.id, "• تم تعطيل صلاحيه التثبيت", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,'❬ لا ❭',nil,nil,nil,nil)
LuaTele.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, GetAdminsNum(ChatId,UserId[2]).invite_users, GetAdminsNum(ChatId,UserId[2]).restrict_members ,0, GetAdminsNum(ChatId,UserId[2]).promote})
else
LuaTele.answerCallbackQuery(data.id, "• تم تفعيل صلاحيه التثبيت", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,'❬ نعم ❭',nil,nil,nil,nil)
LuaTele.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, GetAdminsNum(ChatId,UserId[2]).invite_users, GetAdminsNum(ChatId,UserId[2]).restrict_members ,1, GetAdminsNum(ChatId,UserId[2]).promote})
end
end
end
if Text and Text:match('(%d+)/groupNum3//(%d+)') then
local UserId = {Text:match('(%d+)/groupNum3//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if tonumber(GetAdminsNum(ChatId,UserId[2]).restrict_members) == 1 then
LuaTele.answerCallbackQuery(data.id, "• تم تعطيل صلاحيه الحظر", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,'❬ لا ❭',nil,nil,nil)
LuaTele.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, GetAdminsNum(ChatId,UserId[2]).invite_users, 0 ,GetAdminsNum(ChatId,UserId[2]).pin_messages, GetAdminsNum(ChatId,UserId[2]).promote})
else
LuaTele.answerCallbackQuery(data.id, "• تم تفعيل صلاحيه الحظر", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,'❬ نعم ❭',nil,nil,nil)
LuaTele.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, GetAdminsNum(ChatId,UserId[2]).invite_users, 1 ,GetAdminsNum(ChatId,UserId[2]).pin_messages, GetAdminsNum(ChatId,UserId[2]).promote})
end
end
end
if Text and Text:match('(%d+)/groupNum4//(%d+)') then
local UserId = {Text:match('(%d+)/groupNum4//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if tonumber(GetAdminsNum(ChatId,UserId[2]).invite_users) == 1 then
LuaTele.answerCallbackQuery(data.id, "• تم تعطيل صلاحيه دعوه المستخدمين", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,nil,'❬ لا ❭',nil,nil)
LuaTele.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, 0, GetAdminsNum(ChatId,UserId[2]).restrict_members ,GetAdminsNum(ChatId,UserId[2]).pin_messages, GetAdminsNum(ChatId,UserId[2]).promote})
else
LuaTele.answerCallbackQuery(data.id, "• تم تفعيل صلاحيه دعوه المستخدمين", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,nil,'❬ نعم ❭',nil,nil)
LuaTele.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, 1, GetAdminsNum(ChatId,UserId[2]).restrict_members ,GetAdminsNum(ChatId,UserId[2]).pin_messages, GetAdminsNum(ChatId,UserId[2]).promote})
end
end
end
if Text and Text:match('(%d+)/groupNum5//(%d+)') then
local UserId = {Text:match('(%d+)/groupNum5//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if tonumber(GetAdminsNum(ChatId,UserId[2]).delete_messages) == 1 then
LuaTele.answerCallbackQuery(data.id, "• تم تعطيل صلاحيه مسح الرسائل", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,nil,nil,'❬ لا ❭',nil)
LuaTele.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, 0, GetAdminsNum(ChatId,UserId[2]).invite_users, GetAdminsNum(ChatId,UserId[2]).restrict_members ,GetAdminsNum(ChatId,UserId[2]).pin_messages, GetAdminsNum(ChatId,UserId[2]).promote})
else
LuaTele.answerCallbackQuery(data.id, "• تم تفعيل صلاحيه مسح الرسائل", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,nil,nil,'❬ نعم ❭',nil)
LuaTele.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, 1, GetAdminsNum(ChatId,UserId[2]).invite_users, GetAdminsNum(ChatId,UserId[2]).restrict_members ,GetAdminsNum(ChatId,UserId[2]).pin_messages, GetAdminsNum(ChatId,UserId[2]).promote})
end
end
end
if Text and Text:match('(%d+)/groupNum6//(%d+)') then
local UserId = {Text:match('(%d+)/groupNum6//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if tonumber(GetAdminsNum(ChatId,UserId[2]).promote) == 1 then
LuaTele.answerCallbackQuery(data.id, "• تم تعطيل صلاحيه اضافه مشرفين", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,nil,nil,nil,'❬ لا ❭')
LuaTele.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, GetAdminsNum(ChatId,UserId[2]).invite_users, GetAdminsNum(ChatId,UserId[2]).restrict_members ,GetAdminsNum(ChatId,UserId[2]).pin_messages, 0})
else
LuaTele.answerCallbackQuery(data.id, "• تم تفعيل صلاحيه اضافه مشرفين", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,nil,nil,nil,'❬ نعم ❭')
LuaTele.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, GetAdminsNum(ChatId,UserId[2]).invite_users, GetAdminsNum(ChatId,UserId[2]).restrict_members ,GetAdminsNum(ChatId,UserId[2]).pin_messages, 1})
end
end
end

if Text and Text:match('(%d+)/web') then
local UserId = Text:match('(%d+)/web')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).web == true then
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, false, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
else
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, true, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
end
Get_permissions(ChatId,IdUser,Msg_id)
end
elseif Text and Text:match('(%d+)/info') then
local UserId = Text:match('(%d+)/info')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).info == true then
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, false, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
else
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, true, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
end
Get_permissions(ChatId,IdUser,Msg_id)
end
elseif Text and Text:match('(%d+)/invite') then
local UserId = Text:match('(%d+)/invite')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).invite == true then
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, false, Getpermissions(ChatId).pin)
else
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, true, Getpermissions(ChatId).pin)
end
Get_permissions(ChatId,IdUser,Msg_id)
end
elseif Text and Text:match('(%d+)/pin') then
local UserId = Text:match('(%d+)/pin')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).pin == true then
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, false)
else
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, true)
end
Get_permissions(ChatId,IdUser,Msg_id)
end
elseif Text and Text:match('(%d+)/media') then
local UserId = Text:match('(%d+)/media')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).media == true then
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, false, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
else
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, true, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
end
Get_permissions(ChatId,IdUser,Msg_id)
end
elseif Text and Text:match('(%d+)/messges') then
local UserId = Text:match('(%d+)/messges')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).messges == true then
LuaTele.setChatPermissions(ChatId, false, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
else
LuaTele.setChatPermissions(ChatId, true, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
end
Get_permissions(ChatId,IdUser,Msg_id)
end
elseif Text and Text:match('(%d+)/other') then
local UserId = Text:match('(%d+)/other')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).other == true then
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, false, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
else
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, true, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
end
Get_permissions(ChatId,IdUser,Msg_id)
end
elseif Text and Text:match('(%d+)/polls') then
local UserId = Text:match('(%d+)/polls')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).polls == true then
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, false, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
else
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, true, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
end
Get_permissions(ChatId,IdUser,Msg_id)
end
end
if Text and Text:match('(%d+)/listallAddorrem') then
local UserId = Text:match('(%d+)/listallAddorrem')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = 'تعطيل الرابط', data = IdUser..'/'.. 'unmute_link'},{text = 'تفعيل الرابط', data = IdUser..'/'.. 'mute_link'},
},
{
{text = 'تعطيل الترحيب', data = IdUser..'/'.. 'unmute_welcome'},{text = 'تفعيل الترحيب', data = IdUser..'/'.. 'mute_welcome'},
},
{
{text = 'اتعطيل الايدي', data = IdUser..'/'.. 'unmute_Id'},{text = 'اتفعيل الايدي', data = IdUser..'/'.. 'mute_Id'},
},
{
{text = 'تعطيل الايدي بالصوره', data = IdUser..'/'.. 'unmute_IdPhoto'},{text = 'تفعيل الايدي بالصوره', data = IdUser..'/'.. 'mute_IdPhoto'},
},
{
{text = 'تعطيل الردود', data = IdUser..'/'.. 'unmute_ryple'},{text = 'تفعيل الردود', data = IdUser..'/'.. 'mute_ryple'},
},
{
{text = 'تعطيل الردود العامه', data = IdUser..'/'.. 'unmute_ryplesudo'},{text = 'تفعيل الردود العامه', data = IdUser..'/'.. 'mute_ryplesudo'},
},
{
{text = 'تعطيل الرفع', data = IdUser..'/'.. 'unmute_setadmib'},{text = 'تفعيل الرفع', data = IdUser..'/'.. 'mute_setadmib'},
},
{
{text = 'تعطيل الطرد', data = IdUser..'/'.. 'unmute_kickmembars'},{text = 'تفعيل الطرد', data = IdUser..'/'.. 'mute_kickmembars'},
},
{
{text = 'تعطيل الالعاب', data = IdUser..'/'.. 'unmute_games'},{text = 'تفعيل الالعاب', data = IdUser..'/'.. 'mute_games'},
},
{
{text = 'تعطيل اطردني', data = IdUser..'/'.. 'unmute_kickme'},{text = 'تفعيل اطردني', data = IdUser..'/'.. 'mute_kickme'},
},
{
{text = ' القائمه الرئيسيه ', data = IdUser..'/helpall'},
},
{
{text = '• اخفاء الامر ', data =IdUser..'/'.. 'delAmr'}
},
}
}
return LuaTele.editMessageText(ChatId,Msg_id,'• اوامر التفعيل والتعطيل ', 'md', false, false, reply_markup)
end
end
if Text and Text:match('(%d+)/NextSeting') then
local UserId = Text:match('(%d+)/NextSeting')
if tonumber(IdUser) == tonumber(UserId) then
local Text = "\n• اعدادات المجموعه ".."\nعلامة ال (نعم) تعني مقفول".."\nعلامة ال (لا) تعني مفتوح"
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = GetSetieng(ChatId).lock_fwd, data = '&'},{text = 'التوجبه : ', data =IdUser..'/'.. 'Status_fwd'},
},
{
{text = GetSetieng(ChatId).lock_muse, data = '&'},{text = 'الصوت : ', data =IdUser..'/'.. 'Status_audio'},
},
{
{text = GetSetieng(ChatId).lock_ste, data = '&'},{text = 'الملصقات : ', data =IdUser..'/'.. 'Status_stikear'},
},
{
{text = GetSetieng(ChatId).lock_phon, data = '&'},{text = 'الجهات : ', data =IdUser..'/'.. 'Status_phone'},
},
{
{text = GetSetieng(ChatId).lock_join, data = '&'},{text = 'الدخول : ', data =IdUser..'/'.. 'Status_joine'},
},
{
{text = GetSetieng(ChatId).lock_add, data = '&'},{text = 'الاضافه : ', data =IdUser..'/'.. 'Status_addmem'},
},
{
{text = GetSetieng(ChatId).lock_self, data = '&'},{text = 'بصمه فيديو : ', data =IdUser..'/'.. 'Status_videonote'},
},
{
{text = GetSetieng(ChatId).lock_pin, data = '&'},{text = 'التثبيت : ', data =IdUser..'/'.. 'Status_pin'},
},
{
{text = GetSetieng(ChatId).lock_tagservr, data = '&'},{text = 'الاشعارات : ', data =IdUser..'/'.. 'Status_tgservir'},
},
{
{text = GetSetieng(ChatId).lock_mark, data = '&'},{text = 'الماركدون : ', data =IdUser..'/'.. 'Status_markdaun'},
},
{
{text = GetSetieng(ChatId).lock_edit, data = '&'},{text = 'التعديل : ', data =IdUser..'/'.. 'Status_edits'},
},
{
{text = GetSetieng(ChatId).lock_geam, data = '&'},{text = 'الالعاب : ', data =IdUser..'/'.. 'Status_games'},
},
{
{text = GetSetieng(ChatId).flood, data = '&'},{text = 'التكرار : ', data =IdUser..'/'.. 'Status_flood'},
},
{
{text = '• الرجوع ... ', data =IdUser..'/'.. 'NoNextSeting'}
},
{
{text = ' القائمه الرئيسيه ', data = IdUser..'/helpall'},
},
{
{text = '• اخفاء الامر ', data =IdUser..'/'.. '/delAmr'}
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,Text, 'md', false, false, reply_markup)
end
end
if Text and Text:match('(%d+)/NoNextSeting') then
local UserId = Text:match('(%d+)/NoNextSeting')
if tonumber(IdUser) == tonumber(UserId) then
local Text = "\n• اعدادات المجموعه ".."\nعلامة ال (نعم) تعني مقفول".."\n• علامة ال (لا) تعني مفتوح"
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = GetSetieng(ChatId).lock_links, data = '&'},{text = 'الروابط : ', data =IdUser..'/'.. 'Status_link'},
},
{
{text = GetSetieng(ChatId).lock_spam, data = '&'},{text = 'الكلايش : ', data =IdUser..'/'.. 'Status_spam'},
},
{
{text = GetSetieng(ChatId).lock_inlin, data = '&'},{text = 'الكيبورد : ', data =IdUser..'/'.. 'Status_keypord'},
},
{
{text = GetSetieng(ChatId).lock_vico, data = '&'},{text = 'الاغاني : ', data =IdUser..'/'.. 'Status_voice'},
},
{
{text = GetSetieng(ChatId).lock_gif, data = '&'},{text = 'المتحركه : ', data =IdUser..'/'.. 'Status_gif'},
},
{
{text = GetSetieng(ChatId).lock_file, data = '&'},{text = 'الملفات : ', data =IdUser..'/'.. 'Status_files'},
},
{
{text = GetSetieng(ChatId).lock_text, data = '&'},{text = 'الدردشه : ', data =IdUser..'/'.. 'Status_text'},
},
{
{text = GetSetieng(ChatId).lock_ved, data = '&'},{text = 'الفيديو : ', data =IdUser..'/'.. 'Status_video'},
},
{
{text = GetSetieng(ChatId).lock_photo, data = '&'},{text = 'الصور : ', data =IdUser..'/'.. 'Status_photo'},
},
{
{text = GetSetieng(ChatId).lock_user, data = '&'},{text = 'المعرفات : ', data =IdUser..'/'.. 'Status_username'},
},
{
{text = GetSetieng(ChatId).lock_hash, data = '&'},{text = 'التاك : ', data =IdUser..'/'.. 'Status_tags'},
},
{
{text = GetSetieng(ChatId).lock_bots, data = '&'},{text = 'البوتات : ', data =IdUser..'/'.. 'Status_bots'},
},
{
{text = '• التالي ... ', data =IdUser..'/'.. 'NextSeting'}
},
{
{text = ' القائمه الرئيسيه ', data = IdUser..'/helpall'},
},
{
{text = '• اخفاء الامر ', data =IdUser..'/'.. 'delAmr'}
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,Text, 'md', false, false, reply_markup)
end
end 
if Text and Text:match('(%d+)/delAmr') then
local UserId = Text:match('(%d+)/delAmr')
if tonumber(IdUser) == tonumber(UserId) then
return LuaTele.deleteMessages(ChatId,{[1]= Msg_id})
end
end
if Text and Text:match('(%d+)/Status_link') then
local UserId = Text:match('(%d+)/Status_link')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الروابط', data =UserId..'/'.. 'lock_link'},{text = 'قفل الروابط بالكتم', data =UserId..'/'.. 'lock_linkktm'},
},
{
{text = 'قفل الروابط بالطرد', data =UserId..'/'.. 'lock_linkkick'},{text = 'قفل الروابط بالتقييد', data =UserId..'/'.. 'lock_linkkid'},
},
{
{text = 'فتح الروابط', data =UserId..'/'.. 'unlock_link'},
},
{
{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر الروابط", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_spam') then
local UserId = Text:match('(%d+)/Status_spam')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الكلايش', data =UserId..'/'.. 'lock_spam'},{text = 'قفل الكلايش بالكتم', data =UserId..'/'.. 'lock_spamktm'},
},
{
{text = 'قفل الكلايش بالطرد', data =UserId..'/'.. 'lock_spamkick'},{text = 'قفل الكلايش بالتقييد', data =UserId..'/'.. 'lock_spamid'},
},
{
{text = 'فتح الكلايش', data =UserId..'/'.. 'unlock_spam'},
},
{
{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر الكلايش", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_keypord') then
local UserId = Text:match('(%d+)/Status_keypord')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الكيبورد', data =UserId..'/'.. 'lock_keypord'},{text = 'قفل الكيبورد بالكتم', data =UserId..'/'.. 'lock_keypordktm'},
},
{
{text = 'قفل الكيبورد بالطرد', data =UserId..'/'.. 'lock_keypordkick'},{text = 'قفل الكيبورد بالتقييد', data =UserId..'/'.. 'lock_keypordkid'},
},
{
{text = 'فتح الكيبورد', data =UserId..'/'.. 'unlock_keypord'},
},
{
{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر الكيبورد", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_voice') then
local UserId = Text:match('(%d+)/Status_voice')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الاغاني', data =UserId..'/'.. 'lock_voice'},{text = 'قفل الاغاني بالكتم', data =UserId..'/'.. 'lock_voicektm'},
},
{
{text = 'قفل الاغاني بالطرد', data =UserId..'/'.. 'lock_voicekick'},{text = 'قفل الاغاني بالتقييد', data =UserId..'/'.. 'lock_voicekid'},
},
{
{text = 'فتح الاغاني', data =UserId..'/'.. 'unlock_voice'},
},
{
{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر الاغاني", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_gif') then
local UserId = Text:match('(%d+)/Status_gif')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل المتحركه', data =UserId..'/'.. 'lock_gif'},{text = 'قفل المتحركه بالكتم', data =UserId..'/'.. 'lock_gifktm'},
},
{
{text = 'قفل المتحركه بالطرد', data =UserId..'/'.. 'lock_gifkick'},{text = 'قفل المتحركه بالتقييد', data =UserId..'/'.. 'lock_gifkid'},
},
{
{text = 'فتح المتحركه', data =UserId..'/'.. 'unlock_gif'},
},
{
{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر المتحركات", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_files') then
local UserId = Text:match('(%d+)/Status_files')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الملفات', data =UserId..'/'.. 'lock_files'},{text = 'قفل الملفات بالكتم', data =UserId..'/'.. 'lock_filesktm'},
},
{
{text = 'قفل النلفات بالطرد', data =UserId..'/'.. 'lock_fileskick'},{text = 'قفل الملقات بالتقييد', data =UserId..'/'.. 'lock_fileskid'},
},
{
{text = 'فتح الملقات', data =UserId..'/'.. 'unlock_files'},
},
{
{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر الملفات", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_text') then
local UserId = Text:match('(%d+)/Status_text')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الدردشه', data =UserId..'/'.. 'lock_text'},
},
{
{text = 'فتح الدردشه', data =UserId..'/'.. 'unlock_text'},
},
{
{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر الدردشه", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_video') then
local UserId = Text:match('(%d+)/Status_video')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الفيديو', data =UserId..'/'.. 'lock_video'},{text = 'قفل الفيديو بالكتم', data =UserId..'/'.. 'lock_videoktm'},
},
{
{text = 'قفل الفيديو بالطرد', data =UserId..'/'.. 'lock_videokick'},{text = 'قفل الفيديو بالتقييد', data =UserId..'/'.. 'lock_videokid'},
},
{
{text = 'فتح الفيديو', data =UserId..'/'.. 'unlock_video'},
},
{
{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر الفيديو", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_photo') then
local UserId = Text:match('(%d+)/Status_photo')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الصور', data =UserId..'/'.. 'lock_photo'},{text = 'قفل الصور بالكتم', data =UserId..'/'.. 'lock_photoktm'},
},
{
{text = 'قفل الصور بالطرد', data =UserId..'/'.. 'lock_photokick'},{text = 'قفل الصور بالتقييد', data =UserId..'/'.. 'lock_photokid'},
},
{
{text = 'فتح الصور', data =UserId..'/'.. 'unlock_photo'},
},
{
{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر الصور", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_username') then
local UserId = Text:match('(%d+)/Status_username')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل المعرفات', data =UserId..'/'.. 'lock_username'},{text = 'قفل المعرفات بالكتم', data =UserId..'/'.. 'lock_usernamektm'},
},
{
{text = 'قفل المعرفات بالطرد', data =UserId..'/'.. 'lock_usernamekick'},{text = 'قفل المعرفات بالتقييد', data =UserId..'/'.. 'lock_usernamekid'},
},
{
{text = 'فتح المعرفات', data =UserId..'/'.. 'unlock_username'},
},
{
{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر المعرفات", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_tags') then
local UserId = Text:match('(%d+)/Status_tags')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل التاك', data =UserId..'/'.. 'lock_tags'},{text = 'قفل التاك بالكتم', data =UserId..'/'.. 'lock_tagsktm'},
},
{
{text = 'قفل التاك بالطرد', data =UserId..'/'.. 'lock_tagskick'},{text = 'قفل التاك بالتقييد', data =UserId..'/'.. 'lock_tagskid'},
},
{
{text = 'فتح التاك', data =UserId..'/'.. 'unlock_tags'},
},
{
{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر التاك", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_bots') then
local UserId = Text:match('(%d+)/Status_bots')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل البوتات', data =UserId..'/'.. 'lock_bots'},{text = 'قفل البوتات بالطرد', data =UserId..'/'.. 'lock_botskick'},
},
{
{text = 'فتح البوتات', data =UserId..'/'.. 'unlock_bots'},
},
{
{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر البوتات", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_fwd') then
local UserId = Text:match('(%d+)/Status_fwd')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل التوجيه', data =UserId..'/'.. 'lock_fwd'},{text = 'قفل التوجيه بالكتم', data =UserId..'/'.. 'lock_fwdktm'},
},
{
{text = 'قفل التوجيه بالطرد', data =UserId..'/'.. 'lock_fwdkick'},{text = 'قفل التوجيه بالتقييد', data =UserId..'/'.. 'lock_fwdkid'},
},
{
{text = 'فتح التوجيه', data =UserId..'/'.. 'unlock_link'},
},
{
{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر التوجيه", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_audio') then
local UserId = Text:match('(%d+)/Status_audio')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الصوت', data =UserId..'/'.. 'lock_audio'},{text = 'قفل الصوت بالكتم', data =UserId..'/'.. 'lock_audioktm'},
},
{
{text = 'قفل الصوت بالطرد', data =UserId..'/'.. 'lock_audiokick'},{text = 'قفل الصوت بالتقييد', data =UserId..'/'.. 'lock_audiokid'},
},
{
{text = 'فتح الصوت', data =UserId..'/'.. 'unlock_audio'},
},
{
{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر الصوت", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_stikear') then
local UserId = Text:match('(%d+)/Status_stikear')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الملصقات', data =UserId..'/'.. 'lock_stikear'},{text = 'قفل الملصقات بالكتم', data =UserId..'/'.. 'lock_stikearktm'},
},
{
{text = 'قفل الملصقات بالطرد', data =UserId..'/'.. 'lock_stikearkick'},{text = 'قفل الملصقات بالتقييد', data =UserId..'/'.. 'lock_stikearkid'},
},
{
{text = 'فتح الملصقات', data =UserId..'/'.. 'unlock_stikear'},
},
{
{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر الملصقات", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_phone') then
local UserId = Text:match('(%d+)/Status_phone')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الجهات', data =UserId..'/'.. 'lock_phone'},{text = 'قفل الجهات بالكتم', data =UserId..'/'.. 'lock_phonektm'},
},
{
{text = 'قفل الجهات بالطرد', data =UserId..'/'.. 'lock_phonekick'},{text = 'قفل الجهات بالتقييد', data =UserId..'/'.. 'lock_phonekid'},
},
{
{text = 'فتح الجهات', data =UserId..'/'.. 'unlock_phone'},
},
{
{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر الجهات", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_joine') then
local UserId = Text:match('(%d+)/Status_joine')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الدخول', data =UserId..'/'.. 'lock_joine'},
},
{
{text = 'فتح الدخول', data =UserId..'/'.. 'unlock_joine'},
},
{
{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر الدخول", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_addmem') then
local UserId = Text:match('(%d+)/Status_addmem')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الاضافه', data =UserId..'/'.. 'lock_addmem'},
},
{
{text = 'فتح الاضافه', data =UserId..'/'.. 'unlock_addmem'},
},
{
{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر الاضافه", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_videonote') then
local UserId = Text:match('(%d+)/Status_videonote')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل السيلفي', data =UserId..'/'.. 'lock_videonote'},{text = 'قفل السيلفي بالكتم', data =UserId..'/'.. 'lock_videonotektm'},
},
{
{text = 'قفل السيلفي بالطرد', data =UserId..'/'.. 'lock_videonotekick'},{text = 'قفل السيلفي بالتقييد', data =UserId..'/'.. 'lock_videonotekid'},
},
{
{text = 'فتح السيلفي', data =UserId..'/'.. 'unlock_videonote'},
},
{
{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر بصمه الفيديو", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_pin') then
local UserId = Text:match('(%d+)/Status_pin')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل التثبيت', data =UserId..'/'.. 'lock_pin'},
},
{
{text = 'فتح التثبيت', data =UserId..'/'.. 'unlock_pin'},
},
{
{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر التثبيت", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_tgservir') then
local UserId = Text:match('(%d+)/Status_tgservir')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الاشعارات', data =UserId..'/'.. 'lock_tgservir'},
},
{
{text = 'فتح الاشعارات', data =UserId..'/'.. 'unlock_tgservir'},
},
{
{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر الاشعارات", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_markdaun') then
local UserId = Text:match('(%d+)/Status_markdaun')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الماركداون', data =UserId..'/'.. 'lock_markdaun'},{text = 'قفل الماركداون بالكتم', data =UserId..'/'.. 'lock_markdaunktm'},
},
{
{text = 'قفل الماركداون بالطرد', data =UserId..'/'.. 'lock_markdaunkick'},{text = 'قفل الماركداون بالتقييد', data =UserId..'/'.. 'lock_markdaunkid'},
},
{
{text = 'فتح الماركداون', data =UserId..'/'.. 'unlock_markdaun'},
},
{
{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر الماركدون", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_edits') then
local UserId = Text:match('(%d+)/Status_edits')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل التعديل', data =UserId..'/'.. 'lock_edits'},
},
{
{text = 'فتح التعديل', data =UserId..'/'.. 'unlock_edits'},
},
{
{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر التعديل", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_games') then
local UserId = Text:match('(%d+)/Status_games')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الالعاب', data =UserId..'/'.. 'lock_games'},{text = 'قفل الالعاب بالكتم', data =UserId..'/'.. 'lock_gamesktm'},
},
{
{text = 'قفل الالعاب بالطرد', data =UserId..'/'.. 'lock_gameskick'},{text = 'قفل الالعاب بالتقييد', data =UserId..'/'.. 'lock_gameskid'},
},
{
{text = 'فتح الالعاب', data =UserId..'/'.. 'unlock_games'},
},
{
{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر الالعاب", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_flood') then
local UserId = Text:match('(%d+)/Status_flood')
if tonumber(IdUser) == tonumber(UserId) then

local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل التكرار', data =UserId..'/'.. 'lock_flood'},{text = 'قفل التكرار بالكتم', data =UserId..'/'.. 'lock_floodktm'},
},
{
{text = 'قفل التكرار بالطرد', data =UserId..'/'.. 'lock_floodkick'},{text = 'قفل التكرار بالتقييد', data =UserId..'/'.. 'lock_floodkid'},
},
{
{text = 'فتح التكرار', data =UserId..'/'.. 'unlock_flood'},
},
{
{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر التكرار", 'md', true, false, reply_markup)
end

elseif Text and Text:match('(%d+)/unlock_link') then
local UserId = Text:match('(%d+)/unlock_link')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Lock:Link"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح الروابط").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_spam') then
local UserId = Text:match('(%d+)/unlock_spam')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Lock:Spam"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح الكلايش").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_keypord') then
local UserId = Text:match('(%d+)/unlock_keypord')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Lock:Keyboard"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح الكيبورد").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_voice') then
local UserId = Text:match('(%d+)/unlock_voice')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Lock:vico"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح الاغاني").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_gif') then
local UserId = Text:match('(%d+)/unlock_gif')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Lock:Animation"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح المتحركات").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_files') then
local UserId = Text:match('(%d+)/unlock_files')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Lock:Document"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح الملفات").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_text') then
local UserId = Text:match('(%d+)/unlock_text')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Lock:text"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح الدردشه").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock:Fshar') then
local UserId = Text:match('(%d+)/lock:Fshar')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:lock:Fshar"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح السب").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_video') then
local UserId = Text:match('(%d+)/unlock_video')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Lock:Video"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح الفيديو").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_photo') then
local UserId = Text:match('(%d+)/unlock_photo')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Lock:Photo"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح الصور").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_username') then
local UserId = Text:match('(%d+)/unlock_username')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Lock:User:Name"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح المعرفات").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_tags') then
local UserId = Text:match('(%d+)/unlock_tags')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Lock:hashtak"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح التاك").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_bots') then
local UserId = Text:match('(%d+)/unlock_bots')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Lock:Bot:kick"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح البوتات").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_fwd') then
local UserId = Text:match('(%d+)/unlock_fwd')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Lock:forward"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح التوجيه").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_audio') then
local UserId = Text:match('(%d+)/unlock_audio')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Lock:Audio"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح الصوت").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_stikear') then
local UserId = Text:match('(%d+)/unlock_stikear')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Lock:Sticker"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح الملصقات").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_phone') then
local UserId = Text:match('(%d+)/unlock_phone')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Lock:Contact"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح الجهات").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_joine') then
local UserId = Text:match('(%d+)/unlock_joine')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Lock:Join"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح الدخول").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_addmem') then
local UserId = Text:match('(%d+)/unlock_addmem')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Lock:AddMempar"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح الاضافه").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_videonote') then
local UserId = Text:match('(%d+)/unlock_videonote')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Lock:Unsupported"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح بصمه الفيديو").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_pin') then
local UserId = Text:match('(%d+)/unlock_pin')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:lockpin"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح التثبيت").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_tgservir') then
local UserId = Text:match('(%d+)/unlock_tgservir')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Lock:tagservr"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح الاشعارات").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_markdaun') then
local UserId = Text:match('(%d+)/unlock_markdaun')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Lock:Markdaun"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح الماركدون").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_edits') then
local UserId = Text:match('(%d+)/unlock_edits')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Lock:edit"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح التعديل").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_games') then
local UserId = Text:match('(%d+)/unlock_games')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Lock:geam"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح الالعاب").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_flood') then
local UserId = Text:match('(%d+)/unlock_flood')
if tonumber(IdUser) == tonumber(UserId) then
Redis:hdel(FDFGERB.."FDFGERB:Spam:Group:User"..ChatId ,"Spam:User")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح التكرار").unLock, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/Developers') then
local UserId = Text:match('(%d+)/Developers')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Developers:Groups") 
LuaTele.editMessageText(ChatId,Msg_id,"• تم مسح Myth البوت", 'md', false)
end
elseif Text and Text:match('(%d+)/DevelopersQ') then
local UserId = Text:match('(%d+)/DevelopersQ')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:DevelopersQ:Groups") 
LuaTele.editMessageText(ChatId,Msg_id,"• تم مسح Myth🎖 من البوت", 'md', false)
end
elseif Text and Text:match('(%d+)/TheBasics') then
local UserId = Text:match('(%d+)/TheBasics')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:TheBasics:Group"..ChatId) 
LuaTele.editMessageText(ChatId,Msg_id,"• تم مسح المالكين الاساسين", 'md', false)
end
elseif Text and Text:match('(%d+)/Originators') then
local UserId = Text:match('(%d+)/Originators')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Originators:Group"..ChatId) 
LuaTele.editMessageText(ChatId,Msg_id,"• تم مسح مالكين المجموعه", 'md', false)
end
elseif Text and Text:match('(%d+)/Managers') then
local UserId = Text:match('(%d+)/Managers')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Managers:Group"..ChatId) 
LuaTele.editMessageText(ChatId,Msg_id,"• تم مسح المدراء", 'md', false)
end
elseif Text and Text:match('(%d+)/Addictive') then
local UserId = Text:match('(%d+)/Addictive')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Addictive:Group"..ChatId) 
LuaTele.editMessageText(ChatId,Msg_id,"• تم مسح ادمنيه المجموعه", 'md', false)
end
elseif Text and Text:match('(%d+)/DelDistinguished') then
local UserId = Text:match('(%d+)/DelDistinguished')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:Distinguished:Group"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '• رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,"• تم مسح المميزين", 'md', false)
end
elseif Text and Text:match('(%d+)/kktmAll') then
local UserId = Text:match('(%d+)/kktmAll')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:kkytmAll:Groups") 
LuaTele.editMessageText(ChatId,Msg_id,"• تم مسح المكتومين عام  .", 'md', false)
end
elseif Text and Text:match('(%d+)/BanAll') then
local UserId = Text:match('(%d+)/BanAll')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:BanAll:Groups") 
LuaTele.editMessageText(ChatId,Msg_id,"• تم مسح المحظورين عام", 'md', false)
end
elseif Text and Text:match('(%d+)/BanGroup') then
local UserId = Text:match('(%d+)/BanGroup')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:BanGroup:Group"..ChatId) 
LuaTele.editMessageText(ChatId,Msg_id,"• تم مسح المحظورين", 'md', false)
end
elseif Text and Text:match('(%d+)/SilentGroupGroup') then
local UserId = Text:match('(%d+)/SilentGroupGroup')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(FDFGERB.."FDFGERB:SilentGroup:Group"..ChatId) 
LuaTele.editMessageText(ChatId,Msg_id,"• تم مسح المكتومين", 'md', false)
end
end
end
end
luatele.run(CallBackLua)
 





