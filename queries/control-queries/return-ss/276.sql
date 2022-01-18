select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,store_returns sr,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_item_sk = i.i_item_sk and hd.hd_hash >= 221 and hd.hd_hash <= 621 and cd.cd_hash >= 35 and cd.cd_hash <= 368 and i.i_hash >= 241 and i.i_hash <= 991
;
