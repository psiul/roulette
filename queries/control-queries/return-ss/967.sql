select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,store_returns sr,customer_demographics cd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 149 and ss.ss_hash <= 899 and hd.hd_hash >= 599 and hd.hd_hash <= 999 and cd.cd_hash >= 255 and cd.cd_hash <= 588
;
