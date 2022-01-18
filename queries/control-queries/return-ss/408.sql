select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,store_returns sr,customer_demographics cd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_cdemo_sk = cd.cd_demo_sk and sr.sr_item_sk = i.i_item_sk and hd.hd_hash >= 123 and hd.hd_hash <= 456 and cd.cd_hash >= 100 and cd.cd_hash <= 850 and i.i_hash >= 389 and i.i_hash <= 789
;
