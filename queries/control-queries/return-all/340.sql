select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,store_returns sr,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 184 and ss.ss_hash <= 517 and cd.cd_hash >= 133 and cd.cd_hash <= 883 and i.i_hash >= 149 and i.i_hash <= 549
;
