select count(ss.ss_item_sk)
from store_sales ss,item i,store_returns sr,customer_demographics cd,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and i.i_hash >= 625 and i.i_hash <= 958 and cd.cd_hash >= 10 and cd.cd_hash <= 760 and hd.hd_hash >= 195 and hd.hd_hash <= 595
;
