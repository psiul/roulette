select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,store_returns sr,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hdemo_sk = hd.hd_demo_sk and i.i_hash >= 75 and i.i_hash <= 408 and cd.cd_hash >= 19 and cd.cd_hash <= 769 and hd.hd_hash >= 271 and hd.hd_hash <= 671
;
