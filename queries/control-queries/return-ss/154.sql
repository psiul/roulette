select count(ss.ss_item_sk)
from store_sales ss,item i,store_returns sr,household_demographics hd,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 141 and ss.ss_hash <= 891 and hd.hd_hash >= 27 and hd.hd_hash <= 360 and cd.cd_hash >= 128 and cd.cd_hash <= 528
;
