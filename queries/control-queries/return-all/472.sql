select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer_demographics cd,store_returns sr
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hash >= 117 and ss.ss_hash <= 517 and hd.hd_hash >= 147 and hd.hd_hash <= 897 and cd.cd_hash >= 21 and cd.cd_hash <= 354
;
