select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,store_returns sr,item i,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_item_sk = i.i_item_sk and sr.sr_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 409 and ss.ss_hash <= 809 and cd.cd_hash >= 92 and cd.cd_hash <= 842 and hd.hd_hash >= 45 and hd.hd_hash <= 378
;
