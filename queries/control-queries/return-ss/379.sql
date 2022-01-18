select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,store_returns sr,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 476 and ss.ss_hash <= 809 and hd.hd_hash >= 142 and hd.hd_hash <= 892 and cd.cd_hash >= 108 and cd.cd_hash <= 508
;
