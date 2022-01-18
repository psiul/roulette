select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,customer_demographics cd,item i,household_demographics hd
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_cdemo_sk = cd.cd_demo_sk and sr.sr_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and cd.cd_hash >= 220 and cd.cd_hash <= 620 and i.i_hash >= 248 and i.i_hash <= 998 and hd.hd_hash >= 620 and hd.hd_hash <= 953
;
