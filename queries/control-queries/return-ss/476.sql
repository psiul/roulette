select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,store_returns sr,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_hdemo_sk = hd.hd_demo_sk and cd.cd_hash >= 598 and cd.cd_hash <= 998 and i.i_hash >= 504 and i.i_hash <= 837 and hd.hd_hash >= 219 and hd.hd_hash <= 969
;
